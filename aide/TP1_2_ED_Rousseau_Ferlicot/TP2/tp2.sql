-- FERLICOT ROUSSEAU

DROP dimension dim_produit;
DROP dimension dim_temps;
DROP dimension dim_lieu;
DROP dimension dim_client;


DROP materialized VIEW log on client;
DROP materialized VIEW log on facture;
DROP materialized VIEW log on produit;
DROP materialized VIEW log on ligne_facture;


DROP materialized VIEW fait_vente;
DROP materialized VIEW produit_dim;
DROP materialized VIEW lieu_dim;
DROP materialized VIEW client_dim;
DROP materialized VIEW temps_dim;

-- pour créer une vue materialisee avec la clause "refresh fast",
-- il faut d'abord créer un log sur la table de base

--
-- Dimension produit
--

create materialized view log on produit;

create materialized view produit_dim
refresh fast on commit
as select num as id_produit,
regexp_substr(designation, '[^.]+', 1, 1) as nom,
regexp_substr(designation, '[^.]+', 1, 2) as categorie,
regexp_substr(designation, '[^.]+', 1, 3) as souscategorie
from produit;
-- drop materialized view produit_dim


--
-- Dimension client
--

create materialized view log on client;

create materialized view client_dim
refresh force on demand
as select unique num as id_client,
floor(months_between(sysdate, date_nais)/12) as age,
case 
when floor(months_between(sysdate, date_nais)/12) < 30 then '<30'
when floor(months_between(sysdate, date_nais)/12) < 45 then '30-44'
when floor(months_between(sysdate, date_nais)/12) < 60 then '45-59'
else '>=60'
end as tranche_age,
upper(substr(sexe, 1, 1)) as sexe
from client;

execute dbms_mview.refresh('CLIENT_DIM');

--
-- Dimension temps
--

create materialized view log on facture;

create materialized view temps_dim
refresh force on demand
as select unique
facture.date_etabli as date_vente,
TO_CHAR(facture.date_etabli, 'mm') as num_mois,
TO_CHAR(facture.date_etabli, 'month') as lib_mois,
TO_CHAR(facture.date_etabli, 'yyyy') as annee,
TO_CHAR(facture.date_etabli, 'ddd') as jour_annee,
TO_CHAR(facture.date_etabli, 'ww') as semaine_annee,
TO_CHAR(facture.date_etabli, 'dy') as lib_jour
from facture;

--
-- Dimension lieu
--

create materialized view lieu_dim
refresh force on demand
as select unique
     regexp_substr(client.adresse, '[^,]+', 1, 2) || '_' || regexp_substr(client.adresse, '[^,]+', 1, 3) as id_adresse,
     regexp_substr(adresse,'[^,]+',1,2) AS zip_code,
     regexp_substr(adresse,'[^,]+',1,3) AS ville,
     regexp_substr(adresse,'[^,]+',1,4) AS pays 
from client;


--
-- Fait
--

create materialized view log on ligne_facture;

create materialized view fait_vente
refresh force on demand
as select 
ligne_facture.facture as id_facture,
facture.date_etabli as date_vente,
ligne_facture.produit as id_produit,
facture.client as id_client,
regexp_substr(client.adresse, '[^,]+', 1, 2) || '_' || regexp_substr(client.adresse, '[^,]+', 1, 3) as id_adresse,
prix_date.remise as remise,
ligne_facture.qte as qte,
prix_date.prix as prix_unit,
ligne_facture.qte * prix_date.prix as prix_vente
from ligne_facture
join facture on ligne_facture.facture = facture.num
join prix_date on ligne_facture.id_prix = prix_date.num
join client on facture.client = client.num;

-- Question implementations

-- 1
alter materialized view temps_dim
add constraint  pk_dim_temps primary key (date_vente);

-- Penser à delander pourquoi on a pas besoin de cette clef
--alter materialized view produit_dim
--add constraint  pk_dim_produit primary key (id_produit);

alter materialized view client_dim
add constraint  pk_dim_client primary key (id_client);

alter materialized view lieu_dim
add constraint  pk_dim_lieu primary key (id_adresse);

-- 2

alter materialized view fait_vente
add (
     constraint pk_fait_vente primary key (id_facture, date_vente, id_produit, id_adresse), 
     constraint fk_fait_vente_date foreign key (date_vente) references temps_dim (date_vente),
     constraint fk_fait_vente_prod foreign key (id_produit) references produit_dim (id_produit),
     constraint fk_fait_vente_client foreign key (id_client) references client_dim (id_client),
     constraint fk_fait_vente_lieu foreign key (id_adresse) references lieu_dim (id_adresse)
     );

-- 3
insert into ligne_facture (facture, produit, qte, id_prix) values (3,61,10,43);
insert into ligne_facture (facture, produit, qte, id_prix) values (45,20,9,43);
insert into ligne_facture (facture, produit, qte, id_prix) values (80,15,20,43);

select * 
from fait_vente 
where id_facture = 3 
or id_facture = 45 
or id_facture = 80;

--On a bien les produits 61, 20 et 15.


-- 4

create bitmap index index_produit_categorie
on produit_dim (categorie);

create bitmap index index_produit_souscategorie
on produit_dim (souscategorie);

create bitmap index index_client_sexe
on client_dim (sexe);

create bitmap index index_client_tranche
on client_dim (tranche_age);

create bitmap index index_temps_lib_jour
on temps_dim (lib_jour);

create bitmap index index_temps_mois
on temps_dim (lib_mois);

create bitmap index index_temps_num_mois
on temps_dim (num_mois);

-- 5

create dimension dim_produit
level produit is(produit_dim.id_produit)
level souscategorie is(produit_dim.souscategorie)
level categorie is(produit_dim.categorie)
hierarchy prod_rollup (produit child of souscategorie child of categorie);

execute dbms_dimension.validate_dimension ('dim_produit', FALSE, TRUE, 'Test dim_produit');


create dimension dim_temps
level annee is(temps_dim.annee)
level lib_mois is(temps_dim.lib_mois)
level semaine is (temps_dim.semaine_annee)
level jour is (temps_dim.jour_annee)
hierarchy prod_rollup
(
  jour child of semaine child of lib_mois child of annee);

execute dbms_dimension.validate_dimension ('dim_temps', false, true, 'Test dim_temps');


create dimension dim_lieu
level ville is(lieu_dim.ville)
level pays is(lieu_dim.pays)
level zip is(lieu_dim.zip_code)
hierarchy prod_rollup(zip child of ville child of pays);

execute dbms_dimension.validate_dimension ('dim_lieu', false, true, 'Test dim_lieu');


create dimension dim_client
level age is(client_dim.age)
level tranche_age is(client_dim.tranche_age)
hierarchy prod_rollup(age child of tranche_age);

execute dbms_dimension.validate_dimension ('dim_client', false, true, 'Test dim_client');


-- Requêtes SQL

--1
SELECT id_produit, nom,  sum(prix_vente) as CA
from fait_vente
natural join produit_dim
group by id_produit, nom
order by CA desc;

--2
select categorie, lib_mois ,sum(prix_vente) as CA 
from fait_vente
natural join produit_dim 
natural join temps_dim
group by rollup (categorie,lib_mois);

--3
select tranche_age,sum(prix_vente) as CA,rank() over (order by sum(prix_vente) desc) as rang 
from fait_vente
natural join client_dim
group by tranche_age;

--4
select * from (
  select nom , sum(qte) as quantite_vendue, rank() over (order by  sum(qte) desc) as rang
  from fait_vente
  natural join produit_dim
  group by nom
  )
where rang<=3;





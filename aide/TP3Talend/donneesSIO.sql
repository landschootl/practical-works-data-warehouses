drop table sio_deplacement;
drop table sio_demande;
drop table sio_localisation;
drop table sio_service;
drop table sio_pole;
drop table sio_medicament;
drop table sio_categorie;
drop table sio_laboratoire;

create table sio_laboratoire(
  labo_id NUMBER(3) constraint laboratoire_pkey primary key,
  labo_nom VARCHAR2(40) not null
);

insert into sio_laboratoire values(10,'UPSA');
insert into sio_laboratoire values(11,'TEVA SANTE');
insert into sio_laboratoire values(12,'NOVARTIS');
insert into sio_laboratoire values(13,'SANOFI-ADVENTIS');
insert into sio_laboratoire values(14,'RICHARD');
insert into sio_laboratoire values(15,'GLAXOSMITHKLINE');
insert into sio_laboratoire values(16,'BIOGARAN');
insert into sio_laboratoire values(17,'MERCK SERONO');
insert into sio_laboratoire values(18,'MYLAN');

create table sio_categorie(
  categ_id NUMBER(3) constraint categorie_pkey primary key,
  categ_nom VARCHAR2(50) not null
);

insert into sio_categorie values(1,'antalgique et antipyrétique');
insert into sio_categorie values(2,'anti inflammatoire');
insert into sio_categorie values(3,'élément minéral : potassium');
insert into sio_categorie values(4,'antirhumatismal');
insert into sio_categorie values(5,'antidiabétique');
insert into sio_categorie values(6,'antibiotique');
insert into sio_categorie values(7,'myorelaxant');

create table sio_medicament(
  med_id NUMBER(4) constraint medicament_pkey primary key,
  med_nom VARCHAR2(100) not null,
  categ_id constraint produit_categorie_fkey references sio_Categorie,
  labo_id constraint produit_laboratoire_fkey references sio_Laboratoire,
  poids_unit number(7,1), -- en milligrammes
  vol_unit number(6,2), -- en centilitres
  conditionnement VARCHAR2(30)
);

insert into sio_medicament values(1,'DAFALGAN 1 g, comprimé pelliculé',1,10,1000,null,'comprimé');
insert into sio_medicament values(2,'DAFALGAN 500 mg, gélule',1,10,500,null,'gélule'); 
insert into sio_medicament values(3,'DICLOFENAC TEVA 1 %, gel',2,11,50000,null,'tube');  
insert into sio_medicament values(4,'VOLTARENE 25 mg, comprimé gastro-résistant',2,12,25,null,'comprimé');  
insert into sio_medicament values(5,'ADVIL 400 mg, comprimé enrobé',2,12,400,null,'comprimé'); 
insert into sio_medicament values(6,'DOLIPRANE 500 mg, comprimé',1,13,500,null,'comprimé');  
insert into sio_medicament values(7,'PARACETAMOL TEVA 500 mg, comprimé',1,11,500,null,'comprimé');  
insert into sio_medicament values(8,'POTASSIUM RICHARD 3 POUR CENT, sirop',3,14,null,25,'flacon');  
insert into sio_medicament values(9,'ACADIONE 250 mg, comprimé dragéifié',4,13,250,null,'comprimé'); 
insert into sio_medicament values(10,'AMAREL 3 mg, comprimé',5,13,3,null,'comprimé');  
insert into sio_medicament values(11,'ASPEGIC ADULTES 1000 mg, poudre pour solution buvable en sachet-dose',1,13,1000,null,'sachet');  
insert into sio_medicament values(12,'AMOXICILLINE TEVA SANTE 250 mg/5 ml, poudre pour suspension buvable',6,11,250,6,'flacon'); 
insert into sio_medicament values(13,'AUGMENTIN 500 mg/62,5 mg ENFANTS, poudre pour suspension buvable en sachet-dose',6,15,500,null,'sachet');  
insert into sio_medicament values(14,'CLAMOXYL 1 g, comprimé dispersible',6,15,1000,null,'comprimé');  
insert into sio_medicament values(15,'VOLTARENACTIGO 1 POUR CENT, gel',2,12,60000,null,'tube');  
insert into sio_medicament values(16,'DOXYCYCLINE TEVA 100 mg, comprimé sécable',6,11,100,null,'comprimé');  
insert into sio_medicament values(17,'DOXYCYCLINE BIOGARAN 100 mg, comprimé pelliculé sécable',6,16,100,null,'comprimé');  
insert into sio_medicament values(18,'CIPROFLOXACINE BIOGARAN 500 mg, comprimé pelliculé sécable',6,16,500,null,'comprimé');  
insert into sio_medicament values(19,'CIPROFLOXACINE TEVA 250 mg, comprimé pelliculé sécable',6,11,250,null,'comprimé');  
insert into sio_medicament values(20,'PEFLACINE 400 mg, comprimé pelliculé sécable',6,13,400,null,'comprimé'); 
insert into sio_medicament values(21,'PIPRAM FORT 400 mg, comprimé enrobé',6,13,400,null,'comprimé');  
insert into sio_medicament values(22,'METFORMINE TEVA 850 mg, comprimé pelliculé',5,11,850,null,'comprimé');  
insert into sio_medicament values(23,'GLUCOPHAGE 1000 mg, comprimé pelliculé sécable',5,17,1000,null,'comprimé'); 
insert into sio_medicament values(24,'STAGID 700 mg, comprimé sécable',5,17,700,null,'comprimé'); 
insert into sio_medicament values(25,'PLAQUENIL 200 mg, comprimé pelliculé',4,13,200,null,'comprimé');
insert into sio_medicament values(26,'LEFLUNOMIDE MYLAN 10 mg, comprimé pelliculé',4,18,10,null,'comprimé');
insert into sio_medicament values(27,'LEFLUNOMIDE MYLAN 20 mg, comprimé pelliculé',4,18,20,null,'comprimé');
insert into sio_medicament values(28,'ACECLOFENAC MYLAN 100 mg, comprimé pelliculé',2,18,100,null,'comprimé');
insert into sio_medicament values(29,'AMOXICILLINE MYLAN 1 g, comprimé dispersible',6,18,1000,null,'comprimé'); 
insert into sio_medicament values(30,'CEFPODOXIME MYLAN ENFANTS ET NOURRISSONS 40 mg/5 ml, poudre pour suspension buvable',6,18,null,10,'flacon');
insert into sio_medicament values(31,'IBUPROFENE MYLAN 400 mg, comprimé effervescent',2,18,400,null,'comprimé');
insert into sio_medicament values(32,'PREDNISONE MYLAN 5 mg, comprimé sécable',2,18,5,null,'comprimé');
insert into sio_medicament values(33,'PREDNISONE MYLAN 20 mg, comprimé sécable',2,18,20,null,'comprimé');
insert into sio_medicament values(34,'GLUCOVANCE 500 mg/5 mg, comprimé pelliculé',5,17,5,null,'comprimé');
insert into sio_medicament values(35,'GLUCOVANCE 500 mg/2,5 mg, comprimé pelliculé',5,17,2.5,null,'comprimé');
insert into sio_medicament values(36,'DANTRIUM 100 mg, gélule',7,17,100,null,'gélule');
insert into sio_medicament values(37,'LIORESAL 10 mg, comprimé sécable',7,12,10,null,'comprimé');
insert into sio_medicament values(38,'LIORESAL 10 mg/5 ml, solution injectable pour perfusion par voie intrathécale en ampoule',7,12,10,0.5,'ampoule injectable');
insert into sio_medicament values(39,'DECONTRACTYL 500 mg, comprimé enrobé',7,13,500,null,'comprimé');
insert into sio_medicament values(40,'IBUPROFENE BIOGARAN 200 mg, comprimé pelliculé',2,16,200,null,'comprimé');
insert into sio_medicament values(41,'ASPIRINE UPSA 500 mg, comprimé effervescent',1,10,500,null,'comprimé');
insert into sio_medicament values(42,'NIFLURIL 250 mg, gélule',2,10,250,null,'gélule');

create table sio_pole(
  pole_id NUMBER(3) constraint pole_pkey primary key,
  pole_nom VARCHAR2(50) not null
);

insert into sio_Pole values(100,'Anesthésie - Réanimation');
insert into sio_Pole values(101,'Médico-chirurgical');
insert into sio_Pole values(102,'Enfant');
insert into sio_Pole values(103,'Santé publique, pharmacie, pharmacologie');


create table sio_service(
  serv_id NUMBER(4) constraint service_pkey primary key,
  serv_nom VARCHAR2(80) not null,
  pole_id constraint service_pole_fkey references sio_Pole
);

insert into sio_Service values(1001, 'Anesthésie - réanimation cardio vasculaire',100);
insert into sio_Service values(1002, 'Anesthésie - réanimation pneumo-thoracique',100);
insert into sio_Service values(1003, 'Réanimation neurochirurgicale',100);
insert into sio_Service values(1004, 'Réanimation urgences',100);

insert into sio_Service values(1005, 'Chirurgie générale et digestive',101);
insert into sio_Service values(1006, 'Néphrologie',101);
insert into sio_Service values(1007, 'Chirurgie générale et vasculaire',101);

insert into sio_Service values(1008,'Cardiologie pédiatrique',102);
insert into sio_Service values(1009,'Neuro-pédiatrie',102);
insert into sio_Service values(1010,'Réanimation pédiatrique',102);

insert into sio_Service values(1,'Circuit des produits de santé',103);

create table sio_localisation(
  local_id number(5) constraint local_pkey primary key,
  batiment varchar2(30),
  etage number(2),
  serv_id constraint local_serv_fkey references sio_service
);

insert into sio_Localisation values(10,'Hopital Cardio',3,1001);
insert into sio_Localisation values(11,'Hopital Cardio',2,1001);
insert into sio_Localisation values(12,'Hopital Cardio',2,1002);
insert into sio_Localisation values(13,'Hopital Cardio',1,1002);
insert into sio_Localisation values(14,'Hopital Salengro',4,1003);
insert into sio_Localisation values(15,'Hopital Salengro',0,1004);
insert into sio_Localisation values(16,'Hopital Salengro',1,1004);

insert into sio_Localisation values(17,'Hopital Huriez',2,1005);
insert into sio_Localisation values(18,'Hopital Huriez - Est',3,1005);
insert into sio_Localisation values(19,'Hopital Huriez - Ouest',0,1006);
insert into sio_Localisation values(20,'Hopital Huriez - Est',3,1007);

insert into sio_Localisation values(21,'Hopital Cardio',6,1008);
insert into sio_Localisation values(22,'Hopital Salengro',2,1009);
insert into sio_Localisation values(23,'Hopital Salengro',3,1009);
insert into sio_Localisation values(24,'Hopital J de Flandres',-1,1010);
insert into sio_Localisation values(25,'Hopital J de Flandres',0,1010);

insert into sio_Localisation values(1,'Pharmacie Centrale',null,1);-- comme source de médicaments
insert into sio_Localisation values(2,'Pharmacie Recyclage',null,1);-- comme destination finale
insert into sio_Localisation values(3,'Patient',null,null);-- comme destination finale

create table sio_demande(
  dem_id number(5) constraint demande_pkey primary key,
  qte number(3) default 0 not null,
  constraint qte_demande_positive check(qte > 0),
  med_id NUMBER(4) not null constraint demande_med_fkey references sio_medicament,
  loc_id NUMBER(4) not null constraint demande_loc_fkey references sio_Localisation,
  dem_date DATE not null
);

create table sio_deplacement(
  depl_id Number(5) constraint depl_pkey primary key, 
  depart constraint depl_depart_local_fkey references sio_Localisation, 
    -- depart vaut l'id 1 vers Pharmacie Centrale si arrivee directe dans le service
  arrivee constraint depl_arrivee_local_fkey references sio_Localisation, 
    -- arrivee vaut l'id 3 vers Patient si produit consommé, l'id 2 vers Recyclage si produit jeté
  date_mvt DATE not null,
  med_id Number(4) not null constraint depl_med_fkey references sio_medicament,
  qte number(3) not null,
  constraint qte_deplacement_positive check(qte > 0),
  depl_dem_id number(5) constraint depl_demande_fkey references sio_Demande -- peut valoir NULL
);

insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (1,16,18,25,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (1,1,25,'16/10/2015',18,24,1);
-- demande 1 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (2,14,32,16,'4/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (2,1,16,'4/10/2015',32,13,2);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (3,16,2,'11/10/2015',32,10,2);
-- demande 2 traitée partiellement par la pharmacie
-- demande 2 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (3,18,4,16,'30/10/2015');
-- demande 3 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (4,15,25,14,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (4,12,14,'19/10/2015',25,6,4);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (5,14,2,'26/10/2015',25,5,4);
-- demande 4 traitée partiellement par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (5,8,25,12,'17/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (6,1,12,'17/10/2015',25,16,5);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (7,12,3,'19/10/2015',25,12,5);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (8,12,2,'23/10/2015',25,3,5);
-- demande 5 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (9,21,14,'19/10/2015',25,2,4);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (10,14,3,'21/10/2015',25,1,4);
-- demande 4 traitée partiellement par loc_id=21
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (6,5,25,21,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (11,18,21,'16/10/2015',25,2,6);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (12,21,2,'22/10/2015',25,1,6);
-- demande 6 traitée partiellement par loc_id=18
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (7,5,25,18,'13/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (13,21,18,'13/10/2015',25,13,7);
-- demande 7 traitée par loc_id=21
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (8,16,25,21,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (14,15,21,'10/10/2015',25,15,8);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (15,21,2,'17/10/2015',25,13,8);
-- demande 8 traitée partiellement par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (9,18,25,15,'7/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (16,1,15,'7/10/2015',25,26,9);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (17,15,3,'9/10/2015',25,6,9);
-- demande 9 traitée par la pharmacie
-- demande 8 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (18,1,21,'16/10/2015',25,2,6);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (19,21,3,'18/10/2015',25,1,6);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (20,21,2,'23/10/2015',25,1,6);
-- demande 6 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (21,19,21,'16/10/2015',25,9,6);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (22,21,3,'18/10/2015',25,4,6);
-- demande 6 traitée par loc_id=19
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (10,13,25,19,'13/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (23,1,19,'13/10/2015',25,15,10);
-- demande 10 traitée par la pharmacie
-- demande 4 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (11,15,42,12,'27/10/2015');
-- demande 11 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (12,8,1,18,'4/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (24,1,18,'4/10/2015',1,6,12);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (25,18,3,'5/10/2015',1,4,12);
-- demande 12 traitée partiellement par la pharmacie
-- demande 12 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (13,14,7,21,'22/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (26,17,21,'22/10/2015',7,4,13);
-- demande 13 traitée partiellement par loc_id=17
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (14,7,7,17,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (27,1,17,'19/10/2015',7,15,14);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (28,17,3,'21/10/2015',7,9,14);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (29,17,2,'26/10/2015',7,5,14);
-- demande 14 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (30,15,21,'22/10/2015',7,3,13);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (31,21,3,'23/10/2015',7,2,13);
-- demande 13 traitée partiellement par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (15,4,7,15,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (32,16,15,'19/10/2015',7,5,15);
-- demande 15 traitée par loc_id=16
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (16,7,7,16,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (33,22,16,'16/10/2015',7,11,16);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (34,16,2,'23/10/2015',7,8,16);
-- demande 16 traitée par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (17,14,7,22,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (35,1,22,'14/10/2015',7,8,17);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (36,22,3,'16/10/2015',7,2,17);
-- demande 17 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (37,1,22,'14/10/2015',7,10,17);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (38,22,3,'15/10/2015',7,6,17);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (39,22,2,'20/10/2015',7,2,17);
-- demande 17 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (40,13,21,'22/10/2015',7,1,13);
-- demande 13 traitée partiellement par loc_id=13
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (18,5,7,13,'20/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (41,1,13,'20/10/2015',7,3,18);
-- demande 18 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (42,1,13,'20/10/2015',7,1,18);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (43,13,3,'22/10/2015',7,1,18);
-- demande 18 traitée partiellement par la pharmacie
-- demande 18 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (44,14,21,'22/10/2015',7,13,13);
-- demande 13 traitée par loc_id=14
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (19,17,7,14,'20/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (45,1,14,'20/10/2015',7,11,19);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (46,14,2,'27/10/2015',7,7,19);
-- demande 19 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (47,21,14,'20/10/2015',7,5,19);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (48,14,2,'27/10/2015',7,3,19);
-- demande 19 traitée partiellement par loc_id=21
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (20,9,7,21,'18/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (49,18,21,'18/10/2015',7,13,20);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (50,21,2,'24/10/2015',7,3,20);
-- demande 20 traitée par loc_id=18
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (21,17,7,18,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (51,13,18,'16/10/2015',7,20,21);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (52,18,3,'18/10/2015',7,7,21);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (53,18,2,'22/10/2015',7,5,21);
-- demande 21 traitée par loc_id=13
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (22,22,7,13,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (54,23,13,'14/10/2015',7,25,22);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (55,13,2,'21/10/2015',7,16,22);
-- demande 22 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (23,28,7,23,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (56,1,23,'12/10/2015',7,13,23);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (57,23,3,'14/10/2015',7,11,23);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (58,23,2,'19/10/2015',7,1,23);
-- demande 23 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (59,1,23,'12/10/2015',7,19,23);
-- demande 23 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (60,1,14,'20/10/2015',7,10,19);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (61,14,3,'21/10/2015',7,5,19);
-- demande 19 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (24,14,19,13,'13/10/2015');
-- demande 24 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (25,17,5,16,'13/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (62,22,16,'13/10/2015',5,16,25);
-- demande 25 traitée partiellement par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (26,18,5,22,'11/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (63,12,22,'11/10/2015',5,24,26);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (64,22,2,'18/10/2015',5,6,26);
-- demande 26 traitée par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (27,27,5,12,'9/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (65,15,12,'9/10/2015',5,19,27);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (66,12,3,'11/10/2015',5,17,27);
-- demande 27 traitée partiellement par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (28,22,5,15,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (67,12,15,'6/10/2015',5,23,28);
-- demande 28 traitée par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (29,25,5,12,'4/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (68,1,12,'4/10/2015',5,29,29);
-- demande 29 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (69,1,12,'9/10/2015',5,7,27);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (70,12,2,'15/10/2015',5,7,27);
-- demande 27 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (71,23,12,'9/10/2015',5,10,27);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (72,12,3,'10/10/2015',5,1,27);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (73,12,2,'15/10/2015',5,1,27);
-- demande 27 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (30,13,5,23,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (74,1,23,'6/10/2015',5,14,30);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (75,23,3,'7/10/2015',5,7,30);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (76,23,2,'12/10/2015',5,6,30);
-- demande 30 traitée par la pharmacie
-- demande 25 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (31,19,41,23,'28/10/2015');
-- demande 31 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (32,18,40,20,'23/10/2015');
-- demande 32 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (33,13,13,25,'14/10/2015');
-- demande 33 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (34,17,8,11,'22/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (77,1,11,'22/10/2015',8,11,34);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (78,11,2,'28/10/2015',8,7,34);
-- demande 34 traitée partiellement par la pharmacie
-- demande 34 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (35,13,15,11,'21/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (79,1,11,'21/10/2015',15,1,35);
-- demande 35 traitée partiellement par la pharmacie
-- demande 35 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (36,3,21,14,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (80,1,14,'8/10/2015',21,5,36);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (81,14,3,'10/10/2015',21,4,36);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (82,14,2,'14/10/2015',21,1,36);
-- demande 36 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (37,14,32,22,'7/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (83,1,22,'7/10/2015',32,1,37);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (84,22,3,'9/10/2015',32,1,37);
-- demande 37 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (85,1,22,'7/10/2015',32,22,37);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (86,22,3,'8/10/2015',32,15,37);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (87,22,2,'13/10/2015',32,1,37);
-- demande 37 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (38,10,17,20,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (88,15,20,'12/10/2015',17,1,38);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (89,20,3,'13/10/2015',17,1,38);
-- demande 38 traitée partiellement par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (39,3,17,15,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (90,1,15,'10/10/2015',17,5,39);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (91,15,2,'17/10/2015',17,5,39);
-- demande 39 traitée par la pharmacie
-- demande 38 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (40,6,4,24,'17/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (92,1,24,'17/10/2015',4,12,40);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (93,24,3,'19/10/2015',4,12,40);
-- demande 40 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (41,14,16,15,'21/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (94,1,15,'21/10/2015',16,11,41);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (95,15,3,'23/10/2015',16,2,41);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (96,15,2,'28/10/2015',16,2,41);
-- demande 41 traitée partiellement par la pharmacie
-- demande 41 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (42,6,35,23,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (97,1,23,'14/10/2015',35,3,42);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (98,23,3,'15/10/2015',35,3,42);
-- demande 42 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (99,25,23,'14/10/2015',35,2,42);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (100,23,2,'21/10/2015',35,2,42);
-- demande 42 traitée partiellement par loc_id=25
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (43,4,35,25,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (101,1,25,'12/10/2015',35,2,43);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (102,25,3,'14/10/2015',35,2,43);
-- demande 43 traitée partiellement par la pharmacie
-- demande 43 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (103,10,23,'14/10/2015',35,9,42);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (104,23,2,'21/10/2015',35,2,42);
-- demande 42 traitée par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (44,12,35,10,'11/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (105,23,10,'11/10/2015',35,14,44);
-- demande 44 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (45,15,35,23,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (106,1,23,'8/10/2015',35,21,45);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (107,23,3,'10/10/2015',35,9,45);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (108,23,2,'14/10/2015',35,6,45);
-- demande 45 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (46,11,21,22,'30/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (109,1,22,'30/10/2015',21,9,46);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (110,22,2,'5/11/2015',21,8,46);
-- demande 46 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (111,11,22,'30/10/2015',21,1,46);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (112,22,2,'6/11/2015',21,1,46);
-- demande 46 traitée partiellement par loc_id=11
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (47,5,21,11,'28/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (113,12,11,'28/10/2015',21,3,47);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (114,11,2,'3/11/2015',21,2,47);
-- demande 47 traitée partiellement par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (48,4,21,12,'26/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (115,1,12,'26/10/2015',21,1,48);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (116,12,2,'1/11/2015',21,1,48);
-- demande 48 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (117,20,12,'26/10/2015',21,12,48);
-- demande 48 traitée par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (49,16,21,20,'23/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (118,1,20,'23/10/2015',21,14,49);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (119,20,2,'29/10/2015',21,3,49);
-- demande 49 traitée partiellement par la pharmacie
-- demande 49 abandonnée
-- demande 47 abandonnée
-- demande 46 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (50,17,22,10,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (120,14,10,'8/10/2015',22,18,50);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (121,10,3,'10/10/2015',22,3,50);
-- demande 50 traitée par loc_id=14
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (51,22,22,14,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (122,23,14,'6/10/2015',22,8,51);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (123,14,3,'7/10/2015',22,3,51);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (124,14,2,'12/10/2015',22,2,51);
-- demande 51 traitée partiellement par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (52,10,22,23,'3/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (125,16,23,'3/10/2015',22,4,52);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (126,23,2,'9/10/2015',22,2,52);
-- demande 52 traitée partiellement par loc_id=16
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (53,5,22,16,'30/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (127,1,16,'30/9/2015',22,10,53);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (128,16,3,'1/10/2015',22,8,53);
-- demande 53 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (129,24,23,'3/10/2015',22,10,52);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (130,23,2,'10/10/2015',22,3,52);
-- demande 52 traitée par loc_id=24
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (54,11,22,24,'1/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (131,1,24,'1/10/2015',22,3,54);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (132,24,3,'3/10/2015',22,1,54);
-- demande 54 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (133,1,24,'1/10/2015',22,9,54);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (134,24,3,'2/10/2015',22,9,54);
-- demande 54 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (135,1,14,'6/10/2015',22,21,51);
-- demande 51 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (55,14,34,12,'25/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (136,16,12,'25/10/2015',34,4,55);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (137,12,3,'26/10/2015',34,1,55);
-- demande 55 traitée partiellement par loc_id=16
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (56,6,34,16,'23/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (138,19,16,'23/10/2015',34,14,56);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (139,16,3,'24/10/2015',34,8,56);
-- demande 56 traitée par loc_id=19
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (57,15,34,19,'21/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (140,1,19,'21/10/2015',34,9,57);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (141,19,3,'22/10/2015',34,8,57);
-- demande 57 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (142,1,19,'21/10/2015',34,7,57);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (143,19,3,'22/10/2015',34,4,57);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (144,19,2,'28/10/2015',34,2,57);
-- demande 57 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (145,1,12,'25/10/2015',34,17,55);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (146,12,3,'27/10/2015',34,8,55);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (147,12,2,'31/10/2015',34,6,55);
-- demande 55 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (58,19,20,19,'23/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (148,1,19,'23/10/2015',20,23,58);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (149,19,3,'24/10/2015',20,23,58);
-- demande 58 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (59,14,42,24,'1/10/2015');
-- demande 59 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (60,1,26,16,'11/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (150,1,16,'11/10/2015',26,9,60);
-- demande 60 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (61,19,17,13,'24/10/2015');
-- demande 61 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (62,10,9,14,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (151,23,14,'19/10/2015',9,1,62);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (152,14,2,'26/10/2015',9,1,62);
-- demande 62 traitée partiellement par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (63,3,9,23,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (153,15,23,'16/10/2015',9,9,63);
-- demande 63 traitée par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (64,10,9,15,'13/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (154,20,15,'13/10/2015',9,16,64);
-- demande 64 traitée par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (65,17,9,20,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (155,1,20,'10/10/2015',9,1,65);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (156,20,3,'12/10/2015',9,1,65);
-- demande 65 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (157,24,20,'10/10/2015',9,24,65);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (158,20,3,'12/10/2015',9,17,65);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (159,20,2,'17/10/2015',9,7,65);
-- demande 65 traitée par loc_id=24
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (66,27,9,24,'7/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (160,1,24,'7/10/2015',9,28,66);
-- demande 66 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (161,1,14,'19/10/2015',9,12,62);
-- demande 62 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (67,3,5,17,'25/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (162,11,17,'25/10/2015',5,7,67);
-- demande 67 traitée par loc_id=11
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (68,10,5,11,'23/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (163,1,11,'23/10/2015',5,8,68);
-- demande 68 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (164,1,11,'23/10/2015',5,4,68);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (165,11,2,'29/10/2015',5,3,68);
-- demande 68 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (69,16,36,12,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (166,13,12,'19/10/2015',36,8,69);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (167,12,3,'21/10/2015',36,5,69);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (168,12,2,'26/10/2015',36,1,69);
-- demande 69 traitée partiellement par loc_id=13
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (70,11,36,13,'16/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (169,17,13,'16/10/2015',36,17,70);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (170,13,3,'18/10/2015',36,4,70);
-- demande 70 traitée par loc_id=17
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (71,21,36,17,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (171,18,17,'14/10/2015',36,4,71);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (172,17,3,'16/10/2015',36,1,71);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (173,17,2,'20/10/2015',36,1,71);
-- demande 71 traitée partiellement par loc_id=18
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (72,5,36,18,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (174,12,18,'12/10/2015',36,1,72);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (175,18,3,'14/10/2015',36,1,72);
-- demande 72 traitée partiellement par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (73,4,36,12,'9/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (176,1,12,'9/10/2015',36,3,73);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (177,12,3,'10/10/2015',36,1,73);
-- demande 73 traitée partiellement par la pharmacie
-- demande 73 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (178,23,18,'12/10/2015',36,1,72);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (179,18,2,'19/10/2015',36,1,72);
-- demande 72 traitée partiellement par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (74,4,36,23,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (180,19,23,'10/10/2015',36,9,74);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (181,23,3,'12/10/2015',36,9,74);
-- demande 74 traitée par loc_id=19
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (75,11,36,19,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (182,1,19,'8/10/2015',36,18,75);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (183,19,3,'9/10/2015',36,9,75);
-- demande 75 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (184,1,18,'12/10/2015',36,12,72);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (185,18,3,'13/10/2015',36,7,72);
-- demande 72 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (186,1,17,'14/10/2015',36,11,71);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (187,17,2,'21/10/2015',36,11,71);
-- demande 71 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (188,1,17,'14/10/2015',36,4,71);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (189,17,3,'16/10/2015',36,1,71);
-- demande 71 traitée partiellement par la pharmacie
-- demande 71 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (190,20,12,'19/10/2015',36,7,69);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (191,12,3,'21/10/2015',36,2,69);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (192,12,2,'25/10/2015',36,5,69);
-- demande 69 traitée partiellement par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (76,10,36,20,'17/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (193,24,20,'17/10/2015',36,9,76);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (194,20,2,'23/10/2015',36,3,76);
-- demande 76 traitée partiellement par loc_id=24
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (77,10,36,24,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (195,20,24,'14/10/2015',36,17,77);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (196,24,2,'21/10/2015',36,1,77);
-- demande 77 traitée par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (78,18,36,20,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (197,1,20,'12/10/2015',36,5,78);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (198,20,2,'18/10/2015',36,4,78);
-- demande 78 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (199,10,20,'12/10/2015',36,7,78);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (200,20,3,'14/10/2015',36,1,78);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (201,20,2,'19/10/2015',36,1,78);
-- demande 78 traitée partiellement par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (79,9,36,10,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (202,1,10,'10/10/2015',36,12,79);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (203,10,3,'11/10/2015',36,12,79);
-- demande 79 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (204,24,20,'12/10/2015',36,12,78);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (205,20,3,'14/10/2015',36,7,78);
-- demande 78 traitée par loc_id=24
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (80,15,36,24,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (206,22,24,'10/10/2015',36,9,80);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (207,24,3,'12/10/2015',36,7,80);
-- demande 80 traitée partiellement par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (81,12,36,22,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (208,1,22,'8/10/2015',36,18,81);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (209,22,3,'10/10/2015',36,3,81);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (210,22,2,'14/10/2015',36,15,81);
-- demande 81 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (211,1,24,'10/10/2015',36,7,80);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (212,24,2,'16/10/2015',36,4,80);
-- demande 80 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (213,1,20,'17/10/2015',36,6,76);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (214,20,2,'23/10/2015',36,5,76);
-- demande 76 traitée par la pharmacie
-- demande 69 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (82,14,28,10,'17/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (215,1,10,'17/10/2015',28,1,82);
-- demande 82 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (216,21,10,'17/10/2015',28,14,82);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (217,10,3,'19/10/2015',28,4,82);
-- demande 82 traitée par loc_id=21
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (83,17,28,21,'15/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (218,11,21,'15/10/2015',28,1,83);
-- demande 83 traitée partiellement par loc_id=11
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (84,4,28,11,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (219,22,11,'12/10/2015',28,2,84);
-- demande 84 traitée partiellement par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (85,3,28,22,'10/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (220,1,22,'10/10/2015',28,4,85);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (221,22,3,'11/10/2015',28,4,85);
-- demande 85 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (222,22,11,'12/10/2015',28,11,84);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (223,11,3,'13/10/2015',28,5,84);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (224,11,2,'18/10/2015',28,5,84);
-- demande 84 traitée par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (86,13,28,22,'9/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (225,23,22,'9/10/2015',28,18,86);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (226,22,3,'11/10/2015',28,6,86);
-- demande 86 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (87,20,28,23,'7/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (227,12,23,'7/10/2015',28,28,87);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (228,23,2,'13/10/2015',28,14,87);
-- demande 87 traitée par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (88,31,28,12,'5/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (229,1,12,'5/10/2015',28,32,88);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (230,12,3,'7/10/2015',28,13,88);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (231,12,2,'11/10/2015',28,2,88);
-- demande 88 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (232,24,21,'15/10/2015',28,19,83);
-- demande 83 traitée par loc_id=24
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (89,21,28,24,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (233,1,24,'12/10/2015',28,26,89);
-- demande 89 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (90,3,37,11,'18/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (234,1,11,'18/10/2015',37,1,90);
-- demande 90 traitée partiellement par la pharmacie
-- demande 90 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (91,2,5,22,'20/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (235,1,22,'20/10/2015',5,10,91);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (236,22,2,'26/10/2015',5,6,91);
-- demande 91 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (92,9,9,19,'26/10/2015');
-- demande 92 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (93,19,1,24,'14/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (237,1,24,'14/10/2015',1,13,93);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (238,24,3,'15/10/2015',1,10,93);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (239,24,2,'20/10/2015',1,1,93);
-- demande 93 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (240,22,24,'14/10/2015',1,1,93);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (241,24,2,'21/10/2015',1,1,93);
-- demande 93 traitée partiellement par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (94,4,1,22,'11/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (242,11,22,'11/10/2015',1,13,94);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (243,22,3,'13/10/2015',1,11,94);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (244,22,2,'17/10/2015',1,2,94);
-- demande 94 traitée par loc_id=11
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (95,17,1,11,'9/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (245,10,11,'9/10/2015',1,6,95);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (246,11,3,'10/10/2015',1,5,95);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (247,11,2,'16/10/2015',1,1,95);
-- demande 95 traitée partiellement par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (96,10,1,10,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (248,1,10,'6/10/2015',1,16,96);
-- demande 96 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (249,22,11,'9/10/2015',1,18,95);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (250,11,3,'11/10/2015',1,17,95);
-- demande 95 traitée par loc_id=22
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (97,19,1,22,'7/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (251,16,22,'7/10/2015',1,14,97);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (252,22,3,'8/10/2015',1,5,97);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (253,22,2,'14/10/2015',1,9,97);
-- demande 97 traitée partiellement par loc_id=16
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (98,18,1,16,'5/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (254,1,16,'5/10/2015',1,12,98);
-- demande 98 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (255,21,16,'5/10/2015',1,2,98);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (256,16,2,'12/10/2015',1,2,98);
-- demande 98 traitée partiellement par loc_id=21
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (99,3,1,21,'2/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (257,12,21,'2/10/2015',1,5,99);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (258,21,2,'9/10/2015',1,1,99);
-- demande 99 traitée par loc_id=12
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (100,6,1,12,'30/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (259,17,12,'30/9/2015',1,4,100);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (260,12,3,'1/10/2015',1,2,100);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (261,12,2,'6/10/2015',1,1,100);
-- demande 100 traitée partiellement par loc_id=17
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (101,5,1,17,'28/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (262,1,17,'28/9/2015',1,4,101);
-- demande 101 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (263,23,17,'28/9/2015',1,10,101);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (264,17,2,'4/10/2015',1,6,101);
-- demande 101 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (102,12,1,23,'26/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (265,1,23,'26/9/2015',1,2,102);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (266,23,2,'3/10/2015',1,1,102);
-- demande 102 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (267,1,23,'26/9/2015',1,17,102);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (268,23,2,'3/10/2015',1,12,102);
-- demande 102 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (269,13,12,'30/9/2015',1,10,100);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (270,12,2,'6/10/2015',1,4,100);
-- demande 100 traitée par loc_id=13
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (103,13,1,13,'28/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (271,20,13,'28/9/2015',1,9,103);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (272,13,2,'5/10/2015',1,3,103);
-- demande 103 traitée partiellement par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (104,13,1,20,'26/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (273,10,20,'26/9/2015',1,15,104);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (274,20,3,'28/9/2015',1,13,104);
-- demande 104 traitée par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (105,18,1,10,'24/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (275,1,10,'24/9/2015',1,20,105);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (276,10,2,'30/9/2015',1,15,105);
-- demande 105 traitée par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (277,20,13,'28/9/2015',1,8,103);
-- demande 103 traitée par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (106,10,1,20,'26/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (278,10,20,'26/9/2015',1,18,106);
-- demande 106 traitée par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (107,21,1,10,'24/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (279,1,10,'24/9/2015',1,1,107);
-- demande 107 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (280,1,10,'24/9/2015',1,1,107);
-- demande 107 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (281,18,10,'24/9/2015',1,28,107);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (282,10,3,'26/9/2015',1,10,107);
-- demande 107 traitée par loc_id=18
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (108,31,1,18,'21/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (283,1,18,'21/9/2015',1,22,108);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (284,18,3,'23/9/2015',1,11,108);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (285,18,2,'28/9/2015',1,6,108);
-- demande 108 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (286,23,18,'21/9/2015',1,4,108);
-- demande 108 traitée partiellement par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (109,6,1,23,'18/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (287,1,23,'18/9/2015',1,3,109);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (288,23,3,'20/9/2015',1,3,109);
-- demande 109 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (289,1,23,'18/9/2015',1,1,109);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (290,23,2,'24/9/2015',1,1,109);
-- demande 109 traitée partiellement par la pharmacie
-- demande 109 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (291,17,18,'21/9/2015',1,10,108);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (292,18,3,'22/9/2015',1,4,108);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (293,18,2,'28/9/2015',1,2,108);
-- demande 108 traitée par loc_id=17
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (110,12,1,17,'19/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (294,1,17,'19/9/2015',1,10,110);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (295,17,3,'20/9/2015',1,4,110);
-- demande 110 traitée partiellement par la pharmacie
-- demande 110 abandonnée
-- demande 98 abandonnée
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (296,1,22,'7/10/2015',1,11,97);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (297,22,3,'9/10/2015',1,10,97);
-- demande 97 traitée par la pharmacie
-- demande 93 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (111,15,39,18,'29/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (298,23,18,'29/10/2015',39,20,111);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (299,18,3,'30/10/2015',39,8,111);
-- demande 111 traitée par loc_id=23
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (112,24,39,23,'27/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (300,20,23,'27/10/2015',39,28,112);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (301,23,3,'29/10/2015',39,25,112);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (302,23,2,'3/11/2015',39,2,112);
-- demande 112 traitée par loc_id=20
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (113,29,39,20,'24/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (303,1,20,'24/10/2015',39,31,113);
-- demande 113 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (114,6,2,23,'18/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (304,1,23,'18/10/2015',2,7,114);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (305,23,3,'19/10/2015',2,5,114);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (306,23,2,'25/10/2015',2,2,114);
-- demande 114 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (115,4,34,21,'29/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (307,1,21,'29/10/2015',34,7,115);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (308,21,2,'5/11/2015',34,7,115);
-- demande 115 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (116,6,26,25,'28/10/2015');
-- demande 116 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (117,4,25,19,'28/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (309,1,19,'28/10/2015',25,2,117);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (310,19,3,'30/10/2015',25,2,117);
-- demande 117 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (311,1,19,'28/10/2015',25,1,117);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (312,19,2,'4/11/2015',25,1,117);
-- demande 117 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (313,1,19,'28/10/2015',25,7,117);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (314,19,3,'30/10/2015',25,1,117);
-- demande 117 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (118,19,39,16,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (315,1,16,'6/10/2015',39,1,118);
-- demande 118 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (316,19,16,'6/10/2015',39,25,118);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (317,16,2,'12/10/2015',39,14,118);
-- demande 118 traitée par loc_id=19
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (119,27,39,19,'4/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (318,1,19,'4/10/2015',39,26,119);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (319,19,2,'11/10/2015',39,16,119);
-- demande 119 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (320,1,19,'4/10/2015',39,7,119);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (321,19,3,'5/10/2015',39,7,119);
-- demande 119 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (120,12,28,21,'28/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (322,1,21,'28/10/2015',28,18,120);
-- demande 120 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (121,12,34,10,'21/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (323,15,10,'21/10/2015',34,18,121);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (324,10,3,'22/10/2015',34,13,121);
-- demande 121 traitée par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (122,20,34,15,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (325,1,15,'19/10/2015',34,22,122);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (326,15,3,'20/10/2015',34,14,122);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (327,15,2,'25/10/2015',34,6,122);
-- demande 122 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (123,9,4,10,'8/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (328,1,10,'8/10/2015',4,18,123);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (329,10,3,'9/10/2015',4,6,123);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (330,10,2,'15/10/2015',4,5,123);
-- demande 123 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (124,18,24,16,'29/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (331,1,16,'29/10/2015',24,25,124);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (332,16,3,'30/10/2015',24,8,124);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (333,16,2,'4/11/2015',24,11,124);
-- demande 124 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (125,10,2,18,'17/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (334,10,18,'17/10/2015',2,18,125);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (335,18,2,'23/10/2015',2,4,125);
-- demande 125 traitée par loc_id=10
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (126,21,2,10,'15/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (336,25,10,'15/10/2015',2,24,126);
-- demande 126 traitée par loc_id=25
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (127,28,2,25,'12/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (337,1,25,'12/10/2015',2,27,127);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (338,25,2,'19/10/2015',2,26,127);
-- demande 127 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (339,1,25,'12/10/2015',2,3,127);
-- demande 127 traitée par la pharmacie
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (128,12,20,10,'18/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (340,1,10,'18/10/2015',20,3,128);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (341,10,2,'25/10/2015',20,1,128);
-- demande 128 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (342,15,10,'18/10/2015',20,13,128);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (343,10,3,'19/10/2015',20,10,128);
-- demande 128 traitée par loc_id=15
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (129,15,20,15,'15/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (344,1,15,'15/10/2015',20,10,129);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (345,15,3,'16/10/2015',20,10,129);
-- demande 129 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (346,1,15,'15/10/2015',20,4,129);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (347,15,3,'16/10/2015',20,1,129);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (348,15,2,'22/10/2015',20,2,129);
-- demande 129 traitée partiellement par la pharmacie
-- demande 129 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (130,13,33,16,'28/10/2015');
-- demande 130 non traitée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (131,7,33,23,'19/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (349,1,23,'19/10/2015',33,2,131);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (350,23,3,'21/10/2015',33,1,131);
-- demande 131 traitée partiellement par la pharmacie
-- demande 131 abandonnée
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (132,12,35,16,'6/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (351,1,16,'6/10/2015',35,2,132);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (352,16,2,'12/10/2015',35,1,132);
-- demande 132 traitée partiellement par la pharmacie
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (353,25,16,'6/10/2015',35,12,132);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (354,16,3,'8/10/2015',35,5,132);
-- demande 132 traitée par loc_id=25
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (133,15,35,25,'4/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (355,13,25,'4/10/2015',35,24,133);
-- demande 133 traitée par loc_id=13
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (134,26,35,13,'1/10/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (356,19,13,'1/10/2015',35,34,134);
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (357,13,3,'3/10/2015',35,34,134);
-- demande 134 traitée par loc_id=19
insert into sio_demande(dem_id,qte,med_id,loc_id,dem_date) values (135,37,35,19,'28/9/2015');
insert into sio_deplacement(depl_id,depart,arrivee,date_mvt,med_id,qte,depl_dem_id) values (358,1,19,'28/9/2015',35,38,135);
-- demande 135 traitée par la pharmacie

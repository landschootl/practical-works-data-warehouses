--Ferlicot Rousseau

-- Donnez la moyenne des ventes par année, région, catégorie; par année, région et par année, pour les années 2009 et 2010

--slice(annee=2009 ou annee = 2010, Temps)
SELECT annee, cl_r, category, AVG(qte * pu) as CA_MOYEN
FROM VENTES 
natural join temps
natural join produits
natural join clients
where annee = 2009 or annee = 2010 
group by rollup( annee , cl_r, category);

-- Donnez la moyenne des ventes par année, selon les dimensions région et catégorie pour les années 2009 et 2010

SELECT annee, cl_r, category, AVG(qte * pu) as CA_MOYEN
FROM VENTES 
natural join temps
natural join produits
natural join clients
where annee = 2009 or annee = 2010 
group by cube (annee, cl_r, category);


-- Quel est le produit  qui fait le plus grand CA par année et par catégorie (cf. RANK) ?

select annee, category, pname from (
select annee, category, pname, rank() over (partition by annee, category order by Sum(qte*pu) desc) as rang 
from ventes
natural join temps
natural join produits
group by annee, category, pname
) tmp
where tmp.rang=1;

--Pour chaque année, donner le total des ventes ainsi que le total des ventes par catégorie. On ne veut pas le résultat pour le total des années (utiliser la fonction GROUPING_ID)

select annee, category, sum(qte*pu)
from ventes
natural join temps
natural join produits
group by cube(annee, category)
having grouping_id(annee)< 1;

-- Quel est le meilleur mois de vente du produit "Sirop d érable" pour chacune des années ?

select annee, mois, CA_TOTAL from (select annee, mois, sum(qte*pu) as CA_TOTAL, rank() over (partition by annee order by Sum(qte*pu) desc) as rang
from ventes
natural join temps
natural join produits
where pname = 'Sirop d érable'
group by annee, mois) tmp
where tmp.rang = 1;


-- Donnez tous les totaux de ventes par année selon la dimension catégorie, ainsi que selon la dimension cl_name (nom du client). Utilisez la commande GROUPING_SETS

select annee, cl_name, category,  sum(qte*pu)
from ventes
natural join temps
natural join produits
natural join clients
group by annee, grouping sets(category, cl_name);

-- Quelle est la répartition par tiers des catégories selon leurs quantités totales vendues en 2010 ?
select category, SUM(qte) as QTE_VENDU_2010, NTILE(3) OVER(ORDER BY SUM(qte) DESC) as TIERS
from ventes
natural join temps
natural join produits
where annee = 2010
group by category;

-- Quelle est la quantité de produits vendus pour chaque catégorie, les 5 premiers jours de chaque mois de 2010 ?
-- On peut imaginer plusieurs solutions, selon que l’on interprète «les 5 premiers jours de chaque mois» par «un jour compris entre 1 et 5» ou «les 5 premiers jours de vente».

select category, mois, sum(qte) as qte_vendue
from ventes
natural join temps
natural join produits
where annee =2010
and jour <=5
group by category, annee, mois
order by category, mois;
















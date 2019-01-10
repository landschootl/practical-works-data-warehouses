-- FERLICOT ROUSSEAU

--Quel est le classement des salaires des employés par département pour les départements 10 et 30 ?

SELECT DEPTNO, ENAME, SAL, rank() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANG
FROM EMP
WHERE DEPTNO = 10
OR DEPTNO = 30;                                                                                              

--Idem en ôtant les trous dans le classement

SELECT DEPTNO, ENAME, SAL, dense_rank() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANG
FROM EMP
WHERE DEPTNO = 10
OR DEPTNO = 30;  

-- Quel est le classement décroissant des salaires différents par département pour les départements 10 et 20 ?

SELECT DEPTNO, SAL, dense_rank() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANG
FROM EMP
WHERE DEPTNO = 10
OR DEPTNO = 20
GROUP BY SAL, DEPTNO;  

-- Quel est le salaire total versé par profession (répondre avec deux méthodes possibles avec et sans «group by») ?
SELECT JOB, SUM(SAL) as TOTAL_SAL_JOB
FROM EMP
GROUP BY JOB;

-- OU

SELECT UNIQUE JOB, SUM(SAL) over (PARTITION BY job) as TOTAL_SAL_JOB
FROM EMP;

-- Quel le est la différence entre un « group by » et un « partition by » dans une requête SQL ?

-- La différence est que le group by est une fonction d'aggregat qui va grouper les résultats identiques alors que le partition by est juste une fonction d'analyse qui ne pas grouper les elements identiques.

-- Quel est le montant total des salaires versés, tous départements et jobs confondus, par département et par département et job ?

SELECT DEPTNO, JOB, SUM(SAL) as SUM
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

-- Idem en ôtant toute confusion avec les valeurs nulles (répondre avec deux méthodes possibles)+

SELECT NVL(to_char(DEPTNO), 'TousDep')  as DEPARTEMENT, NVL(to_char(JOB), 'TousEmployés') as JOB, SUM(SAL) as SUM
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);









DROP TABLE DEPT;
DROP TABLE EMP;

CREATE TABLE DEPT
    (
    DEPTNO NUMERIC(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    PRIMARY KEY("DEPTNO")
    );

CREATE TABLE EMP
    (
    EMPNO NUMERIC(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMERIC(4),
    HIREDATE DATE,
    SAL NUMERIC(7,2),
    COMM NUMERIC(7,2),
    DEPTNO NUMERIC(2)
    );

INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-7-87','dd-mm-yy')-85,3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-7-87', 'dd-mm-yy')-51,1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
COMMIT;

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

-- 

-- Quel est le montant total des salaires versés, tous départements et jobs confondus, par département et par département et job ?

SELECT DEPTNO, JOB, SUM(SAL) as SUM
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

-- Idem en ôtant toute confusion avec les valeurs nulles (répondre avec deux méthodes possibles)+

SELECT NVL(to_char(DEPTNO), 'TousDep')  as DEPARTEMENT, NVL(to_char(JOB), 'TousEmployés') as JOB, SUM(SAL) as SUM
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);









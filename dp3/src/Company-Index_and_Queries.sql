-- RESOLUÇÃO DO DESAFIO - PARTE 1 - CRIAÇÃO DE ÍNDICES, QUERIES E VIEWS
-- Utilizou-se como critério para indexação, os atributos chave utilizados na junção das tabelas para qualificar as consultas.

use company;

create index idx_employee_name on employee(Fname);
create index idx_employee_dno on employee(Dno);
create index idx_Department_Dnumber on department(Dnumber);

-- EXECUÇÃO DAS QUERIES

-- Pergunta: Qual o departamento com maior número de pessoas ?
-- A Querie retorna o departamento com o valor maximo de empregados, incluindo valores máximos duplicados, caso ocorra.
SELECT dname as 'Departament', employee_count as 'Employees'
FROM (
    SELECT d.dnumber, d.dname, COUNT(e.dno) AS employee_count
    FROM department d
    LEFT JOIN employee e ON d.dnumber = e.dno
    GROUP BY d.dnumber
) AS counts 
WHERE employee_count = (
    SELECT MAX(employee_count)
    FROM (
        SELECT d.dnumber, COUNT(e.dno) AS employee_count
        FROM department d
        LEFT JOIN employee e ON d.dnumber = e.dno
        GROUP BY d.dnumber
    ) AS max_counts
);
 
 
-- Pergunta: Quais são os departamentos por cidade? 
select d.Dname as 'Departamento', l.Dlocation as 'Cidade' from department d 
	join dept_locations l
    on d.Dnumber = l.Dnumber
    order by Dname;


-- Pergunta: Qual a relação de empregados por departamento 
select concat(e.Fname, ' ', Minit, ' ', Lname) as Funcionário, d.dname as 'Departamento' from employee e 
	join department d
    on e.dno = d.dnumber
    order by d.dname, e.fname;
    
-- VIEWS:

-- Número de empregados por departamento e localidade        
create view employee_location as 
	SELECT d.dname as Department, Dlocation as Location, COUNT(e.dno) as 'Employees'
		FROM department d
		LEFT JOIN employee e ON d.dnumber = e.dno
        LEFT JOIN dept_locations l ON l.dnumber = d.dnumber
		GROUP BY d.dnumber, l.dlocation
        ORDER BY l.dlocation, d.dname;


-- Lista de departamentos e seus gerentes
create view dept_mngr as 
	SELECT d.dname as Department, concat(e.Fname, ' ', e.Minit, ' ', e.Lname) as Manager, l.dlocation as Location
		FROM department d
		LEFT JOIN employee e ON d.dnumber = e.dno
        LEFT JOIN dept_locations l ON l.dnumber = d.dnumber
		WHERE e.ssn = d.mgr_ssn
        ORDER BY d.dname, l.dlocation;


-- Projetos com maior número de empregados
create view max_employee_prj as
	SELECT Pname as Project, Employee_count from 
		(SELECT Pname, count(w.Essn) as Employee_count
        FROM works_on w
        LEFT JOIN employee e on w.Essn = e.Ssn
		LEFT JOIN project p on w.pno = p.pnumber
        group by pname) as count_prj
    WHERE employee_count = (
		SELECT max(employee_COUNT) from
    	(SELECT Pname, count(w.Essn) as Employee_count
        FROM works_on w
        LEFT JOIN employee e on w.Essn = e.Ssn
		LEFT JOIN project p on w.pno = p.pnumber
        group by pname) as max_count_prj)
        order by pname;
    
    
-- Lista de projetos, departamentos e gerentes
CREATE VIEW prj_dept_mngr as 
	SELECT p.Pname as Project, d.Dname as Department, concat(e.Fname, ' ', e.Minit, ' ', Lname) as Manager
		FROM project p
        JOIN department d ON d.Dnumber = p.Dnum
        JOIN employee e ON d.Mgr_ssn = e.Ssn
        order by Pname;


-- Quais empregados possuem dependentes e se são gerentes 
create view employee_dep_mgr AS
SELECT concat(Fname, ' ', Minit, ' ', Lname, 
	CASE d1.Essn 
		WHEN d1.Essn THEN ''
    ELSE 'NO'
    END) AS Employee, 
    CASE d2.Mgr_ssn
		WHEN d2.Mgr_ssn THEN 'YES'
    ELSE 'NO'
	END AS Manager
    FROM employee e
    JOIN dependent d1 on e.ssn = d1.essn
    LEFT JOIN department d2 on e.ssn = d2.Mgr_ssn
    group by employee;
   

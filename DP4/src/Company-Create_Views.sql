-- RESOLUÇÃO DO DESAFIO 4 
-- PARTE 1 - PERSONALIZANDO ACESSOS COM VIEWS
/*
- Neste desafio você irá criar visões para os seguintes cenários: 

Número de empregados por departamento e localidade 
Lista de departamentos e seus gerentes 
Projetos com maior número de empregados (ex: por ordenação desc) 
Lista de projetos, departamentos e gerentes 
Quais empregados possuem dependentes e se são gerentes

- Definir as permissões de acesso as views de acordo com o tipo de conta de usuários:
O usuário gerente terá acesso as informações de employee e departamento, entretanto employee não terá acesso as informações relacionadas aos departamentos ou gerentes
*/

use company;

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

   
-- DEFINIÇÃO DE PERMISSÕES DE ACESSO AS VIEWS

create user 'geral'@localhost identified by '123456789';
grant all privileges on company.prj_dept_mngr to 'geral'@localhost;

create user 'manager'@localhost identified by '123456789';
grant all privileges on company.* to 'manager'@localhost;

revoke all, grant OPTION FROM 'geral'@localhost;
revoke all, grant OPTION FROM 'manager'@localhost;



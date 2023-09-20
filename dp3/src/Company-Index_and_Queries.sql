-- RESOLUÇÃO DO DESAFIO - PARTE 1 - CRIAÇÃO DOS ÍNDICES E QUERIES
-- Utilizou-se como critério a indexação dos atributos chave utilizados na junção das tabelas para qualificar as consultas.

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
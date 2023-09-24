-- RESOLUÇÃO DO DESAFIO 4 
-- PARTE 2 - AUTOMATIZANDO AÇÕES COM TRIGGERS PARA O CENÁRIO DE ECOMMERCE

use ecommerce;

-- CRIANDO A TABELA FORMER_CLIENT QUE RECEBERÁ OS REGISTROS DE CLIENTES EXCLUIDOS
create table former_client (
id_former_client int primary key auto_increment,
Fname varchar(10),
Minit char(3),
Lname varchar(20),
CPF char(11),
Address varchar(255),
Delete_date timestamp default now()
) engine innodb ;

-- CRIANDO TRIGGER BEFORE CLIENT DELETE
delimiter $$
create trigger bef_client_delete
before delete
on clients for EACH ROW
BEGIN
		insert into former_client(Fname, Minit, Lname, CPF, Address) 
        values (OLD.Fname, OLD.Minit, OLD.Lname, OLD.CPF, OLD.Address);
END $$
delimiter ;

show TRIGGERS;

call proc_clients(1,'John', 'D', 'Ford', '01750558703', 'Capitain America St');
call proc_clients(2,'John', 'D', 'Rockfeller', '01750558703', 'Fair Lane Drive');
call proc_clients(3,'', '', '', '01750558703', '');
call proc_clients(4,'','','','','');

-- TRIGGER DE INSERÇÃO BEFORE INSERT PARA O CENARIO DE COMPANY

use company;


delimiter $$
create trigger bef_employee_insert
before insert
on employee for EACH ROW
	BEGIN
			case new.Dno 
				when 1 then set new.Super_ssn = '333445555'; 
				when 2 then set new.Super_ssn = null; 
				when 3 then set new.Super_ssn = null; 
				when 4 then set new.Super_ssn = '123456789'; 
				when 5 then set new.Super_ssn = '987654321'; 
			end case; 
	END $$
delimiter ;

insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
			values('João', 'B', 'Silva', '122456759', '1962-01-09', '678-Fondren-Houston-TX', 'M', '32000.00', NULL, 5); 


-- TRIGGER DE ATUZALIZAÇÃO BEFORE UPDATE PARA O CENARIO DE COMPANY

delimiter // 
create trigger bef_employee_upd BEFORE UPDATE ON employee 
       FOR EACH ROW 
       BEGIN 
            IF NEW.salary <= OLD.salary THEN 
               SET NEW.salary = OLD.salary * 1.20; 
           ELSEIF NEW.salary > OLD.salary THEN
               SET NEW.salary = OLD.salary * 1.20; 
           END IF; 
       END // 
delimiter ; 

update employee set salary = 32000.00 where ssn = '122456759';

show triggers;
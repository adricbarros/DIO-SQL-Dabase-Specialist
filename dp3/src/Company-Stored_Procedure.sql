-- RESOLUÇÃO DO DESAFIO  - PARTE 2 
-- UTILIZAÇÃO DE PROCEDURES PARA MANIPULAÇÃO DE DADOS EM BANCO DE DADOS

use ecommerce;

-- PROCEDURE PARA INSERÇÃO, REMOÇÃO, ALTERAÇÃO E LISTAGEM DOS DADOS DE CLIENTES
DELIMITER \\
create procedure proc_clients(
	in opcao_p int,
	in Fname_p varchar(10),
	in Minit_p char(3) ,
	in Lname_p varchar(20),
	in CPF_p char(11),
	in Address_p varchar(255)
	)
BEGIN
	IF opcao_p = 1 then -- OPÇÃO 1: INSERE CLIENTES NO CADASTRO
		INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES (Fname_p, Minit_p, Lname_p, CPF_p, Address_p);
        SELECT 'REGISTRO INSERIDO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CONCAT(FNAME_p, ' ', MINIT_p, ' ', LNAME_p) AS 'CLIENT NAME', CPF_P AS CPF, ADDRESS_p AS ADDRESS;
	ELSEIF opcao_P = 2 then -- #OPÇÃO 2: ALTERA OS DADOS DO CLIENTE EXCETO CPF
	    UPDATE clients SET Fname = fname_p, Minit = minit_p, Lname = lname_p, cpf = cpf_p, Address = address_p WHERE cpf = cpf_p;
		SELECT 'REGISTRO ATUALIZADO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CONCAT(FNAME_p, ' ', MINIT_p, ' ', LNAME_p) AS 'CLIENT NAME', CPF_P AS CPF, ADDRESS_p AS ADDRESS;
    ELSEIF opcao_P = 3 then -- OPÇÃO 3: REMOVE CLIENTES NO CADASTRO
		DELETE FROM clients WHERE CPF = CPF_p;
        SELECT 'REGISTRO REMOVIDO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CPF_P AS CPF;
    ELSEIF opcao_p = 4 THEN -- OPÇÃO 4: LISTAGEM DE CLIENTES E CPF (MASCARADO)
		SELECT CONCAT(FNAME, ' ', MINIT, ' ', LNAME) AS 'CLIENT NAME', CONCAT(SUBSTR(CPF, 1, 3), '.***', SUBSTR(CPF, 7, 3), '-**') AS CPF FROM CLIENTS ORDER BY fname;
	END IF;
    end \\
DELIMITER ;


call proc_clients(1,'John', 'D', 'Ford', '01750558703', 'Capitain America St');
call proc_clients(2,'John', 'D', 'Rockfeller', '01750558703', 'Fair Lane Drive');
call proc_clients(3,'', '', '', '01750558703', '');
call proc_clients(4,'','','','','');

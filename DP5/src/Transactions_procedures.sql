-- DIO SQL Database Specialist
-- Resolução do Desafio de Projeto Nº 5
-- Criando Transações e executando Backup & Recovery de Banco de Dados

-- PARTE 1 – Transações de Banco de Dados.
-- Executar statements de consultas e modificações de dados persistidos no banco de dados via transações

USE ecommerce;
SELECT @@autocommit;
SET AUTOCOMMIT = OFF;


START TRANSACTION;
	INSERT INTO ecommerce.clients (Fname, Minit, Lname, CPF, Address) 
		VALUES ('John', 'D', 'Ford', '01750558703', 'Capitain America St');
	UPDATE ecommerce.clients SET Fname='John', Minit='D', Lname='Rockfeller', CPF='01750558703', Address='Fair Lane Drive'
		WHERE CPF = '01750558703';
COMMIT;

START TRANSACTION;
	SELECT CONCAT(FNAME, ' ', MINIT, ' ', LNAME) AS 'CLIENT NAME', CONCAT(SUBSTR(CPF, 1, 3), '.***', SUBSTR(CPF, 7, 3), '-**') AS CPF, ADDRESS
    FROM CLIENTS
    ORDER BY fname;
ROLLBACK;


-- PARTE 2 - Transações de Banco de Dados com procedure.
-- Neste desafio você irá criar um exemplo de transação com procedure.
/* 
Procedure deve ter variáveis que receberão valores dos atributos e parâmetro para escolha da ação (inserção, modificação ou sair).
Defina uma estrutura condicional para cada ação a ser executada.
Implementar a verificação de erro, acarretando em um ROLLBACK total ou parcial (SAVEPOINT).
*/

DELIMITER \\
create procedure proc_clients_trx(
	in opcao_p int,
	in Fname_p varchar(10),
	in Minit_p char(3) ,
	in Lname_p varchar(20),
	in CPF_p char(11),
	in Address_p varchar(255)
	)
BEGIN
	DECLARE erro_proc_client_trx TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_proc_client_trx = TRUE;
	
    IF opcao_p = 1 THEN -- OPÇÃO 1: INSERE CLIENTES NO CADASTRO
		START TRANSACTION;
        INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES (Fname_p, Minit_p, Lname_p, CPF_p, Address_p);
        IF erro_proc_client_trx = FALSE THEN
			COMMIT;
			SELECT 'REGISTRO INSERIDO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CONCAT(FNAME_p, ' ', MINIT_p, ' ', LNAME_p) AS 'CLIENT NAME', CPF_P AS CPF, ADDRESS_p AS ADDRESS;
		ELSE
			ROLLBACK;
			SELECT 'Erro na transação' AS "MENSAGEM DO SISTEMA";
		END IF;
    ELSEIF opcao_P = 2 then -- #OPÇÃO 2: ALTERA OS DADOS DO CLIENTE EXCETO CPF
	    START TRANSACTION;
        UPDATE clients SET Fname = fname_p, Minit = minit_p, Lname = lname_p, Address = address_p WHERE cpf = cpf_p;
        IF erro_proc_client_trx = FALSE THEN
			COMMIT;
			SELECT 'REGISTRO ATUALIZADO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CONCAT(FNAME_p, ' ', MINIT_p, ' ', LNAME_p) AS 'CLIENT NAME', CPF_P AS CPF, ADDRESS_p AS ADDRESS;
		ELSE
			ROLLBACK;
			SELECT 'Erro na transação' AS "MENSAGEM DO SISTEMA";
		END IF;
    ELSEIF opcao_P = 3 then -- OPÇÃO 3: REMOVE CLIENTES NO CADASTRO
		START TRANSACTION;
        DELETE FROM clients WHERE CPF = CPF_p;
	    IF erro_proc_client_trx = FALSE THEN
			COMMIT;
			SELECT 'REGISTRO REMOVIDO COM SUCESSO =>' AS "MENSAGEM DO SISTEMA", CPF_P AS CPF;
		ELSE
			ROLLBACK;
			SELECT 'Erro na transação' AS "MENSAGEM DO SISTEMA";
		END IF;
    ELSEIF opcao_p = 4 THEN -- OPÇÃO 4: LISTAGEM DE CLIENTES, CPF (MASCARADO) E ENDEREÇO
		START TRANSACTION;
        SELECT CONCAT(FNAME, ' ', MINIT, ' ', LNAME) AS 'CLIENT NAME', CONCAT(SUBSTR(CPF, 1, 3), '.***', SUBSTR(CPF, 7, 3), '-**') AS CPF, ADDRESS FROM CLIENTS ORDER BY fname;
        ROLLBACK;
	END IF;
    END \\
DELIMITER ;


call proc_clients_trx(1,'John', 'D', 'Ford', '01750558703', 'Capitain America St');
call proc_clients_trx(2,'Joseph', 'C', 'Climber', '01750558703', 'R Lauro Muller');
call proc_clients_trx(3,'', '', '', '01750558703', '');
call proc_clients_trx(4,'','','','','');
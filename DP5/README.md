# DIO - SQL DATABASE SPECIALIST

***Repositório com a resolução do Desafio de Projeto Nº 5: Criando Transações, executando Backup e Recovery de Banco de Dados***

<img src="images/database_data.png" align='center' alt="drawing" width="900" heigth="551"/>


![GitHub repo size](https://img.shields.io/github/repo-size/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)


## Objetivos:


**Parte 1 – Transações de Banco de Dados.**

Neste desafio você irá utilizar transações para executar modificações na base de dados.

Entregável:

    • Executar statements de consultas e modificações de dados persistidos no banco de dados via transações
    

**Parte 2 – Transações de Banco de Dados com procedure.**

Neste desafio você irá criar um exemplo de transação com procedure.

Entregável: 

    • Procedure deve ter variáveis que receberão valores dos atributos e parâmetro para escolha da ação (inserção, modificação ou sair).
    • Defina uma estrutura condicional para cada ação a ser executada.
    • Implementar a verificação de erro, acarretando em um ROLLBACK total ou parcial (SAVEPOINT).
  
**Parte 3 – Backup & Recovery de Banco de Dados.**

Neste desafio você realizará o backup e recovery do banco de dados.

Entregável: 

    • Utilize o mysqdump para realizar o backup e recovery do banco de dados e-commerce.
    • Realize o backup de diferentes bancos de dados e insira os recursos como procedures, eventos e outros.
    • Adicione o arquivo de backup ao github juntamente com o script


## **Resolução:**

**Parte 1 – Transações de Banco de Dados.**

<img src="images/transaction_queries.png" align='center' alt="drawing" width="1095" heigth="411"/>


**Parte 2 – Transações de Banco de Dados com procedures.**

• Tabela de Clientes antes das alterações da Procedure.

<img src="images/Procedure__transaction_0.png" align='center' alt="drawing" width="500" heigth="350"/>


• Inserção de dados na tabela de Clientes.

<img src="images/Procedure__transaction_1.png" align='center' alt="drawing" width="500" heigth="350"/>

• Consulta de dados persistidos na tabela de Clientes.

<img src="images/Procedure__transaction_2.png" align='center' alt="drawing" width="500" heigth="390"/>


• Alteração de dados na tabela de Clientes via Transaction com procedures.

<img src="images/Procedure__transaction_3.png" align='center' alt="drawing" width="500" heigth="350"/>

• Consulta de dados persistidos após alteração na tabela de Clientes.

<img src="images/Procedure__transaction_4.png" align='center' alt="drawing" width="500" heigth="350"/>


• Verificação de erro após inserção de dados duplicados de Cliente(CPF).

<img src="images/Procedure_transaction_5.png" align='center' alt="drawing" width="500" heigth="350"/>



**Parte 3 – Backup & Recovery de Banco de Dados.**


• Backup do banco de dados ecommerce com mysqdump. 

<img src="images/Backup_ecommerce.png" align='center' alt="drawing" width="979" heigth="350"/>

• Backup do banco de dados company com os recursos: procedures, triggers e outros com mysqldump. 

<img src="images/Backup_company.png" align='center' alt="drawing" width="979" heigth="350"/>

## Source Files:
  
![SQL Create Transaction Procedures](https://github.com/adricbarros/DIO-SQL-Database-Specialist/blob/main/DP5/src/Transaction_procedures.sql)

![SQL Backup Data - Company](https://github.com/adricbarros/DIO-SQL-Database-Specialist/blob/main/DP5/src/Company_bkp.sql)

![SQL Backup Data - Ecommerce](https://github.com/adricbarros/DIO-SQL-Database-Specialist/blob/main/DP5/src/Ecommerce_bkp.sql)

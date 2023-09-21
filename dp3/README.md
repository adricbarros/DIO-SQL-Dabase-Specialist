
# DIO - SQL DATABASE SPECIALIST

Repositório com a resolução do Desafio de Projeto Nº 3: Personalizando Banco de Dados com Índices e Procedures.

<img src="images\INDEXING_DATABASES.png" align='center' alt="drawing" width="1323" heigth="614"/>

![GitHub repo size](https://img.shields.io/github/repo-size/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)


## Objetivos:


**Parte 1 – Criando índices em Banco de Dados**

Criação de índices para consultas para o cenário de company com as perguntas (queries sql) para recuperação de informações. Sendo assim, dentro do script serão criados os índices com base nas consultas SQL.  

O que será levado em consideração para criação dos índices? 

    Quais os dados mais acessados 

    Quais os dados mais relevantes no contexto 

Lembre-se da função do índice... ele impacta diretamente na velocidade da busca pelas informações no SGBD. Crie apenas aqueles que são importantes. Sendo assim, adicione um README dentro do repositório do Github explicando os motivos que o levaram a criar tais índices. Para que outras pessoas possam se espelhar em seu trabalho, crie uma breve descrição do projeto. 

A criação do índice pode ser criada via ALTER TABLE ou CREATE Statement.

Perguntas:  

    1 - Qual o departamento com maior número de pessoas? 
    2 - Quais são os departamentos por cidade? 
    3 - Relação de empregados por departamento 

O empregador precisa ter as visões:

    • Número de empregados por departamento e localidade
    • Lista de departamentos e seus gerentes
    • Projetos com maior número de empregados
    • Lista de projetos, departamentos e gerentes
    • Quais empregados possuem dependentes e se são gerentes

Entregável: 

    Crie as queries e views para responder essas perguntas 
    Crie o índice para cada tabela envolvida (de acordo com a necessidade) 
    Tipo de indice utilizado e motivo da escolha (via comentário no script ou readme) 
     
    

**Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados**

Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).  

Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

Entregável: 

    Script SQL com a procedure criada e chamada para manipular os dados de universidade e e-commerce. 

    Podem ser criados dois arquivos distintos, assim como a utilização do mesmo script para criação das procedures.

## Resolução - Parte 1:

**Perguntas:**  

1 - Qual o departamento com maior número de pessoas?

   <img src="images\dept_max_employee.png" align='center' alt="drawing" width="188" heigth="85"/>
     
2 - Quais são os departamentos por cidade? 
   
   <img src="images\dept_by_city.png" align='center' alt="drawing" width="189" heigth="136"/>
    
3 - Relação de empregados por departamento
   
   <img src="images\employee_by_dept.png" align='center' alt="drawing" width="220" heigth="204"/>

**Views**

• Número de empregados por departamento e localidade

<img src="images\employee_location.png" align='center' alt="drawing" width="246" heigth="130"/>

• Lista de departamentos e seus gerentes

<img src="images\dept_mngr.png" align='center' alt="drawing" width="282" heigth="132"/>

• Projetos com maior número de empregados

<img src="images\max_employee_prj.png" align='center' alt="drawing" width="218" heigth="119"/>

• Lista de projetos, departamentos e gerentes

<img src="images\prj_dept_mngr.png" align='center' alt="drawing" width="299" heigth="151"/>

• Quais empregados possuem dependentes e se são gerentes

<img src="images\employee_dep_mgr.png" align='center' alt="drawing" width="188" heigth="115"/>

## Resolução - Parte 2:

• Stored Procedure para manipulação dos dados em Ecommerce 

**Listagem inicial:**

<img src="images\Company_proc_select1.png" align='center' alt="drawing" width="221" heigth="201"/>

**Inserção:**

<img src="images\Company_proc_insert.png" align='center' alt="drawing" width="535" heigth="69"/>

**Check da inserção:**

<img src="images\Company_proc_select2.png" align='center' alt="drawing" width="266" heigth="216"/>

**Alteração:**

<img src="images\Company_proc_update.png" align='center' alt="drawing" width="535" heigth="69"/>

**Check da alteração:**

<img src="images\Company_proc_select3.png" align='center' alt="drawing" width="264" heigth="214"/>

**Exclusão:**

<img src="images\Company_proc_delete.png" align='center' alt="drawing" width="333" heigth="61"/>

## Source Files:
  
![SQL Create Index & Views Script](https://github.com/adricbarros/DIO-SQL-Database-Specialist/raw/main/dp3/src/Company-Index_and_Queries.sql)

![SQL Stored Procedure Script](https://github.com/adricbarros/DIO-SQL-Database-Specialist/raw/main/dp3/src/Company-Stored_Procedure.sql)

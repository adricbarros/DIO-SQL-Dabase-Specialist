
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

## Resolução:

**Parte 1 - Perguntas:**  

1 - Qual o departamento com maior número de pessoas?

   <img src="images\dept_max_employee.png" align='center' alt="drawing" width="188" heigth="85"/>
     
2 - Quais são os departamentos por cidade? 
   
   <img src="images\dept_by_city.png" align='center' alt="drawing" width="189" heigth="136"/>
    
3 - Relação de empregados por departamento
   
   <img src="images\employee_by_dept.png" align='center' alt="drawing" width="220" heigth="204"/>

## Source Files:
  
![SQL Create Index & Views Script](https://github.com/adricbarros/DIO-SQL-Database-Specialist/raw/main/dp3/src/Company-Index_and_Queries.sql)

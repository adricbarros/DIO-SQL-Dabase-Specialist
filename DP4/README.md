# DIO - SQL DATABASE SPECIALIST

***Repositório com a resolução do Desafio de Projeto Nº 4: Personalizando Acessos e Automatizando ações no MySQL***

<img src="images/Views_and_triggers_SQL.png" align='center' alt="drawing" width="960" heigth="469"/>


![GitHub repo size](https://img.shields.io/github/repo-size/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)


## Objetivos:


**Parte 1 – Personalizando acessos com views para o cenário de Company**

Neste desafio você irá criar visões para os seguintes cenários:

    • Número de empregados por departamento e localidade 
    • Lista de departamentos e seus gerentes 
    • Projetos com maior número de empregados (ex: por ordenação desc) 
    • Lista de projetos, departamentos e gerentes 
    • Quais empregados possuem dependentes e se são gerentes 
 

Definir permissões de acesso as views de acordo com o tipo de conta de usuário. 

Criar um usuário gerente que terá acesso as informações de employee e departamento. 
Contudo, employee não terá acesso as informações relacionadas aos departamentos ou gerentes. 



**Parte 2 – Criando gatilhos para cenário de e-commerce**

Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de e-commerce. 

Entregável: 

    • Triggers de remoção: before delete 
    • Triggers de atualização: before update 
 
CODE 2:
Remoção  
Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 

CODE 3:
Atualização  
Inserção de novos colaboradores e atualização do salário base. 


## **Resolução - Parte 1:**

**Personalizando acessos com Views**

• Número de empregados por departamento e localidade

<img src="images/employee_location.png" align='center' alt="drawing" width="246" heigth="130"/>

• Lista de departamentos e seus gerentes

<img src="images/dept_mngr.png" align='center' alt="drawing" width="282" heigth="132"/>

• Projetos com maior número de empregados

<img src="images/max_employee_prj.png" align='center' alt="drawing" width="218" heigth="119"/>

• Lista de projetos, departamentos e gerentes

<img src="images/prj_dept_mngr.png" align='center' alt="drawing" width="299" heigth="151"/>

• Quais empregados possuem dependentes e se são gerentes

<img src="images/employee_dep_mgr.png" align='center' alt="drawing" width="188" heigth="115"/>


**Definição de permissões de acesso as Views e ao Banco de Dados**

• Usuário Geral: Concedido acesso somente a View "prj_dept_mngr"

<img src="images/user_permission_geral-1.png" align='center' alt="drawing" width="868" heigth="517"/>

<img src="images/User_permission_geral-2.png" align='center' alt="drawing" width="864" heigth="557"/>

• Usuário Manager: Concedido acesso irrestrito ao banco Company

<img src="images/User_permission_manager-1.png" align='center' alt="drawing" width="1241" heigth="647"/>

## **Resolução - Parte 2:**

**Automatizando ações com Triggers**


## Source Files:
  
![SQL Create Views & Triggers Script](https://github.com/adricbarros/DIO-SQL-Database-Specialist/blob/main/DP4/src/Company-Create_Views_Triggers.sql)



# DIO - SQL Database Specialist

Repositório com as resoluções dos desafios de projeto e desafios de código da formação SQL Database Specialist da Digital Inovation One - DIO.

<img src="images\SQL Specialist Logo.webp" align='center' alt="drawing" width="250" heigth="250"/>

![GitHub repo size](https://img.shields.io/github/repo-size/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)

## Sobre:

Detalhes da formação

Desenvolva suas habilidades com banco de dados, aprenda como modelar uma base de dados de acordo com necessidades de negócios, aprenda a trabalhar com comandos Data Manipulation Language (DML) e Data Definition Language (DDL) para consultar e manipular seus dados. Crie projetos de soluções baseadas nas boas práticas das regras formais e explore técnicas de Recuperação e Controle de Concorrência em Banco de dados.

⚠️Pré-requisitos: Conhecimentos básicos em Lógica de Programação e Pensamento Computacional são muito bem-vindos!

Atividades:

* Desafio de Código: Coloque em prática todo o conhecimento adquirido nas aulas e teste o seu conhecimento na resolução de um desafio.
* Desafio de Projeto: Construa o seu portfólio construindo projetos práticos com o conhecimento adquirido ao longo das aulas.

## Desafio 1:

Objetivo:
Refine o modelo apresentado acrescentando os seguintes pontos:

   * Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
   * Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
   * Entrega – Possui status e código de rastreio;


![R E S O L U Ç Ã O:](https://github.com/adricbarros/DIO-SQL-Database-Specialist/tree/main/DP1)


## Desafio 2:

Criar um esquema conceitual do zero. 
A partir da narrativa fornecida criar todas as entidades, relacionamentos e atributos. Caso encontre algo que não foi definido na narrativa, utilize a sua compreensão do contexto e deixe uma descrição no README do seu github para verificação.

O esquema deverá ser adicionado ao repositório do Github para futura avaliação do desafio de projeto.
Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.

Narrativa:

  * Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
  * Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas.
  * Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
  * A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
  * O valor de cada peça também irá compor a OS.
  * O cliente autoriza a execução dos serviços.
  * A mesma equipe avalia e executa os serviços.
  * Os mecânicos possuem código, nome, endereço e especialidade.
  * Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
  * Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
  * Uma Os pode ter vários tipos de peças, e uma peça pode estar presente em mais de uma OS.


![R E S O L U Ç Ã O:](https://github.com/adricbarros/DIO-SQL-Database-Specialist/tree/main/DP2)


## Desafio 3:


Criação de índices com base nas consultas para o cenário de company e queries sql para recuperação de informações.  

**Parte 1 – Criando índices em Banco de Dados**

O que deverá ser levado em consideração para criação dos índices? 

    • Quais os dados mais acessados 
    • Quais os dados mais relevantes no contexto 

A criação do índice pode ser criada via ALTER TABLE ou CREATE Statement.

**Perguntas:**

    1 - Qual o departamento com maior número de pessoas? 
    2 - Quais são os departamentos por cidade? 
    3 - Relação de empregados por departamento 

**Entregável:** 

    • Crie as queries para responder essas perguntas 
    • Crie o índice para cada tabela envolvida (de acordo com a necessidade) 
    • Tipo de indice utilizado e motivo da escolha (via comentário no script ou readme) 
     
    

**Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados**

Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).  

Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

Entregável: 

    •Script SQL com a procedure criada e chamada para manipular os dados de universidade e e-commerce. 
    •Podem ser criados dois arquivos distintos, assim como a utilização do mesmo script para criação das procedures.

![R E S O L U Ç Ã O:](https://github.com/adricbarros/DIO-SQL-Database-Specialist/tree/main/dp3)


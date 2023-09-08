
# DIO - Formação SQL Specialist

Repositório com a resolução do Desafio: Projeto Lógico de Banco de Dados do Zero.

<img src="images\banner-de-mecanico-foto.jpg" align='center' alt="drawing" width="1680" heigth="640"/>

![GitHub repo size](https://img.shields.io/github/repo-size/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/adricbarros/DIO-SQL-Database-Specialist?style=for-the-badge)


## Objetivo:

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

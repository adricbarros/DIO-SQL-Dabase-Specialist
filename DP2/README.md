
# DIO - SQL DATABASE SPECIALIST

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


## Resolução:


**Esquema Conceitual**

<img src="images\Modelo Conceitual - Oficina.png" align='center' alt="drawing" width="693" heigth="413"/>
<br />
<br />

**Diagrama EER** ***(Enhanced Entity Relationship)***
<br />               
<img src="images\Diagrama EER - Oficina.png" align='center' alt="drawing" width="693" heigth="413"/>

Conforme interpretação do contexto fornecido, as seguintes convenções foram consideradas no Modelo Relacional:
<br />
- Os clientes podem ser pessoa física ou jurídica, devendo a aplicação tratar o dado (CPF ou CNPJ) de acordo com a quantidade de caracteres inseridos (11 ou 14) respectivamente.
- O Cliente abre uma Ordem de Serviço, que é encaminhada a uma equipe responsável.
- A equipe responsável avalia os itens necessários para o atendimento.
- A equipe lança as peças e serviços que irão compor o valor da OS e apresenta ao cliente.
- A OS possui data de abertura, data do prazo de entrega e data da entrega, para melhor controle do cumprimento dos prazos pelas equipes.
- O Cliente autoriza a execução, caso contrário a OS é cancelada.
- Orçamentos não são cobrados, conforme preconiza o Código de Defesa do Consumidor.
- A OS possui 6 Status pré definidos:
     * Em Aberto: Está aguardando orçamento e posterior autorização do cliente.
     * Cancelada: Cliente não autorizou o serviço.
     * Autorizada: Serviço autorizado, porém ainda não iniciado.
     * Em execução: Serviço em andamento após autorização do cliente.
     * Fechada: Serviço concluído e aguardando faturamento.
     * Faturada: Cliente efetuou o pagamento e Nota Fiscal foi emitida.    
- As equipes possuem 2 mecânicos, sendo que um mecânico só pode atuar em uma só equipe.
- Os nomes das equipes são únicos.
- Os dados de cadastro dos mecânicos são resgatados através do relacionamento entre as entidades Equipe e Funcionários.
- Os dados dos produtos e serviços que compoem a OS são resgatados através do relacionamento entre as entidades Ordem de Serviço, Produtos e Serviços.
<br />
OBSERVAÇÕES:
<br />
1 - Este projeto não contempla todas as entidades e relacionamentos necessários para uso em um cenário real, atendo-se ao cumprimento do contexto fornecido para execução do projeto, sendo assim, não foram abordados de forma aprofundada as entidades, funcionalidades e relacionamentos de controle de estoque, financeiro, pessoal e etc.
<br />
2 - Em um cenário real, é possível a atuação de mais de uma equipe de mecânicos numa OS, como por exemplo em caso de colisões, onde serviços mecânicos, elétricos, de funilaria e pintura são utilizados, e que em virtude da natureza dos serviços são desempenhados por equipes de profissionais distintas. Entretanto, foi utilizado o contexto fornecido no desenvolvimento do esquema lógico.
  
![SQL Create Script:](https://github.com/adricbarros/DIO-SQL-Database-Specialist/tree/main/DP2/src/SQL Create Script - Oficina.sql)

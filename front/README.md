## Projeto Lista de Tarefas - 80% Completo
## Este projeto fo concebido do Zero o que demandou certo tempo

**Back-end:**

* **.NET 8:**  A mais recente versão do framework .NET, da Microsoft, para desenvolvimento de aplicações web, desktop, mobile e jogos. Oferece alto desempenho, segurança e produtividade.
* **SQL Server 2022:** Sistema de gerenciamento de banco de dados relacional (RDBMS) da Microsoft, utilizado para armazenar e recuperar dados da aplicação.

**Bibliotecas .NET:**

* **Microsoft.EntityFrameworkCore.Design:** Ferramentas de design-time para o Entity Framework Core, facilitando a criação e gerenciamento do modelo de dados.
* **Microsoft.AspNetCore.Identity:** Framework para gerenciamento de usuários, autenticação e autorização em aplicações ASP.NET Core.
* **Microsoft.AspNetCore.Identity.EntityFrameworkCore:**  Integração do ASP.NET Core Identity com o Entity Framework Core, permitindo armazenar dados de usuários em um banco de dados.
* **Microsoft.EntityFrameworkCore:**  Framework ORM (Object-Relational Mapping) que permite interagir com o banco de dados usando objetos C# ao invés de escrever código SQL diretamente.
* **Microsoft.EntityFrameworkCore.SqlServer:**  Provedor do Entity Framework Core para SQL Server, permitindo a utilização do Entity Framework com bancos de dados SQL Server.

**Camadas da Aplicação:**

* **tasks.api:** Camada responsável pela API REST da aplicação, que expõe endpoints para interação com o front-end.
* **tasks.data:** Camada de acesso a dados, que contém a lógica para interagir com o banco de dados (repositórios, etc.).
* **tasks.service:** Camada de serviços, que contém a lógica de negócio da aplicação.
* **tasks.shared:** Camada que contém código compartilhado entre as outras camadas, como DTOs (Data Transfer Objects) e interfaces.
* **tasks.test:** Camada que contém os testes unitários e de integração da aplicação.

**Front-end (Angular):**

**Bibliotecas de Terceiros:**

* **sweetalert2:** Biblioteca para exibir alertas e caixas de diálogo personalizadas de forma fácil e atraente.
* **rxjs:**  Biblioteca para programação reativa, que permite lidar com fluxos de dados assíncronos de forma eficiente.


**Observação:** As demais bibliotecas listadas no `package.json` do Angular (como `@angular/core`, `@angular/router`, etc.) são parte do próprio framework Angular e não são consideradas bibliotecas de terceiros.

**Resumo:**

O projeto utiliza uma arquitetura moderna e robusta, com separação clara de responsabilidades entre as camadas da aplicação. O back-end em .NET 8 com Entity Framework Core oferece alto desempenho e segurança, enquanto o front-end em Angular com bibliotecas como SweetAlert2 e RxJS proporciona uma interface de usuário moderna e responsiva. A utilização de testes unitários e de integração garante a qualidade e a confiabilidade do código.

**Executando o Projeto:**
1 - Base de Dados

1.1 - Entre dentro da aplicacao back pasta task.api, edit o arquivo appsettings.json e mude a string de conexao para o local do banco de dados correto

1.2 - Volte para a pasta raiza back e digite o comando abaixo:
dotnet ef migrations add Initial --project tasks.data --startup-project tasks.api

Caso haja um erro na base na hora de restaurar a migracao, devido a problemas na ferramente, use o script DDL ba pasta raiza do GIT para criar uma base com a estrutura correta


1.3 - Digite o comando abaixo para rodar o servidor
dotnet run

3 - Em um novo terminal, entre na aplicao front e digite o comando abaixo para exectar o client:
ng serve


Tarefas as ralizar :

1 - Edicao de Tarefas e mudança de Status
2 - Aplicacao Responsividade
3 - Finalizar Paginacao
4 - Login e Logout back - No back so falta criacao da CONTROLLER 
5 - Ligin e Logout Aplicacao Front - Linkar com o BACK





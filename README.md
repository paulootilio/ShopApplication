Sobre
========
ShopApplication é uma aplicação para controle de estoque de produtos

<!-- Requisitos -->
## :books: Requisitos
- Ter [**Git**](https://git-scm.com/) para clonar o projeto.
- Ter [**Docker**](https://www.docker.com/) para rodar o projeto.

<!-- Começando -->
## :gear: Começando

instruções sobre como configurar o projeto localmente.
```bash
# Entrar no diretório da aplicação:
  $ cd ShopApplication

  # Subir containers:
  $ docker-compose up -d

  # Criar o banco e rodar as migrations:
  $ docker-compose run myapp bundle exec rake db:create db:migrate db:seed

  # Rodar a aplicação:
  $ docker-compose up
```
Acessar aplicação: [**localhost:5000**](http://localhost:5000/)

Feito por Paulo Otilio 👋🏻 [Get in touch!](https://github.com/paulootilio)
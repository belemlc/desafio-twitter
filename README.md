# Desafio Upnid API Twitter

## Instalação dos serviços para rodar a api

Primeiro será necessário instalar o Elixir, Node e Phoenix, segue a baixo os links para instalaÇão

[`👉 Instalaar o Elixir`](https://elixir-lang.org/install.html)

[`👉 Instalar o NodeJS`](https://nodejs.org/en/)

[`👉 Instalar o Phoenix`](https://hexdocs.pm/phoenix/installation.html#content)



### Iniciando o Phoenix server, rode os seguintes comando no seu terminal:

Como muitas linguagens tem seus CLI's o Elixir/Erlang também tem, o "mix" e ele que iremos usar para rodar o projeto, segue abaixo os comandos necessário:

  * Primeiro clone o projeto `git clone https://github.com/belemlc/desafio-twitter.git`
  * Entre dentro do Projeto `cd desafio-twitter`
  * Instaleo Hex primeiro `mix local.hex --force`
  * Limpando cache das depêndencias antes `mix deps.clean --all`
  * Instalando as dependências `mix deps.get`
  * Vamos rodar o banco de dados `docker-compose up -d --build`
  * Caso queira ver o logo do banco `docker logs postgres_desafio -f`
  * Criar e migrar o banco de dados `mix ecto.setup`
  * Instalando as dependencias do Nodejs `cd assets && npm install`
  * Inicie o Phoenix endpoint com `mix phx.server`

Acesse o link da api [`localhost:4000`](http://localhost:4000) em um browser, [`Insonia`](https://insomnia.rest) ou [`Postman`](https://www.getpostman.com) para rodar alguns cenários será necessário gerar o um token de autenticação, então as duas ultimas opções são melhores.

### Testando o projeto

* Adicionar um Usuário [POST] `http://localhost:4000/api/users/signup`
  * Header: `Content-Type: application/json e Accept: application/json`
  * Body/JSON: `{ "users": {"name": "", "email": "", password: ""} }`
  * Response: `{email: "", token: ""}`
  * Copie o token para usar nos testes

* Login [POST] `http://localhost:4000/api/users/signin`
  * Header: `Content-Type: application/json e Accept: application/json`
  * Body/JSON: `{ "email": "", password: ""}`
  * Response: `{email: "", token: ""}`
  * Copie o token para usar nos testes

* Listar os Usuários [GET] `http://localhost:4000/api/users`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Response: `users`

* Atualizar um Usuário [PUT] `http://localhost:4000/api/users/id`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Body/JSON: `{"campo": "valor"}`
  * Response: `user`

* Excluir um Usuário [DELETE] `http://localhost:4000/api/users/id`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Response: ``

### Status do usuário

* Publicar um status [POST] `http://localhost:4000/api/users/status`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Body/JSON: `{ "status": {"status": "", "user_id": ""} }`
  * Response: `{status}`

* Listar todos os Status [GET] `http://localhost:4000/api/status`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Response: `status`

* Listar Status por Usuário [GET] `http://localhost:4000/api/users/[id do usuario]/status`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Response: `status`

* Atualizar um Status [PUT] `http://localhost:4000/api/status/id`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Body/JSON: `{"campo": "valor"}`
  * Response: `user`

* Excluir um Usuário [DELETE] `http://localhost:4000/api/status/id`
  * Header: `Content-Type: application/json e Accept: application/json`
    * Autentication: `Bearer token`
  * Response: ``

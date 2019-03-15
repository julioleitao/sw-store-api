# sw-store-api

## About
Um microserviço criado com Elixir e Phoenix. Provê uma API REST para um loja virtual 
e com o checkout lógico (sem escrita no banco) de acordo com os preços e promoções.
O software segue o [The Twelve-Factor App](https://12factor.net/pt_br/).

## Tecnologias
* Linguagem [Elixir](http://elixir-lang.org)
* [Phoenix Framework](https://phoenixframework.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Docker](https://www.docker.com/)
* [Heroku](https://www.heroku.com/)

## Development guide (README)

* A maneira mais fácil de levantar a stack completa do serviço é executando o comando `docker-compose up -d`.
* Caso queira ter a aplicação rodando direto na máquina host, basta executar `mix deps.get; mix phx.server`.
* É necessário ter um banco de dados PostgreSQL disponível. Caso queira ter disponível `docker-compose up -d postgres_database`.
* Para executar os testes: `mix test`.
* Para realizar a migração dos dados `mix ecto.migrate`.

## Software Architecture

O microserviço é composto por duas aplicações que ficam no diretório apps:
* store_core: provê a camada de negócio e camada de dados.
* store_web: provê a camada web da API REST JSON.

Cada aplicação é composta por diferentes camadas com responsabilidade distintas.

### store_core
* lib/store_core/contexts: camada de negócio
* lib/store_core/schemas: mapeamento e validações das entidades que são persistidas
* lib/store_core/repo.ex: repositório do Ecto para a comunicação com o banco de dados.

### store_web
* lib/store_web/controllers: implementação de cada recurso da API.
* lib/store_web/views: provê a camada view de cada recurso. 
* lib/store_wb/router.ex: declara as rotas da API. Encapsula validações e parsers dos dados da API. 
* lib/store_web/channels: comuicação via websocket. Não é utilizado no momento.


## Documentação da API REST

Ver em [apps/store_web/docs/api.md](https://github.com/julioleitao/sw_store_api/blob/master/apps/store_web/docs/api.md)

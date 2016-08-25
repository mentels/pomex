# Pomex

## Requirements

* Elixir >= 1.3.1
* Postgres instance
  The easiet way to setup the database is with [docker image](https://hub.docker.com/_/postgres/): 
  
 ```bash
  docker run --name pomex-postgres -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres
  ```

## Getting Started

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`
  * Start Phoenix endpoint inside IEx with `iex -S mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

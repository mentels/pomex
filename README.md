# Pomex

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Pomex](#pomex)
    - [Requirements](#requirements)
    - [Getting Started](#getting-started)
    - [Learn more](#learn-more)

<!-- markdown-toc end -->


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

## Routes

You can display the routes with `mix phoenix.routes`:

```bash
# The "landing page" do display the UI
             page_path  GET     /                                  Pomex.PageController :index
# Testing API
             user_path  GET     /users                             Pomex.UserController :index
             user_path  GET     /users/:id/edit                    Pomex.UserController :edit
             user_path  GET     /users/new                         Pomex.UserController :new
             user_path  GET     /users/:id                         Pomex.UserController :show
             user_path  POST    /users                             Pomex.UserController :create
             user_path  PATCH   /users/:id                         Pomex.UserController :update
                        PUT     /users/:id                         Pomex.UserController :update
             user_path  DELETE  /users/:id                         Pomex.UserController :delete
    user_pomodoro_path  GET     /users/:user_id/pomodors           Pomex.PomodoroController :index
    user_pomodoro_path  GET     /users/:user_id/pomodors/:id/edit  Pomex.PomodoroController :edit
    user_pomodoro_path  GET     /users/:user_id/pomodors/new       Pomex.PomodoroController :new
    user_pomodoro_path  GET     /users/:user_id/pomodors/:id       Pomex.PomodoroController :show
    user_pomodoro_path  POST    /users/:user_id/pomodors           Pomex.PomodoroController :create
    user_pomodoro_path  PATCH   /users/:user_id/pomodors/:id       Pomex.PomodoroController :update
                        PUT     /users/:user_id/pomodors/:id       Pomex.PomodoroController :update
    user_pomodoro_path  DELETE  /users/:user_id/pomodors/:id       Pomex.PomodoroController :delete
# The API to be used by devices
         api_user_path  GET     /api/users/:id                     Pomex.Api.UserController :show
         api_user_path  POST    /api/users                         Pomex.Api.UserController :create
api_user_pomodoro_path  POST    /api/users/:user_id/pomodoros      Pomex.Api.PomodoroController :create
api_user_pomodoro_path  PATCH   /api/users/:user_id/pomodoros/:id  Pomex.Api.PomodoroController :update
                        PUT     /api/users/:user_id/pomodoros/:id  Pomex.Api.PomodoroController :update
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

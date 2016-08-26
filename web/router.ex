defmodule Pomex.Router do
  use Pomex.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Pomex do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController do
      post "/pomodoros", UserController, :add_pomodoro
      patch "/pomodoros/:pid", UserController, :update_pomodoro
    end

    get "/", PageController, :index
  end
  
end

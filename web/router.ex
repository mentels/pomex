defmodule Pomex.Router do
  use Pomex.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pomex do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController do
      resources "/pomodoros", PomodorController
    end
    
    get "/", PageController, :index
  end

  scope "/api", HelloWorld do
    pipe_through :api

    resources "/users", UserController, only: [:show, :create] do
      resources "/pomodoros", PomodorController, only: [:create,
                                                        :update]
    end
  end
  
end

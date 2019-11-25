defmodule DesafioTwitterWeb.Router do
  use DesafioTwitterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", DesafioTwitterWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  scope "/api", DesafioTwitterWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/users", UserController do
      get "status", UserController, :status
    end
    resources "/status", StatusController, except: [:new, :edit]
  end
end

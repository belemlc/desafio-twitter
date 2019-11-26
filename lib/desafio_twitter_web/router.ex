defmodule DesafioTwitterWeb.Router do
  use DesafioTwitterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  pipeline :auth do
    plug DesafioTwitterWeb.Auth.Pipeline
  end

  scope "/", DesafioTwitterWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  scope "/api", DesafioTwitterWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", DesafioTwitterWeb do
    pipe_through [:api, :auth]
    resources "/users", UserController, except: [:new, :edit] do
      get "status", UserController, :status
    end
    resources "/status", StatusController, except: [:new, :edit]
  end
end

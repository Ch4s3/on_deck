defmodule OnDeckWeb.Router do
  use OnDeckWeb, :router

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

  scope "/", OnDeckWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", OnDeckWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit, :show]
    resources "/beers", BeerController, except: [:new, :edit, :show]
  end

  forward "/graph", Absinthe.Plug,
    schema: OnDeck.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: OnDeck.Schema
end

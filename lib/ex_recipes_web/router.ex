defmodule ExRecipesWeb.Router do
  use ExRecipesWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])

    plug(Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json],
      pass: ["*/*"],
      json_decoder: Poison
    )
  end

  scope "/", ExRecipesWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/recipe*anything", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: ExRecipesWeb.Schema)
    forward("/", Absinthe.Plug, schema: ExRecipesWeb.Schema)
  end
end

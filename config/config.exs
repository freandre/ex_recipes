# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_recipes,
  ecto_repos: [ExRecipes.Repo]

# Configures the endpoint
config :ex_recipes, ExRecipesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YOr+W6h5Wt731IhHBDWZWVG5cXp+n8PL2JrYqFiHO0qxkxIl0NZnI408DlI+diHp",
  render_errors: [view: ExRecipesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExRecipes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

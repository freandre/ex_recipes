# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ex_recipes, ecto_repos: [ExRecipes.Repo]

# Configures the endpoint
config :ex_recipes, ExRecipesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w2TApPvUM7ydthKzKeASz4IDntEysz/IM6QzT7px1plDhyMYd0xdGMf/U5wumhGl",
  render_errors: [view: ExRecipesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExRecipes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

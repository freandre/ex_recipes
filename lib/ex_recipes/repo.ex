defmodule ExRecipes.Repo do
  use Ecto.Repo,
    otp_app: :ex_recipes,
    adapter: Ecto.Adapters.Postgres
end

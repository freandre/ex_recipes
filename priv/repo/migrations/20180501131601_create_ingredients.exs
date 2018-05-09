defmodule ExRecipes.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :ingredient, :string

      timestamps()
    end

  end
end

defmodule ExRecipes.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :picture, :binary
      add :description, :string

      timestamps()
    end

  end
end

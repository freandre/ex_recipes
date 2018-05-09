defmodule ExRecipes.Repo.Migrations.CreateSteps do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :picture, :binary
      add :description, :string

      timestamps()
    end

  end
end

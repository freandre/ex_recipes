defmodule ExRecipes.Repo.Migrations.CreateRevisions do
  use Ecto.Migration

  def change do
    create table(:revisions) do
      add :revision, :integer
      add :recipe_id, references(:recipes, on_delete: :nothing)

      timestamps()
    end

    create index(:revisions, [:recipe_id])
  end
end

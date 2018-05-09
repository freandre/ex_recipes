defmodule ExRecipes.Repo.Migrations.CreateIngredientLists do
  use Ecto.Migration

  def change do
    create table(:ingredient_lists) do
      add :revision_id, references(:revisions, on_delete: :nothing)
      add :ingredient_id, references(:ingredients, on_delete: :nothing)

      timestamps()
    end

    create index(:ingredient_lists, [:revision_id])
    create index(:ingredient_lists, [:ingredient_id])
  end
end

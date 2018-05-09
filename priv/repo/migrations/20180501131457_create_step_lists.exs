defmodule ExRecipes.Repo.Migrations.CreateStepLists do
  use Ecto.Migration

  def change do
    create table(:step_lists) do
      add :revision_id, references(:revisions, on_delete: :nothing)
      add :step_id, references(:steps, on_delete: :nothing)

      timestamps()
    end

    create index(:step_lists, [:revision_id])
    create index(:step_lists, [:step_id])
  end
end

defmodule ExRecipes.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :posted_at, :naive_datetime
      add :comment, :string
      add :revision_id, references(:revisions, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:revision_id])
  end
end

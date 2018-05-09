defmodule ExRecipes.Recipes.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field(:comment, :string)
    field(:posted_at, :naive_datetime)
    belongs_to(:revision, ExRecipes.Recipes.Revision)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:posted_at, :comment])
    |> validate_required([:posted_at, :comment])
  end
end

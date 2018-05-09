defmodule ExRecipes.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field(:title, :string)
    field(:description, :string)
    field(:picture, :binary)
    has_many(:revisions, ExRecipes.Recipes.Revision)

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :picture, :description])
    |> validate_required([:title, :picture, :description])
  end
end

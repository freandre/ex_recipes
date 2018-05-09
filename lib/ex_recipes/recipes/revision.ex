defmodule ExRecipes.Recipes.Revision do
  use Ecto.Schema
  import Ecto.Changeset

  schema "revisions" do
    field(:revision, :integer)
    belongs_to(:recipe, ExRecipes.Recipes.Recipe)
    has_many(:comments, ExRecipes.Recipes.Comment)

    many_to_many(
      :ingredients,
      ExRecipes.Recipes.Ingredient,
      join_through: ExRecipes.Recipes.IngredientList
    )

    many_to_many(:steps, ExRecipes.Recipes.Step, join_through: ExRecipes.Recipes.StepList)

    timestamps()
  end

  @doc false
  def changeset(revision, attrs) do
    revision
    |> cast(attrs, [:revision])
    |> validate_required([:revision])
  end
end

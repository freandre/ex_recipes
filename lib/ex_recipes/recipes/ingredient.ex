defmodule ExRecipes.Recipes.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field(:ingredient, :string)

    many_to_many(
      :revision,
      ExRecipes.Recipes.Revision,
      join_through: ExRecipes.Recipes.IngredientList
    )

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:ingredient])
    |> validate_required([:ingredient])
  end
end

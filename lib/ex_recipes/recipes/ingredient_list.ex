defmodule ExRecipes.Recipes.IngredientList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredient_lists" do
    field(:revision_id, :id)
    field(:ingredient_id, :id)

    timestamps()
  end

  @doc false
  def changeset(ingredient_list, attrs) do
    ingredient_list
    |> cast(attrs, [])
    |> validate_required([])
  end
end

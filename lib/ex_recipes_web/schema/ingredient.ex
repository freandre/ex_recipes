defmodule ExRecipesWeb.Schema.Ingredient do
  use Absinthe.Schema.Notation

  object :ingredient do
    field(:id, :id)
    field(:ingredient, :string)
  end
end
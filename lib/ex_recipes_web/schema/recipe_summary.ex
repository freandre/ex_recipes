defmodule ExRecipesWeb.Schema.RecipeSummary do
  use Absinthe.Schema.Notation

  alias ExRecipesWeb.Resolvers

  object :recipe_summary do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:picture, :string)

    field(:revisions, :integer) do
      resolve(&Resolvers.Recipes.count_revisions/3)
    end
  end
end

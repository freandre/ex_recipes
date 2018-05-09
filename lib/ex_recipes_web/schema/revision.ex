defmodule ExRecipesWeb.Schema.Revision do
  use Absinthe.Schema.Notation

  alias ExRecipesWeb.Resolvers

  object :revision do
    field(:id, :id)
    field(:revision, :integer)
    field(:recipe, :recipe)

    field(:comments, list_of(:comment)) do
      resolve(&Resolvers.Recipes.list_comments/3)
    end

    field(:ingredients, list_of(:ingredient)) do
      resolve(&Resolvers.Recipes.list_ingredients/3)
    end

    field(:steps, list_of(:step)) do
      resolve(&Resolvers.Recipes.list_steps/3)
    end
  end
end

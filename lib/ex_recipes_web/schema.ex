defmodule ExRecipesWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(ExRecipesWeb.Schema.Recipe)
  import_types(ExRecipesWeb.Schema.RecipeSumUp)
  import_types(ExRecipesWeb.Schema.Revision)
  import_types(ExRecipesWeb.Schema.Comment)
  import_types(ExRecipesWeb.Schema.Ingredient)
  import_types(ExRecipesWeb.Schema.Step)

  alias ExRecipesWeb.Resolvers

  query do
    @desc "Get minimal informations from recipes"
    field :recipes, list_of(:recipe_sumup) do
      resolve(&Resolvers.Recipes.list_recipes/3)
    end

    @desc "Get a given recipe"
    field :recipe, :recipe do
      arg(:id, :id)
      resolve(&Resolvers.Recipes.list_recipes/3)
    end
  end
end

defmodule ExRecipesWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(ExRecipesWeb.Schema.Recipe)
  import_types(ExRecipesWeb.Schema.RecipeSummary)
  import_types(ExRecipesWeb.Schema.Comment)
  import_types(ExRecipesWeb.Schema.Ingredient)
  import_types(ExRecipesWeb.Schema.Step)

  alias ExRecipesWeb.Resolvers

  query do
    @desc "Get minimal informations from recipes"
    field :recipes, list_of(:recipe_summary) do
      resolve(&Resolvers.Recipes.list_recipes/3)
    end

    @desc "Get a given recipe"
    field :recipe, :recipe do
      arg(:id, non_null(:id))
      arg(:revision, :integer)
      resolve(&Resolvers.Recipes.get_recipe/3)
    end
  end
end

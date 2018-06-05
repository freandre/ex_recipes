defmodule ExRecipesWeb.Resolvers.Recipes do
  def list_recipes(_parent, _args, _resolution) do
    {:ok, ExRecipes.Recipes.list_recipes()}
  end

  def count_revisions(%ExRecipes.Recipes.Recipe{} = recipe, _args, _resolution) do
    {:ok, ExRecipes.Recipes.count_revisions_for_recipe(recipe)}
  end

  def get_recipe(_parent, %{id: id}, _resolution) do
    {:ok, ExRecipes.Recipes.get_recipe!(id)}
  end

  def list_comments(_parent, _args, resolution) do
    args = resolution.context[:top_args]

    {:ok, ExRecipes.Recipes.get_comments_for_recipe(args)}
  end

  def list_ingredients(_parent, _args, resolution) do
    args = resolution.context[:top_args]

    {:ok, ExRecipes.Recipes.get_ingredients_for_recipe(args)}
  end

  def list_steps(_parent, _args, resolution) do
    args = resolution.context[:top_args]

    {:ok, ExRecipes.Recipes.get_steps_for_recipe(args)}
  end
end

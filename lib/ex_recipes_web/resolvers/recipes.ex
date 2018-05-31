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

  def list_comments(%ExRecipes.Recipes.Revision{} = revision, _args, _resolution) do
    {:ok, ExRecipes.Recipes.get_comments_for_revision(revision)}
  end

  def list_ingredients(%ExRecipes.Recipes.Revision{} = revision, _args, _resolution) do
    {:ok, ExRecipes.Recipes.get_ingredients_for_revision(revision)}
  end

  def list_steps(%ExRecipes.Recipes.Revision{} = revision, _args, _resolution) do
    {:ok, ExRecipes.Recipes.get_steps_for_revision(revision)}
  end
end

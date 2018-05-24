defmodule ExRecipesWeb.Resolvers.Recipes do
  def list_recipes(_parent, %{id: id}, _resolution) do
    {:ok, ExRecipes.Recipes.get_recipe!(id)}
  end

  def list_recipes(_parent, _, _resolution) do
    {:ok, ExRecipes.Recipes.list_recipes()}
  end

  def list_revisions(%ExRecipes.Recipes.Recipe{} = recipe, args, _resolution) do
    {:ok, ExRecipes.Recipes.get_revisions_for_recipe(recipe, args)}
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

defmodule ExRecipes.Recipes do
  @moduledoc """
  The Recipes context.
  """

  import Ecto.Query, warn: false
  alias ExRecipes.Repo

  alias ExRecipes.Recipes.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes(%{id: id}), do: get_recipe!(id)
  def list_recipes, do: Repo.all(Recipe)

  @doc """
  Gets a single recipe.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe!(id), do: Repo.get!(Recipe, id)

  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(attrs \\ %{}) do
    %Recipe{}
    |> Recipe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, attrs) do
    recipe
    |> Recipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{source: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe) do
    Recipe.changeset(recipe, %{})
  end

  alias ExRecipes.Recipes.Revision

  @doc """
  Returns the list of revisions.

  ## Examples

      iex> list_revisions()
      [%Revision{}, ...]

  """
  def list_revisions do
    Repo.all(Revision)
  end

  @doc """
  Gets a single revision.

  Raises `Ecto.NoResultsError` if the Revision does not exist.

  ## Examples

      iex> get_revision!(123)
      %Revision{}

      iex> get_revision!(456)
      ** (Ecto.NoResultsError)

  """
  def get_revision!(id), do: Repo.get!(Revision, id)

  @doc """
  Gets a mist of revisions associated to a recipe id.

  """
  def get_revisions_for_recipe(%Recipe{} = recipe, %{revision: revision}) do
    Repo.all(from(r in Revision, where: r.recipe_id == ^recipe.id and r.revision == ^revision))
  end

  def get_revisions_for_recipe(%Recipe{} = recipe, _args) do
    Repo.all(from(r in Revision, where: r.recipe_id == ^recipe.id, order_by: [asc: r.revision]))
  end

  @doc """
  Creates a revision.

  ## Examples

      iex> create_revision(%{field: value})
      {:ok, %Revision{}}

      iex> create_revision(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_revision(attrs \\ %{}) do
    %Revision{}
    |> Revision.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a revision.

  ## Examples

      iex> update_revision(revision, %{field: new_value})
      {:ok, %Revision{}}

      iex> update_revision(revision, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_revision(%Revision{} = revision, attrs) do
    revision
    |> Revision.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Revision.

  ## Examples

      iex> delete_revision(revision)
      {:ok, %Revision{}}

      iex> delete_revision(revision)
      {:error, %Ecto.Changeset{}}

  """
  def delete_revision(%Revision{} = revision) do
    Repo.delete(revision)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking revision changes.

  ## Examples

      iex> change_revision(revision)
      %Ecto.Changeset{source: %Revision{}}

  """
  def change_revision(%Revision{} = revision) do
    Revision.changeset(revision, %{})
  end

  alias ExRecipes.Recipes.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Gets a mist of revisions associated to a recipe id.

  """
  def get_comments_for_revision(%Revision{} = revision) do
    Repo.all(
      from(c in Comment, where: c.revision_id == ^revision.id, order_by: [asc: c.posted_at])
    )
  end

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end

  alias ExRecipes.Recipes.Step
  alias ExRecipes.Recipes.StepList

  @doc """
  Returns the list of steps.

  ## Examples

      iex> list_steps()
      [%Step{}, ...]

  """
  def list_steps do
    Repo.all(Step)
  end

  @doc """
  Gets a single step.

  Raises `Ecto.NoResultsError` if the Step does not exist.

  ## Examples

      iex> get_step!(123)
      %Step{}

      iex> get_step!(456)
      ** (Ecto.NoResultsError)

  """
  def get_step!(id), do: Repo.get!(Step, id)

  @doc """
  Gets a mist of revisions associated to a recipe id.

  """
  def get_steps_for_revision(%Revision{} = revision) do
    Repo.all(
      from(
        s in Step,
        join: sl in StepList,
        where: sl.revision_id == ^revision.id and s.id == sl.step_id,
        order_by: [asc: sl.id]
      )
    )
  end

  @doc """
  Creates a step.

  ## Examples

      iex> create_step(%{field: value})
      {:ok, %Step{}}

      iex> create_step(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_step(attrs \\ %{}) do
    %Step{}
    |> Step.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a step.

  ## Examples

      iex> update_step(step, %{field: new_value})
      {:ok, %Step{}}

      iex> update_step(step, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_step(%Step{} = step, attrs) do
    step
    |> Step.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Step.

  ## Examples

      iex> delete_step(step)
      {:ok, %Step{}}

      iex> delete_step(step)
      {:error, %Ecto.Changeset{}}

  """
  def delete_step(%Step{} = step) do
    Repo.delete(step)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking step changes.

  ## Examples

      iex> change_step(step)
      %Ecto.Changeset{source: %Step{}}

  """
  def change_step(%Step{} = step) do
    Step.changeset(step, %{})
  end

  @doc """
  Returns the list of step_lists.

  ## Examples

      iex> list_step_lists()
      [%StepList{}, ...]

  """
  def list_step_lists do
    Repo.all(StepList)
  end

  @doc """
  Gets a single step_list.

  Raises `Ecto.NoResultsError` if the Step list does not exist.

  ## Examples

      iex> get_step_list!(123)
      %StepList{}

      iex> get_step_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_step_list!(id), do: Repo.get!(StepList, id)

  @doc """
  Creates a step_list.

  ## Examples

      iex> create_step_list(%{field: value})
      {:ok, %StepList{}}

      iex> create_step_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_step_list(attrs \\ %{}) do
    %StepList{}
    |> StepList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a step_list.

  ## Examples

      iex> update_step_list(step_list, %{field: new_value})
      {:ok, %StepList{}}

      iex> update_step_list(step_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_step_list(%StepList{} = step_list, attrs) do
    step_list
    |> StepList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a StepList.

  ## Examples

      iex> delete_step_list(step_list)
      {:ok, %StepList{}}

      iex> delete_step_list(step_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_step_list(%StepList{} = step_list) do
    Repo.delete(step_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking step_list changes.

  ## Examples

      iex> change_step_list(step_list)
      %Ecto.Changeset{source: %StepList{}}

  """
  def change_step_list(%StepList{} = step_list) do
    StepList.changeset(step_list, %{})
  end

  alias ExRecipes.Recipes.Ingredient
  alias ExRecipes.Recipes.IngredientList

  @doc """
  Returns the list of ingredients.

  ## Examples

      iex> list_ingredients()
      [%Ingredient{}, ...]

  """
  def list_ingredients do
    Repo.all(Ingredient)
  end

  @doc """
  Gets a single ingredient.

  Raises `Ecto.NoResultsError` if the Ingredient does not exist.

  ## Examples

      iex> get_ingredient!(123)
      %Ingredient{}

      iex> get_ingredient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ingredient!(id), do: Repo.get!(Ingredient, id)

  @doc """
  Gets a mist of revisions associated to a recipe id.

  """
  def get_ingredients_for_revision(%Revision{} = revision) do
    Repo.all(
      from(
        i in Ingredient,
        join: il in IngredientList,
        where: il.revision_id == ^revision.id and i.id == il.ingredient_id,
        order_by: [asc: il.id]
      )
    )
  end

  @doc """
  Creates a ingredient.

  ## Examples

      iex> create_ingredient(%{field: value})
      {:ok, %Ingredient{}}

      iex> create_ingredient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ingredient(attrs \\ %{}) do
    %Ingredient{}
    |> Ingredient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ingredient.

  ## Examples

      iex> update_ingredient(ingredient, %{field: new_value})
      {:ok, %Ingredient{}}

      iex> update_ingredient(ingredient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ingredient(%Ingredient{} = ingredient, attrs) do
    ingredient
    |> Ingredient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Ingredient.

  ## Examples

      iex> delete_ingredient(ingredient)
      {:ok, %Ingredient{}}

      iex> delete_ingredient(ingredient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ingredient(%Ingredient{} = ingredient) do
    Repo.delete(ingredient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ingredient changes.

  ## Examples

      iex> change_ingredient(ingredient)
      %Ecto.Changeset{source: %Ingredient{}}

  """
  def change_ingredient(%Ingredient{} = ingredient) do
    Ingredient.changeset(ingredient, %{})
  end

  @doc """
  Returns the list of ingredient_lists.

  ## Examples

      iex> list_ingredient_lists()
      [%IngredientList{}, ...]

  """
  def list_ingredient_lists do
    Repo.all(IngredientList)
  end

  @doc """
  Gets a single ingredient_list.

  Raises `Ecto.NoResultsError` if the Ingredient list does not exist.

  ## Examples

      iex> get_ingredient_list!(123)
      %IngredientList{}

      iex> get_ingredient_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ingredient_list!(id), do: Repo.get!(IngredientList, id)

  @doc """
  Creates a ingredient_list.

  ## Examples

      iex> create_ingredient_list(%{field: value})
      {:ok, %IngredientList{}}

      iex> create_ingredient_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ingredient_list(attrs \\ %{}) do
    %IngredientList{}
    |> IngredientList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ingredient_list.

  ## Examples

      iex> update_ingredient_list(ingredient_list, %{field: new_value})
      {:ok, %IngredientList{}}

      iex> update_ingredient_list(ingredient_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ingredient_list(%IngredientList{} = ingredient_list, attrs) do
    ingredient_list
    |> IngredientList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a IngredientList.

  ## Examples

      iex> delete_ingredient_list(ingredient_list)
      {:ok, %IngredientList{}}

      iex> delete_ingredient_list(ingredient_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ingredient_list(%IngredientList{} = ingredient_list) do
    Repo.delete(ingredient_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ingredient_list changes.

  ## Examples

      iex> change_ingredient_list(ingredient_list)
      %Ecto.Changeset{source: %IngredientList{}}

  """
  def change_ingredient_list(%IngredientList{} = ingredient_list) do
    IngredientList.changeset(ingredient_list, %{})
  end
end

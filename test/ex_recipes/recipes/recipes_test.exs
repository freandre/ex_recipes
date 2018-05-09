defmodule ExRecipes.RecipesTest do
  use ExRecipes.DataCase

  alias ExRecipes.Recipes

  describe "recipes" do
    alias ExRecipes.Recipes.Recipe

    @valid_attrs %{description: "some description", picture: "some picture", title: "some title"}
    @update_attrs %{
      description: "some updated description",
      picture: "some updated picture",
      title: "some updated title"
    }
    @invalid_attrs %{description: nil, picture: nil, title: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(@valid_attrs)
      assert recipe.description == "some description"
      assert recipe.picture == "some picture"
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, recipe} = Recipes.update_recipe(recipe, @update_attrs)
      assert %Recipe{} = recipe
      assert recipe.description == "some updated description"
      assert recipe.picture == "some updated picture"
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end

  describe "revisions" do
    alias ExRecipes.Recipes.Revision

    @valid_attrs %{revision: 42}
    @update_attrs %{revision: 43}
    @invalid_attrs %{revision: nil}

    def revision_fixture(attrs \\ %{}) do
      {:ok, revision} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_revision()

      revision
    end

    test "list_revisions/0 returns all revisions" do
      revision = revision_fixture()
      assert Recipes.list_revisions() == [revision]
    end

    test "get_revision!/1 returns the revision with given id" do
      revision = revision_fixture()
      assert Recipes.get_revision!(revision.id) == revision
    end

    test "create_revision/1 with valid data creates a revision" do
      assert {:ok, %Revision{} = revision} = Recipes.create_revision(@valid_attrs)
      assert revision.revision == 42
    end

    test "create_revision/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_revision(@invalid_attrs)
    end

    test "update_revision/2 with valid data updates the revision" do
      revision = revision_fixture()
      assert {:ok, revision} = Recipes.update_revision(revision, @update_attrs)
      assert %Revision{} = revision
      assert revision.revision == 43
    end

    test "update_revision/2 with invalid data returns error changeset" do
      revision = revision_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_revision(revision, @invalid_attrs)
      assert revision == Recipes.get_revision!(revision.id)
    end

    test "delete_revision/1 deletes the revision" do
      revision = revision_fixture()
      assert {:ok, %Revision{}} = Recipes.delete_revision(revision)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_revision!(revision.id) end
    end

    test "change_revision/1 returns a revision changeset" do
      revision = revision_fixture()
      assert %Ecto.Changeset{} = Recipes.change_revision(revision)
    end
  end

  describe "comments" do
    alias ExRecipes.Recipes.Comment

    @valid_attrs %{comment: "some comment", posted_at: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{comment: "some updated comment", posted_at: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{comment: nil, posted_at: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Recipes.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Recipes.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Recipes.create_comment(@valid_attrs)
      assert comment.comment == "some comment"
      assert comment.posted_at == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Recipes.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.comment == "some updated comment"
      assert comment.posted_at == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_comment(comment, @invalid_attrs)
      assert comment == Recipes.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Recipes.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Recipes.change_comment(comment)
    end
  end

  describe "steps" do
    alias ExRecipes.Recipes.Step

    @valid_attrs %{description: "some description", picture: "some picture"}
    @update_attrs %{description: "some updated description", picture: "some updated picture"}
    @invalid_attrs %{description: nil, picture: nil}

    def step_fixture(attrs \\ %{}) do
      {:ok, step} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_step()

      step
    end

    test "list_steps/0 returns all steps" do
      step = step_fixture()
      assert Recipes.list_steps() == [step]
    end

    test "get_step!/1 returns the step with given id" do
      step = step_fixture()
      assert Recipes.get_step!(step.id) == step
    end

    test "create_step/1 with valid data creates a step" do
      assert {:ok, %Step{} = step} = Recipes.create_step(@valid_attrs)
      assert step.description == "some description"
      assert step.picture == "some picture"
    end

    test "create_step/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_step(@invalid_attrs)
    end

    test "update_step/2 with valid data updates the step" do
      step = step_fixture()
      assert {:ok, step} = Recipes.update_step(step, @update_attrs)
      assert %Step{} = step
      assert step.description == "some updated description"
      assert step.picture == "some updated picture"
    end

    test "update_step/2 with invalid data returns error changeset" do
      step = step_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_step(step, @invalid_attrs)
      assert step == Recipes.get_step!(step.id)
    end

    test "delete_step/1 deletes the step" do
      step = step_fixture()
      assert {:ok, %Step{}} = Recipes.delete_step(step)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_step!(step.id) end
    end

    test "change_step/1 returns a step changeset" do
      step = step_fixture()
      assert %Ecto.Changeset{} = Recipes.change_step(step)
    end
  end

  describe "step_lists" do
    alias ExRecipes.Recipes.StepList

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def step_list_fixture(attrs \\ %{}) do
      {:ok, step_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_step_list()

      step_list
    end

    test "list_step_lists/0 returns all step_lists" do
      step_list = step_list_fixture()
      assert Recipes.list_step_lists() == [step_list]
    end

    test "get_step_list!/1 returns the step_list with given id" do
      step_list = step_list_fixture()
      assert Recipes.get_step_list!(step_list.id) == step_list
    end

    test "create_step_list/1 with valid data creates a step_list" do
      assert {:ok, %StepList{} = step_list} = Recipes.create_step_list(@valid_attrs)
    end

    test "create_step_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_step_list(@invalid_attrs)
    end

    test "update_step_list/2 with valid data updates the step_list" do
      step_list = step_list_fixture()
      assert {:ok, step_list} = Recipes.update_step_list(step_list, @update_attrs)
      assert %StepList{} = step_list
    end

    test "update_step_list/2 with invalid data returns error changeset" do
      step_list = step_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_step_list(step_list, @invalid_attrs)
      assert step_list == Recipes.get_step_list!(step_list.id)
    end

    test "delete_step_list/1 deletes the step_list" do
      step_list = step_list_fixture()
      assert {:ok, %StepList{}} = Recipes.delete_step_list(step_list)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_step_list!(step_list.id) end
    end

    test "change_step_list/1 returns a step_list changeset" do
      step_list = step_list_fixture()
      assert %Ecto.Changeset{} = Recipes.change_step_list(step_list)
    end
  end

  describe "ingredients" do
    alias ExRecipes.Recipes.Ingredient

    @valid_attrs %{ingredient: "some ingredient"}
    @update_attrs %{ingredient: "some updated ingredient"}
    @invalid_attrs %{ingredient: nil}

    def ingredient_fixture(attrs \\ %{}) do
      {:ok, ingredient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_ingredient()

      ingredient
    end

    test "list_ingredients/0 returns all ingredients" do
      ingredient = ingredient_fixture()
      assert Recipes.list_ingredients() == [ingredient]
    end

    test "get_ingredient!/1 returns the ingredient with given id" do
      ingredient = ingredient_fixture()
      assert Recipes.get_ingredient!(ingredient.id) == ingredient
    end

    test "create_ingredient/1 with valid data creates a ingredient" do
      assert {:ok, %Ingredient{} = ingredient} = Recipes.create_ingredient(@valid_attrs)
      assert ingredient.ingredient == "some ingredient"
    end

    test "create_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_ingredient(@invalid_attrs)
    end

    test "update_ingredient/2 with valid data updates the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, ingredient} = Recipes.update_ingredient(ingredient, @update_attrs)
      assert %Ingredient{} = ingredient
      assert ingredient.ingredient == "some updated ingredient"
    end

    test "update_ingredient/2 with invalid data returns error changeset" do
      ingredient = ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_ingredient(ingredient, @invalid_attrs)
      assert ingredient == Recipes.get_ingredient!(ingredient.id)
    end

    test "delete_ingredient/1 deletes the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{}} = Recipes.delete_ingredient(ingredient)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_ingredient!(ingredient.id) end
    end

    test "change_ingredient/1 returns a ingredient changeset" do
      ingredient = ingredient_fixture()
      assert %Ecto.Changeset{} = Recipes.change_ingredient(ingredient)
    end
  end

  describe "ingredient_lists" do
    alias ExRecipes.Recipes.IngredientList

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def ingredient_list_fixture(attrs \\ %{}) do
      {:ok, ingredient_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_ingredient_list()

      ingredient_list
    end

    test "list_ingredient_lists/0 returns all ingredient_lists" do
      ingredient_list = ingredient_list_fixture()
      assert Recipes.list_ingredient_lists() == [ingredient_list]
    end

    test "get_ingredient_list!/1 returns the ingredient_list with given id" do
      ingredient_list = ingredient_list_fixture()
      assert Recipes.get_ingredient_list!(ingredient_list.id) == ingredient_list
    end

    test "create_ingredient_list/1 with valid data creates a ingredient_list" do
      assert {:ok, %IngredientList{} = ingredient_list} =
               Recipes.create_ingredient_list(@valid_attrs)
    end

    test "create_ingredient_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_ingredient_list(@invalid_attrs)
    end

    test "update_ingredient_list/2 with valid data updates the ingredient_list" do
      ingredient_list = ingredient_list_fixture()

      assert {:ok, ingredient_list} =
               Recipes.update_ingredient_list(ingredient_list, @update_attrs)

      assert %IngredientList{} = ingredient_list
    end

    test "update_ingredient_list/2 with invalid data returns error changeset" do
      ingredient_list = ingredient_list_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Recipes.update_ingredient_list(ingredient_list, @invalid_attrs)

      assert ingredient_list == Recipes.get_ingredient_list!(ingredient_list.id)
    end

    test "delete_ingredient_list/1 deletes the ingredient_list" do
      ingredient_list = ingredient_list_fixture()
      assert {:ok, %IngredientList{}} = Recipes.delete_ingredient_list(ingredient_list)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_ingredient_list!(ingredient_list.id) end
    end

    test "change_ingredient_list/1 returns a ingredient_list changeset" do
      ingredient_list = ingredient_list_fixture()
      assert %Ecto.Changeset{} = Recipes.change_ingredient_list(ingredient_list)
    end
  end
end

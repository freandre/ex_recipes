defmodule ExRecipesWeb.IngredientListControllerTest do
  use ExRecipesWeb.ConnCase

  alias ExRecipes.Recipes

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:ingredient_list) do
    {:ok, ingredient_list} = Recipes.create_ingredient_list(@create_attrs)
    ingredient_list
  end

  describe "index" do
    test "lists all ingredient_lists", %{conn: conn} do
      conn = get(conn, ingredient_list_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ingredient lists"
    end
  end

  describe "new ingredient_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ingredient_list_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ingredient list"
    end
  end

  describe "create ingredient_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ingredient_list_path(conn, :create), ingredient_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ingredient_list_path(conn, :show, id)

      conn = get(conn, ingredient_list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ingredient list"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ingredient_list_path(conn, :create), ingredient_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ingredient list"
    end
  end

  describe "edit ingredient_list" do
    setup [:create_ingredient_list]

    test "renders form for editing chosen ingredient_list", %{
      conn: conn,
      ingredient_list: ingredient_list
    } do
      conn = get(conn, ingredient_list_path(conn, :edit, ingredient_list))
      assert html_response(conn, 200) =~ "Edit Ingredient list"
    end
  end

  describe "update ingredient_list" do
    setup [:create_ingredient_list]

    test "redirects when data is valid", %{conn: conn, ingredient_list: ingredient_list} do
      conn =
        put(
          conn,
          ingredient_list_path(conn, :update, ingredient_list),
          ingredient_list: @update_attrs
        )

      assert redirected_to(conn) == ingredient_list_path(conn, :show, ingredient_list)

      conn = get(conn, ingredient_list_path(conn, :show, ingredient_list))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, ingredient_list: ingredient_list} do
      conn =
        put(
          conn,
          ingredient_list_path(conn, :update, ingredient_list),
          ingredient_list: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Ingredient list"
    end
  end

  describe "delete ingredient_list" do
    setup [:create_ingredient_list]

    test "deletes chosen ingredient_list", %{conn: conn, ingredient_list: ingredient_list} do
      conn = delete(conn, ingredient_list_path(conn, :delete, ingredient_list))
      assert redirected_to(conn) == ingredient_list_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, ingredient_list_path(conn, :show, ingredient_list))
      end)
    end
  end

  defp create_ingredient_list(_) do
    ingredient_list = fixture(:ingredient_list)
    {:ok, ingredient_list: ingredient_list}
  end
end

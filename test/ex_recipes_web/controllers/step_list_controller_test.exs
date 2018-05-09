defmodule ExRecipesWeb.StepListControllerTest do
  use ExRecipesWeb.ConnCase

  alias ExRecipes.Recipes

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:step_list) do
    {:ok, step_list} = Recipes.create_step_list(@create_attrs)
    step_list
  end

  describe "index" do
    test "lists all step_lists", %{conn: conn} do
      conn = get(conn, step_list_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Step lists"
    end
  end

  describe "new step_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, step_list_path(conn, :new))
      assert html_response(conn, 200) =~ "New Step list"
    end
  end

  describe "create step_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, step_list_path(conn, :create), step_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == step_list_path(conn, :show, id)

      conn = get(conn, step_list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Step list"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, step_list_path(conn, :create), step_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Step list"
    end
  end

  describe "edit step_list" do
    setup [:create_step_list]

    test "renders form for editing chosen step_list", %{conn: conn, step_list: step_list} do
      conn = get(conn, step_list_path(conn, :edit, step_list))
      assert html_response(conn, 200) =~ "Edit Step list"
    end
  end

  describe "update step_list" do
    setup [:create_step_list]

    test "redirects when data is valid", %{conn: conn, step_list: step_list} do
      conn = put(conn, step_list_path(conn, :update, step_list), step_list: @update_attrs)
      assert redirected_to(conn) == step_list_path(conn, :show, step_list)

      conn = get(conn, step_list_path(conn, :show, step_list))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, step_list: step_list} do
      conn = put(conn, step_list_path(conn, :update, step_list), step_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Step list"
    end
  end

  describe "delete step_list" do
    setup [:create_step_list]

    test "deletes chosen step_list", %{conn: conn, step_list: step_list} do
      conn = delete(conn, step_list_path(conn, :delete, step_list))
      assert redirected_to(conn) == step_list_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, step_list_path(conn, :show, step_list))
      end)
    end
  end

  defp create_step_list(_) do
    step_list = fixture(:step_list)
    {:ok, step_list: step_list}
  end
end

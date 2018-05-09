defmodule ExRecipesWeb.StepControllerTest do
  use ExRecipesWeb.ConnCase

  alias ExRecipes.Recipes

  @create_attrs %{description: "some description", picture: "some picture"}
  @update_attrs %{description: "some updated description", picture: "some updated picture"}
  @invalid_attrs %{description: nil, picture: nil}

  def fixture(:step) do
    {:ok, step} = Recipes.create_step(@create_attrs)
    step
  end

  describe "index" do
    test "lists all steps", %{conn: conn} do
      conn = get(conn, step_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Steps"
    end
  end

  describe "new step" do
    test "renders form", %{conn: conn} do
      conn = get(conn, step_path(conn, :new))
      assert html_response(conn, 200) =~ "New Step"
    end
  end

  describe "create step" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, step_path(conn, :create), step: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == step_path(conn, :show, id)

      conn = get(conn, step_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Step"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, step_path(conn, :create), step: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Step"
    end
  end

  describe "edit step" do
    setup [:create_step]

    test "renders form for editing chosen step", %{conn: conn, step: step} do
      conn = get(conn, step_path(conn, :edit, step))
      assert html_response(conn, 200) =~ "Edit Step"
    end
  end

  describe "update step" do
    setup [:create_step]

    test "redirects when data is valid", %{conn: conn, step: step} do
      conn = put(conn, step_path(conn, :update, step), step: @update_attrs)
      assert redirected_to(conn) == step_path(conn, :show, step)

      conn = get(conn, step_path(conn, :show, step))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, step: step} do
      conn = put(conn, step_path(conn, :update, step), step: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Step"
    end
  end

  describe "delete step" do
    setup [:create_step]

    test "deletes chosen step", %{conn: conn, step: step} do
      conn = delete(conn, step_path(conn, :delete, step))
      assert redirected_to(conn) == step_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, step_path(conn, :show, step))
      end)
    end
  end

  defp create_step(_) do
    step = fixture(:step)
    {:ok, step: step}
  end
end

defmodule ExRecipesWeb.RevisionControllerTest do
  use ExRecipesWeb.ConnCase

  alias ExRecipes.Recipes

  @create_attrs %{revision: 42}
  @update_attrs %{revision: 43}
  @invalid_attrs %{revision: nil}

  def fixture(:revision) do
    {:ok, revision} = Recipes.create_revision(@create_attrs)
    revision
  end

  describe "index" do
    test "lists all revisions", %{conn: conn} do
      conn = get(conn, revision_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Revisions"
    end
  end

  describe "new revision" do
    test "renders form", %{conn: conn} do
      conn = get(conn, revision_path(conn, :new))
      assert html_response(conn, 200) =~ "New Revision"
    end
  end

  describe "create revision" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, revision_path(conn, :create), revision: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == revision_path(conn, :show, id)

      conn = get(conn, revision_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Revision"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, revision_path(conn, :create), revision: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Revision"
    end
  end

  describe "edit revision" do
    setup [:create_revision]

    test "renders form for editing chosen revision", %{conn: conn, revision: revision} do
      conn = get(conn, revision_path(conn, :edit, revision))
      assert html_response(conn, 200) =~ "Edit Revision"
    end
  end

  describe "update revision" do
    setup [:create_revision]

    test "redirects when data is valid", %{conn: conn, revision: revision} do
      conn = put(conn, revision_path(conn, :update, revision), revision: @update_attrs)
      assert redirected_to(conn) == revision_path(conn, :show, revision)

      conn = get(conn, revision_path(conn, :show, revision))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, revision: revision} do
      conn = put(conn, revision_path(conn, :update, revision), revision: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Revision"
    end
  end

  describe "delete revision" do
    setup [:create_revision]

    test "deletes chosen revision", %{conn: conn, revision: revision} do
      conn = delete(conn, revision_path(conn, :delete, revision))
      assert redirected_to(conn) == revision_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, revision_path(conn, :show, revision))
      end)
    end
  end

  defp create_revision(_) do
    revision = fixture(:revision)
    {:ok, revision: revision}
  end
end

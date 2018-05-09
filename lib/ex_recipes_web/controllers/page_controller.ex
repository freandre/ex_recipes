defmodule ExRecipesWeb.PageController do
  use ExRecipesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

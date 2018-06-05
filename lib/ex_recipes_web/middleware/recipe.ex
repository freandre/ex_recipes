defmodule ExRecipesWeb.Middleware.Recipe do
  @behaviour Absinthe.Middleware

  def call(resolution, _config) do
    case resolution.context do
      %{top_args: _} ->
        resolution

      _ ->
        ctx = resolution.context |> Map.put_new(:top_args, resolution.arguments())
        %{resolution | context: ctx}
    end
  end
end

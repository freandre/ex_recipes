defmodule ExRecipes.Recipes.StepList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "step_lists" do
    field(:revision_id, :id)
    field(:step_id, :id)

    timestamps()
  end

  @doc false
  def changeset(step_list, attrs) do
    step_list
    |> cast(attrs, [])
    |> validate_required([])
  end
end

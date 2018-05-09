defmodule ExRecipes.Recipes.Step do
  use Ecto.Schema
  import Ecto.Changeset

  schema "steps" do
    field(:description, :string)
    field(:picture, :binary)
    many_to_many(:revision, ExRecipes.Recipes.Revision, join_through: ExRecipes.Recipes.StepList)

    timestamps()
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:picture, :description])
    |> validate_required([:picture, :description])
  end
end

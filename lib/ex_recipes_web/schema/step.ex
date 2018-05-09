defmodule ExRecipesWeb.Schema.Step do
  use Absinthe.Schema.Notation

  object :step do
    field(:id, :id)
    field(:description, :string)
    field(:picture, :string)
  end
end

defmodule ExRecipesWeb.Schema.Comment do
  use Absinthe.Schema.Notation

  object :comment do
    field(:id, :id)
    field(:comment, :string)
    field(:revision, :revision)
    field(:posted_at, :naive_datetime)
  end
end

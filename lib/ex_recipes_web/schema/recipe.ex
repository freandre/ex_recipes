defmodule ExRecipesWeb.Schema.Recipe do
  use Absinthe.Schema.Notation

  alias ExRecipesWeb.Resolvers

  object :recipe do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:picture, :string)

    field(:revisions, list_of(:revision)) do
      arg(:revision, :integer)
      resolve(&Resolvers.Recipes.list_revisions/3)
    end
  end
end

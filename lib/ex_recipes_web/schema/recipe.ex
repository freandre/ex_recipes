defmodule ExRecipesWeb.Schema.Recipe do
  use Absinthe.Schema.Notation

  alias ExRecipesWeb.Resolvers

  object :recipe do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:picture, :string)

    field(:revisions, :integer) do
      resolve(&Resolvers.Recipes.count_revisions/3)
    end

    field(:ingredients, list_of(:ingredient)) do
      resolve(&Resolvers.Recipes.list_ingredients/3)
    end

    field(:steps, list_of(:step)) do
      resolve(&Resolvers.Recipes.list_steps/3)
    end

    field(:comments, list_of(:comment)) do
      resolve(&Resolvers.Recipes.list_comments/3)
    end
  end
end

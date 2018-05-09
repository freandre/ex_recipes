# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExRecipes.Repo.insert!(%ExRecipes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ExRecipes.Repo

alias ExRecipes.Recipes.Recipe
alias ExRecipes.Recipes.Revision
alias ExRecipes.Recipes.Comment
alias ExRecipes.Recipes.Ingredient
alias ExRecipes.Recipes.Step

homard = Repo.insert!(%Ingredient{ingredient: "1 Homard"})
oeufs = Repo.insert!(%Ingredient{ingredient: "2 oeufs"})
estragon = Repo.insert!(%Ingredient{ingredient: "Estragon"})

couper = Repo.insert!(%Step{description: "Couper le homard en deux"})
farce = Repo.insert!(%Step{description: "Preparer la farce"})
cuire = Repo.insert!(%Step{description: "Cuire les oeufs"})

revision1 =
  Repo.insert!(%Revision{
    revision: 1,
    comments: [
      %Comment{comment: "Trop bon !!", posted_at: ~N[2017-10-26 08:00:00]}
    ]
  })
  |> Repo.preload([:ingredients, :steps])
  |> Ecto.Changeset.change()
  |> Ecto.Changeset.put_assoc(:ingredients, [oeufs, homard])
  |> Ecto.Changeset.put_assoc(:steps, [couper, farce, cuire])
  |> Repo.update!()

revision2 =
  Repo.insert!(%Revision{
    revision: 2,
    comments: [
      %Comment{comment: "Trop de gnole !!", posted_at: ~N[2017-10-26 10:00:00]}
    ]
  })
  |> Repo.preload([:ingredients, :steps])
  |> Ecto.Changeset.change()
  |> Ecto.Changeset.put_assoc(:ingredients, [homard, oeufs, estragon])
  |> Ecto.Changeset.put_assoc(:steps, [couper, cuire, farce])
  |> Repo.update!()

Repo.insert!(%Recipe{
  title: "Homard à la Cancalaise",
  picture: "somepic",
  description: "Un classique vendéen !",
  revisions: [revision1, revision2]
})

farine = Repo.insert!(%Ingredient{ingredient: "100gr de farine"})
beurre = Repo.insert!(%Ingredient{ingredient: "200gr de beurre"})

melanger = Repo.insert!(%Step{description: "Melanger les ingredients"})
feuilleter = Repo.insert!(%Step{description: "Donner deux tours"})
reposer = Repo.insert!(%Step{description: "Laisser la pate reposer"})

revision3 =
  Repo.insert!(%Revision{
    revision: 1,
    comments: [
      %Comment{comment: "Pas assez cuit", posted_at: ~N[2017-10-28 11:42:00]}
    ]
  })
  |> Repo.preload([:ingredients, :steps])
  |> Ecto.Changeset.change()
  |> Ecto.Changeset.put_assoc(:ingredients, [farine, beurre])
  |> Ecto.Changeset.put_assoc(:steps, [melanger, feuilleter, reposer])
  |> Repo.update!()

Repo.insert!(%Recipe{
  title: "Kouign Aman",
  picture: "somepic",
  description: "Parfait pour un regime.",
  revisions: [revision3]
})

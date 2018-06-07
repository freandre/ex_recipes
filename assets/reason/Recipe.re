let component = ReasonReact.statelessComponent("Recipe");

/* Shortcut declaration */
let str = ReasonReact.string;

/* GraphQL declaration */
module GetVersionedRecipe = [%graphql {|
  query getVersionedRecipe($id: Int!, $revision: Int!) {
    recipe(id: $id, revision: $revision) {
      title
      description
      ingredients {
        ingredient
      }
      steps{
        description
      }
      comments {
        comment
        postedAt
      }
    }
  }
|}];

module GetVersionedRecipeQuery = ReasonApollo.CreateQuery(GetVersionedRecipe);

let make = (~id, ~revision, _children) => {
  ...component,
  render: (_self) => {
        let recipeQuery = GetVersionedRecipe.make(~id=id, ~revision=revision, ());

        <GetVersionedRecipeQuery variables=recipeQuery##variables>
        ...(({result}) => {
          switch result {
            | Loading => <div>(str("Loading"))</div>
            | Error(error) => Js.log(error);
                              <div>(str("Something Went Wrong"))</div>
            | Data(response) =>
                let recipe = response##recipe;

                switch recipe {
                  | Some(recipe) =>
                    let title = recipe##title;
                    let description = recipe##description;
                    let ingredients = recipe##ingredients;
                    let steps = recipe##steps;
                    let comments = recipe##comments;

                    <RecipePage title description ingredients steps comments />
                  | _ => ReasonReact.null
                }
          }
        })
      </GetVersionedRecipeQuery>
    }
};
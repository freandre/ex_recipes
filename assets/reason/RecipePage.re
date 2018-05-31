let component = ReasonReact.statelessComponent("RecipePage");

/* Shortcut declaration */
let str = ReasonReact.string;

/* GraphQL declaration */
module GetVersionedRecipe = [%graphql {|  
  query getVersionedRecipe($id: Int!, $revision: Int!) {
    recipe(id: $id) {
      title
      description
      revisions(revision: $revision) {
        revision
        ingredients {
          ingredient
        }
        steps{
          description
        }
      }
    } 
  }   
|}]; 

module GetVersionedRecipeQuery = ReasonApollo.CreateQuery(GetVersionedRecipe);

let make = (~id, ~revision=?, _children) => {
  ...component,
  render: (_self) => {
    
    let (recipeQuery, queryElement) = switch revision {
        | Some(revision) => (GetVersionedRecipe.make(~id=id, ~revision=revision, ()), GetVersionedRecipeQuery);
        | _ => (GetRecipe.make(~id=id, ()), GetRecipeQuery);
        };    

    <queryElement variables=recipeQuery##variables>
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
                  
                  <div className="container-fluid">
                    <div className="row">
                      <RecipeTitle title />
                      <RecipeDescription description />
                    </div>
                    <VersionedElements />                    
                  </div>
                | _ => ReasonReact.null
              }
        }
      })
    </queryElement>
  }
};

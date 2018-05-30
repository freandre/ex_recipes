let component = ReasonReact.statelessComponent("RecipePage");

/* Shortcut declaration */
let str = ReasonReact.string;

/* GraphQL declaration */
module GetRecipe = [%graphql {|  
  query getRecipe($id: Int!) {
    recipes(id: $id) {
      title
      description      
    }
  }   
|}]; 

module GetRecipeQuery = ReasonApollo.CreateQuery(GetRecipe);

let make = (~id, ~revision=?, _children) => {
  ...component,
  render: (_self) => {
    let recipeQuery = GetRecipe.make(~id=id, ());

    <GetRecipeQuery variables=recipeQuery##variables>
      ...(({result}) => {
        switch result {
          | Loading => <div>(str("Loading"))</div>
          | Error(error) => Js.log(error);
                            <div>(str("Something Went Wrong"))</div>
          | Data(response) => <div>(str("Something"))</div>               
        }
      })
    </GetRecipeQuery>
  }
};

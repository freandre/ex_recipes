let component = ReasonReact.statelessComponent("RecipesPage");

let str = ReasonReact.string;

module GetRecipes = [%graphql {|
  {
    recipes {
      title
      description
    } 
  }
|}]; 

module GetRecipesQuery = ReasonApollo.CreateQuery(GetRecipes);

let make = (_children) => {
  ...component,
  render: (_self) => {
    let recipesQuery = GetRecipes.make(());

    <GetRecipesQuery variables=recipesQuery##variables>
      ...(({result}) => {
        switch result {
          /*| NoData => <div> (str("No Data")) </div>*/
          | Loading => <div> (str("Loading")) </div>
          | Error(error) => <div> (str(error)) </div>
          | Data(response) => <div>(str("check"))</div> 
            /*<div className="card-deck">
              <RecipeCard title="Homard" description="miam" />
              <RecipeCard title="Moru" description="mmm" />
              <RecipeCard title="Homard" description="miam" />
            </div>*/
          /*<div> (ReasonReact.string(response##pokemon##name)) </div>*/
        }
      })
    </GetRecipesQuery>
  }
};
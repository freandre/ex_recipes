let component = ReasonReact.statelessComponent("RecipesPage");

/* Shortcut declaration */
let str = ReasonReact.string;

/* GraphQL declaration */
module GetRecipes = [%graphql {|
  query getRecipes {
    recipes {
      title
      description
      id
    }
  }
|}];

module GetRecipesQuery = ReasonApollo.CreateQuery(GetRecipes);

/* Prepare a recipe card */
let gen_recipe = (recipe) => {  
  switch(recipe) {    
    | Some(recipe) =>
          <RecipeCard id=recipe##id title=recipe##title description=recipe##description />
    | _ => ReasonReact.null
  }
};

/* Prepare a recipe card list */
let gen_recipes = (response) => {  
  switch(response##recipes) {    
    | Some(recipes) =>
        Array.map(elem => gen_recipe(elem), recipes)
        |> ReasonReact.array
    | _ => ReasonReact.null
  }
};

let make = (_children) => {
  ...component,
  render: (_self) => {
    let recipesQuery = GetRecipes.make(());

    <GetRecipesQuery variables=recipesQuery##variables>
      ...(({result}) => {
        switch result {
          | Loading => <div>(str("Loading"))</div>
          | Error(error) => Js.log(error);
                            <div>(str("Something Went Wrong"))</div>
          | Data(response) => <div className="card-columns">(gen_recipes(response))</div>               
        }
      })
    </GetRecipesQuery>
  }
};

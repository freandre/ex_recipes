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

let gen_recipe = (recipe) => {  
  switch(recipe) {    
    | Some(recipe) =>        
          <RecipeCard title=recipe##title description=recipe##description />
    | _ => ReasonReact.null
  }
};

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
          | Data(response) => <div className="card-deck">(gen_recipes(response))</div>               
        }
      })
    </GetRecipesQuery>
  }
};

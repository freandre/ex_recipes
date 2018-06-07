let component = ReasonReact.statelessComponent("RecipesPage");

/* Shortcut declaration */
let str = ReasonReact.string;

/* GraphQL declaration */
module GetRecipes = [%graphql {|
  query getRecipes {
    recipes {
      id
      revisions
      title
      description
    }
  }
|}];

module GetRecipesQuery = ReasonApollo.CreateQuery(GetRecipes);

/* Prepare a recipe card */
let gen_recipe = (recipe, lastId) => {
  switch(recipe) {
    | Some(recipe) =>
          lastId := lastId^ + 1;
          <RecipeCard id=recipe##id revisions=recipe##revisions title=recipe##title description=recipe##description key=(string_of_int(lastId^)) />
    | _ => ReasonReact.null
  }
};

/* Prepare a recipe card list */
let gen_recipes = (response) => {
  let lastId = ref(-1);
  switch(response##recipes) {
    | Some(recipes) =>
        Array.map(elem => gen_recipe(elem, lastId), recipes)
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

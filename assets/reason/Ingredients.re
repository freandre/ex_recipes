let component = ReasonReact.statelessComponent("Ingredients");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare a list of ingredients */
let gen_ingredients = (ingredients) => {
  Array.map(elem => <Ingredient ingredient=elem />, ingredients)
  |> ReasonReact.array
};

let make = (~ingredients, _children) => {
  ...component,
  render: (_self) => {    
    switch(ingredients) {
        | Some(ingredients) => 
            /* <ul className="list-group list-group-flush"> */
            <ul>
              (gen_ingredients(ingredients))
            </ul>
        | _ => ReasonReact.null
    };
  }  
};

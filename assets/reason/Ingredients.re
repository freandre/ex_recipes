let component = ReasonReact.statelessComponent("Ingredients");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare a list of ingredients */
let gen_ingredients = (ingredients) => {
  let lastId = ref(-1);
  Array.map(elem => {
      lastId := lastId^ + 1;
      <Ingredient ingredient=elem key=(string_of_int(lastId^)) />
    }, ingredients)
  |> ReasonReact.array
};

let make = (~ingredients, _children) => {
  ...component,
  render: (_self) => {    
    switch(ingredients) {
        | Some(ingredients) => 
            <form>
              <ul className="list-group list-group-flush">
                (gen_ingredients(ingredients))
              </ul>
            </form>
        | _ => ReasonReact.null
    };
  }  
};

let component = ReasonReact.statelessComponent("Ingredient");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare the list item */
let gen_item = (ingredient) => {
    switch(ingredient) {
        | Some(ingredient) =>
            /* <li className="list-group-item">(str(ingredient))</li> */
            <li>(str(ingredient))</li>
        | _ => ReasonReact.null
    };
}

let make = (~ingredient, _children) => {
  ...component,
  render: (_self) => {      
    switch(ingredient) {
        | Some(ingredient) =>
            gen_item(ingredient##ingredient)
        | _ => ReasonReact.null
    };
  }  
};

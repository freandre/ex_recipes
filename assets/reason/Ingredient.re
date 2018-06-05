type state = {
    being_modified: bool,
    is_modified: bool,
    ingredient: option(string)
}

type actions = 
  | Edit
  | Freeze(option(string));

let component = ReasonReact.reducerComponent("Ingredient");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare the list item */
let gen_item = (ingredient) => {
    switch(ingredient) {
        | Some(ingredient) =>
            <li className="list-group-item">(str(ingredient))</li>            
        | _ => ReasonReact.null
    };
}

let get_ingredient = (ing_obj) => {
    switch(ing_obj) {
        | Some(ingredient) => ingredient##ingredient
        | _ => None
    };
}

let make = (~ingredient, _children) => {
  ...component,
  initialState: () => {
      being_modified: false,
      is_modified: false,
      ingredient: get_ingredient(ingredient)
  },   
  reducer: (action, state) =>
    switch (action) {
    | Edit => ReasonReact.Update({...state, being_modified: true, is_modified: true})
    | Freeze(ingredient) => ReasonReact.Update({being_modified: false, is_modified: true, ingredient: ingredient})
  },
  render: (_self) => {      
    switch(ingredient) {
        | Some(ingredient) =>
            gen_item(ingredient##ingredient)
        | _ => ReasonReact.null
    };
  }  
};

type state = {
    being_modified: bool,
    is_modified: bool,
    ingredient: string
}

type actions = 
  | Edit
  | Update(string)
  | Cancel;

let component = ReasonReact.reducerComponent("Ingredient");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare an item */
let gen_item = (self) => {
    <li className="list-group-item" onClick=(_event => self.ReasonReact.send(Edit))>
        (str(self.ReasonReact.state.ingredient))
    </li>
}

/* Prepare an input item */
let gen_input = (self) => {
    <input
    value=(self.ReasonReact.state.ingredient)
    _type="text"
    placeholder="Ingredient" />
}

/* Extract the ingredient value*/
let get_ingredient = (ing_obj) => {
    switch(ing_obj) {
        | Some(ingredient) => 
            switch(ingredient##ingredient) {
                | Some(ingredient) => ingredient
                | _ => ""
            }
        | _ => ""
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
    | Update(ingredient) => ReasonReact.Update({being_modified: false, is_modified: true, ingredient: ingredient})
    | Cancel => ReasonReact.Update({...state, being_modified: false})
  },
  render: (self) => {      
    switch(self.state.being_modified) {
        | true =>  gen_input(self)
        | false => gen_item(self)
    };
  }  
};

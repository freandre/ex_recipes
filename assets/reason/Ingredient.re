type state = {
    being_modified: bool,
    is_modified: bool,
    ingredient: string,
    currentValue: string
}

type actions = 
  | Edit(string) 
  | Update(string)
  | Cancel;

let component = ReasonReact.reducerComponent("Ingredient");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Get value from input */
let valueFromEvent = (evt) => 
    (evt |> ReactEventRe.Form.target |> ReactDOMRe.domElementToObj)##value;

/* Prepare an item */
let gen_item = (self) => {
    <span onClick=(_event => self.ReasonReact.send(Edit(self.ReasonReact.state.ingredient)))>
        (str(self.ReasonReact.state.ingredient))
    </span>
}

/* Prepare an input item */
let gen_input = (self) => {
    <div className="input-group input-group-sm">
        <input 
            _type="text" 
            className="form-control" 
            placeholder="Ingredient" 
            ariaLabel="Ingredient" 
            ariaDescribedby="basic-addon2"            
            value=(self.ReasonReact.state.currentValue)
            onChange=(event => self.ReasonReact.send(Edit(valueFromEvent(event))))
        />
        <div className="input-group-append">
            <button className="btn btn-outline-secondary" _type="button" onClick=(_event => self.ReasonReact.send(Update(self.ReasonReact.state.currentValue)))>
                <i className="fas fa-check" />
            </button>
            <button className="btn btn-outline-secondary" _type="button" onClick=(_event => self.ReasonReact.send(Cancel))>
                <i className="fas fa-times" />
            </button>
        </div>
    </div>
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
    let ingredient = get_ingredient(ingredient);
    {
      being_modified: false,
      is_modified: false,
      ingredient: ingredient,
      currentValue: ingredient
    }
  },   
  reducer: (action, state) =>
    switch (action) {
    | Edit(value) => ReasonReact.Update({...state, being_modified: true, is_modified: true, currentValue: value})    
    | Update(ingredient) => ReasonReact.Update({...state, being_modified: false, is_modified: true, ingredient: ingredient})
    | Cancel => ReasonReact.Update({...state, being_modified: false})
  },
  render: (self) => {      
    switch(ingredient) {      
        | Some(_ingredient) => 
            <li className="list-group-item">
                (switch(self.state.being_modified) {
                    | true =>  gen_input(self)
                    | false => gen_item(self)
                })
            </li>
        | _ => ReasonReact.null
    }
  }  
};

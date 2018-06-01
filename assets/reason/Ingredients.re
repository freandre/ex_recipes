let component = ReasonReact.statelessComponent("Ingredients");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~ingredients, _children) => {
  ...component,
  render: (_self) => {    
    switch(ingredients) {
        | Some(ingredients) => 
            <ul className="list-group list-group-flush">
                
            </ul>
        | _ => ReasonReact.null
    };
  }  
};

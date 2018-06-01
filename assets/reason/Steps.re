let component = ReasonReact.statelessComponent("Steps");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~steps, _children) => {
  ...component,
  render: (_self) => {    
    switch(steps) {
        | Some(steps) => 
            <ul className="list-group">
                
            </ul>
        | _ => ReasonReact.null
    };
  }  
};

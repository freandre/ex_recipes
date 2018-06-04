let component = ReasonReact.statelessComponent("Step");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare the list item */
let gen_item = (step) => {
    switch(step) {
        | Some(step) =>
            <li>(str(step))</li>
        | _ => ReasonReact.null
    };
}

let make = (~step, _children) => {
  ...component,
  render: (_self) => {      
    switch(step) {
        | Some(step) =>
            gen_item(step##description)
        | _ => ReasonReact.null
    };
  }  
};

let component = ReasonReact.statelessComponent("Steps");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare a list of ingredients */
let gen_steps = (steps) => {
  Array.map(elem => <Step step=elem />, steps)
  |> ReasonReact.array
};

let make = (~steps, _children) => {
  ...component,
  render: (_self) => {    
    switch(steps) {
        | Some(steps) => 
            <ol>(gen_steps(steps))</ol>
        | _ => ReasonReact.null
    };
  }  
};

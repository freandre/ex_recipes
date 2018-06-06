let component = ReasonReact.statelessComponent("Steps");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare a list of ingredients */
let gen_steps = (steps) => {
  let lastId = ref(-1);
  Array.map(elem => 
    {
      lastId := lastId^ + 1;
      <Step step=elem key=(string_of_int(lastId^)) />
    }, steps)
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

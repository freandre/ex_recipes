let component = ReasonReact.statelessComponent("Recipe");

let make = (_children) => {
    ...component,
    render: self =>
      <div>
        (ReasonReact.string("recipe"))
      </div>,
  };
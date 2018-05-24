let component = ReasonReact.statelessComponent("Recipes");

let make = (_children) => {
    ...component,
    render: self =>
      <div>
        (ReasonReact.string("recipes"))
      </div>,
  };
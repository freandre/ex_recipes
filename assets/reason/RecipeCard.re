let component = ReasonReact.statelessComponent("RecipeCard");

let str = ReasonReact.string;

let make = (~title, ~subtitle=?, ~description, _children) => {
    ...component,
    render: (_self) =>

    <div className="card">
      <div className="card-body">
        <h5 className="card-title">(str(title))</h5>
        (switch(subtitle) {
          | None => ReasonReact.null
          | Some(subtitle) => <h6 className="card-subtitle mb-2 text-muted"> (str(subtitle))</h6>
        })
        <p className="card-text">(str(description))</p>
      </div>
    </div>,
  };
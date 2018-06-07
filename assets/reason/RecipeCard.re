let component = ReasonReact.statelessComponent("RecipeCard");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Click handler */
let handleClick = (href, event) =>
  if (! ReactEventRe.Mouse.defaultPrevented(event)) {
    ReactEventRe.Mouse.preventDefault(event);
    ReasonReact.Router.push(href);
  };

/* Prepare a subtitle if available */
let gen_subtitle = (subtitle) => {
  switch(subtitle) {
    | Some(subtitle) => <h6 className="card-subtitle mb-2 text-muted">(str(subtitle))</h6>
    | _ => ReasonReact.null
  }
};

let make = (~id, ~revisions, ~title, ~subtitle=?, ~description, _children) => {
    ...component,
    render: (_self) =>
      switch(id, revisions, title, description) {
      | (Some(id), Some(revisions), Some(title), Some(description)) =>
        <div className="card shadow-sm rounded" onClick=(handleClick("/recipe/" ++ id ++ "/revision/" ++ string_of_int(revisions)))>
          <div className="card-body">
            <h5 className="card-title">(str(title))</h5>
            (gen_subtitle(subtitle))
            <p className="card-text">(str(description))</p>
          </div>
        </div>
      | _ => ReasonReact.null
      }
  };
let component = ReasonReact.statelessComponent("RecipeTitle");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~title, _children) => {
    ...component,
    render: (_self) => 
        switch(title) {
            | Some(title) => <h1>(str(title))</h1>
            | _ => ReasonReact.null
        }
};

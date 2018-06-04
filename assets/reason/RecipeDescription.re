let component = ReasonReact.statelessComponent("RecipeDescription");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~description, _children) => {
    ...component,
    render: (_self) => 
        switch(description) {
            | Some(description) => <h6 className="lead">(str(description))</h6>  
            | _ => ReasonReact.null
        }        
};

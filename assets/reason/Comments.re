let component = ReasonReact.statelessComponent("Comments");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Prepare a text item */
let gen_text = (text) => {
    switch(text) {
        | Some(text) => <p className="card-text">(str(text))</p>
        | _ => ReasonReact.null    
    }
}

/* Prepare a date item */
let gen_date = (date) => {
    let datestr = switch(date) {
        | Some(date) => Js.Json.decodeString(date);
        | _ => None 
    }; 
    
    switch(datestr) {
        | Some(date) => <p className="card-text text-right text-muted">(str(date))</p>
        | _ => ReasonReact.null    
    }
}

/* Prepare a comment item */
let gen_comment = (comment) => {
    switch(comment) {    
        | Some(comment) =>
            <div className="card shadow-sm rounded">                
                <div className="card-body">          
                    (gen_text(comment##comment))
                    (gen_date(comment##postedAt))
                </div>                
            </div>
        | _ => ReasonReact.null
    }
}

/* Prepare the list of comments */
let gen_comments = (comments) => {            
    Array.map(elem => gen_comment(elem), comments)
    |> ReasonReact.array        
}

let make = (~comments, _children) => {
  ...component,
  render: (_self) => {    
    switch(comments) {
        | Some(comments) => 
            <div className="container-fluid">
                (gen_comments(comments))
            </div>
        | _ => ReasonReact.null
    };
  }  
};

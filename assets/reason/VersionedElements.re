let component = ReasonReact.statelessComponent("VersionedElements");

let str = ReasonReact.string;

let make = (_children) => {
    ...component,
    render: (_self) => 
        <div className="row">
            <div className="col">
            /*ingredients*/
            </div>
            <div className="col-4">
            /*steps*/
            </div>
        </div>
  }; 
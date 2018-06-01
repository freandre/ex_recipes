let component = ReasonReact.statelessComponent("RecipePage");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~title, ~description, ~comments, _children) => {
  ...component,
  render: (_self) => {    
      <div className="container-fluid">
        <div className="row">
          <RecipeTitle title />
          <RecipeDescription description />
        </div>
        <div className="row">
          <div className="col">
            /*ingredients*/
          </div>
          <div className="col-4">
            /*steps*/
          </div>
        </div>
        <Comments comments />
      </div>      
    }  
};

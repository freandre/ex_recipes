let component = ReasonReact.statelessComponent("RecipePage");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~title, ~description, ~ingredients, ~steps, ~comments, _children) => {
  ...component,
  render: (_self) => {    
      <div className="container-fluid">
        <div className="row">
          <RecipeTitle title />
        </div>
        <div className="row">
          <RecipeDescription description />
        </div>
        <div className="row">
          <div className="col">
            <Ingredients ingredients />
          </div>
          <div className="col-4">
            <Steps steps />
          </div>
        </div>
        <Comments comments />
      </div>      
    }  
};

let component = ReasonReact.statelessComponent("RecipePage");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = (~id, ~revision, ~revisions, ~title, ~description, ~ingredients, ~steps, ~comments, _children) => {
  ...component,
  render: (_self) => {
      <div className="container-fluid">
        <div className="row">
          <RecipeTitle title />
        </div>
        <div className="row mb-5">
          <RecipeDescription description />
        </div>
        <div className="row mb-5">
          <Navigation id revision revisions />
        </div>
        <div className="row mb-5">
          <div className="col-4">
            <Ingredients ingredients />
          </div>
          <div className="col-8">
            <Steps steps />
          </div>
        </div>
        <Comments comments />
      </div>
    }
};

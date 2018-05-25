let component = ReasonReact.statelessComponent("RecipesPage");

let str = ReasonReact.string;

let make = (_children) => {
    ...component,
    render: self =>

    <div className="card-deck">
      <RecipeCard title="Homard" description="miam" />
      <RecipeCard title="Moru" description="mmm" />
      <RecipeCard title="Homard" description="miam" />
    </div>
  };
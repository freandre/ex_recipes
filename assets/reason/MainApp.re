/* Types declaration */
type route =
  | Home
  | Recipe(int)
  | VersionedRecipe(int, int);

type state = {route};

type action =
  | ChangeRoute(route);

/* Handler declaration */  
let reducer = (action, _state) =>
    switch (action) {
        | ChangeRoute(route) => ReasonReact.Update({route: route})
    };

let mapUrlToRoute = (url: ReasonReact.Router.url) =>
    switch (url.path) {
        | [] => Home
        | ["recipe", id, "revision", revision] => VersionedRecipe(int_of_string(id), int_of_string(revision))
        | ["recipe", id] => Recipe(int_of_string(id))                
        | _ => Home
    };

let component = ReasonReact.reducerComponent("MainApp");

/* Shortcut declaration */
let str = ReasonReact.string;

let make = _children => {
    ...component,
    reducer,
    initialState: () => {route: Home},
    subscriptions: self => [
      Sub(
        () =>
          ReasonReact.Router.watchUrl(url =>
            self.send(ChangeRoute(url |> mapUrlToRoute))
          ),
        ReasonReact.Router.unwatchUrl,
      ),
    ],
    render: self =>
        <ReasonApollo.Provider client=GraphQLClient.instance>        
            <div className="container-fluid">
                <div className="row">
                    <div className="col-2" />
                    <div className="col-8"> 
                        <div className="jumbotron jumbotron-fluid shadow-sm mb-5">
                            <div className="container">            
                                <h1 className="display-4">(str("Forge my recipe !"))</h1>
                                <p className="lead">(str("The versioned recipe maker."))</p>
                            </div>
                        </div>

                        (switch (self.state.route) {
                            | Home => <RecipesPage />                            
                            | Recipe(id) => <Recipe id />
                            | VersionedRecipe(id, revision) => <VersionedRecipe id revision />
                        })

                    </div>
                    <div className="col-2" />
                </div>
            </div>        
        </ReasonApollo.Provider>, 
};

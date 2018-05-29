let str = ReasonReact.string;

ReactDOMRe.renderToElementWithId(
    <ReasonApollo.Provider client=GraphQLClient.instance>        
        <div className="container">                            
            <div className="row">
                <div className="col" />
                <div className="col-8"> 
                    <div className="jumbotron jumbotron-fluid">
                        <div className="container">            
                            <h1 className="display-4">(str("Forge my recipe !"))</h1>
                            <p className="lead">(str("The versioned recipe maker."))</p>
                        </div>
                    </div>

                    <RecipesPage />
                </div>
                <div className="col" />
            </div>    
        </div>        
    </ReasonApollo.Provider>, 
    "root");
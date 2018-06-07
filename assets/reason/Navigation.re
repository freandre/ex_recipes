let component = ReasonReact.statelessComponent("Navigation");

/* Shortcut declaration */
let str = ReasonReact.string;

/* Click handler */
let handleClick = (href, event) =>
  if (! ReactEventRe.Mouse.defaultPrevented(event)) {
    ReactEventRe.Mouse.preventDefault(event);
    ReasonReact.Router.push(href);
  };

/* Prepare a "current" class element */
let gen_class = (elem, revision) => {
    if (elem == revision) {
        "page-item active"
    } else {
        "page-item"
    }
}

/* Prepare url for navigation */
let gen_url = (id, revision) => {
    "/recipe/" ++ string_of_int(id) ++ "/revision/" ++ string_of_int(revision)
}

/* Prepare text for navigation */
let gen_text = (id, elem, revision) => {
    if (elem == revision) {
        <span className="page-link">
            (str(string_of_int(elem)))
        </span>
    } else {
        <a className="page-link" onClick=(handleClick(gen_url(id, revision)))>
            (str(string_of_int(elem)))
        </a>
    }
}

/* Prepare a unique navigaiton element */
let gen_nav = (id, revision, revisions) => {
    let lastId = ref(-1);

    Array.init(revisions, i => revisions - i)
    |> Array.map(elem => {
        lastId := lastId^ + 1;
        <li className=(gen_class(elem, revision)) key=(string_of_int(lastId^))>
            (gen_text(id, elem, revision))
        </li>
    })
    |> ReasonReact.array
  };

let make = (~id, ~revision, ~revisions, _children) => {
  ...component,
  render: (_self) =>
    switch(revisions) {
        | (Some(revisions)) =>
            <nav ariaLabel="Available revisions">
                <ul className="pagination pagination-sm justify-content-end">
                <li className="page-item disabled">
                    <a className="page-link" href="#" tabIndex=(-1)>(str("Previous"))</a>
                </li>

                (gen_nav(id, revision, revisions))

                <li className="page-item">
                    <a className="page-link" href="#">(str("Next"))</a>
                </li>
                </ul>
            </nav>
        | _ => ReasonReact.null
    }
};

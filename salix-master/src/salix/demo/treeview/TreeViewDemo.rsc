module salix::demo::treeview::TreeViewDemo

import salix::Core;
import salix::App;
import salix::lib::TreeView;
import salix::HTML;
import IO;

import lang::json::IO;

alias Model = str;

App[Model] treeViewApp()
  = app(init, view, update, |http://localhost:7031/salix/demo/treeview/index.html|, |project://salix/src|
       , parser = parseMsg);

Model init() = "";

data Msg
  = click()
  | selected(str nodeId)
  ;
  

Model update(Msg msg, Model m) {
  switch (msg) {
    case selected(str id) : m = id;
  }
  return m;
}

void view(Model m) {
  div(() {
    h3("Tree view demo");
    h5("Selected: <m>");
    
    treeView(onNodeSelected(Msg::selected), (T tnode) {
      tnode("Parent 1", () {
        tnode("Child 1", () {
          tnode("Grandchild 1");
          tnode("Grandchild 2");
        });
        tnode("Child 2", selected());
     });
     tnode("Parent 2", color("red"));
     tnode("Parent 3");
     tnode("Parent 4");
     tnode("Parent 5");
     if (/1$/ := m) {
       tnode("Another one because 1!!!");
     }
     if (/2$/ := m) {
       tnode("Another one because 2!!!");
     }
   });
 });
}  

module Load

import Syntax;
import ParseTree;
import IO;
import Message;

import Parser;
import AST;
import ParseTree;
import util::IDE;
import vis::Figure;

public Program PS_implode(Tree tree)
  = implode(#Program, tree);
  
private node PS_outline (Tree t)
  = PS_implode(t);

public Levels testimplode(Tree tree)
  = implode(#Levels, tree);

public str PS_NAME = "PuzzleScript";  //language name
public str PS_EXT  = "PS" ;           //file extension

public void PS_register()
{
  Contribution PS_style =
    categories
    (
      (
        "Comment": {foregroundColor(color("dimgray")),bold()},
        "String": {foregroundColor(color("teal")),bold()},
        "OID" : {foregroundColor(color("mediumblue")),bold()},        
        "CID" : {foregroundColor(color("teal")),bold()},
        "LID": {foregroundColor(color("darkblue")),bold()},
        "blue" : {foregroundColor(color("royalblue")),bold()},
        "yellow": {foregroundColor(color("yellow")),bold()},
        "brown": {foregroundColor(color("brown")),bold()},
        "orange": {foregroundColor(color("orange")),bold()},
        "green": {foregroundColor(color("darkgreen")),bold()},        
        "red": {foregroundColor(color("firebrick")),bold()}
        //,"MetaKeyword": {foregroundColor(color("blueviolet")), bold()}
      )
    );
    
  PS_contributions =
  {
    PS_style
    /*,
    popup
    (
      menu
      (
        "PuzzleScript language",
        [
          action("eval", PS_eval)
        ]
      )
    )*/
  };
  
  registerLanguage(PS_NAME, PS_EXT, PS_parse);
  registerOutliner(PS_NAME, PS_outline);
  registerContributions(PS_NAME, PS_contributions);
}
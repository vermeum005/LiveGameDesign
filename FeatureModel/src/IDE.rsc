module IDE
import Syntax;

import ParseTree;
import IO;
import Message;
import Ambiguity;

import util::IDE;
import vis::Figure;

//debugging:
import Set;
import Map;

public str FM_NAME = "FeatureModel";  //language name
public str FM_EXT  = "FM" ;           //file extension

//private node PS_outline (Tree t)
//  = PS_implode(t);

public void FM_register()
{
  Contribution FM_style =
    categories
    (
      (
        "Comment": {foregroundColor(color("dimgray")),bold()},
        //"String": {foregroundColor(color("teal")),bold()},
        "ID" : {foregroundColor(color("mediumblue")),bold()},        
        //"CID" : {foregroundColor(color("teal")),bold()},
        //"LID": {foregroundColor(color("darkblue")),bold()},
        "blue" : {foregroundColor(color("royalblue")),bold()},
        "yellow": {foregroundColor(color("yellow")),bold()},
        "brown": {foregroundColor(color("brown")),bold()},
        "orange": {foregroundColor(color("orange")),bold()},
        "green": {foregroundColor(color("darkgreen")),bold()},        
        "red": {foregroundColor(color("firebrick")),bold()}
        //,"MetaKeyword": {foregroundColor(color("blueviolet")), bold()}
      )
    );
    
  FM_contributions =
  {
    FM_style
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
  
  registerLanguage(FM_NAME, FM_EXT, FM_parse);
  //registerOutliner(PS_NAME, PS_outline);
  registerContributions(FM_NAME, FM_contributions);
}

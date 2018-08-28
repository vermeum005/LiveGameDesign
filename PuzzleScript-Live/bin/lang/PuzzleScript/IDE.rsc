module lang::PuzzleScript::IDE

import lang::PuzzleScript::Syntax;
import lang::PuzzleScript::Model;

import ParseTree;
import IO;
import Message;
import Ambiguity;

import util::IDE;
import vis::Figure;

//debugging:
import Set;
import Map;

public str PS_NAME = "PuzzleScript";  //language name
public str PS_EXT  = "PS" ;           //file extension

private node PS_outline (Tree t)
  = PS_implode(t);

private void PS_eval(Tree t, loc l)
{
  println("Tree");
  iprintln(t);

  println("Abstract Syntax Tree");
  //Tree t = PS_parse(l);
  
  if(/amb := t)
  {
    println("ambiguous!");
  }
  
  adt::PS PS = PS_implode(t);
  iprintln(PS);
  
  //int val = eval(PS);
  
  //println("value <val>");
}

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

public Program testIt()
{
  loc file = |project://PuzzleScript-Live/test2.PS|;
  
  Tree t = PS_parse(file);
  
  //deep match doesn't work due to preamble
  
  
  //iprintln(diagnose(t));
  
  return PS_implode(t);
}
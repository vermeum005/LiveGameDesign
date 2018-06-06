module IDE

import Syntax;
import Model;

import ParseTree;
import IO;
import Message;
import Ambiguity;

import util::IDE;
import vis::Figure;

//debugging:
import Set;
import Map;

public str PS_NAME = "PuzzleScript Language";                //language name
public str PS_EXT  = "PS" ;                                  //file extension

data Dummy
  = dummy();

private node PS_outline (Tree t)
  = dummy();//PS_implode(t);

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
        "PS" : {foregroundColor(color("royalblue"))}
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

public void testIt()
{
  loc file = |project://PuzzleScriptOct2017/test2.PS|;
  
  Tree t = PS_parse(file);
  
  /*
  //deep match doesn't work due to preamble
  int count = 1;
  if(alt: /amb := t)
  {
    count = count + 1;
    iprintln("ambiguous!");
    println(alt);
    iprintln(alt);
  }*/

/*  
  p = PS_implode(t);

  iprintln(p);
  */
  
}
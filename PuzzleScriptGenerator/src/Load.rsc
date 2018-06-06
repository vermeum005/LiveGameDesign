module Load

import Parser;
import AST;
import ParseTree;

public Program PS_implode(Tree tree)
  = implode(#Program, tree);

//public Program PS_parse_implode(str prog)
//  = PS_implode(PS_parse(prog));
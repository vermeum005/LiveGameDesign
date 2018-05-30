module Parser

import Syntax;
//import AST;
import ParseTree;

public LayerData load(str txt) = parse(#LayerData, txt);
module Load

import Prelude;
import Syntax;
import AST;

public PROGRAM load(str txt) = implode(#PROGRAM, parse(#Program, txt));
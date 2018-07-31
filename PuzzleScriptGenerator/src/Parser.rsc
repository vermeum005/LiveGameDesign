module Parser

import Syntax;
//import AST;
import ParseTree;

public Program load(str txt) = parse(#Program, txt);
public Program load1() = parse(#Program, |project://PuzzleScriptGenerator/Test.PS|);

public Program load2() = parse(#Program, |project://PuzzleScriptGenerator/Test2.PS|);
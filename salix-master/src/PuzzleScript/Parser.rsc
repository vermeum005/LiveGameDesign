module PuzzleScript::Parser

import PuzzleScript::Syntax;
//import AST;
import ParseTree;

public PSProgram load(str txt) = parse(#PSProgram, txt);
public PSProgram load1() = parse(#PSProgram, |project://salix/src/PuzzleScript/Test/Test.PS|);

public PSProgram load2() = parse(#PSProgram, |project://salix/src/PuzzleScript/Test/TopDown.PS|);
public PSProgram loadPlatformer() = parse(#PSProgram, |project://salix/src/PuzzleScript/Test/Platformer.PS|);
public PSProgram loadPlatformer2() = parse(#PSProgram, |project://salix/src/PuzzleScript/Test/Platformer2.PS|);
public PSProgram readGame() = parse(#PSProgram, |project://salix/src/PuzzleScript/Test/ReadIn.PS|);
public WinCondition PS_win(str txt) = parse(#WinCondition, txt);
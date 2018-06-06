module Compile

import Prelude;
import AST;
import Assembly;
import Load;

alias Instrs = list[Instr];                       

// compile Expressions.

Instrs compileExp(natCon(int N)) = [pushNat(N)];  

Instrs compileExp(strCon(str S)) = [pushStr(substring(S,1,size(S)-1))];

Instrs compileExp(id(PicoId Id)) = [rvalue(Id)];

public Instrs compileExp(add(EXP E1, EXP E2)) =    
  [*compileExp(E1), *compileExp(E2), add2()];

Instrs compileExp(sub(EXP E1, EXP E2)) =
  [*compileExp(E1), *compileExp(E2), sub2()];

Instrs compileExp(conc(EXP E1, EXP E2)) =
  [*compileExp(E1), *compileExp(E2), conc2()];
  
// Unique label generation

private int nLabel = 0;                            

private str nextLabel() {
  nLabel += 1;
  return "L<nLabel>";
}

// Compile a statement

Instrs compileStat(asgStat(PicoId Id, EXP Exp)) =
	[lvalue(Id), *compileExp(Exp), assign()];
	
Instrs compileStat(ifElseStat(EXP Exp,              
                              list[STATEMENT] Stats1,
                              list[STATEMENT] Stats2)){
  
  elseLab = nextLabel();
  endLab = nextLabel();  
  return [*compileExp(Exp), 
          gofalse(elseLab), 
          *compileStats(Stats1),  
          go(endLab), 
          label(elseLab), 
          *compileStats(Stats2), 
          label(endLab)];
}

Instrs compileStat(whileStat(EXP Exp, 
                             list[STATEMENT] Stats1)) {
  entryLab = nextLabel();
  endLab = nextLabel();
  return [label(entryLab), 
          *compileExp(Exp), 
          gofalse(endLab), 
          *compileStats(Stats1), 
          go(entryLab), 
          label(endLab)];
}

// Compile a list of statements
Instrs compileStats(list[STATEMENT] Stats1) =      
  [ *compileStat(S) | S <- Stats1 ];
  
// Compile declarations

Instrs compileDecls(list[DECL] Decls) =
  [ ((tp == natural()) ? dclNat(Id) : dclStr(Id))  |       
    decl(PicoId Id, TYPE tp) <- Decls
  ];

// Compile a Pico program

public Instrs compileProgram(PROGRAM P){
  nLabel = 0;
  if(program(list[DECL] Decls, list[STATEMENT] Series) := P){
     return [*compileDecls(Decls), *compileStats(Series)];
  } else
    throw "Cannot happen";
}

public Instrs compileProgram(str txt) = compileProgram(load(txt));
    
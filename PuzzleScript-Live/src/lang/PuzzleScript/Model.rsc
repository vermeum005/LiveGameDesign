module lang::PuzzleScript::Model

import ParseTree;

data Program
  = program(list[Section] sections);

data Section
  = metadata(str attr, str val)
  | section(str section, list[Element] elements);

data Element
  = section(str section)
  | object(ID name, ID char, list[Color] colors, Sprite sprite)
  | legend(ID char, list[ID] objects)
  | layer(list[ID] layer)
  | rule(When when, list[Segment] condition, list[Segment] result)
  | level(list[Message] messages, Level level)
  ;
   
data When
  = uncond()
  | late()
  | hor()
  | vert()
  ;

data Segment
  = remove()
  | part(list[Fill] fill)
  | until()
  ;

data Fill
  = fill(Mod m, ID id)
  ;

data Mod
  = just() 
  | push() 
  | pull()
  | not()
  | rnd()
  | stat() 
  | rdir()
  ;

data Color
   = color(str color);

data Sprite
   = sprite(list[str] sprite);

data Message
  = message(str message);

data Level
  = level(str level);

data ID
  = id(str name);

public Program PS_implode(Tree tree)
  = implode(#lang::PuzzleScript::Model::Program, tree);

public Program PS_parse_implode(str prog)
  = PS_implode(PS_parse(prog));
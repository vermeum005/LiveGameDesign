module lang::PuzzleScript::Syntax2

import lang::std::Layout;

lexical ID
  = [a-zA-Z*#^@$%&.*+]+ !>> [a-zA-Z*#^@$%&.*+] \ KEYWORDS;

keyword KEYWORDS
  = "OBJECTS" | "LEGEND" | "RULES" | "COLLISIONLAYERS" | "LEVELS" | "WINCONDITIONS"
  | "..." | "and" | "or" | "late" | "horizontal" | "vertical" | "random" | "stationary" | "randomDir"
  | "all" | "no" | "on" | "some" //logic keywords
  | "up" | "down" | "right" | "left" //absolute directions
  | "^" | "V" | "\<" | "\>" | "moving" | "stationary" | "parallel" | "perpendicular"//relative directions
  | "title" |  "homepage" | "author" | "level" | "message"
  | "red" | "green" | "blue" | "orange" | "brown" | "yellow"
  ;
  
start syntax Program
  = "OBJECTS" ID* "LEGEND"
  ;
  
public start[Program] PS_parse(str src) = 
  parse(#start[Program], src);

public start[Program] PS_parse(str src, loc file) = 
  parse(#start[Program], src, file);
  
public start[Program] PS_parse(loc file) = parse(#start[Program], file); 
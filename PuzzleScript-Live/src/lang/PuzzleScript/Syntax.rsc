module lang::PuzzleScript::Syntax

import lang::std::Layout;

start syntax Program
  = program: Section* sections
  ;
  
syntax Section
  = metadata: ("author" | "homepage" | "title") STRING
  | section:  ("OBJECTS" | "LEGEND" | "RULES" | "COLLISIONLAYERS" | "WINCONDITIONS" | "LEVELS") Element*;
  
syntax Element
  = object:   OID name CID char Color+ colors Sprite sprite
  | legend:   CID char "=" {OID "and"}+  objects 
  | layer:    {LID ","}+ layer
  | rule:     When when "[" { Segment "|"}+ condition "]" "-\>" "[" {Segment "|"}+ result "]"
  | level:    Message* messages Level level
  | wincond:  ("some" | "all") ID "on" ID
  ;

syntax When
  = uncond: /*empty*/
  | late:  "late"
  | hor:   "horizontal"
  | vert:  "vertical"
  ;
  
syntax Segment
  = remove: /*empty*/
  | cell:   Fill+
  | until:  "..."
  ;

syntax Fill
  = fill: Mod OID
  ;

syntax Mod
  = just: /*empty*/
  | push: "\>"
  | pull: "\<"
  | not:  "no"
  | rnd:  "random"
  | stat: "stationary"
  | rdir: "randomDir"
  ;
  
lexical Color
  = color: (  "red" | "blue" | "green" | "brown" | "orange" | "yellow")
  ;

syntax Sprite
  = sprite: Row+
  ;
  
lexical Row
  = row: Pixel+ [\n]
  ;
  
lexical Pixel
  = pixel: [.0-9] !>>[\ \t\r];

lexical Level
  = @category="String" level: [#]+ [\n] (ID [\n])* >> [\n];
   
lexical STRING
  = @category="String" ![\n]* >> [\n];
   
syntax Message
  = message: "message" STRING;

lexical CID
  = @category="CID" id: ID;

lexical LID
  = @category="LID" id: ID;

lexical OID
  = @category="OID" id: ID; 

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
   
public start[Program] PS_parse(str src) = 
  parse(#start[Program], src);

public start[Program] PS_parse(str src, loc file) = 
  parse(#start[Program], src, file);
  
public start[Program] PS_parse(loc file) = parse(#start[Program], file); 
 
module Syntax

start syntax Program
  = program: Preamble Objects Legend
  ;
  // CollisionLayers Rules;

syntax Preamble
  = preamble: "title" String "author" String "homepage" String
  ;
  
syntax Objects
  = objects: "OBJECTS" Object*
  ;

syntax Object
  = object: ID Color
  ;
      
syntax Legend
  = legend: "LEGEND" Mapping*;

syntax Mapping
  = mapping: CHAR "=" {ID "and"}+
  ;
  
//FIXME
syntax CollisionLayers
  = collisionLayers:
  "COLLISIONLAYERS"
  ( {ID ","}* ".")*; // dot instead of linebreak to disambiguate layers
 
syntax Rules
  = "RULES"
  (Condition "-\>" Effect)*
  ;

syntax Condition
  = "late"? "[" {((Mod ID) | "...") "|"}* "]";

syntax Effect
  = "[" {((Mod ID) | "..." | "") "|"}* "]";
  
syntax Mod
  = "\<"
  | "\>"
  | /*empty*/
  ;
  
layout Layout = WhitespaceAndComment* !>> [\ \t\n\r%];

lexical WhitespaceAndComment 
   = [\ \t\n\r]
   | @category="Comment" "%" ![%]+ "%"
   | @category="Comment" "%%" ![\n]* $
   ;

lexical CHAR
    = ch: [A-Z];

syntax Color
   = blue: "Blue"
   | orange: "Orange"
   | red: "Red"
   | yellow: "Yellow"
   | green: "Green"
   | brown: "Brown";

lexical ID  = id: [A-Z][a-z0-9]* !>> [a-z0-9];
lexical String = "\"" ![\"]*  "\"";

public start[Program] PS_parse(str src) = 
  parse(#start[Program], src);

public start[Program] PS_parse(str src, loc file) = 
  parse(#start[Program], src, file);
  
public start[Program] PS_parse(loc file) = parse(#start[Program], file); 

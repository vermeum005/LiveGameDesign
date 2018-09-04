module Syntax

import lang::std::Layout;

lexical ID
  = id: [a-zA-Z*#^@$%&.*+]+ !>> [a-zA-Z*#^@$%&.*+] \ Keywords;
lexical String = ![\"]* ;

start syntax FeatureModel
  = model: Feature*;

syntax Feature
  = feature: "root"? "feature" ID Mod "{" Edge* ExtraEdge*"}" 
  | rule: "rule" ID "{" ExtraEdge* "}" "\"" Rule "\""
  | goal: "goal" ID "{" ExtraEdge* "}" "\"" String "\"";

syntax Mod
  = xor: "xor" //alternative
  | or: "or"  //inclusive or
  | or:       //empty alternative
  ;

syntax Edge
  = mandatory: "--." ID
  | optional: "--o" ID
  | subfeature: "--" ID
  ;
  
syntax ExtraEdge
	= excludes: "-.-." ID
	| requires: "_._." ID;
	
syntax When
  = uncond: /*empty*/
  | late:  "late"
  | hor:   "horizontal"
  | vert:  "vertical"
  | down: "down"
  ;
  
syntax Rule
	= rule: When when "[" {RulePart "]["}+ condition "]""-\>" "[" {RulePart "]["}+ result "]"
	;

syntax RulePart
	=  rulepart:{ Segment "|"}+ 
	;
		
syntax Segment
  = remove: /*empty*/
  | cell:   Fill+
  | until:  "..."
  ;

syntax Fill
	= fill: Mod ID
	;
syntax Mod
	= just: /*empty*/
	| away: "\<"
	| towords: "\>"
	| up: "^"
	| downM: "v"
	;
  
keyword Keywords
	= "RULES" | "OBJECTS" | "LEGEND" | "COLLISIONLAYERS" 
	| "WINCONDITIONS" | "LEVELS" | "title" | "author" 
	| "homepage" | "or" | "\<" | "\>" | "^" | "v" | "Some"
	| "All" | "No"|"on" | "message" | "and" | "...";
	  
public start[FeatureModel] FM_parse() = 
  parse(#start[FeatureModel], |project://salix/test/PuzzleScript.FM|);

public start[FeatureModel] FM_parse(str src, loc file) = 
  parse(#start[FeatureModel], src, file);
  
public start[FeatureModel] FM_parse(loc file) = parse(#start[FeatureModel], file); 

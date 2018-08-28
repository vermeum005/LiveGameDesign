module Syntax

import lang::std::Layout;

lexical ID
  = id: [a-zA-Z*#^@$%&.*+]+ !>> [a-zA-Z*#^@$%&.*+];

start syntax Model
  = model: Feature*;

syntax Feature
  = feature: "root"? "feature" ID Mod "{" Edge* ExtraEdge*"}";

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
  
public start[Model] FM_parse() = 
  parse(#start[Model], |project://FeatureModel/test/PuzzleScript.FM|);

public start[Model] FM_parse(str src, loc file) = 
  parse(#start[Model], src, file);
  
public start[Model] FM_parse(loc file) = parse(#start[Model], file); 

module Syntax

//lexical Natural = [0-9]+ !>> [0-9] ;
lexical ID = [a-zA-Z][a-z0-9.A-Z]+ !>> [a-z0-9.A-Z] \ Keywords;
//lexical String = "\"" ![\"]*  "\"" \ Keywords;
//lexical Sym = [a-zA-Z.!@#$%&*];
//lexical Mp = Sym* \ Keywords;

//lexical Spriteline = [0-9.][0-9.][0-9.][0-9.][0-9.];
//syntax Sprite = Spriteline  Spriteline  Spriteline  Spriteline Spriteline;


layout WhiteSpace = [\t-\n\ \r]* ;

start syntax Program
	= program: "OBJECTS" ID* "LEGEND";
	//Layer RuleData;

syntax CreatorData
	= creatordata: "title " ID "author " ID "homepage " ID;


syntax Objects
	= objects: "OBJECTS" ObjectData*
	;
	
syntax ObjectData 
	= objectdata: ID
	;
	
syntax Colors
	= colors: {Color WhiteSpace}+;
	
syntax Color
   = blue: "blue"
   | orange: "orange"
   | red: "red"
   | yellow: "yellow"
   | green: "green"
   | brown: "brown"
   | gray: "gray"
   | black: "black";
	
syntax Legend
	= legend: "LEGEND"
	;	
syntax LegendData
	= objectcluster: ID "=" {ID "or"}+
	| legendobject: Sym "=" ID;

syntax Layers
	= layers: "COLLISIONLAYERS" {LayerData "\n"}*
	;
syntax LayerData
	= layerdata: {ID ","}+;
	// empty slots in effects dont work yet. Applies to teleporting
syntax RuleData
	= ruledata: "RULES" {Rule "\n"}*;
	
syntax Rule
	= rule: PreCondition? (Conditions "-\>" Effects);
	
syntax Conditions
	= conditions: "[" {Condition "|"}+ "]";
	
syntax Condition
	= modcondition: Mod ID
	| condition: ID
	| emptycondition: "...";
	
syntax PreCondition
	= late: "late"
	| horizontal: "Horizontal"
	| vertical: "Vertical";

syntax Effects
	= effects: "[" {Effect "|"}+ "]";
	
syntax Effect
	= modeffect: Mod ID
	| effect: ID
	| emptyeffect: "...";

syntax Mod
	= away: "\<"
	| towords: "\>"
	| up: "^"
	| down: "v"
	;

keyword Keywords
	= "RULES" | "OBJECTS" | "LEGEND" | "COLLISIONLAYERS" 
	| "WINCONDITIONS" | "LEVELS" | "title" | "author" | "homepage" ;

//syntax Effect
//	= effect: "[" {((Mod ID) | "..." | "") "|"}* "]";

//syntax Condition
//	= condition: "late"? "[" {((Mod ID) | "...") "|"}* "]";

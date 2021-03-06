module PuzzleScript::Syntax

lexical Natural = [0-9]+ !>> [0-9] ;
lexical String = [a-zA-Z][a-z0-9.A-Z]+ !>> [a-z0-9.A-Z] \ Keywords;
lexical STRING = @category="String" ![\n]* >> [\n];
lexical Sym = [a-zA-Z.!@#$%&*0-9];
lexical Mp = Sym* \ Keywords;

lexical Pixel = [.0-9.!@#$%&*];
lexical Spriteline = Pixel* [\r][\n] \ Keyword;
lexical Sprite = sprite: Spriteline* [\r][\n];

lexical Whitespace 
  = [\u0009-\u000D \u0020 \u0085 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000]
  ; 
lexical Comment = @lineComment @category="Comment" "//" ![\n]* $;
layout Standard 
  = WhitespaceOrComment* !>> [\u0009-\u000D \u0020 \u0085 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000] !>> "//";
lexical WhitespaceOrComment 
  = whitespace: Whitespace
  | comment: Comment
  ; 
syntax ID
	= id: String;
start syntax PSProgram
	= program: CreatorData Objects Legend Sound Layers RuleData WinCondition Levels;

syntax CreatorData
	= creatordata: "title " ID "author " ID "homepage " ID;


syntax Objects
	= objects: "OBJECTS" ObjectData*
	;
	
syntax ObjectData 
	= objectdata: ID Colors Sprite
	;
	
syntax Colors
	= colors: Color+;
	
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
	= legend: "LEGEND" LegendData*
	;	
syntax LegendData
	= objectcluster: ID "=" {ID "or"}+
	| legendobject: Sym "=" {ID "and"}+;

syntax Sound
	= sound: "SOUNDS"
	;

syntax Layers
	= layers: "COLLISIONLAYERS" LayerData*
	;
syntax LayerData
	= layerdata: {ID ","}+;
	// empty slots in effects dont work yet. Applies to teleporting

syntax RuleData
	= ruledata: "RULES" Rule*;
	
syntax Rule
	= rule: When when "[" {RulePart "]["}+ condition "]""-\>" "[" {RulePart "]["}+ result "]"
	;

syntax RulePart
	=  rulepart:{ Segment "|"}+ 
	;
syntax When
  = uncond: /*empty*/
  | late:  "late"
  | hor:   "horizontal"
  | vert:  "vertical"
  | down:  "down"
  | up: "up"
  | lateDown: "late down"
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
	| upM: "^"
	| downM: "v"
	;

start syntax WinCondition
	= wincondition: "WINCONDITIONS" ("Some"| "All"| "No") {ID "on"}+;

syntax Levels
	= levels: "LEVELS" Level*;

syntax Level
	= level: Message* Sprite;
syntax Message
	= message: "message" STRING;
keyword Keywords
	= "RULES" | "OBJECTS" | "LEGEND" | "COLLISIONLAYERS" 
	| "WINCONDITIONS" | "LEVELS" | "title" | "author" 
	| "homepage" | "or" | "\<" | "\>" | "^" | "v" | "Some"
	| "All" | "No"|"on" | "message" | "and" | "randomDir";
	
public start[Program] PS_parse(str src) = 
  parse(#start[Program], src);

public start[Program] PS_parse(str src, loc file) = 
  parse(#start[Program], src, file);
  
public start[Program] PS_parse(loc file) = parse(#start[Program], file); 
 
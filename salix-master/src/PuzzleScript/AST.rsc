module PuzzleScript::AST

alias Sprite = str;
alias Mp = str;
alias Sym = str;

data ID = id(str name);

data Program
  = program
  (
    CreatorData creatordata, Objects objects, Legend legend, Sound sound, Layers layers, RuleData ruledata, WinCondition wincondition, Levels levels
  );
  
data CreatorData 
	= creatordata(ID title, ID author, ID homepage)
	;
	
data Objects
	= objects(list[ObjectData] objects)
	;
	
data ObjectData
	= objectdata(ID name, Colors colors, Sprite sprite)
	;
	
data Colors
	= colors(list[Color] color)
	;
data Color
   = blue()
   | orange()
   | red()
   | yellow()
   | green()
   | brown()
   | gray()
   | black()
   ;

data Legend
	= legend(list[LegendData] legend);	
data LegendData
	= objectcluster(ID clustername, list[ID] objectnames)
	| legendobject(Sym symbol, list[ID] objectnames);

data Sound
	= sound();

data Layers
	= layers(list[LayerData] layers);	
data LayerData
	= layerdata(list[ID] names);
	
data RuleData
	= ruledata(list[Rule] rules);
	
data Rule
	= rule(When when, list[RulePart] condition, list[RulePart] result);

data RulePart
	= rulepart(list[Segment] states)
	;
	
data Segment
  = remove()
  | cell(list[Fill] fill)
  | until()
  ;
	
data Mod
	= just()
	| away()
	| towords()
	| upM()
	| downM()
	;
data Fill
  = fill(Mod m, ID id)
  ;
data When
  = uncond()
  | late()
  | hor()
  | vert()
  | down()
  | up()
  | lateDown()
  ;
	
data WinCondition
	= wincondition(str prefix, list[ID] objects)
	;
	
data Levels
	= levels(list[Level] levels);
	
data Level
	= level(str message, Sprite sprite);
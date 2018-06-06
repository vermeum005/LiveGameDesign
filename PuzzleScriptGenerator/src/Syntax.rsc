module Syntax

lexical Natural = [0-9]+ !>> [0-9] ;
lexical ID = [a-zA-Z][a-z0-9.A-Z]+ !>> [a-z0-9.A-Z];
lexical String = "\"" ![\"]*  "\"";
lexical Sym = [a-zA-Z.!@#$%^&*];
lexical Mp = Sym*;

syntax Spriteline = [0-9.][0-9.][0-9.][0-9.][0-9.];
syntax Sprite = Spriteline [\n] Spriteline [\n] Spriteline [\n] Spriteline [\n] Spriteline;


layout WhiteSpace = [\t-\n\ \r]* ;

start syntax Program
	= program: CreatorData Objects Legend Layers;

start syntax CreatorData
	= creatordata: "title " ID "author " ID "homepage " ID;


syntax Objects
	= objects: ObjectData+
	;
	
syntax ObjectData 
	= objectdata: ID Colors Sprite;
	
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
	= legend: LegendData+
	;	
syntax LegendData
	= objectcluster: ID "=" {ID "or"}+
	| legendobject: Sym "=" ID;

syntax Layers
	= layers: {LayerData "\r"}+
	;
syntax LayerData
	= layerdata: {ID ","}+;



module Syntax

lexical Natural = [0-9]+ !>> [0-9] ;
lexical ID = [a-zA-Z][a-z0-9.A-Z]* !>> [a-z0-9.A-Z];
lexical String = "\"" ![\"]*  "\"";
lexical Sym = [a-zA-Z.!@#$%^&*];
lexical Mp = Sym*;

syntax Spriteline = [0-9.][0-9.][0-9.][0-9.][0-9.];
syntax Sprite = Spriteline [\n] Spriteline [\n] Spriteline [\n] Spriteline [\n] Spriteline;


layout WhiteSpace = [\t-\n\ \r]* ;

//start syntax CreatorData
//	= title: "title " ID title
//	| author: "author " ID author
//	| homepage: "homepage " ID homepage;


//start syntax ObjectData 
//	= objectdata: ID name  ID+ colors  Sprite sprite;
	
//start syntax LegendData
//	= objectcluster: ID clustername "=" {ID "or"}+
//	| legendobject: Sym symbol "=" ID objectname;

//start syntax LayerData
//	= layerdata: {ID ","}+;



module AST

alias ID = str;
alias Sprite = str;
alias Mp = str;
alias Sym = str;

data Program
  = program
  (
    CreatorData creatordata, Objects objects, Legend legend, Layers layers
  );
  
data CreatorData 
	= creatordata(ID title, ID author, ID homepage)
	;
	
data Objects
	= objects(list[ObjectData] objects)
	;
	
data ObjectData
	= objectdata(ID name, Colors, Sprite)
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
	| legendobject(Sym symbol, ID objectname);

data Layers
	= layers(list[LayerData] layers);	
data LayerData
	= layerdata(list[ID] names);
	
//public data RuleData
//	= rule(ID rule);

//public data WinCondition
//	= wincondition(ID condition);
	
//public data LevelData
//	= mp(Mp mp);
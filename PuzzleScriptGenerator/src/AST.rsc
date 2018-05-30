module AST

alias ID = str;
alias Sprite = str;
alias Mp = str;
alias Sym = str;

public data CreatorData 
	= title(ID title)
	|author(ID author)
	|homepage(ID homepage);
	
public data ObjectData
	= objectdata(ID name, list[ID] colors, Sprite sprite);
	
public data LegendData
	= objectcluster(ID clustername, list[ID] objectnames)
	| legendobject(Sym symbol, ID objectname);
	
public data LayerData
	= layerinfo(list[list[ID] names] layers);
	
public data RuleData
	= rule(ID rule);

public data WinCondition
	= wincondition(ID condition);
	
public data LevelData
	= mp(Mp mp);
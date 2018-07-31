module AST

import ParseTree;

data Model
  = model(list[Feature] features);

data Feature
  = feature(bool isRoot, ID id, Mod modifier, list[Edge] edges, list[ExtraEdge] extraEdges);

data Mod
  = xor()
  | or()
  ;
  
data Edge
  = mandatory(ID target)
  | optional(ID target)
  | subfeature(ID target);

data ExtraEdge
	= excludes(ID target)
	| requires(ID target);
data ID
  = id(str name);
  
public Model FM_implode(Tree tree)
  = implode(#Model, tree);

public Model FM_parse_implode(str prog)
  = FM_implode(FM_parse(prog));
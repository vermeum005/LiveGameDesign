module AST

import ParseTree;

data FeatureModel
  = model(list[Feature] features);

data Feature
  = feature(bool isRoot, ID id, Mod modifier, list[Edge] edges, list[ExtraEdge] extraEdges)
  | rule(ID id, list[ExtraEdge] extraEdges, Rule rule)
  | goal(ID id, list[ExtraEdge] extraEdges, str goal)
  ;

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
	| up()
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
  ;

data Mod
  = xor()
  | or()
  ;
  
data Edge
  = mandatory(ID target)
  | optional(ID target)
  | subfeature(ID target)
  ;

data ExtraEdge
	= excludes(ID target)
	| requires(ID target)
	;
	
data ID
  = id(str name);
  
public FeatureModel FM_implode(Tree tree)
  = implode(#FeatureModel, tree);

public FeatureModel FM_parse_implode(str prog)
  = FM_implode(FM_parse(prog));
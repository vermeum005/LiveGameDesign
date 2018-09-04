module Checker

import IO;
import AST;

map[ID, Feature] featureMap(FeatureModel m)
  = (f.id: f | Feature f <- m.features);

void resolve(FeatureModel m)
{
  map[ID, Feature] fm = featureMap(m);
  for(Feature f <- m.features)
  {
  	if(feature(bool isRoot, ID id, Mod modifier, list[Edge] edges, list[ExtraEdge] extraEdges) := f)
  	{
    	for(Edge e <- f.edges)
    	{
      		if(e.target in fm)
      		{
       	 		println("found <e.target>");
     		}
      		else
      		{
        		println("error: <e.target> not found");
      		}
    	}
    	for(ExtraEdge e <- f.extraEdges)
    	{
      		if(e.target in fm)
      		{
       			println("found <e.target>");
      		}
      		else
      		{
        		println("error: <e.target> not found");
      		}
    	}
  	}
  	else if (rule(ID id, list[ExtraEdge] extraEdges, str rules) := f)
  	{
  		println(f.rules);
  	}
   }
}
module Checker

import IO;
import AST;

map[ID, Feature] featureMap(Model m)
  = (f.id: f | Feature f <- m.features);

void resolve(Model m)
{
  map[ID, Feature] fm = featureMap(m);
  for(Feature f <- m.features)
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
}
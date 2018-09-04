module PuzzleScript::Matching

import PuzzleScript::AST;
import PuzzleScript::Syntax;
import PuzzleScript::Load;
import PuzzleScript::Parser;
import AST;
import Syntax;
import IO;
import List;

alias Matching =  list[lrel[ID,ID]];

list[ID] flatten(Rule rule)
{
  list[ID] idList = [];
  visit(rule)
  {
    case ID id: idList += id;
  }
  return idList;
}

Rule anonymize(Rule rule)
= visit(rule)
  {
    case id(str name) => id("")
  };



public bool match(Program program, Rule pattern)
{
  list[ID] roles = flatten(pattern);
  Rule thePattern = anonymize(pattern);
  Matching matching = [];
  int count = 0;
  
  for(Rule rule <- program.ruledata.rules)
  {
    if(anonymize(rule) == thePattern)
    {
      //hooray a match was found
      //list[ID] variables = flatten(rule);

      //lrel[ID,ID] ruleMatching = zip(roles, variables);
      
      //matching += [ruleMatching];
      count += 1;
    }
  }
  if (count == 0)
  	return false;
  else
  	return true;
  //return matching;
}

public void TestIT()
{
	a = PS_implode(load1());
	b = FM_implode(FM_parse());
	for (Feature r <- b.features)
	{
		if (rule(ID id, list[ExtraEdge] extraEdges, Rule rule) := r)
		{
			c = match(a,r.rule);
			if (c)
			{
				iprintln(r.id.name);
			}
		}
	}
}
public void TestITT()
{
	a = FM_implode(FM_parse());
	for (Feature r <- a.features)
	{
		if (rule(ID id, list[ExtraEdge] extraEdges, Rule rule) := r)
		{
			println(flatten(r.rule));
		}
	}
}
module Matching

import AST;
import Syntax;
import Load;
import Parser;
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



public Matching match(Program program, Rule pattern)
{
  list[ID] roles = flatten(pattern);
  Rule thePattern = anonymize(pattern);
  Matching matching = [];
    
  for(Rule rule <- program.ruledata.rules)
  {
    if(anonymize(rule) == thePattern)
    {
      //hooray a match was found
      list[ID] variables = flatten(rule);

      lrel[ID,ID] ruleMatching = zip(roles, variables);
      
      matching += [ruleMatching];
    }
  }
  return matching;
}

public void TestIT()
{
	a = PS_implode(load1());
	b = PS_implode(load2());
	for (Rule r <- b.ruledata.rules)
	{
		c = match(a,r);
		iprintln(c);
	}
}
public void TestITT()
{
	a = PS_implode(load2());
	for (Rule r <- a.ruledata.rules)
	{
		println(flatten(r));
	}
}
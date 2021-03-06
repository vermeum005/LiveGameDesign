module PuzzleScript::Serialize

import IO;
import List;
import PuzzleScript::AST;
import util::Math;
import String;

public void safeTo(Program program)
{
	writeFile(|project://salix/src/PuzzleScript/Test/Test3.PS|, toString(program));
}
public str toString(program(CreatorData creatordata, Objects objects, Legend legend, Sound sound, Layers layers, RuleData ruledata, WinCondition wincondition, Levels levels)) 
 = "<toString(creatordata)>\nOBJECTS\n<toString(objects)>LEGEND \n<toString(legend)>\nSOUNDS\n\nCOLLISIONLAYERS\n<toString(layers)>\nRULES\n<toString(ruledata)>\nWINCONDITIONS\n<toString(wincondition)>\nLEVELS\n<toString(levels)>";

//CreatorData --------------------------------------------------
public str toString(creatordata(ID title, ID author, ID homepage))
 = "title <title.name> \nauthor <author.name> \nhomepage <homepage.name>\n" ;

//ObjectData --------------------------------------------------
public str toString(objects(list[ObjectData] objects))
 = "<for (l <- objects){><toString(l)><}>" ;
 
public str toString(objectdata(ID name, Colors colors, Sprite sprite))
 = "<name.name>\n<toString(colors)> \n<sprite>" ;

public str toString(colors(list[Color] colors))
 = "<for (c <- colors){><toString(c)> <}>" ;
 
//Legend -------------------------------------------------------
public str toString(legend(list[LegendData] legend))
 = "<for (l <- legend){><toString(l)>\n<}>" ;

str toString(objectcluster(ID clustername, list[ID] objectnames))
{
  str result = "<clustername.name> = ";
  int i = 0;
  for (l <- objectnames)
  {
    i+=1;
    result += "<l.name>";
    if(i < size(objectnames))
    {
      result += " or ";
    }
  }
  return result;
}

str toString(legendobject(Sym symbol, list[ID] objectnames))
 {
  str result = "<symbol> = ";
  int i = 0;
  for (l <- objectnames)
  {
    i+=1;
    result += "<l.name>";
    if(i < size(objectnames))
    {
      result += " and ";
    }
  }
  return result;
}
 
//Layers -------------------------------------------------------

str toString(layers(list[LayerData] layers))
 = "<for (l <- layers){><toString(l)>\n<}>" ;
 
str toString(layerdata(list[ID] names))
 {
  str result = "";
  int i = 0;
  for (l <- names)
  {
    i+=1;
    result += "<l.name>";
    if(i < size(names))
    {
      result += ", ";
    }
  }
  return result;
}

//Rules -------------------------------------------------------
public str toString(ruledata(list[Rule] rules))
 = "<for (r <- rules){><toString(r)>\n<}>" ;

public str toString(rule(When when, list[RulePart] condition, list[RulePart] result))
{
  str teststuff = "<toString(when)>";
  int i = 0;
  int b = 0;
  teststuff += "[ ";
  for (l <- condition)
  {
    i+=1;
    teststuff += toString(l);
    if(i < size(condition))
    {
      teststuff += " ][ ";
    }
  }
  teststuff += "] -\>";
  teststuff += "[ ";
  for (r <- result)
  {
    b+=1;
    teststuff += toString(r);
    if(b < size(result))
    {
      teststuff += " ][ ";
    }
  }
  teststuff += "]";
  return teststuff;
}
str toString(rulepart(list[Segment] states))
{
	str teststuff = "";
	int a = 0;
	for (s <- states)
    {
    	a += 1;
    	teststuff += toString(s);
    	if(a < size(states))
    	{
      		teststuff += " | ";
    	}
    }
    return teststuff;
}
 //= "<toString(when)>[ <for (c <- condition){><toString(c)> |<}>] -\> [<for (r <- result){><toString(r)>|<}>]" ;

str toString(remove())
 = "" ;
str toString(cell(list[Fill] fill))
 = "<for (f <- fill){><toString(f)><}>" ;
str toString(fill(Mod m, ID id))
 = "<toString(m)> <id.name>" ;
str toString(just())
 = "" ;
str toString(away())
 = " \< " ;
str toString(towords())
 = " \> " ;
str toString(upM())
 = " ^ " ;
str toString(downM())
 = " v " ;
str toString(until())
 = "..." ;
 
str toString(uncond())
 = "" ;
str toString(late())
 = "late" ; 
str toString(hor())
 = "horizontal" ; 
str toString(vert())
 = "vertical" ; 
str toString(down())
 = "down";
str toString(up())
 = "up";
str toString(lateDown())
 = "late down";
//Wincondition -------------------------------------------------
public str toString(wincondition(str prefix, list[ID] objects))
{
str result = "<prefix> ";
  int i = 0;
  for (l <- objects)
  {
    i+=1;
    result += "<l.name>";
    if(i < size(objects))
    {
      result += " on ";
    }
  }
  result += "\n";
  return result;
}
 //= "<prefix> <for (l <- objects){><l><}>" ;
//Levels -------------------------------------------------------
public str toString(levels(list[Level] levels))
 = "<for (l <- levels){><toString(l)><}>"; 
 
public str toString(level(str message, Sprite sprite))
 = "<message> \n <sprite>";
 
 
 // Colors-------------------
public str toString(gray())
 = "gray" ;
public str toString(blue())
 = "blue" ;
public str toString(orange())
 = "orange" ;
public str toString(red())
 = "red" ;
public str toString(yellow())
 = "yellow" ;
public str toString(green())
 = "green" ;
public str toString(brown())
 = "brown" ;
public str toString(black())
 = "black" ;
 
void countList(int i)
{
	i += 1;
}
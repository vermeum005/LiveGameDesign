module PuzzleScript::Generator

import AST;
import Syntax;
import PuzzleScript::AST;
import PuzzleScript::Syntax;
import PuzzleScript::Serialize;
import PuzzleScript::Parser;
import PuzzleScript::Load;
import List;
import IO;

public void generate(list[Feature] chosenOnes, str WinCondition, str genre)
{
	Program b;
	if (genre == "TopDown")
		b = PS_implode(load2());
	else{
		b = PS_implode(loadPlatformer());}
	b.objects.objects = addObjects(b.objects.objects, genre);
	b.legend.legend = addLegend(b.legend.legend, genre);
	b.layers.layers = addLayer(b.layers.layers, genre);
	b.ruledata.rules = addRules(b.ruledata.rules, chosenOnes);
	b.wincondition = addWincondition(b.wincondition, WinCondition);
	safeTo(b);
}

list[ObjectData] addObjects(list[ObjectData] objects, str genre)
{
	Program c;
	if (genre == "TopDown")
		c = PS_implode(load1());
	else{
		c = PS_implode(loadPlatformer2());}
	for(ObjectData object <- c.objects.objects)
	{
		objects += [object];
	}
	return objects;
}

list[LegendData] addLegend(list[LegendData] legend, str genre)
{
	Program c;
	if (genre == "TopDown")
		c = PS_implode(load1());
	else{
		c = PS_implode(loadPlatformer2());}
	for (LegendData l <- c.legend.legend)
	{
		legend += [l];
	}
	return legend;
}

list[LayerData] addLayer(list[LayerData] layers, str genre)
{
	Program c;
	if (genre == "TopDown")
		c = PS_implode(load1());
	else{
		c = PS_implode(loadPlatformer2());}
	for (LayerData l <- c.layers.layers)
	{
		layers += [l];
	}
	return layers;
}

list[Rule] addRules(list[Rule] rules, list[Feature] chosenOnes)
{
	for (Feature f <- chosenOnes)
	{
		if (rule(ID id, list[ExtraEdge] extraEdges, Rule rule):=f)
			if (f.id.name != "Walking" && f.id.name != "TDWalking")
				rules += [f.rule];
			else ();
	}
	return rules;
}

WinCondition addWincondition(WinCondition wincondition, str WinCondition)
{
	str temp = "WINCONDITIONS";
	temp += "<WinCondition>";
	q = PS_imWin(PS_win(temp));
	wincondition.prefix = q.prefix;
	wincondition.objects = q.objects;
	return wincondition;
}

void addLevels()
{

}
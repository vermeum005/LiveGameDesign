module Model

import ParseTree;

data Program
  = program
  (
    Preamble preamble, Objects objects, Legend legend
  )
  ;
  //TODO add these later 
  //    Objects objects,
  //  Legend legend
  //  CollisionLayers cl,
  //  Rules rules

data Preamble
  = preamble(str title, str author, str homepage)
  ;

data Objects
  = objects(list[Object] objects)
  ;
  
data Object
  = object(ID id, Color color)
  ;
  
data Legend
  = legend(list[Mapping] mappings)
  ;
  
data Mapping
   = mapping(CHAR char, list[ID] objects)
   ;

data CHAR
  = ch(str name);
  
data ID
  = id(str name);

data Color
   = blue()
   | orange()
   | red()
   | yellow()
   | green()
   | brown()
   ;
   
public Program PS_implode(Tree tree)
  = implode(#Model::Program, tree);

public Program PS_parse_implode(str prog)
  = PS_implode(PS_parse(prog));

   
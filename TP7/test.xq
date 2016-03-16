xquery version "1.0";

import module namespace expr = "http://lille.org" at "expression.xq";
declare option saxon:output "omit-xml-declaration=yes";

declare variable $expression := "expression.xml";
declare variable $e1 := "e1.xml";
declare variable $gen := "gen.xml";


expr:eval($expression)

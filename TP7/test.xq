xquery version "1.0";

import module namespace expr ="http://lille.org" at "/home/m1/maizn/Documents/LABD/TP7/expression.xq";
declare option saxon:output "omit-xml-declaration=yes";
declare variable $exp := "expression.xml";


expr:print($exp)

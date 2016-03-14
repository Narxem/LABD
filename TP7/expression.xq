xquery version "1.0";

module namespace expr="http://lille.org";
declare default element namespace "http://www.expression.org";

declare function expr:rec_print($expr as node()) as xs:string{
  if($expr/name() eq "op") then
    concat('(',expr:rec_print($expr/*[1]), ' ', $expr/@val, ' ', expr:rec_print($expr/*[2]),')')
  else
    data($expr)
};


declare function expr:print($name as xs:string) as xs:string{
      expr:rec_print(doc($name)/expr/*)
};

xquery version "1.0";

module namespace expr="http://lille.org";
declare default element namespace "http://wwww.expression.org";

declare function expr:rec_print($expr as node()) as xs:string{
  if($expr/name() eq "op") then
    concat('(',expr:rec_print($expr/*[1]),expr:rec_print($expr/*[2]),')')
  else
    concat(data($expr), "1")
};


declare function expr:print($name as xs:string) as xs:string{
      expr:rec_print(doc($name)/expr/*)
};

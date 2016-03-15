xquery version "1.0";

module namespace expr="http://lille.org";
declare default element namespace "http://www.expression.org";

declare function expr:rec_print($expr as node()) as xs:string{
	if($expr/name() = "op") then
		concat('(',expr:rec_print($expr/*[1]), ' ', $expr/@val, ' ', expr:rec_print($expr/*[2]),')')
	else
		data($expr)
};


declare function expr:print($name as xs:string) as xs:string{
	expr:rec_print(doc($name)/expr/*)
};

declare function expr:rec_eval($expr as node()) as xs:integer {
	if ($expr/name() = "op") then
		if ($expr/@val = "+") then
			expr:rec_eval($expr/*[1]) + expr:rec_eval($expr/*[2]) 
		else if ($expr/@val = "-") then
			expr:rec_eval($expr/*[1]) - expr:rec_eval($expr/*[2]) 
		else if ($expr/@val = "*") then
			expr:rec_eval($expr/*[1]) * expr:rec_eval($expr/*[2]) 
		else if ($expr/@val = "/") then
			expr:rec_eval($expr/*[1]) idiv expr:rec_eval($expr/*[2])
		else
			fn:error()
	else if ($expr/name() = "const") then
		$expr/text()
	else
		fn:error()
};


declare function expr:eval($name as xs:string) as xs:integer {
	expr:rec_eval(doc($name)/expr/*)
};
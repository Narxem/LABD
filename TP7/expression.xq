xquery version "1.0";

module namespace expr="http://lille.org";
declare default element namespace "http://www.expression.org";


(: ######################## PRINT FUNCTION ######################## :)
declare function expr:rec_print($expr as node()) as xs:string{
	if($expr/name() = "op") then
		concat('(',expr:rec_print($expr/*[1]), ' ', $expr/@val, ' ', expr:rec_print($expr/*[2]),')')
	else
		data($expr)
};

declare function expr:print($name as xs:string) as xs:string{
	expr:rec_print(doc($name)/expr/*)
};



(: ######################### EVAL FUNCTION ######################### :)
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
	else if ($expr/name() = "cons") then
		$expr/text()
	else
		fn:error()
};

declare function expr:eval($name as xs:string) as xs:integer {
	expr:rec_eval(doc($name)/expr/*)
};

(: ######################## EVALVAR FUNCTION ######################## :)
declare function expr:rec_eval-var($expr as node(), $var as node()) as xs:integer {
	if ($expr/name() = "op") then
		if ($expr/@val = "+") then
			expr:rec_eval-var($expr/*[1], $var) + expr:rec_eval-var($expr/*[2], $var) 
		else if ($expr/@val = "-") then
			expr:rec_eval-var($expr/*[1], $var) - expr:rec_eval-var($expr/*[2], $var) 
		else if ($expr/@val = "*") then
			expr:rec_eval-var($expr/*[1], $var) * expr:rec_eval-var($expr/*[2], $var) 
		else if ($expr/@val = "/") then
			expr:rec_eval-var($expr/*[1], $var) idiv expr:rec_eval-var($expr/*[2], $var)
		else
			fn:error()
	else if ($expr/name() = "cons") then
		$expr/text()
	else if ($expr/name() = "var") then
		if (fn:count($var/*[name() = $expr/text()]) = 1) then
			$var/*[name() = $expr/text()]/text()
		else
			fn:error()

	else
		fn:error()
};

declare function expr:eval-var($name as xs:string, $variables as xs:string) as xs:integer {
	expr:rec_eval-var(doc($name)/expr/*, doc($variables)/*)
};

(: ########################### SIMPLIFY FUNCTION ########################### :)
declare function expr:rec_simplify($expr as node(), $var as node()) as element() {
	if ($expr/name() = "op") then
		if ($expr/@val = "+") then
			<op val='+'>{expr:rec_simplify($expr/*[1], $var)} {expr:rec_simplify($expr/*[2], $var)}</op>
		else if ($expr/@val = "-") then
			<op val='-'>{expr:rec_simplify($expr/*[1], $var)} {expr:rec_simplify($expr/*[2], $var)}</op>
		else if ($expr/@val = "*") then
			<op val='*'>{expr:rec_simplify($expr/*[1], $var)} {expr:rec_simplify($expr/*[2], $var)}</op>
		else if ($expr/@val = "/") then
			<op val='/'>{expr:rec_simplify($expr/*[1], $var)} {expr:rec_simplify($expr/*[2], $var)}</op>
		else
			fn:error()
	else if ($expr/name() = "cons") then
		<cons>{$expr/text()}</cons>
	else if ($expr/name() = "var") then
		if (fn:count($var/*[name() = $expr/text()]) = 1) then
			<cons>{$var/*[name() = $expr/text()]/text()}</cons>
		else if (fn:count($var/*[name() = $expr/text()]) > 1) then
			fn:error()
		else
			<var>{$expr/text()}</var>
	else
		fn:error()
};

declare function expr:simplify($name as xs:string, $variables as xs:string) as element() {
	expr:rec_simplify(doc($name)/expr/*, doc($variables)/*)
};
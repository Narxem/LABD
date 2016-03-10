xquery version "1.0";

declare option saxon:output "omit-xml-declaration=yes";
declare variable $catalog := "plant_catalog.xml";
declare variable $order := "plant_order.xml";

<PLANTS>
{
let $final :=
for $plant in doc($order)//PLANT
	let $plant_priced:= 
	for $plant_cat in doc($catalog)//PLANT
		where some $COMMON in $plant_cat/COMMON
		satisfies $COMMON = $plant/COMMON
		return 
			xs:double(replace($plant_cat/PRICE,"\$","")) * $plant/QUANTITY
	return
		sum($plant_priced)
return 
	<PRICE>
		{sum($final)	}
	</PRICE>
}
</PLANTS>

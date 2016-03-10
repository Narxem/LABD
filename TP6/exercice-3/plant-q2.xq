xquery version "1.0";

declare option saxon:output "omit-xml-declaration=yes";
declare variable $catalog := "plant_catalog.xml";
declare variable $families := "plant_families.xml";

<CATALOG>
{
	for $light in distinct-values(doc($catalog)//PLANT/LIGHT)
		let $plants :=
		for $plant in doc($catalog)//PLANT
			where $plant/LIGHT = $light
			return 
				<PLANT>
					{$plant/*[not(name()='LIGHT')]}
				</PLANT>
		return 
		<LIGHT>
			<EXPOSURE>
			{$light}
			</EXPOSURE>
			{$plants}
		</LIGHT>
}

</CATALOG>
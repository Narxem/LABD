xquery version "1.0";

declare option saxon:output "omit-xml-declaration=yes";
declare variable $catalog := "plant_catalog.xml";
declare variable $families := "plant_families.xml";

<PLANTS>
{
for $plant in doc($catalog)//PLANT
	let $plant_family := 
	for $family in doc($families)//FAMILY
		where some $SPECIES in $family/SPECIES
		satisfies $SPECIES = $plant/BOTANICAL
		return 
			$family
	return
		<PLANT>
		{$plant/*}
			<FAMILY>{$plant_family/NAME/text()}</FAMILY>
		</PLANT>


}
</PLANTS>
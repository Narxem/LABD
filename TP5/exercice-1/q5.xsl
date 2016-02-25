<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		>
		<xsl:output method="html" indent="yes" encoding="UTF-8"
				omit-xml-declaration="no"/>

		<xsl:template match="/">    
			<clubs xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:apply-templates select="//clubs/club"></xsl:apply-templates>
			</clubs>
		</xsl:template>
		
		<xsl:template match="club">
			<xsl:copy-of select="nom"/>
			<xsl:copy-of select="ville"/>
			<xsl:variable name="club_id"></xsl:variable>
			
			<rencontres>
				<domicile>
					<xsl:copy-of select="//rencontres/rencontre[receveur/text() = $club_id]"/>
				</domicile>

				<exterieur>
					<xsl:copy-of select="//rencontres/descendant::rencontre[invite/text() = $club_id]"/>
				</exterieur>				
			</rencontres>
		</xsl:template>
		
		

</xsl:stylesheet>

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
			<xsl:variable name="club_id" select="./@id"></xsl:variable>
			
			<rencontres>
				<domicile>
					<xsl:for-each select="//rencontre[receveur/text() = $club_id]">
					<xsl:variable name="id_inv" select="./invite/text()"></xsl:variable>
					<xsl:variable name="score_inv" select="./score"></xsl:variable>
						
						
							<xsl:copy>
								<xsl:copy-of select="./parent/journee/@num"/> 
								<club><xsl:value-of select="//club[contains(@id,$id_inv)]/nom"/></club>
								<xsl:copy-of select="$score_inv"/>		
							 </xsl:copy> 

					</xsl:for-each>
					
				</domicile>

				<exterieur>
					<xsl:for-each select="//rencontre[invite/text() = $club_id]">
					<xsl:variable name="id_inv" select="./receveur/text()"></xsl:variable>
					<xsl:variable name="score_inv" select="./score"></xsl:variable>
						<club><xsl:value-of select="//club[contains(@id,$id_inv)]/nom"/></club>
						<xsl:copy-of select="$score_inv"/>
					</xsl:for-each>
				</exterieur>				
			</rencontres>
		</xsl:template>
		
		

</xsl:stylesheet>

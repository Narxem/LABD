<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>
		<xsl:output method="html" indent="yes" encoding="UTF-8"
				omit-xml-declaration="no"/>

		<xsl:template match="/">    
			<xsl:apply-templates select="//journees">
				<xsl:with-param name="n" select="18"></xsl:with-param>
			</xsl:apply-templates>
		</xsl:template>
		
		<xsl:template match="journees">
			<xsl:param name="n"></xsl:param>
			<xsl:copy-of select="journee[@num = $n]"/>
		</xsl:template>
		
		

</xsl:stylesheet>

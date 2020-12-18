<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="ISO-8859-1" doctype-public="-//W3C//DTD SVG 1.0//EN" standalone="yes" version="1.0" indent="yes" method="xml" />

<xsl:template match="/">

	<svg height="250px" xmlns="http://www.w3.org/2000/svg">
		<title>Evolution mois mois</title>
		<xsl:for-each select="//mois">
			<xsl:element name="rect">
				<xsl:attribute name="width">1cm</xsl:attribute>
				<xsl:attribute name="height"><xsl:value-of select="."/></xsl:attribute>
				<xsl:attribute name="x"><xsl:value-of select="@numero*50+50"/></xsl:attribute>
				<xsl:attribute name="y"><xsl:value-of select="150-."/></xsl:attribute>
				<xsl:attribute name="fill">lime</xsl:attribute>
			</xsl:element>
		</xsl:for-each>
	</svg>

</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

<xsl:template match="/">
	<html lang="fr">
		<head>
			<title>Exercice 9</title>
		</head>
		<body>
		<xsl:for-each select="systeme_solaire/planete">
			<xsl:sort select="masse" data-type="number"/>
			<xsl:if test="not(nom='Terre')">
			<h2><xsl:value-of select="nom"/> :</h2>
			<ul>
				<li>Distance au soleil: <xsl:value-of select="distance"/> <xsl:value-of select="distance/@unit"/></li>
				<li>Masse: <xsl:value-of select="masse"/> <xsl:value-of select="masse/@unit"/></li>
				<li>Diamètre: <xsl:value-of select="diametre"/> <xsl:value-of select="diametre/@unit"/></li>
				<xsl:if test="satellite"><li>Nombre de satellites: <xsl:value-of select="satellite"/></li></xsl:if>
			</ul>
			</xsl:if>
		</xsl:for-each>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
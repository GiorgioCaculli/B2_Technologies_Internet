<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>

<xsl:template match="/">
	<html>
		<head><title>Document SVG inséré dans un document HTML</title></head>
	</html>
	<body>
		<h1>Résultats mois par mois</h1>	
		<h2>Version texte</h2>
		<ul>
			<xsl:for-each select="//mois"><li>Mois&#160;:&#160;<strong><xsl:value-of select="@nom"/></strong>&#160;-&#160;<xsl:value-of select="."/></li></xsl:for-each>
		</ul>
		<h2>Version graphique</h2>
		<iframe scroll="yes" src="exo12_5.svg" height="540" width="98%" frameborder="0">Vous avez besoin d'un plug-in SVG !</iframe>
	</body>
</xsl:template>

</xsl:stylesheet>

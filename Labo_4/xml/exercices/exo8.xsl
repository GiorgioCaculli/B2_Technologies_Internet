<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="//titre"/></title>
		</head>
		<body>
			<h1><xsl:value-of select="//titre"/></h1>
			<p><b>Auteur:</b> <xsl:value-of select="//auteur"/></p>
			<p><b>Remarque:</b> <xsl:value-of select="//remarque"/></p>
			
			<h2>Procédure</h2>
				<h3>Ingrédients:</h3>
					<ul>
					<xsl:for-each select="//item"><!--<xsl:sort select="." data-type="text" lang="fr" order="ascending"/>--><li><xsl:value-of select="."/></li></xsl:for-each>
					</ul>
				<h3>Opérations:</h3>
					<ol>
					<xsl:for-each select="//texte"><li><xsl:value-of select="."/></li></xsl:for-each>
					</ol>
			<!--<p><xsl:value-of select="//procedure"/></p>-->
		</body>
	</html>
</xsl:template>


</xsl:stylesheet>
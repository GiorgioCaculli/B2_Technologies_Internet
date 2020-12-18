<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--<xsl:output method="html" version="html 4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>-->

<xsl:template match="/">
	<html>
	<head>
		<title>Exemple de sortie HTML</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	</head>
	<body>
		<h1>Bouteille de marque <xsl:value-of select="bouteille/marque"/></h1>
		
		<h2>Composition:</h2>
			<!--<p><xsl:value-of select="bouteille/composition"/></p>-->
			<h3>Liste des ions positifs:</h3>
			<xsl:for-each select="bouteille/composition/ion_positif">
				<xsl:value-of select="."/><br/>
			</xsl:for-each>
			<h3>Liste des ions négatifs:</h3>
			<xsl:for-each select="bouteille/composition/ion_negatif">
				<xsl:value-of select="."/><br/>
			</xsl:for-each>
			<h3>Liste des autres matériaux:</h3>
			<xsl:for-each select="bouteille/composition/autres_materiaux">
				<xsl:value-of select="."/><br/>
			</xsl:for-each>
		
		<h2>Lieu d'origine:</h2>
			<p>Ville de <b><xsl:value-of select="bouteille/source/ville"/></b>, dans le département
			<b><xsl:value-of select="bouteille/source/departement"/></b>.</p>
	
		<h2>Autres informations:</h2>
			<ul>
				<li>Contenance: <xsl:value-of select="bouteille/contenance"/></li>
				<li>pH: <xsl:value-of select="bouteille/ph"/></li>
			</ul>
	
	
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>

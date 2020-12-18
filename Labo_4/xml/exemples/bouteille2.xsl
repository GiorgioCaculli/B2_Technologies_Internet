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
		<h1>Bouteille de marque <xsl:value-of select="marque"/></h1>
		
	<xsl:value-of select="."/>
	
	
	
	
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>

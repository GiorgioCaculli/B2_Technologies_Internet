<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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
			<p><xsl:value-of select="//procedure"/></p>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<xsl:template match="/">
	<html>
		<head>
			<title>Collection de nuages</title>
		</head>
		<body>
			<h1>Les nuages</h1>
			<xsl:for-each select="nuages/nuage">
				<h2><xsl:number format="1" level="single"/>. <xsl:variable name="name" select="nom/text()"/><xsl:value-of select="translate($name,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></h2>
				<p>Ce type de nuage possède les espèces suivantes&#160;:</p>
				<ul>
					<xsl:for-each select="nom/espece"><li><xsl:value-of select="."/></li></xsl:for-each>	
				</ul>
				
			</xsl:for-each>
		</body>
	</html>
</xsl:template>



</xsl:stylesheet>

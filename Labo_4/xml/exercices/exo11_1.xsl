<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
	<html>
		<head>
			<title>Collection de nuages</title>
			<script type="text/javascript"><![CDATA[
				var XMLsource = new Object;
				var XSLsource = new Object;
				XMLsource = document.XMLDocument;
				XSLsource = document.XSLDocument;
				
                                            function changecouleur()
					{
						balisefont=XSLsource.documentElement.selectNodes("//font");
						couleur=balisefont[0].getAttribute('color');
						
						if (couleur=='red')
							{(XSLsource.selectNodes("//font"))[0].setAttribute('color', 'blue');}
						if (couleur=='blue')
							{(XSLsource.selectNodes("//font"))[0].setAttribute('color', 'red');}
						
						document.body.innerHTML = XMLsource.transformNode(XSLsource);
					}
			]]></script>
		</head>
		<body onClick="changecouleur()">
			<h1>Les nuages</h1>
			<xsl:for-each select="nuages/nuage">
				<h2><xsl:value-of select="nom/text()"/></h2>
				<p>Ce type de nuage possède les <font color="red">espèces</font> suivantes&#160;:</p>
				<ul>
					<xsl:for-each select="nom/espece"><li><xsl:value-of select="."/></li></xsl:for-each>	
				</ul>
				
			</xsl:for-each>
		</body>
	</html>
</xsl:template>



</xsl:stylesheet>

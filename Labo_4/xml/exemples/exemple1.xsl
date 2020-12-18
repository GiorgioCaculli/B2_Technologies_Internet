<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
<xsl:template match="/">
	<html>
		<head>
			<title>Collection de nuages</title>
			<script type="text/javascript"><![CDATA[
				var XMLsource = new Object;
				var XSLsource = new Object;
				XMLsource = document.XMLDocument;
				XSLsource = document.XSLDocument;
				
                                            function changeordre()
					{
						XSLsort=XSLsource.documentElement.selectNodes("//xsl:sort");
						ordre_de_classement=XSLsort[0].getAttribute('order');
						
						if (ordre_de_classement=='ascending')
							{(XSLsource.selectNodes("//xsl:sort"))[0].setAttribute('order', 'descending');}
						if (ordre_de_classement=='descending')
							{(XSLsource.selectNodes("//xsl:sort"))[0].setAttribute('order', 'ascending');}
						
						document.body.innerHTML = XMLsource.transformNode(XSLsource);
					}
					
			]]></script>
		</head>
		<body onClick="changeordre()">
			<h1>Les nuages</h1>
			<xsl:for-each select="nuages/nuage">
				<h2><xsl:value-of select="nom/text()"/></h2>
				<p>Ce type de nuage possède les espèces suivantes&#160;:</p>
				<ul>
					<xsl:for-each select="nom/espece"><xsl:sort select="." order="ascending"/><li><xsl:value-of select="."/></li></xsl:for-each>	
				</ul>
			</xsl:for-each>
		</body>
	</html>
</xsl:template>



</xsl:stylesheet>

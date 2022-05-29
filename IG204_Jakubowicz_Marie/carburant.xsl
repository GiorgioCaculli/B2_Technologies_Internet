<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:param name="dep">03</xsl:param>
  <xsl:param name="vi">Vichy</xsl:param>
  <xsl:template match="root">
    <html>
      <link rel="stylesheet" type="text/css" href="affichage.css" />
      <head>
        <title>Examen</title>
      </head>
      <body>
        <table>
          <xsl:for-each select="pompe">
            <xsl:for-each select="./localisation[departement = $dep]">
              <xsl:for-each select="ville[@nom = $vi]">
                <tr><th> marque :</th>
                <th> departement :</th>
                <th> ville :</th>
                <th> details :</th></tr>
                <tr><td><xsl:value-of select="./marque"/></td>
                <td><xsl:value-of select="$dep"/></td>
                <td><xsl:value-of select="$vi"/></td>
                <td><a href ="https://www.google.be/maps/place/" target="lien"><xsl:value-of select="detail"/></a></td>
                </tr>
		      </xsl:for-each>
		    </xsl:for-each>
	      </xsl:for-each>	
	    </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

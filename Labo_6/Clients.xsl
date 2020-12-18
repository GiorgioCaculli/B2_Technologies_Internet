<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="pays">Allemagne</xsl:param>
    <xsl:param name="ville">Berlin</xsl:param>
    <xsl:variable name="uppercase" select="ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞŸŽŠŒ"/>
    <xsl:variable name="lowercase" select="abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿžšœ"/>
    <xsl:template match="dataroot">
        <html>
            <head>
                <title>Clients</title>
                <link rel="stylesheet" type="text/css" href="Clients.css"/>
            </head>
            <body>
                <h2>Pays: <xsl:value-of select='$pays'/> - Ville: <xsl:value-of select="$ville"/></h2>
                <table>
                    <tr>
                        <th>Pays</th>
                        <th>Code Postal</th>
                        <th>Ville</th>
                        <th>Société</th>
                        <th>Téléphone</th>
                        <th>Drapeau</th>
                    </tr>
                    <xsl:for-each select="Clients[Pays=$pays]">
                        <xsl:if test="Ville=$ville">
                            <tr>
                                <td><xsl:value-of select="Pays"/></td>
                                <td><xsl:value-of select="Code_x0020_postal"/></td>
                                <td><xsl:element name="a"><xsl:attribute name="href">https://www.openstreetmap.org/search?query=<xsl:value-of select="Ville"/></xsl:attribute><xsl:value-of select="Ville"/></xsl:element></td>
                                <td><xsl:value-of select="Société"/></td>
                                <td><xsl:value-of select="Téléphone"/></td>
                                <td><xsl:element name="img"><xsl:attribute name="src">drapeau/drap_<xsl:value-of select="translate(Pays, $uppercase, $lowercase)"/>.gif</xsl:attribute></xsl:element></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="ville">Paris</xsl:param>
    <xsl:variable name="uppercase" select="ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞŸŽŠŒ"/>
    <xsl:variable name="lowercase" select="abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿžšœ"/>
    <xsl:template match="dataroot">
        <html>
            <head>
                <title>Clients</title>
                <link rel="stylesheet" type="text/css" href="Clients.css"/>
            </head>
            <body>
                <h2>Choisissez un pays et une ville</h2>
                <form method="POST">
                    <select name="pays">
                        <xsl:for-each select="Clients[not(Pays = preceding::Clients/Pays)]">
                            <option>
                                <xsl:value-of select="Pays"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <select name="ville">
                        <xsl:for-each select="Clients[not(Ville = preceding::Clients/Ville)]">
                            <option>
                                <xsl:value-of select="Ville"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <input type="submit" value="FILTRER"/>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

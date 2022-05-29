<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="departement">02</xsl:param>
    <xsl:param name="ville">Urcel</xsl:param>
    <xsl:template match="root">
        <html>
            <head>
                <title>Carburants</title>
                <link rel="stylesheet" type="text/css" href="carburants.css"/>
            </head>
            <body>
                <h2>Departement : <xsl:value-of select="$departement"/> -
                    Ville : <xsl:value-of select="$ville"/></h2>
                <table>
                    <tr>
                        <th>Marque</th>
                        <th>Departement</th>
                        <th>Ville</th>
                        <th>Latitude</th>
                        <th>Longitude</th>
                        <th>Lien</th>
                    </tr>
                    <xsl:for-each select="pompe">
                        <xsl:if test="contains(localisation/departement, $departement)">
                            <xsl:if test="contains(localisation/ville/@nom, $ville)">
                                <tr>
                                    <td><xsl:value-of select="marque"/></td>
                                    <td><xsl:value-of select="localisation/departement"/></td>
                                    <td><xsl:value-of select="localisation/ville/@nom"/><br /><xsl:value-of select="localisation/ville/detail"/></td>
                                    <td><xsl:value-of select="@latitude"/></td>
                                    <td><xsl:value-of select="@longitude"/></td>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                https://maps.google.com/?q=<xsl:value-of select="@latitude"/>,<xsl:value-of select="@longitude"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="target">_</xsl:attribute>
                                            https://maps.google.com/?q=<xsl:value-of select="@latitude"/>,<xsl:value-of select="@longitude"/>
                                        </xsl:element>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

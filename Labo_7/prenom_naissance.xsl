<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="annee">2015</xsl:param>
    <xsl:param name="genre">F</xsl:param>
    <xsl:param name="prenom">Laura</xsl:param>
    <xsl:param name="region">Bel</xsl:param>
    <xsl:param name="occurence_tri">Ascendant</xsl:param>
    <xsl:param name="region_tri">Occurence</xsl:param>
    <xsl:template match="Stat_prenom">
        <html>
            <head>
                <title>Prenom Naissance</title>
                <link rel="stylesheet" type="text/css" href="prenom_naissance.css"/>
            </head>
            <body>
                <h2>Annee : <xsl:value-of select="$annee"/> -
                    Genre : <xsl:value-of select="$genre"/> -
                    Prenom : <xsl:value-of select="$prenom"/> -
                    Region : <xsl:value-of select="$region"/></h2>
                <table>
                    <tr>
                        <th>Annee</th>
                        <th>Genre</th>
                        <th>Prenom</th>
                        <th>Region</th>
                        <th>Occurence</th>
                    </tr>
                    <xsl:for-each select="data">
                        <xsl:if test="contains(@annee, $annee)">
                            <xsl:for-each select="naissance">
                                <xsl:sort select="occurence[$occurence_tri='Ascendant']" data-type="number"/>
                                <xsl:sort select="occurence[$occurence_tri='Descendant']" data-type="number" order="descending"/>
                                <xsl:sort select="prenom[not($region='')]"/>
                                <xsl:sort select="occurence[$region_tri='Occurence' and not($region='')]" data-type="number"/>
                                <xsl:if test="contains(@genre, $genre)">
                                    <xsl:if test="contains(prenom, $prenom)">
                                        <xsl:for-each select="occurence">
                                            <xsl:if test="contains(@region, $region)">
                                                <tr>
                                                    <td><xsl:value-of select="../../@annee"/></td>
                                                    <td><xsl:value-of select="../@genre"/></td>
                                                    <td><xsl:value-of select="../prenom"/></td>
                                                    <td><xsl:value-of select="@region"/></td>
                                                    <td><xsl:value-of select="../occurence"/></td>
                                                </tr>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="qte">10</xsl:param>
    <xsl:template match="dataroot">
        <html>
            <head>
                <title>Produits</title>
                <link rel="stylesheet" type="text/css" href="Produits.css"/>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Référence</th>
                        <th>Nom</th>
                        <th>Num fournisseur</th>
                        <th>Code catégorie</th>
                        <th>Quantité par unité</th>
                        <th>Prix unitaire</th>
                        <th>Unités en stock</th>
                        <th>Unités commandées</th>
                        <th>Niveau de réapprov.</th>
                        <th>Indisponible</th>
                    </tr>
                    <xsl:for-each select="Produits[Unités_en_stock > $qte]">
                        <xsl:sort select="Niveau_de_réapprovisionnement" data-type="number"/>
                        <tr>
                            <td><xsl:value-of select="Réf_produit"/></td>
                            <td><xsl:value-of select="Nom_du_produit"/></td>
                            <td><xsl:value-of select="N_fournisseur"/></td>
                            <td><xsl:value-of select="Code_catégorie"/></td>
                            <td><xsl:value-of select="Quantité_par_unité"/></td>
                            <td><xsl:value-of select="Prix_unitaire"/></td>
                            <td><xsl:value-of select="Unités_en_stock"/></td>
                            <td><xsl:value-of select="Unités_commandées"/></td>
                            <td><xsl:value-of select="Niveau_de_réapprovisionnement"/></td>
                            <td><xsl:value-of select="Indisponible"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

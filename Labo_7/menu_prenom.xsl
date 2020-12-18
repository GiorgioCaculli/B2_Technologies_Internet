<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="Stat_prenom">
        <!--<html><body>on peut supprimer html et body si le but n'est pas de générer une page mais un fragment de page, ici c'est le cas car on veut créer un formulaire avec une liste "<select><option>...</option></select>" -->

        <h2>Choisissez un genre, une annee, une region et le prenom</h2>
        <form method="POST">
            <label for="genre">Genre : </label>
            <select name="genre" id="Genre">
                <option></option>
                <option>F</option>
                <option>M</option>
            </select><br />
            <label for="annee">Annee : </label>
            <select name="annee" id="annee">
                <option></option>
                <xsl:for-each select="data[not(@annee = preceding::data/@annee)]">
                    <option>
                        <xsl:value-of select="@annee"/>
                    </option>
                </xsl:for-each>
            </select><br />
            <label for="occurence_tri">Pour trier par occurence, choisir : genre et/ou annee</label><br />
            <select name="occurence_tri" id="occurence_tri">
                <option></option>
                <option>Ascendant</option>
                <option>Descendant</option>
            </select><br />
            <label for="region">Region : </label>
            <select name="region" id="region">
                <option></option>
                <xsl:for-each select="data">
                    <xsl:for-each select="naissance">
                        <xsl:for-each select="occurence[not(@region = preceding::occurence/@region)]">
                            <option>
                                <xsl:value-of select="@region"/>
                            </option>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </select><br />
            <label for="region_tri">Pour trier par prenom ou occurence, choisir : region</label><br />
            <select name="region_tri" id="region_tri">
                <option></option>
                <option>Prenom</option>
                <option>Occurence</option>
            </select><br />
            <label for="prenom">Prenom : </label>
            <input type="text" name="prenom"/><br />
            <input type="submit" value="FILTRER"/>
        </form>
    </xsl:template>
</xsl:stylesheet>
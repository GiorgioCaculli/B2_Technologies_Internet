<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="etudiants">
        <!--<html><body>on peut supprimer html et body si le but n'est pas de générer une page mais un fragment de page, ici c'est le cas car on veut créer un formulaire avec une liste "<select><option>...</option></select>" -->

        <h2>Choisissez une classe</h2>
        <form method="POST">
            <select name="classe">
                <xsl:for-each select="student[not(classe = preceding::student/classe)]">
                    <option>
                        <xsl:value-of select="classe"/>
                    </option>
                </xsl:for-each>
            </select>
            <input type="submit" value="FILTRER"/>
        </form>
    </xsl:template>
</xsl:stylesheet>
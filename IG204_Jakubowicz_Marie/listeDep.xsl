<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="root">
    <!--<html><body>on peut supprimer html et body si le but n'est pas de générer une page mais un fragment de page, ici c'est le cas car on veut créer un formulaire avec une liste "<select><option>...</option></select>" -->

    <h2>Choisissez un departement :</h2>
    <form method="POST">

      <select name="departement" id="departement">
        <xsl:for-each select="//localisation/departement[not(preceding::localisation/departement = .)]">
          <xsl:sort select="." data-type="text" order="ascending"/>
          <option>
            <xsl:value-of select="../departement"/>
          </option> 
        </xsl:for-each>
      </select>

      <input type="submit" value="FILTRER"/>
    </form>
  </xsl:template>


</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="root">
    <!--<html><body>on peut supprimer html et body si le but n'est pas de générer une page mais un fragment de page, ici c'est le cas car on veut créer un formulaire avec une liste "<select><option>...</option></select>" -->

    <h2>Choisissez une ville :</h2>
    <form method="POST">

      <select name="ville" id="ville">
        <xsl:for-each select="//localisation/ville[not(preceding::localisation/ville = .)]">
          <xsl:sort select="." data-type="text" order="ascending"/>
          <option>
            <xsl:value-of select="./ville[@nom]"/>
          </option>
        </xsl:for-each>
      </select>
      <input type="submit" value="FILTRER"/>
    </form>
  </xsl:template>


</xsl:stylesheet>

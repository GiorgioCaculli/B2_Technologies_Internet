<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name='cl'></xsl:param> <!-- pas de valeur par défaut du paramètre-->
<xsl:template match="etudiants">
<html><body><!-- on peut supprimer html, body si le but n'est pas de générer une page mais un fragment de page-->

<h2><xsl:value-of select= '$cl'/></h2>
<xsl:for-each select="student[classe=$cl]"> 
<xsl:sort select="cl" data-type="text" order="ascending"/> 
&#160; 
<xsl:value-of select="nom"/>
&#160; 
<xsl:value-of select="prenom"/>
&#160; 
<xsl:value-of select="classe"/>
&#160; 
<xsl:value-of select="groupes"/><br />

</xsl:for-each>
</body></html>
</xsl:template>


</xsl:stylesheet>
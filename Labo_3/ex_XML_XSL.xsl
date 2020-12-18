<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1"/>
  <!--cr�ation d'un gabarit sur le noeud "Bottin"-->
  <xsl:template match="Bottin">
    <!--D�s que l'on trouve le noeud"Bottin", on commence le document HTML avec <Body>-->
    <html>
      <head>
        <xsl:apply-templates select="Abonne"/>
        <title>
          <xsl:value-of select="@region"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="Abonne"/>
        <!--imbrication des gabarits correspondant � "Abonne"-->
      </body>
    </html>
  </xsl:template>
  <!--cr�ation d'un gabarit sur le noeud Abonne-->
  <xsl:template match="Abonne">
    <!--Dans ce qui suit &#160; �quivaut � l'espace et &#47; �quivaut � / -->
    <h1 align="center">
      <xsl:value-of select="@id"/>&#160;<xsl:value-of select="Nom"/>&#160;<xsl:value-of select="Prenom"/>
      <!--@ permet d acc�der aux attributs du n ud courant--><!--<xsl:value-ofselect="Nom"/> permet d'acc�der � la valeur de l'enfant not� "enfant" du noeud courant "Abonne"-->
      <!--il s'agit d'expressions XPath qui est un langage qui permet de d�finir des chemins de localisation  http://fr.wikipedia.org/wiki/XPath-->
    </h1>
    <p align="center">
      <font size="5" color="red">TELEPHONE:<xsl:value-of select="Prefixe"/>&#47;<xsl:value-of select="Tel"/>
      </font>
    </p>
    <h3 align="center">
      <xsl:apply-templates select="Adresse"/>
      <!--imbrication des gabarits correspondant � "Adresse"-->
      <xsl:value-of select="CodePostal"/>&#160;<xsl:value-of select="Ville"/>
    </h3>
    <HR/>
    <!--trace une ligne entre chaque abonne-->
  </xsl:template>
  <!--cr�ation d'un gabarit sur le noeud Adresse-->
  <xsl:template match="Adresse">
    <h3 align="center">
      <xsl:value-of select="@designation"/>&#160;<xsl:value-of select="@nom"/>&#160;N�&#160;<xsl:value-of select="@numero"/>
    </h3>
  </xsl:template>
</xsl:stylesheet>

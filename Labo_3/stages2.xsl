<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <!--création d'un gabarit sur le noeud "Bottin"-->
  <xsl:template match="Stage">
    <!--Dès que l'on trouve le noeud "Bottin", on commence le document HTML avec <Body>-->
    <html>
      <head>
        <!--<xsl:apply-templates select="Student"/>-->
        <title>Stages</title>
      </head>
      <body>
        <xsl:apply-templates select="Student"/>
        <!--imbrication des gabarits correspondant à "Abonne"-->
      </body>
    </html>
  </xsl:template>
  <!--création d'un gabarit sur le noeud Abonne-->
  <xsl:template match="Student">
    <!--Dans ce qui suit &#160; équivaut à l'espace et &#47; équivaut à / -->
    <h1>
      <xsl:value-of select="@nom"/>&#160;<xsl:value-of select="@prenom"/>
      <!--@ permet d’accéder aux attributs du nœud courant--><!--<xsl:value-ofselect="Nom"/> permet d'accéder à la valeur de l'enfant noté "enfant" du noeud courant "Abonne"-->
      <!--il s'agit d'expressions XPath qui est un langage qui permet de définir des chemins de localisation  http://fr.wikipedia.org/wiki/XPath-->
    </h1>
    <p>
      <font size="5" color="teal">
        Section: <xsl:value-of select="@section"/><br />
        Classe: <xsl:value-of select="@classe"/>
      </font>
    </p>
    <h3>
      <xsl:apply-templates select="Entreprise"/>
    </h3>
    <HR/>
  </xsl:template>
  <!--création d'un gabarit sur le noeud Adresse-->
  <xsl:template match="Entreprise">
    <h3>
      <xsl:value-of select="@nom"/> <xsl:value-of select="@object_social"/><br />
      Tel: <xsl:value-of select="@tel"/><br />
      Adresse: <xsl:value-of select="@adresse"/><br />
      Responsable service: <xsl:value-of select="@responsable_service"/><br />
      Responsable stagiaire: <xsl:value-of select="@responsable_stagiaire"/><br />
    </h3>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <!--création d'un gabarit sur le noeud "Bottin"-->
  <xsl:template match="Stage">
    <!--Dès que l'on trouve le noeud "Bottin", on commence le document HTML avec <Body>-->
    <html>
      <head>
        <style>
          table, th, td {
          border: 1px solid black;
          border-collapse: collapse;
          }
          td {
          width: 50%;
          }
        </style>
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
    <table width="100%" style="boder: 1px solid black; border-collapse: collapse;">
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Nom et prenom de l'etudiant</b></td>
        <td><xsl:value-of select="@nom"/>&#160;<xsl:value-of select="@prenom"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Section</b></td>
        <td><xsl:value-of select="@section"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Classe</b></td>
        <td><xsl:value-of select="@classe"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><center><b>Renseignements concernant l'entreprise</b></center></td>
      </tr>
      <xsl:apply-templates select="Entreprise"/>
    </table>
    <br />
    <hr />
    <br />
  </xsl:template>
  <!--création d'un gabarit sur le noeud Adresse-->
  <xsl:template match="Entreprise">
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Denomination de l'entreprise</b></td>
        <td><xsl:value-of select="@nom"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Adresse de l'entreprise</b></td>
        <td><xsl:value-of select="@adresse"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Object social</b></td>
        <td><xsl:value-of select="@objet_social"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Nom du directeur ou responsable de service</b></td>
        <td><xsl:value-of select="@responsable_service"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Nom et fonction du responsable du stagiaire</b></td>
        <td><xsl:value-of select="@responsable_stagiaire"/></td>
      </tr>
      <tr style="boder: 1px solid black; border-collapse: collapse;">
        <td><b>Numero de telephone</b></td>
        <td><xsl:value-of select="@tel"/></td>
      </tr>
    <!--<h3>
      <xsl:value-of select="@nom"/> <xsl:value-of select="@object_social"/><br />
      Tel: <xsl:value-of select="@tel"/><br />
      Adresse: <xsl:value-of select="@adresse"/><br />
      Responsable service: <xsl:value-of select="@responsable_service"/><br />
      Responsable stagiaire: <xsl:value-of select="@responsable_stagiaire"/><br />
    </h3>-->
  </xsl:template>
</xsl:stylesheet>

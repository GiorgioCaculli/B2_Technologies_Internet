<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:fx="#fx-functions" exclude-result-prefixes="msxsl fx">
	<xsl:output method="html" version="4.0" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>

	<!-- creation d'une cle sur un noeud particulier -->
	<xsl:key name="key_nom_auteur" match="library/book/author" use="name"/>
	<xsl:key name="key_characters" match="character" use="name"/>
	<xsl:template match="library" >

		<html>
			<head>
				<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8"/>
				<title>Library</title>
				<style type="text/css"></style>
			</head>
			<body link="#0c0000" vlink="#050000">

				Informations extraites de Library.xml:
				<br/><br/>

				<!--<xsl:value-of select="author/name"[not (preceding::author/name = author/name )]/-->
				Le nom des auteurs sans doublons: <br/>
				<xsl:for-each select="./book/author[generate-id()=generate-id(key('key_nom_auteur', name)[1])]">
					<xsl:sort select="./name" order="ascending" />

					nom et date de naissance de l'auteur:
					<xsl:value-of select="./name"/> &#160;
					<xsl:value-of select="./born"/>
					Titre:<xsl:value-of select='./parent::*/title'/> <!--exemple de remontee au parent-->
					<br/>
				</xsl:for-each>

				<br/>
				<hr/>
				Le nom des characters
				<br/>
				<xsl:for-each select="./book/character[generate-id() = generate-id(key('key_characters', name)[1])]" >
					nom character:
					<xsl:value-of select="."/>
					<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
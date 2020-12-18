<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="ISO-8859-1"/>
    <xsl:template match="movies">
        <html>
            <head>
                <title>Ciné</title>
            </head>
            <body>
                <h3>Question 1: tous les éléments titre grâce à un gabarit</h3>
                <xsl:apply-templates select="movie"/>
                <hr/>
                <h3>Question 2: titre des films sortis après 2000</h3>
                <xsl:apply-templates select="movie[year>2000]"/>
                <hr/>
                <h3>Question 3: le résumé de American Beauty</h3>
                <xsl:for-each select="movie">
                    <xsl:if test="title='American Beauty'">
                        <xsl:value-of select="summary"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 4: qui est le metteur en scène de Gladiator?</h3>
                <xsl:for-each select="movie">
                    <xsl:if test="title='Gladiator'">
                        <xsl:value-of select="director"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 5: titres avec des films d'Harrison Ford</h3>
                <xsl:for-each select="movie">
                    <xsl:if test="actor[last_name='Ford']">
                        <xsl:if test="actor[first_name='Harrison']">
                            <xsl:value-of select="title"/><br/>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 6: quels films ont un résumé?</h3>
                <xsl:for-each select="movie[summary!='']">
                    <xsl:value-of select="title"/><br/>
                </xsl:for-each>
                <hr/>
                <h3>Question 7: quels films n'ont pas de résumé?</h3>
                <xsl:for-each select="movie[not(summary!='')]">
                    <xsl:value-of select="title"/><br/>
                </xsl:for-each>
                <hr/>
                <h3>Question 8: quel rôle tient Clint Eastwood dans Impitoyable?</h3>
                <xsl:for-each select="movie[title='Impitoyable']">
                    <xsl:if test="actor[last_name='Eastwood']">
                        <xsl:if test="actor[first_name='Clint']">
                            <xsl:value-of select="actor/role"/><br/>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 9: quel est le dernier film du document?</h3>
                <xsl:value-of select="movie[last()]/title"/><br/>
                <hr/>
                <h3>Question 10: films dont le titre contient un 'G'</h3>
                <xsl:for-each select="movie">
                    <xsl:if test="contains(title, 'G')">
                        <xsl:value-of select="title"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 11: films dont la distribution consiste en exactement 3 acteurs</h3>
                <xsl:for-each select="movie">
                    <xsl:if test="count(actor)=3">
                        <xsl:value-of select="title"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <hr/>
                <h3>Question 12: tous les acteurs sans doublon</h3>
                <xsl:for-each select="movie/actor[not(@id = preceding::actor/@id)]">
                    <xsl:value-of select="first_name"/>&#160;
                    <xsl:value-of select="last_name"/><br/>
                </xsl:for-each>
                <!--<h3>Titre des films de Hitchcock</h3>
                <xsl:apply-templates select="movie[director/last_name='Hitchcock']"/>

                <h3>Question 1 avec for-each</h3>
                <xsl:for-each select="movie">
                    <xsl:value-of select="title"/><br/>
                </xsl:for-each>
                <hr/>

                <h3>Question 2 avec for-each et prédicat</h3>
                <xsl:for-each select="./movie[year>2000]">
                    <xsl:value-of select="title"/><br/>
                </xsl:for-each>
                <hr/>

                <h3>Question 2 avec for-each et xsl-if</h3>
                <xsl:for-each select="./movie">
                    <xsl:sort select="year" data-type="number" order="descending"/>
                    <xsl:if test="year>2000">
                        <xsl:value-of select="title"/>:<xsl:value-of select="year"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <hr/>-->

            </body>
        </html>
        <!-- question 1 avec gabarit-->
    </xsl:template>

    <xsl:template match="movie">
        <xsl:value-of select="title/text()"/><br/>
    </xsl:template>





</xsl:stylesheet>
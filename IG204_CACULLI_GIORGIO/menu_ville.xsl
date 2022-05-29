<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:param name="departement"></xsl:param>
    <xsl:template match="root">
        <form method="POST">
            <label for="ville">Ville : </label>
            <select name="ville" id="ville" onchange="this.form.submit()">
                <option></option>
                <xsl:for-each select="pompe">
                    <xsl:if test="localisation/departement = $departement">
                        <xsl:if test="localisation[not(ville/@nom = preceding::localisation/ville/@nom)]">
                            <option>
                                <xsl:value-of select="localisation/ville/@nom"/>
                            </option>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </select><br />
        </form>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="root">
        <html>
            <head>
                <title>Carburants</title>
            </head>
            <body>
                <form method="POST">
                    <label for="departement">Departement : </label>
                    <select name="departement" id="departement" onchange="this.form.submit()">
                        <option></option>
                        <xsl:for-each select="pompe">
                            <xsl:if test="localisation[not(departement = preceding::localisation/departement)]">
                                <option>
                                    <xsl:value-of select="localisation/departement"/>
                                </option>
                            </xsl:if>
                        </xsl:for-each>
                    </select><br />
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
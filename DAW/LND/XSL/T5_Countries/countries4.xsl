<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <xsl:variable name="poblacionTotal" select="sum(/countries/country[language='Spanish']/city/population)" /><!-- Variable que suma toda la población de los países de habla hispana -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Countries</title>
                <link rel="stylesheet" href="countries.css"/>
            </head>
            <body>
                <h1 class="enunciado">Países de habla hispana, con sus ciudades y población de éstas</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th></th><th>Nombre</th><th>Ciudades</th><th>Población</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country[language='Spanish']">
                            <xsl:sort select="@population" data-type="number" order="descending" />
                            <tr>
                                <td><xsl:value-of select="position()" /></td>
                                <td><xsl:value-of select="@name" /></td>
                                <td>
                                    <xsl:for-each select ="city">
                                        <li><xsl:value-of select = "name" /></li>
                                    </xsl:for-each>
                                </td>
                                <td class="derecha">
                                    <xsl:for-each select ="city">
                                        <li><xsl:value-of select = "population" /></li>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td></td><td></td><td>Total:</td><td class="derecha"><xsl:value-of select="$poblacionTotal" /></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
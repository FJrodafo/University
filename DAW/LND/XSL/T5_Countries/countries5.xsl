<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <!-- Variables -->
    <xsl:variable name="mayor" select="max(/countries/country/(@population div @area))" />
    <xsl:variable name="menor" select="min(/countries/country/(@population div @area))" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Countries</title>
                <link rel="stylesheet" href="countries.css" />
            </head>
            <body>
                <h1 class="enunciado">El país con mayor/menor densidad de población</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>País</th>
                            <th>Densidad de población</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <xsl:value-of select="/countries/country[(@population div @area)=$mayor]/@name" />
                            </td>
                            <td class="derecha">
                                <xsl:value-of select="format-number(max(/countries/country/(@population div @area)),'0.00')" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="/countries/country[(@population div @area)=$menor]/@name" />
                            </td>
                            <td class="derecha">
                                <xsl:value-of select="format-number(min(/countries/country/(@population div @area)),'0.00')" />
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <xsl:for-each select="let $mayor:=max(/countries/country/(@population div @area)) return /countries/country[(@population div @area)=$mayor]">
                                <tr>
                                    <td><xsl:value-of select="@name" /></td>
                                    <td><xsl:value-of select="format-number(@population div @area,'0.00')" /></td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="let $menor:=min(/countries/country/(@population div @area)) return /countries/country[(@population div @area)=$menor]">
                                <tr>
                                    <td><xsl:value-of select="@name" /></td>
                                    <td><xsl:value-of select="format-number(@population div @area,'0.00')" /></td>
                                </tr>
                            </xsl:for-each>
                        </tr>
                        -->
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
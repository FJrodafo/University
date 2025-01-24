<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <xsl:variable name="poblacionGlobal" select="sum(/countries/country/@population)" /><!-- Variable que suma toda la población de la tierra -->
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
                <h1 class="enunciado">Países más poblados de La Tierra</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Población</th>
                            <th>Del total global</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country">
                            <xsl:sort select="@population" data-type="number" order="descending" />
                            <xsl:if
                                test="position() &lt;= 10">
                                <tr>
                                    <td>
                                        <xsl:value-of select="position()" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="@name" />
                                    </td>
                                    <td class="derecha">
                                        <xsl:value-of select="@population" />
                                    </td>
                                    <td class="derecha">
                                        <xsl:value-of select="format-number((@population * 100) div $poblacionGlobal,'0.00')" />%
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                        <tr>
                            <td></td>
                            <td>Población Global</td>
                            <td class="derecha">
                                <xsl:value-of select="$poblacionGlobal" />
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <h1 class="enunciado">Países menos poblados de La Tierra</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Población</th>
                            <th>Del total global</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country">
                            <xsl:sort select="@population" data-type="number" order="ascending" />
                            <xsl:if
                                test="position() &lt;= 10">
                                <tr>
                                    <td>
                                        <xsl:value-of select="position()" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="@name" />
                                    </td>
                                    <td class="derecha">
                                        <xsl:value-of select="@population" />
                                    </td>
                                    <td class="derecha">
                                        <xsl:value-of select="format-number((@population * 100) div $poblacionGlobal,'0.000000')" />%
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                        <tr>
                            <td></td>
                            <td>Población Global</td>
                            <td class="derecha">
                                <xsl:value-of select="$poblacionGlobal" />
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
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
                <h1 class="enunciado">Países de habla española</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Num.Lenguas</th>
                            <th>Num.Hab.</th>
                            <th>Densidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country[language='Spanish']">
                            <xsl:sort select="@population" data-type="number" order="descending" />
                            <tr>
                                <td>
                                    <xsl:value-of select="@name" />
                                </td>
                                <td class="derecha">
                                    <xsl:value-of select="count(language)" />
                                </td>
                                <td class="derecha">
                                    <xsl:value-of select="format-number(language[.='Spanish']/@percentage * (@population div 100),'0.00')" />
                                </td>
                                <td class="derecha">
                                    <xsl:value-of select="format-number(@population div @area,'0.00')" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
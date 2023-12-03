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
                <h1 class="enunciado">Países de habla alemana y alguna lengua más</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Num.Lenguas</th>
                            <th>Num.Hab.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country[count(language)>2 and language='German']">
                            <tr>
                                <td>
                                    <xsl:value-of select="@name" />
                                </td>
                                <td class="derecha">
                                    <xsl:value-of select="count(language)" />
                                </td>
                                <td class="derecha">
                                    <xsl:value-of select="format-number(language[.='German']/@percentage * (@population div 100),'0.00')" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Lecturas Recomendadas</title>
                <link href="libreria.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <h2>Lecturas recomendadas para final de curso</h2>
                <table id="libros" border="1">
                    <tr style="background-color: lightgreen;">
                        <th>ISBN</th><th>Título</th><th>Autor</th><th>Precio</th><th>IVA</th><th>Precio con IVA</th>
                    </tr>
                    <xsl:for-each select="libreria/libro">
                        <xsl:sort select="titulo" data-type="text" order="ascending" />
                        <xsl:if test="position() mod 2 = 1">
                            <tr class="impar">
                                <td><xsl:value-of select="isbn" /></td>
                                <td><xsl:value-of select="titulo" /></td>
                                <td><xsl:value-of select="autor" /></td>
                                <td><xsl:value-of select="precio" /></td>
                                <td class="derecha"><xsl:value-of select="format-number(precio * 8 div 100,'0.00')" /></td>
                                <td class="derecha"><xsl:value-of select="format-number(precio * 1.08,'0.00')" /></td>
                                <xsl:choose>
                                    <xsl:when test="precio &lt;= 40"><td class="verde">Muy Asequible</td></xsl:when>
                                    <xsl:when test="precio &lt;= 80"><td class="amarillo">Asequible</td></xsl:when>
                                    <xsl:when test="precio &lt;= 100"><td class="naranja">Caro</td></xsl:when>
                                    <!-- <xsl:when test="precio &gt; 100"><td class="rojo">Me ha costao un riñón</td></xsl:when>-->
                                    <xsl:otherwise><td class="rojo">Muy Caro</td></xsl:otherwise>
                                </xsl:choose>
                            </tr>
                        </xsl:if>
                        <xsl:if test="position() mod 2 = 0">
                            <tr class="par">
                                <td><xsl:value-of select="isbn" /></td>
                                <td><xsl:value-of select="titulo" /></td>
                                <td><xsl:value-of select="autor" /></td>
                                <td><xsl:value-of select="precio" /></td>
                                <td class="derecha"><xsl:value-of select="format-number(precio * 8 div 100,'0.00')" /></td>
                                <td class="derecha"><xsl:value-of select="format-number(precio * 1.08,'0.00')" /></td>
                                <xsl:choose>
                                    <xsl:when test="precio &lt;= 40"><td class="verde">Muy Asequible</td></xsl:when>
                                    <xsl:when test="precio &lt;= 80"><td class="amarillo">Asequible</td></xsl:when>
                                    <xsl:when test="precio &lt;= 100"><td class="naranja">Caro</td></xsl:when>
                                    <!-- <xsl:when test="precio &gt; 100"><td class="rojo">Me ha costao un riñón</td></xsl:when>-->
                                    <xsl:otherwise><td class="rojo">Muy Caro</td></xsl:otherwise>
                                </xsl:choose>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
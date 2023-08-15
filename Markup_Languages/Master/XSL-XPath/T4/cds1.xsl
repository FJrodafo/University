<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>CDs</title>
                <link rel="stylesheet" href="cds.css" />
            </head>
            <body>
                <h1 class="enunciado">Listado de CDs de Música</h1>
                <table style="margin: auto;">
                    <thead>
                        <tr style="background-color: white; text-align: center;">
                            <th>Título</th>
                            <th>Año</th>
                            <th>Artista</th>
                            <th>Canciones</th>
                            <th>Sellos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="cds/cd">
                            <tr>
                                <td>
                                    <xsl:value-of select="@titulo_album" />
                                </td>
                                <td>
                                    <xsl:value-of select="@año_publicacion" />
                                </td>
                                <td>
                                    <xsl:for-each select="artistas/artista">
                                        <li>
                                            <xsl:value-of select="." />
                                        </li>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:if test="position() mod 2 = 1">
                                        <table style="margin: left;">
                                            <thead>
                                                <tr style="background-color: darkgreen">
                                                    <th>Duración</th>
                                                    <th>Título</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <xsl:for-each select="canciones/cancion">
                                                    <tr style="background-color: lightgreen">
                                                        <td>
                                                            <xsl:value-of select="@duracion" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="." />
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>
                                    </xsl:if>
                                    <xsl:if test="position() mod 2 = 0">
                                        <table style="margin: left;">
                                            <thead>
                                                <tr style="background-color: lightgreen">
                                                    <th>Duración</th>
                                                    <th>Título</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <xsl:for-each select="canciones/cancion">
                                                    <tr style="background-color: darkgreen">
                                                        <td>
                                                            <xsl:value-of select="@duracion" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="." />
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>
                                    </xsl:if>
                                </td>
                                <td>
                                    <xsl:for-each select="sellos_discograficos/sello_discografico">
                                        <li>
                                            <xsl:value-of select="." />
                                        </li>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
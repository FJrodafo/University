<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="html" doctype-system="about:legacy-compact" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Video Club</title>
                <link rel="stylesheet" href="videoclub.css" />
            </head>
            <body>
                <h1 class="enunciado">Listado de películas</h1>
                <table border="1">
                    <thead>
                        <tr class="yellow">
                            <th>Título</th>
                            <th>Nacionalidad</th>
                            <th>Prod.</th>
                            <th>Dir.</th>
                            <th>Año</th>
                            <th>Dur.</th>
                            <th>Gen.</th>
                            <th>Sinopsis</th>
                            <th>Url</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="videoclub/pelicula">
                            <tr class="grayIzquierda">
                                <td>
                                    <xsl:value-of select="titulo" />
                                </td>
                                <td>
                                    <xsl:value-of select="nacionalidad" />
                                </td>
                                <td>
                                    <xsl:value-of select="productor" />
                                </td>
                                <td>
                                    <xsl:value-of select="director" />
                                </td>
                                <td>
                                    <xsl:value-of select="año" />
                                </td>
                                <td><xsl:value-of select="duracion" />min.</td>
                                <td>
                                    <xsl:for-each select="genero">
                                        <li>
                                            <xsl:value-of select="." />
                                        </li>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:value-of select="sinopsis" />
                                </td>
                                <td>
                                    <a href="{url}"><xsl:value-of select="titulo" /> IMDB</a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
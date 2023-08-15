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
                            <th>Director</th>
                            <th>Carátula</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="videoclub/pelicula" /><!-- Aplica la plantilla match="pelicula" -->
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="pelicula">
        <tr class="grayCentro">
            <td>
                <b>
                    <xsl:value-of select="titulo" />
                </b>
            </td>
            <td>
                <b>
                    <xsl:value-of select="director" />
                </b>
            </td>
            <td>
                <a href="{url}">
                    <img src="fotos/{foto}" />
                </a>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
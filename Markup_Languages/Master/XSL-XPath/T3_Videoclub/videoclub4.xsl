<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" />
    <xsl:template match="/">
        <videoclub>
            <xsl:for-each select="videoclub/pelicula[nacionalidad='ES']">
                <pelicula>
                    <titulo>
                        <xsl:value-of select="titulo" />
                    </titulo>
                    <nacionalidad>
                        <xsl:value-of select="nacionalidad" />
                    </nacionalidad>
                    <director>
                        <xsl:value-of select="director" />
                    </director>
                    <productor>
                        <xsl:value-of select="productor" />
                    </productor>
                    <año>
                        <xsl:value-of select="año" />
                    </año>
                    <xsl:for-each select="genero">
                        <genero>
                            <xsl:value-of select="." />
                        </genero>
                    </xsl:for-each>
                    <url>
                        <xsl:value-of select="url" />
                    </url>
                </pelicula>
            </xsl:for-each>
        </videoclub>
    </xsl:template>
</xsl:stylesheet>
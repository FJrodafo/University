<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="text" />
    <xsl:template match="/">
        <xsl:text>Título;Nacionalidad;Productor;Director;Año;Duración;Género;Sinopsis;Foto;Url</xsl:text><xsl:text>&#13;&#10;</xsl:text><!-- carriage return 13 - line feed 10 -->
        <xsl:apply-templates select="videoclub/pelicula" />
    </xsl:template>
    <xsl:template match="pelicula">
        <xsl:value-of select="titulo" /><xsl:text>;</xsl:text>
        <xsl:value-of select="nacionalidad" /><xsl:text>;</xsl:text>
        <xsl:value-of select="productor" /><xsl:text>;</xsl:text>
        <xsl:value-of select="director" /><xsl:text>;</xsl:text>
        <xsl:value-of select="año" /><xsl:text>;</xsl:text>
        <xsl:value-of select="duracion" /><xsl:text>min;</xsl:text>
        <xsl:for-each select="genero"><xsl:value-of select="." /></xsl:for-each><xsl:text>;</xsl:text>
        <xsl:value-of select="sinopsis" /><xsl:text>;</xsl:text>
        <xsl:value-of select="foto" /><xsl:text>;</xsl:text>
        <xsl:value-of select="url" /><xsl:text>&#13;&#10;</xsl:text><!-- carriage return 13 - line feed 10 -->
    </xsl:template>
</xsl:stylesheet>
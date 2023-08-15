<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="text" />
    <xsl:template match="/">
        <xsl:text>Nombre;Apellido1;Apellido2;Móvil&#13;&#10;</xsl:text><!-- carriage return 13 - line feed 10 -->
        <xsl:apply-templates select="agenda/contacto" />
    </xsl:template>
    <xsl:template match="contacto">
        <xsl:value-of select="nombre" /><xsl:text>;</xsl:text>
        <xsl:value-of select="ap1" /><xsl:text>;</xsl:text>
        <xsl:value-of select="ap2" /><xsl:text>;</xsl:text>
        <xsl:value-of select="movil" /><xsl:text>&#13;&#10;</xsl:text><!-- carriage return 13 - line feed 10 -->
    </xsl:template>
</xsl:stylesheet>
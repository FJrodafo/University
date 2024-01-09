<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" />
    <xsl:template match="/">
        <cds>
            <xsl:for-each select="cds/cd">
                <cd>
                    <titulo_album><xsl:value-of select="@titulo_album"/></titulo_album>
                    <año_publicacion><xsl:value-of select="@año_publicacion"/></año_publicacion>
                    <artista><xsl:value-of select="artista"/></artista>
                    <canciones>
                        <xsl:for-each select="canciones/cancion">
                            <cancion>
                                <duracion><xsl:value-of select="@duracion"/></duracion>
                                <titulo><xsl:value-of select="."/></titulo>
                            </cancion>
                        </xsl:for-each>
                    </canciones>
                    <sellos_discograficos>
                        <xsl:for-each select="sellos_discograficos/sello_discografico">
                            <sello_discografico><xsl:value-of select="."/></sello_discografico>
                        </xsl:for-each>
                    </sellos_discograficos>
                </cd>
            </xsl:for-each>
        </cds>
    </xsl:template>
</xsl:stylesheet>
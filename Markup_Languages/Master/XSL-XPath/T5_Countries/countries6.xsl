<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" />
    <xsl:template match="/">
        <countries>
            <xsl:for-each select="countries/country">
                <country>
                    <name>
                        <xsl:value-of select="@name" />
                    </name>
                    <population>
                        <xsl:value-of select="@population" />
                    </population>
                    <area>
                        <xsl:value-of select="@area" />
                    </area>
                    <xsl:for-each select="city">
                        <city>
                            <name>
                                <xsl:value-of select="name" />
                            </name>
                            <population>
                                <xsl:value-of select="population" />
                            </population>
                        </city>
                    </xsl:for-each>
                    <xsl:for-each select="language">
                        <language>
                            <name>
                                <xsl:value-of select="." />
                            </name>
                            <percentage>
                                <xsl:value-of select="@percentage" />
                            </percentage>
                        </language>
                    </xsl:for-each>
                </country>
            </xsl:for-each>
        </countries>
    </xsl:template>
</xsl:stylesheet>
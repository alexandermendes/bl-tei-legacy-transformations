<xsl:stylesheet version="2.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="tei #default">
    <xsl:import href="global.xsl" />
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    
    <!-- Identity transform -->
    <xsl:template match="@*|node()"> 
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Fix msIdentifier -->
    <xsl:template match="tei:msDesc/tei:msIdentifier">
        <msIdentifier>
            <xsl:apply-templates select="tei:country" />
            <xsl:apply-templates select="tei:settlement" />
            <xsl:apply-templates select="tei:institution" />
            <repository><xsl:text>Oriental Manuscripts</xsl:text></repository>
            <collection><xsl:text>Persian Manuscripts</xsl:text></collection>
            <xsl:apply-templates select="node()[not(self::tei:country) and 
                                                not(self::tei:settlement) and
                                                not(self::tei:institution) and
                                                not(self::tei:repository) and
                                                not(self::tei:collection)]"/>
        </msIdentifier>
    </xsl:template>

    <!-- Update @mainLang language codes from 'per' to 'fa' -->
    <xsl:template match="@mainLang" >
        <xsl:attribute name="mainLang">
            <xsl:value-of select="replace(., 'per', 'fa')"/>
        </xsl:attribute>
    </xsl:template>

    <!-- Replace 'Hijri-qamari' with Hijriqamari (to match IAMS record) -->
    <xsl:template match="@calendar" >
        <xsl:attribute name="calendar">
            <xsl:value-of select="replace(., 'Hijri-qamari', 'Hijri qamari')"/>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
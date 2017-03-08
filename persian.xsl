<xsl:stylesheet version="2.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="tei #default">
    <xsl:import href="global.xsl" />
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>

    <!-- Fix msIdentifier -->
    <xsl:template match="tei:msDesc/tei:msIdentifier">
        <msIdentifier>
            <country><xsl:text>UK</xsl:text></country>
            <xsl:apply-templates select="tei:settlement" />
            <institution><xsl:text>British Library</xsl:text></institution>
            <repository><xsl:text>Oriental Manuscripts</xsl:text></repository>
            <collection><xsl:text>Persian Manuscripts</xsl:text></collection>
            <xsl:apply-templates select="node()[not(self::tei:settlement) and
                                                not(self::tei:country) and
                                                not(self::tei:institution) and
                                                not(self::tei:repository) and
                                                not(self::tei:collection)]"/>
        </msIdentifier>
    </xsl:template>

    <!-- Add <availability> if it doesnt exist -->
    <xsl:template match="tei:msDesc/tei:additional/tei:adminInfo[not(tei:availability)]">
        <adminInfo>
            <xsl:apply-templates select="@*|node()"/>
            <availability status="free" />
        </adminInfo>
    </xsl:template>

    <!-- Add <textLang> to <msContents> if it doesnt exist -->
    <xsl:template match="tei:msDesc/tei:msContents[not(tei:textLang)]">
        <msContents>
            <textLang mainLang="fa">Persian</textLang>
            <xsl:apply-templates select="@*|node()"/>
        </msContents>
    </xsl:template>

    <!-- Update @mainLang language codes from 'per' to 'fa' -->
    <xsl:template match="*//@mainLang" >
        <xsl:attribute name="mainLang">
            <xsl:value-of select="replace(., 'per', 'fa')"/>
        </xsl:attribute>
    </xsl:template>

    <!-- Remove 'Anonymous' <author> elements removed from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:author/tei:persName[text() = 'Anonymous']" />

    <!-- Remove empty <pers> elements from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:author/tei:persName[not(*) and not(normalize-space())]" />

    <!-- Remove empty <title> elements from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:title[not(*) and not(normalize-space())]" />
    
    <!-- Remove empty <recordHist> elements -->
    <xsl:template match="tei:recordHist[not(*) and not(normalize-space())]" />

    <!-- Remove empty <altIdentifier> elements -->
    <xsl:template match="tei:altIdentifier[not(*) and not(normalize-space())]" />

    <!-- Replace 'Hijri-qamari' with Hijriqamari (to match IAMS record) -->
    <xsl:template match="@calendar" >
        <xsl:attribute name="calendar">
            <xsl:value-of select="replace(., 'Hijri-qamari', 'Hijri qamari')"/>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
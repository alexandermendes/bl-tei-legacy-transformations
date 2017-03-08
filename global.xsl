<xsl:stylesheet version="2.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="tei #default">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>

    <!-- Identity transform -->
    <xsl:template match="@*|node()"> 
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Remove old processing instructions -->
    <xsl:template match="//processing-instruction()" />

    <!-- Add processing instructions for Oxygen and Altova Authentic -->
    <xsl:template match="tei:TEI">
        <xsl:processing-instruction name="altova_sps">
            <xsl:text>..\Enrich_new.sps</xsl:text>
        </xsl:processing-instruction>
        <TEI xmlns="http://www.tei-c.org/ns/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://www.tei-c.org/ns/1.0 ../tei_enrich_new.xsd">
            <xsl:apply-templates />
        </TEI>
    </xsl:template>
    
    <!-- Remove rend attributes -->
    <xsl:template match="@rend"/>
    
    <!-- Update <country> and <institution> -->
    <xsl:template match="tei:msDesc/tei:msIdentifier">
        <msIdentifier>
            <country><xsl:text>UK</xsl:text></country>
            <xsl:apply-templates select="tei:settlement" />
            <institution><xsl:text>British Library</xsl:text></institution>
            <xsl:apply-templates select="node()[not(self::tei:country) and
                                                not(self::tei:settlement) and
                                                not(self::tei:institution)]"/>
        </msIdentifier>
    </xsl:template>
    
    <!-- Add <availability status="free"> if no <availability> exists -->
    <xsl:template match="tei:msDesc/tei:additional/tei:adminInfo[not(tei:availability)]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <availability status="free" />
        </xsl:copy>
    </xsl:template>
    
    <!-- Remove 'Anonymous' <author> elements removed from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:author/tei:persName[text() = 'Anonymous']" />

    <!-- Remove empty <persName> elements from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:author/tei:persName[not(*) and not(normalize-space())]" />

    <!-- Remove empty <title> elements from <msItem> -->
    <xsl:template match="tei:msDesc/tei:msContents/tei:msItem/tei:title[not(*) and not(normalize-space())]" />
    
    <!-- Remove empty <recordHist> elements -->
    <xsl:template match="tei:recordHist[not(*) and not(normalize-space())]" />
    
    <!-- Remove empty <listBibl> elements -->
    <xsl:template match="tei:listBibl[not(*) and not(normalize-space())]" />

    <!-- Remove empty <altIdentifier> elements -->
    <xsl:template match="tei:altIdentifier[not(*) and not(normalize-space())]" />
    
    <!-- Remove all empty attributes -->
    <xsl:template match="@*[not(normalize-space())]" />
</xsl:stylesheet>
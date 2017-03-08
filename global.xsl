<xsl:stylesheet version="2.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="tei #default">

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
    
</xsl:stylesheet>
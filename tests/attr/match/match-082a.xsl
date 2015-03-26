<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    exclude-result-prefixes="err">

    <!-- 
        Parentheses in patterns become legal in XSLT 3.0. They have the same priority.
        This test tests throwing the same-priority error.
    -->

    <xsl:mode on-multiple-match="fail" />
    
    <xsl:template match="doc">
        <wrong />
    </xsl:template>

    <xsl:template match="(doc|cod)">
        <wrong />
    </xsl:template>

    <xsl:template name="xsl:initial-template">
        <xsl:variable name="n"><doc /></xsl:variable>
        <xsl:try>
            <xsl:apply-templates select="$n"/>
            <xsl:catch errors="err:XTDE0540">
                <ok />
            </xsl:catch>
        </xsl:try>
    </xsl:template>

</xsl:stylesheet>
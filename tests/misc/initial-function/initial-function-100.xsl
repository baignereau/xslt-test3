<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="urn:functions"
    exclude-result-prefixes="xs math f"
    version="3.0">
    
    <xsl:function name="f:test">
        <xsl:param name="p" as="item()*" />
        <xsl:sequence select="$p" />
    </xsl:function>
    
</xsl:stylesheet>
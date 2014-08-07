<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within a streaming template, use xsl:for-each-group group-adjacent, access to context item post-descent -->
  <!-- see spec bug 26513 -->
  
  <xsl:mode name="s" streamable="yes"/>
       
    
  <xsl:template name="main">
    <xsl:stream href="../docs/transactions.xml">
    	<xsl:apply-templates select="account" mode="s"/>
    </xsl:stream>
  </xsl:template> 


  <xsl:template match="account" mode="s">
     <out>
      <xsl:for-each-group select="transaction" group-adjacent="number(@value) ge 0">
        <g>
         <start value="{@value}"/>
         <group values="{current-group()/@value}"/>
         <end value="{@value}"/>
        </g> 
      </xsl:for-each-group> 
    </out>
  </xsl:template>   
       
</xsl:transform>


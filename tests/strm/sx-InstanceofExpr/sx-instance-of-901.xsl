<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Test of xsl:stream with empty(), filtered with non-motionless predicate -->
    
    <xsl:template name="main">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/ITEM[AUTHOR='Jasper Fforde']) instance of element(ITEM)"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
</xsl:stylesheet>
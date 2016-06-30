<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:f="http://www.w3.org/xslt30tests/functions" exclude-result-prefixes="map xs err f">

  <xsl:variable name="RUN" select="true()" static="yes"/>
  <xsl:strip-space elements="*"/>


  <xsl:function name="f:count-descendants-001" as="xs:integer" streamability="absorbing">
    <xsl:param name="input" as="node()*"/>
    <xsl:sequence select="count($input!descendant::*)"/>
  </xsl:function>

  <xsl:template name="t-001" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:count-descendants-001(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <xsl:template name="t-002" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="f:count-descendants-001(/BOOKLIST/BOOKS/ITEM)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <xsl:function name="f:count-descendants-003" as="xs:integer" streamability="absorbing">
    <xsl:param name="input" as="node()*"/>
    <xsl:sequence select="count($input/descendant::*)"/>
  </xsl:function>
  
  <xsl:template name="t-003" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:count-descendants-003(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <xsl:template name="t-004" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="f:count-descendants-003(/BOOKLIST/BOOKS/ITEM)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- recursive absorbing function -->
  
  <xsl:function name="f:count-descendants-or-self-005" as="xs:integer" streamability="absorbing">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="1 + sum($input/* ! f:count-descendants-or-self-005(.))"/>
  </xsl:function>
  
  <xsl:template name="t-005" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:count-descendants-or-self-005(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Call absorbing function with grounded input -->
  
  <xsl:template name="t-006" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="copy-of(/BOOKLIST/BOOKS/ITEM) ! f:count-descendants-or-self-005(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- two references to the variable allowed if you're careful -->
  
  <xsl:function name="f:f-007" as="xs:string" streamability="absorbing">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="namespace-uri($input) || '#' || local-name($input) || '?' || exists($input/*)"/>
  </xsl:function>
  
  <xsl:template name="t-007" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:f-007(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Invoke streamable template from streamable function -->
  
  <xsl:mode name="m-008" streamable="yes"/>
  
  <xsl:template match="ITEM" mode="m-008">
    <xsl:sequence select="string(PRICE)"/>
  </xsl:template>
  
  <xsl:function name="f:f-008" as="element(data)" streamability="absorbing">
    <xsl:param name="input" as="node()*"/>
    <data>
      <xsl:apply-templates select="$input" mode="m-008"/>
    </data>
  </xsl:function>
  
  <xsl:template name="t-008" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="f:f-008(/BOOKLIST/BOOKS/ITEM)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  
  

</xsl:stylesheet>

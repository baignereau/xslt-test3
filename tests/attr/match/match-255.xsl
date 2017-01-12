<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">
    
    <xsl:template match="a[@code='a'][number(@num)=22]">1</xsl:template>
    <xsl:template match="a[@code='b'][number(@num)=22]">2</xsl:template>
    <xsl:template match="a[@code='c'][number(@num)=22]">3</xsl:template>
    <xsl:template match="a[@code='d'][number(@num)=22]">4</xsl:template>
    <xsl:template match="a[@code='e'][number(@num)=22]">5</xsl:template>
    <xsl:template match="a[@code='f'][number(@num)=22]">6</xsl:template>
    <xsl:template match="a[@code='g'][number(@num)=22]">7</xsl:template>
    <xsl:template match="a[@code='h'][number(@num)=22]">8</xsl:template>
    <xsl:template match="a[@code='i'][number(@num)=22]">9</xsl:template>
    <xsl:template match="a[@code='j'][number(@num)=22]">10</xsl:template>
    <xsl:template match="a[@code='k'][number(@num)=22]">11</xsl:template>
    <xsl:template match="a[@code='l'][number(@num)=22]">12</xsl:template>
    <xsl:template match="a[@code='m'][number(@num)=22]">13</xsl:template>
    <xsl:template match="a[@code='n'][number(@num)=25]">14</xsl:template>
    <xsl:template match="a[@code='o'][number(@num)=25]">15</xsl:template>
    <xsl:template match="a[@code='p'][number(@num)=25]">16</xsl:template>
    <xsl:template match="a[@code='q'][number(@num)=25]">17</xsl:template>
    <xsl:template match="a[@code='r'][number(@num)=25]">18</xsl:template>
    <xsl:template match="a[@code='s'][number(@num)=25]">19</xsl:template>
    <xsl:template match="a[@code='t'][number(@num)=25]">20</xsl:template>
    <xsl:template match="a[@code='u'][number(@num)=25]">21</xsl:template>
    <xsl:template match="a[@code='v'][number(@num)=25]">22</xsl:template>
    <xsl:template match="a[@code='w'][number(@num)=25]">23</xsl:template>
    <xsl:template match="a[@code='x'][number(@num)=28]">24</xsl:template>
    <xsl:template match="a[@code='y'][number(@num)=28]">25</xsl:template>
    <xsl:template match="a[@code='z'][number(@num)=28]">26</xsl:template>
    <xsl:template match="a">0</xsl:template>
    
    <xsl:variable name="data">
        Unfortunately the attempt to fix this was done simply by modifying the generated tests. 
        This test set must not be manually modified, or the changes will simply disappear the next 
        time the spec is rebuilt. The problem needs to be fixed at source by generating correct 
        tests from the examples in the spec.
    </xsl:variable>
    
    <xsl:template name="main">
        <out>
            <xsl:for-each select="string-to-codepoints(normalize-space($data))!codepoints-to-string(.)">
                <xsl:variable name="e" as="element(a)">
                    <a code="{.}" num="{22 + position() mod 5}"/>
                </xsl:variable>
                <xsl:variable name="n" as="xs:integer">
                    <xsl:apply-templates select="$e"/>
                </xsl:variable>
                <xsl:sequence select="$n"/>
            </xsl:for-each>
        </out>
    </xsl:template>
    
 
</xsl:stylesheet>

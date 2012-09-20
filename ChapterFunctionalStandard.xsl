<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template match="my:FunctionalStandard" >
  
    <fo:block border="solid" space-after="11pt" padding-top="11pt" padding-bottom="11pt" >

      <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
        <fo:table-column column-number="1" column-width="{$chapter-marginref-area-width}" />
        <fo:table-column column-number="2" column-width="{$chapter-text-area-width}" />
        <fo:table-body>
          <fo:table-row >
            <fo:table-cell text-align="center">
              <fo:block xsl:use-attribute-sets="LogoNormalFont">
                <fo:block font-size="11pt">
                  standard
                </fo:block>
                <fo:block xsl:use-attribute-sets="LogoLargeFont">
                  <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="../my:ChapterNo" />
                </fo:block>
                <fo:block font-size="11pt">
                  mandatory
                </fo:block>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-right="11pt">
              <fo:block>
                <xsl:apply-templates select="my:DefinitionText" />
                <xsl:apply-templates select="my:Conditions" />
                <xsl:apply-templates select="my:Limitations" />
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>

    </fo:block>
  
  </xsl:template>

  <xsl:template match="my:DefinitionText" >

    <fo:block xsl:use-attribute-sets="FunctionalStandardFont">
      <xsl:apply-templates />
    </fo:block>

  </xsl:template>

  <xsl:template match="my:Conditions" >

    <fo:list-block provisional-distance-between-starts="1.5cm">
      <xsl:apply-templates select="my:ConditionText" />
    </fo:list-block>

  </xsl:template>

  <xsl:template match="my:ConditionText" >

    <fo:list-item>
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="FunctionalStandardConditionFont">
          (<xsl:number format="a" />)
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="FunctionalStandardConditionFont">
          <xsl:apply-templates />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>

  </xsl:template>


  <xsl:template match="my:Limitations" >
  
    <fo:block xsl:use-attribute-sets="FunctionalStandardLimitationFont" font-weight="bold" space-before="11pt" >Limitation:</fo:block>
    <xsl:apply-templates select="my:LimitationText" />

    <fo:list-block provisional-distance-between-starts="1.5cm">
      <xsl:apply-templates select="my:LimitationTerms/my:LimitationTermText" />
    </fo:list-block>
    
  </xsl:template>
  
  <xsl:template match="my:LimitationText" >

    <fo:block xsl:use-attribute-sets="FunctionalStandardLimitationFont">
      <xsl:apply-templates />
    </fo:block>

  </xsl:template>
  
  <xsl:template match="my:LimitationTermText" >

    <xsl:if test="string-length( normalize-space( . ) ) > 0" >
      <fo:list-item>
        <fo:list-item-label end-indent="label-end()">
          <fo:block xsl:use-attribute-sets="FunctionalStandardLimitationFont">(<xsl:number format="a" />)</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
          <fo:block xsl:use-attribute-sets="FunctionalStandardLimitationFont">
            <xsl:apply-templates />
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              >

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template match="my:Regulation" >
  
    <fo:block border="solid" space-after="11pt" padding-top="11pt" padding-bottom="11pt" >

      <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
        <fo:table-column column-number="1" column-width="{$chapter-marginref-area-width}" />
        <fo:table-column column-number="2" column-width="{$chapter-text-area-width}" />
        <fo:table-body>
          <fo:table-row >
            <fo:table-cell text-align="center">
              <fo:block xsl:use-attribute-sets="LogoNormalFont">
                <fo:block font-size="11pt">
                  regulation
                </fo:block>
                <fo:block xsl:use-attribute-sets="LogoLargeFont">
                  <xsl:value-of select="../my:ChapterNo" />
                </fo:block>
                <fo:block font-size="11pt">
                  mandatory
                </fo:block>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-right="11pt">
              <fo:block>
                <xsl:apply-templates select="my:RegulationText" />
                <xsl:apply-templates select="my:RegulationCriteria" />
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>

    </fo:block>
  
  </xsl:template>
  
  <xsl:template match="my:RegulationText" >
    <fo:block xsl:use-attribute-sets="RegulationFont" >
      <xsl:choose>
        <xsl:when test="string-length( normalize-space( . ) ) = 0">
          <fo:inline color="red">Missing Regulatory Text.</fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </fo:block>
  </xsl:template>

  <xsl:template match="my:RegulationCriteria" >
    <fo:block>
      <fo:list-block provisional-distance-between-starts="1.5cm" >
        <xsl:apply-templates select="my:RegulationCriteriaItem" />
      </fo:list-block>
    </fo:block>
  </xsl:template>

  <xsl:template match="my:RegulationCriteriaItem" >
    <fo:list-item >
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="RegulationCriteriaFont">
          (<xsl:number format="1" />)
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <xsl:apply-templates select="my:CriteriaText" />
        <xsl:apply-templates select="my:CriteriaItems" />
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

  <xsl:template match="my:CriteriaText" >
    <fo:block xsl:use-attribute-sets="RegulationCriteriaFont">
      <xsl:choose>
        <xsl:when test="string-length( normalize-space( . ) ) = 0">
          <fo:inline color="red">Missing Regulation Criteria Text.</fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </fo:block>
  </xsl:template>

  <xsl:template match="my:CriteriaItems" >

    <fo:block>
      <fo:list-block provisional-distance-between-starts="1.5cm">
        <xsl:apply-templates select="my:CriteriaItemText" />
      </fo:list-block>
    </fo:block>

  </xsl:template>

  <xsl:template match="my:CriteriaItemText" >

    <fo:list-item>
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="RegulationCriteriaFont">
          (<xsl:number format="a" />)
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="RegulationCriteriaFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing Regulation Criteria.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>

  </xsl:template>

</xsl:stylesheet>

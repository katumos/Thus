<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="my:Graphic">
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
      <xsl:if test="$document-format = $document-format-normal and not( @graphicType = $graphic-format-wide )" >
        <fo:table-column column-width="{$chapter-marginref-area-width}" />
      </xsl:if>
      <fo:table-column column-width="100%" />
      <fo:table-body>
        <fo:table-row>
          <xsl:if test="$document-format = $document-format-normal and not( @graphicType = $graphic-format-wide )" >
            <fo:table-cell><fo:block/></fo:table-cell>
          </xsl:if>
          <fo:table-cell>
            <xsl:apply-templates select="." mode="in-cell" />
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:GraphicCaption" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="GraphicCaptionFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing graphic caption.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="my:Graphic" mode="in-cell">
    <xsl:choose>
      <xsl:when test="@align = $graphic-align-centre">
        <xsl:attribute name="text-align" >center</xsl:attribute>
      </xsl:when>
      <xsl:when test="@align = $graphic-align-right">
        <xsl:attribute name="text-align" >right</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="text-align" >left</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@valign = $graphic-align-middle">
        <xsl:attribute name="display-align" >center</xsl:attribute>
      </xsl:when>
      <xsl:when test="@valign = $graphic-align-bottom">
        <xsl:attribute name="display-align" >after</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="display-align" >before</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <fo:table table-layout="fixed" inline-progression-dimension.maximum="100%">
      <fo:table-column width="100%" />
      <fo:table-body>
        <xsl:apply-templates select="my:GraphicCaption" />
        <fo:table-row>
          <fo:table-cell>
            <fo:block>
              <fo:external-graphic src="url({my:GraphicData})" scaling="uniform" >
                  <xsl:attribute name="width" ><xsl:value-of select="@width" />cm</xsl:attribute>
                  <xsl:attribute name="height" ><xsl:value-of select="@height" />cm</xsl:attribute>
              </fo:external-graphic>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>

  </xsl:template>
  
</xsl:stylesheet>

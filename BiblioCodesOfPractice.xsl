<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format" >

  <xsl:include href="BibliographicFonts.xsl" />

  <xsl:template match="my:BG_BSCodesOfPractice" >
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%" break-before="page" table-omit-header-at-break="false">
      <fo:table-column column-number="1" column-width="{$number-column-width}" />
      <fo:table-column column-number="2" column-width="{$title-column-width}" />
      <fo:table-column column-number="3" column-width="0.5cm" />
      <fo:table-column column-number="4" column-width="{$amended-column-width}" />
      <fo:table-column column-number="5" column-width="{$section-column-width}" />
      <fo:table-header>
        <fo:table-row>
          <fo:table-cell number-columns-spanned="5">
            <fo:block xsl:use-attribute-sets="CaptionFont" space-after="11pt">
              <xsl:choose>
                <xsl:when test="string-length( normalize-space( my:BG_BSCodesOfPracticeCaption ) ) = 0">
                  <fo:inline color="red">Missing Caption.</fo:inline>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="my:BG_BSCodesOfPracticeCaption" />
                </xsl:otherwise>
              </xsl:choose>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Number</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Title</fo:block>
          </fo:table-cell>
          <fo:table-cell><fo:block /></fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Amended</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Section</fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-header>
      <fo:table-body>
        <xsl:apply-templates select="my:BG_BSCodesOfPracticeItem" />
      </fo:table-body>
    </fo:table>
    
    <xsl:apply-templates select="my:BG_BSCodesOfPracticeNote" />
  </xsl:template>
  
  <xsl:template match="my:BG_BSCodesOfPracticeItem" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell number-columns-spanned="5">
        <fo:block space-before="11pt" />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="TableCellFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @Number ) ) = 0">
              <fo:inline color="red">Missing Number</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@Number" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="TableCellFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing Title</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="." />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell><fo:block /></fo:table-cell>
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="TableCellFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @Amended ) ) = 0">
              <fo:inline>-</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@Amended" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center">
        <fo:block xsl:use-attribute-sets="TableCellFont">
          <xsl:value-of select="@Section" />
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="my:BG_BSCodesOfPracticeNote" >
    <fo:block xsl:use-attribute-sets="NoteFont" space-before="11pt" keep-with-next="always">Note:</fo:block>
    <fo:block>
      <xsl:choose>
        <xsl:when test="string-length( normalize-space( . ) ) = 0">
          <fo:inline color="red">Missing Note Text.</fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="." />
        </xsl:otherwise>
      </xsl:choose>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
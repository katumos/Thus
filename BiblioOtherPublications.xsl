<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format" >

  <xsl:include href="BibliographicFonts.xsl" />

  <xsl:variable name="reference-column-width" select="'3cm'" />
  <xsl:variable name="publisher-column-width" select="'3.5cm'" />

  <xsl:template match="my:BG_OtherPublications" >
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%" break-before="page" table-omit-header-at-break="false">
      <fo:table-column column-number="1" column-width="{$title-column-width}" />
      <fo:table-column column-number="2" column-width="0.5cm" />
      <fo:table-column column-number="3" column-width="{$reference-column-width}" />
      <fo:table-column column-number="4" column-width="0.5cm" />
      <fo:table-column column-number="5" column-width="{$publisher-column-width}" />
      <fo:table-column column-number="6" column-width="{$section-column-width}" />
      <fo:table-header>
        <fo:table-row>
          <fo:table-cell number-columns-spanned="6">
            <fo:block xsl:use-attribute-sets="CaptionFont" space-after="11pt">
              <xsl:choose>
                <xsl:when test="string-length( normalize-space( my:BG_OtherPublicationsCaption ) ) = 0">
                  <fo:inline color="red">Missing Caption.</fo:inline>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="my:BG_OtherPublicationsCaption" />
                </xsl:otherwise>
              </xsl:choose>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Title</fo:block>
          </fo:table-cell>
          <fo:table-cell><fo:block /></fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Reference</fo:block>
          </fo:table-cell>
          <fo:table-cell><fo:block /></fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Publisher</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block xsl:use-attribute-sets="TableCaptionFont">Section</fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-header>
      <fo:table-body>
        <xsl:apply-templates select="my:BG_OtherPublicationSection" />
      </fo:table-body>
    </fo:table>
    
    <xsl:apply-templates select="my:BG_OtherPublicationsNote" />
  </xsl:template>
  
  <xsl:template match="my:BG_OtherPublicationSection" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell number-columns-spanned="6">
        <fo:block space-before="22pt" xsl:use-attribute-sets="SectionFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( my:BG_OtherPublicationSectionTitle ) ) = 0">
              <fo:inline color="red">Missing Title</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="my:BG_OtherPublicationSectionTitle" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="my:BG_OtherPublication" />
  </xsl:template>

  
  <xsl:template match="my:BG_OtherPublication" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell number-columns-spanned="6">
        <fo:block space-before="11pt" />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
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
            <xsl:when test="string-length( normalize-space( @Reference ) ) = 0">
              <fo:inline>-</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@Reference" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell><fo:block /></fo:table-cell>
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="TableCellFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @Publisher ) ) = 0">
              <fo:inline color="red">Missing Publisher</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@Publisher" />
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
  
  <xsl:template match="my:BG_OtherPublicationsNote" >
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
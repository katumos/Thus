<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:include href="ChapterTableLayout.xsl" />

  <xsl:template match="my:Table" >
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
      <xsl:if test="$document-format = $document-format-normal and not( @tableType = $table-format-wide )" >
        <fo:table-column column-width="{$chapter-marginref-area-width}" />
      </xsl:if>
      <fo:table-column column-width="100%" />
      <fo:table-body>
        <fo:table-row>
          <xsl:if test="$document-format = $document-format-normal and not( @tableType = $table-format-wide )" >
            <fo:table-cell><fo:block/></fo:table-cell>
          </xsl:if>
          <fo:table-cell>
            <xsl:apply-templates select="." mode="in-cell" />
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:Table" mode="in-cell" >
    <fo:table table-layout="fixed" inline-progression-dimension.maximum="100%">
      <fo:table-column width="100%" />
      <fo:table-body>
        <xsl:apply-templates select="my:TableCaption" />
        <fo:table-row>
          <fo:table-cell>
            <xsl:apply-templates select="my:HtmlTableData" />
          </fo:table-cell>
        </fo:table-row>
        <xsl:apply-templates select="my:TableNotes" />
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:TableCaption" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="NormalHeadingFont" >
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing table caption.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="my:TableNotes" >
    <fo:table-row>
      <fo:table-cell>
        <fo:block>
          <xsl:if test="count( my:TableNoteItem ) &gt; 0" >
            <fo:block xsl:use-attribute-sets="TableNoteFont" >
              Notes:
            </fo:block>
            <fo:list-block provisional-distance-between-starts="1.5cm">
              <xsl:apply-templates select="my:TableNoteItem" />
            </fo:list-block>
          </xsl:if>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="my:TableNoteItem" >
    <fo:list-item>
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="TableNoteItemFont"><xsl:number format="1" />.</fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="TableNoteItemFont">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing table note.</fo:inline>
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

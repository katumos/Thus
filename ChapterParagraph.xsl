<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:html="http://www.w3.org/1999/xhtml" >

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template match="my:Paragraph">
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
      <xsl:if test="$document-format = $document-format-normal" >
        <fo:table-column column-width="{$chapter-marginref-area-width}" />
      </xsl:if>
      <fo:table-column column-width="100%" />
      <fo:table-body>
        <xsl:if test="my:ParagraphHeader[@inlineHeader = 'false']" >
          <fo:table-row keep-with-next="always" >
            <xsl:if test="$document-format = $document-format-normal" >
              <fo:table-cell><fo:block /></fo:table-cell>
            </xsl:if>
            <fo:table-cell>
              <fo:block>
                <xsl:apply-templates select="my:ParagraphHeader" />
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </xsl:if>
        <fo:table-row>
          <xsl:if test="$document-format = $document-format-normal" >
            <fo:table-cell>
              <xsl:apply-templates select="my:MarginReferences/my:MarginReference" />
            </fo:table-cell>
          </xsl:if>
          <fo:table-cell>
            <xsl:apply-templates select="my:ParagraphText"/>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </xsl:template>
  
  <xsl:template match="my:Paragraph" mode="in-cell">
    <fo:table table-layout="fixed" inline-progression-dimension.maximum="100%">
      <fo:table-column width="100%" />
      <fo:table-body>
        <xsl:if test="my:ParagraphHeader[@inlineHeader = 'false']" >
          <fo:table-row keep-with-next="always" >
            <fo:table-cell>
              <fo:block>
                <xsl:apply-templates select="my:ParagraphHeader" />
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </xsl:if>
        <fo:table-row>
          <fo:table-cell>
            <xsl:apply-templates select="my:ParagraphText"/>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:ParagraphHeader" >
    <fo:inline xsl:use-attribute-sets="ParagraphHeaderFont">
      <xsl:choose>
        <xsl:when test="string-length( normalize-space( . ) ) = 0">
          <fo:inline color="red">Missing paragraph header.</fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </fo:inline>
  </xsl:template>
    
  <xsl:template match="my:ParagraphText" >
    <fo:block xsl:use-attribute-sets="ParagraphFont">
      <xsl:if test="../my:ParagraphHeader/@inlineHeader = 'true'" >
        <xsl:apply-templates select="../my:ParagraphHeader" />
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="string-length( normalize-space( . ) ) = 0">
          <fo:inline color="red">Empty paragraph.</fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </fo:block>
  </xsl:template>

  <!--
  <xsl:template match="my:Paragraph" mode="document-format-wide" >
    <xsl:apply-templates select="my:ParagraphHeader[@inlineHeader = 'false']" mode="document-format-wide"/>
    <fo:table-row>
      <fo:table-cell>
        <xsl:apply-templates select="my:ParagraphText"/>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="my:ParagraphHeader[@inlineHeader = 'false']" mode="document-format-normal" >
    <fo:table-row keep-with-next="always" >
      <fo:table-cell><fo:block /></fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="." />
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="my:ParagraphHeader[@inlineHeader = 'false']" mode="document-format-wide" >
    <fo:table-row keep-with-next="always" >
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="." />
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  -->

</xsl:stylesheet>
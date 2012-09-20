<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:fox="http://xml.apache.org/fop/extensions"
                              xmlns:html="http://www.w3.org/1999/xhtml" 
                              >

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template name="HandbookTOC" >
  
    <fo:page-sequence master-reference="toc.page" >

      <!-- Page Header -->
      <xsl:call-template name="PageHeader" />

      <!-- Page Footer -->
      <fo:static-content flow-name="footer.toc" display-align="after">
        <fo:table border-collapse="collapse" table-layout="fixed" inline-progression-dimension.minimum="100%" >
          <fo:table-column column-number="1" width="100%" />
          <fo:table-body>
            <fo:table-row height="1.3cm" display-align="after" >
              <fo:table-cell>
                <fo:block xsl:use-attribute-sets="PageFooterFont" text-align="end">contents</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>

      <!-- Page Body -->
      <fo:flow flow-name="xsl-region-body">
        <fo:table border-collapse="collapse" table-layout="fixed" inline-progression-dimension.minimum="100%">
          <fo:table-column column-number="1" width="100%" />
          <fo:table-body>
            <fo:table-row height="{$chapter-page-content-height}" display-align="after">
              <fo:table-cell>
                <fo:block>

                  <fo:block xsl:use-attribute-sets="HandbookTOCHeadingFont" border-bottom="solid" space-after="10pt" >
                    <fo:list-block provisional-distance-between-starts="1.5cm">
                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block />
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block>
                            <xsl:text>Contents</xsl:text>
                          </fo:block>
                        </fo:list-item-body>
                      </fo:list-item>
                    </fo:list-block>
                  </fo:block>

                  <fo:list-block provisional-distance-between-starts="1.5cm">
                    <xsl:apply-templates select="//my:Sections" />
                    <xsl:apply-templates select="//my:Appendices" />
                    <xsl:apply-templates select="//my:Additional" />
                  </fo:list-block>
                  
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>

    </fo:page-sequence>
    
  </xsl:template>

  <xsl:template match="my:Sections" >
    <xsl:apply-templates select="./child::node()[string-length( normalize-space( text() ) ) != 0 ]" />
  </xsl:template>
  
  <xsl:template match="my:Appendices" >
    <xsl:apply-templates select="./child::node()[string-length( normalize-space( text() ) ) != 0 ]" />
  </xsl:template>
  
  <xsl:template match="my:Additional" >
    <xsl:apply-templates select="./child::node()[string-length( normalize-space( text() ) ) != 0 ]" />
  </xsl:template>
  
  <xsl:template match="my:Section" >
    <xsl:if test="string-length( normalize-space( @groupMarker ) )&gt; 0" >
      <fo:list-item>
        <fo:list-item-label><fo:block /></fo:list-item-label>
        <fo:list-item-body>
          <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
            <xsl:value-of select="@groupMarker" />
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>
    <fo:list-item >
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <xsl:value-of select="@sectionNo" />
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <xsl:value-of select="@sectionTitle" />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="my:Inclusion" >
    <xsl:if test="string-length( normalize-space( @groupMarker ) )&gt; 0" >
      <fo:list-item>
        <fo:list-item-label><fo:block /></fo:list-item-label>
        <fo:list-item-body>
          <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
            <xsl:value-of select="@groupMarker" />
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>
    <fo:list-item >
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @sectionNo ) ) = 0">
              <fo:inline color="red">?</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@sectionNo" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @sectionTitle ) ) = 0">
              <fo:inline color="red">Missing section title.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@sectionTitle" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

  <xsl:template match="my:AppendixA" >
    <fo:list-item >
      <fo:list-item-label>
        <fo:block />
      </fo:list-item-label>
      <fo:list-item-body>
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <fo:inline>Appendix A defined terms</fo:inline>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="my:AppendixB" >
    <fo:list-item >
      <fo:list-item-label>
        <fo:block />
      </fo:list-item-label>
      <fo:list-item-body>
        <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
          <fo:inline>Appendix B list of standards and other publications</fo:inline>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="my:InclusionDocument" >
    <xsl:if test="@tocInclude = 'true'" >
      <xsl:if test="string-length( normalize-space( @groupMarker ) )&gt; 0" >
        <fo:list-item>
          <fo:list-item-label><fo:block /></fo:list-item-label>
          <fo:list-item-body>
            <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
              <xsl:value-of select="@groupMarker" />
            </fo:block>
          </fo:list-item-body>
        </fo:list-item>
      </xsl:if>
      <fo:list-item >
        <fo:list-item-label><fo:block /></fo:list-item-label>
        <fo:list-item-body>
          <fo:block xsl:use-attribute-sets="HandbookTOCItemFont" line-height="22pt">
            <xsl:choose>
              <xsl:when test="string-length( normalize-space( @tocTitle ) ) = 0">
                <fo:inline color="red">Missing inclusion title.</fo:inline>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@tocTitle" />
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>

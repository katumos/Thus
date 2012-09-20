<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:fox="http://xml.apache.org/fop/extensions"
                              xmlns:html="http://www.w3.org/1999/xhtml" 
                              >

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template name="SectionTOC" >
  
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
          <xsl:attribute name="id">
            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionTitle" />
          </xsl:attribute>
          <fo:table-column column-number="1" width="100%" />
          <fo:table-body>
            <fo:table-row height="{$chapter-page-content-height}" display-align="after">
              <fo:table-cell>
                <fo:block>

                  <fo:block xsl:use-attribute-sets="SectionTOCHeadingFont" border-bottom="solid" space-after="10pt" >
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
                  
                    <xsl:apply-templates select="./child::node()[string-length( normalize-space( text() ) ) != 0 ]" />
                  
                    <!--
                    <xsl:for-each select="./my:Chapter">
                  
                      <xsl:if test="string-length( normalize-space( . ) ) &gt; 0" >
                        <fo:list-item >
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
                              <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="@chapterNo" />
                            </fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
                              <xsl:value-of select="@chapterTitle" />
                            </fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                      </xsl:if>
          
                    </xsl:for-each>
                    -->
                  </fo:list-block>
                  
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>

    </fo:page-sequence>

  </xsl:template>
  
  <xsl:template match="my:Chapter" >
    <xsl:if test="string-length( normalize-space( @groupMarker ) )&gt; 0" >
      <fo:list-item>
        <fo:list-item-label><fo:block /></fo:list-item-label>
        <fo:list-item-body>
          <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
            <xsl:value-of select="@groupMarker" />
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>
    <fo:list-item >
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
          <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@chapterNo" />
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
          <xsl:value-of select="@chapterTitle" />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="my:Inclusion" >
    <xsl:if test="string-length( normalize-space( @groupMarker ) )&gt; 0" >
      <fo:list-item>
        <fo:list-item-label><fo:block /></fo:list-item-label>
        <fo:list-item-body>
          <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
            <xsl:value-of select="@groupMarker" />
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </xsl:if>
    <fo:list-item >
      <fo:list-item-label end-indent="label-end()">
        <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
          <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
          <xsl:text>.</xsl:text>
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @chapterNo ) ) = 0">
              <fo:inline color="red">?</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@chapterNo" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block xsl:use-attribute-sets="SectionTOCItemFont" line-height="22pt">
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( @chapterTitle ) ) = 0">
              <fo:inline color="red">Missing chapter title.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@chapterTitle" />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
    
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format"
                              xmlns:fox="http://xml.apache.org/fop/extensions"
                              xmlns:html="http://www.w3.org/1999/xhtml" 
                              >

  <xsl:include href="ChapterFonts.xsl" />

  <xsl:template name="ChapterTOC" >
  
    <xsl:param name="chapter" />
    
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
            <xsl:text>.</xsl:text>
            <xsl:value-of select="$chapter/my:ChapterNo" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="$chapter/my:ChapterTitle" />
          </xsl:attribute>
          <fo:table-column column-number="1" width="100%" />
          <fo:table-body>
            <fo:table-row height="{$chapter-page-content-height}" display-align="after">
              <fo:table-cell>
                <fo:block>
                
                  <!-- Annex Type -->
                  <xsl:if test="$chapter/@chapterType = $chapter-type-annex" >
                    <fo:block xsl:use-attribute-sets="TOCHeadingFont" >
                      <xsl:text>Annex</xsl:text>
                    </fo:block>
                  </xsl:if>

                  <fo:block xsl:use-attribute-sets="TOCHeadingFont" border-bottom="solid" space-after="10pt" >
                    <fo:list-block provisional-distance-between-starts="1.5cm">
                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block>
                            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
                            <xsl:text>.</xsl:text>
                            <xsl:value-of select="$chapter/my:ChapterNo" />
                          </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <xsl:choose>
                            <xsl:when test="$chapter/my:ChapterTitle[not(text())]" >
                              <fo:block color="red">Missing chapter title.</fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                              <fo:block>
                                <xsl:value-of select="$chapter/my:ChapterTitle" />
                              </fo:block>
                            </xsl:otherwise>
                          </xsl:choose>
                        </fo:list-item-body>
                      </fo:list-item>
                    </fo:list-block>
                  </fo:block>

                  <xsl:if test="$chapter/@chapterType = '4'">
                    <fo:block xsl:use-attribute-sets="TOCItemFont" >
                      This standard does not apply to domestic buildings
                    </fo:block>
                  </xsl:if>
                 
                  <fo:list-block provisional-distance-between-starts="1.5cm">
                  
                    <xsl:if test="$chapter/@chapterType = $chapter-type-functional-standard" >
          
                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block xsl:use-attribute-sets="TOCItemFont">
                            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
                            <xsl:text>.</xsl:text>
                            <xsl:value-of select="$chapter/my:ChapterNo" />
                          </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block xsl:use-attribute-sets="TOCItemFont">
                            Functional standard
                          </fo:block>
                        </fo:list-item-body>
                      </fo:list-item>
          
                    </xsl:if>
          
                    <xsl:for-each select="$chapter/my:Clause">
                  
                      <fo:list-item >
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block xsl:use-attribute-sets="TOCItemFont">
                            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:SectionNo" />
                            <xsl:text>.</xsl:text>
                            <xsl:value-of select="/my:Document/my:Handbook/my:Section/my:Chapter/my:ChapterNo" />
                            <xsl:text>.</xsl:text>
                            <xsl:value-of select="my:ClauseNo" />
                          </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block xsl:use-attribute-sets="TOCItemFont">
                            <xsl:choose>
                              <xsl:when test="string-length( normalize-space( my:ClauseTitle ) ) = 0" >
                                <fo:block color="red">
                                  Missing clause title.
                                </fo:block>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:apply-templates select="my:ClauseTitle" mode="TOC" />
                              </xsl:otherwise>
                            </xsl:choose>
                          </fo:block>
                        </fo:list-item-body>
                      </fo:list-item>
          
                    </xsl:for-each>
          
                  </fo:list-block>
                  
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>

    </fo:page-sequence>
    
  </xsl:template>
  
  <xsl:template match="my:ClauseTitle" mode="TOC" >
    <xsl:apply-templates mode="TOC" />
  </xsl:template>

  <xsl:template match="html:sub" mode="TOC" >
    <xsl:apply-templates select="." />
  </xsl:template>

  <xsl:template match="html:sup" mode="TOC" >
    <xsl:apply-templates select="." />
  </xsl:template>

  <xsl:template match="text()" mode="TOC" >
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>

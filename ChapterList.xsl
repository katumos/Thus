<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:my="http://www.sbsa.gov.uk/XMLSYS/Handbook#1"
                              xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:include href="ChapterFonts.xsl" />
  
  <xsl:variable name="list-label-body-distance" select="'0.5cm'" />
  <xsl:variable name="list-nested-indent" select="'0.5cm'" />
  
  <xsl:template match="my:List">
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
      <xsl:if test="$document-format = $document-format-normal" >
        <fo:table-column column-width="{$chapter-marginref-area-width}" />
      </xsl:if>
      <fo:table-column column-width="100%" />
      <fo:table-body>
        <xsl:apply-templates select="my:ListName" />
        <xsl:apply-templates select="my:ListItem" />
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:List" mode="in-cell">
    <fo:table table-layout="fixed" inline-progression-dimension.minimum="100%">
      <fo:table-column column-width="100%" />
      <fo:table-body>
        <xsl:apply-templates select="my:ListName" mode="in-cell" />
        <xsl:apply-templates select="my:ListItem" mode="in-cell" />
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="my:ListName" >
    <fo:table-row keep-with-next="always">
      <xsl:if test="$document-format = $document-format-normal">
        <fo:table-cell><fo:block /></fo:table-cell>
      </xsl:if>
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="ListNameFont" >
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing list caption.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="my:ListName" mode="in-cell" >
    <fo:table-row keep-with-next="always">
      <fo:table-cell>
        <fo:block xsl:use-attribute-sets="ListNameFont" >
          <xsl:choose>
            <xsl:when test="string-length( normalize-space( . ) ) = 0">
              <fo:inline color="red">Missing list caption.</fo:inline>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates />
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="my:ListItem" >
    <fo:table-row>
      <xsl:if test="$document-format = $document-format-normal">
        <fo:table-cell>
          <xsl:apply-templates select="my:MarginReferences/my:MarginReference" />
        </fo:table-cell>
      </xsl:if>
      <fo:table-cell>
        <fo:block>
          <fo:list-block provisional-distance-between-starts="{$list-label-body-distance}">
            <xsl:call-template name="ListItemText" >
              <xsl:with-param name="type" select="../@listType" />
              <xsl:with-param name="item" select="my:ListItemText" />
            </xsl:call-template>
          </fo:list-block>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="my:NestedList" />
  </xsl:template>
  
  <xsl:template match="my:ListItem" mode="in-cell">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>
          <fo:list-block provisional-distance-between-starts="{$list-label-body-distance}">
            <xsl:call-template name="ListItemText" >
              <xsl:with-param name="type" select="../@listType" />
              <xsl:with-param name="item" select="my:ListItemText" />
            </xsl:call-template>
          </fo:list-block>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="my:NestedList" mode="in-cell" />
  </xsl:template>
  
  <xsl:template match="my:NestedList" >
    <xsl:apply-templates select="my:ListName" />
    <xsl:apply-templates select="my:NestedListItem" />
  </xsl:template>
  
  <xsl:template match="my:NestedList" mode="in-cell" >
    <xsl:apply-templates select="my:ListName" mode="in-cell" />
    <xsl:apply-templates select="my:NestedListItem" mode="in-cell" />
  </xsl:template>
  
  <xsl:template match="my:NestedListItem" >
    <fo:table-row>
      <xsl:if test="$document-format = $document-format-normal">
        <fo:table-cell>
          <xsl:apply-templates select="my:MarginReferences/my:MarginReference" />
        </fo:table-cell>
      </xsl:if>
      <fo:table-cell>
        <fo:block>
          <fo:list-block provisional-distance-between-starts="{$list-label-body-distance}" start-indent="{$list-nested-indent}">
            <xsl:call-template name="ListItemText" >
              <xsl:with-param name="type" select="../@listType" />
              <xsl:with-param name="item" select="my:ListItemText" />
            </xsl:call-template>
          </fo:list-block>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="my:NestedListItem" mode="in-cell" >
    <fo:table-row>
      <fo:table-cell>
        <fo:block>
          <fo:list-block provisional-distance-between-starts="{$list-label-body-distance}" start-indent="{$list-nested-indent}">
            <xsl:call-template name="ListItemText" >
              <xsl:with-param name="type" select="../@listType" />
              <xsl:with-param name="item" select="my:ListItemText" />
            </xsl:call-template>
          </fo:list-block>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template name="ListItemText" >
    <xsl:param name="type" />
    <xsl:param name="item" />
      <fo:list-item>
        <fo:list-item-label end-indent="label-end()">
          <xsl:choose>
            <xsl:when test="$type = $list-type-bullet" >
              <fo:block xsl:use-attribute-sets="ListTypeBulletFont" >
                &#x2022;
              </fo:block>
            </xsl:when>
            <xsl:when test="$type = $list-type-numeric">
              <fo:block xsl:use-attribute-sets="ListTypeNumericFont" >
                <xsl:number format="1" />.
              </fo:block>
            </xsl:when>
            <xsl:when test="$type = $list-type-alphabetic">
              <fo:block xsl:use-attribute-sets="ListTypeAlphabeticFont" >
                <xsl:number format="a" />.
              </fo:block>
            </xsl:when>
            <xsl:when test="$type = $list-type-custom">
              <fo:block xsl:use-attribute-sets="ListTypeCustomFont" >
                <xsl:number format="i" />
              </fo:block>
            </xsl:when>
            <xsl:otherwise>
              <fo:block />
            </xsl:otherwise>
          </xsl:choose>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
          <fo:block xsl:use-attribute-sets="ListItemFont" >
            <xsl:choose>
              <xsl:when test="string-length( normalize-space( $item ) ) = 0">
                <fo:inline color="red">Missing Item.</fo:inline>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="$item" />
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
  </xsl:template>
  
</xsl:stylesheet>

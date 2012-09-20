<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:std="http://www.concept.co.uk/std" >

  <xsl:template name="std:ToLower" >
    <xsl:param name="text" />
    <xsl:value-of select="translate( $text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz' )" />
  </xsl:template>

  <xsl:template name="std:ToUpper" >
    <xsl:param name="text" />
    <xsl:value-of select="translate( $text, 'abcdefghijklmonpqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' )" />
  </xsl:template>
  
  <xsl:template name="std:URL" >
    <xsl:param name="url" />
    <xsl:choose>
      <xsl:when test="contains( $url, '/' )">
        <xsl:variable name="before" select="substring-before( $url,'/' )" />
        <xsl:variable name="after" select="substring-after( $url, '/' )" />
        <xsl:value-of select="$before" />
        &#x2f;
        <xsl:if test="string-length( $after ) &gt; 0" >
          &#x200B;
          <xsl:call-template name="std:URL" >
            <xsl:with-param name="url" select="$after" />
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$url" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet> 

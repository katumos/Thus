<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

  <!--

    Formatting Variables

  -->

  <!-- Handbook Types -->
  <xsl:variable name="handbook-type-domestic" select="0" />
  <xsl:variable name="handbook-type-non-domestic" select="1" />
  
  <!-- Document Format Types -->
  <xsl:variable name="document-format-normal" select="0" />
  <xsl:variable name="document-format-wide" select="1" />
  
  <!-- Chapter Types -->
  <xsl:variable name="chapter-type-introduction" select="0" />
  <xsl:variable name="chapter-type-functional-standard" select="1" />
  <xsl:variable name="chapter-type-regulation" select="2" />
  <xsl:variable name="chapter-type-annex" select="3" />
  
  <!-- Margin Reference Types -->
  <xsl:variable name="margin-reference-type-heading" select="0" />
  <xsl:variable name="margin-reference-type-url" select="1" />
  
  <!-- List Types -->
  <xsl:variable name="list-type-bullet" select="0" />
  <xsl:variable name="list-type-numeric" select="1" />
  <xsl:variable name="list-type-alphabetic" select="2" />
  <xsl:variable name="list-type-custom" select="3" />
  
  <!-- Graphic Format Types -->
  <xsl:variable name="graphic-format-normal" select="0" />
  <xsl:variable name="graphic-format-wide" select="1" />
  
  <!-- Graphic Alignment Styles -->
  <xsl:variable name="graphic-align-left" select="0" />
  <xsl:variable name="graphic-align-centre" select="1" />
  <xsl:variable name="graphic-align-right" select="2" />
  <xsl:variable name="graphic-align-top" select="0" />
  <xsl:variable name="graphic-align-middle" select="1" />
  <xsl:variable name="graphic-align-bottom" select="2" />
  
  <!-- Table Format Types -->
  <xsl:variable name="table-format-normal" select="0" />
  <xsl:variable name="table-format-wide" select="1" />
  
</xsl:stylesheet>

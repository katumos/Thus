<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

  <!-- 

      Common Fonts

   -->
   
  <xsl:attribute-set name="PageHeaderFont">
    <xsl:attribute name="font-family">Times</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="PageFooterFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="NormalHeadingFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="TOCHeadingFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="TOCItemFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="SectionTOCHeadingFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="SectionTOCItemFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="HandbookTOCHeadingFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="HandbookTOCItemFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="LogoNormalFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="LogoLargeFont">
    <xsl:attribute name="font-family">Arial Rounded MT Bold</xsl:attribute>
    <xsl:attribute name="font-size">36pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="FunctionalStandardFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">justify</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="FunctionalStandardConditionFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="FunctionalStandardLimitationFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="RegulationFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="RegulationCriteriaFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ClauseTitleFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ParagraphHeaderFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ParagraphFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="text-align">justify</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="MarginRefFont">
    <xsl:attribute name="font-family">Times</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ListNameFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ListTypeBulletFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="line-height">100%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ListTypeNumericFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ListTypeAlphabeticFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ListTypeCustomFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="ListItemFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="TableNoteFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="TableNoteItemFont">
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="line-height">105%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="GraphicCaptionFont">
    <xsl:attribute name="font-family">Comic Sans MS</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>

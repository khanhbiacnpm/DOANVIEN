<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/pages">
    <table>
      <tr>
        <xsl:apply-templates select="page0"></xsl:apply-templates>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="page0">
    <td class="cssMenu0">
      <xsl:attribute name="onmouseover">_showElement('mnu<xsl:value-of select="TabID"/>')</xsl:attribute>
      <xsl:attribute name="onmouseout">_hideElement('mnu<xsl:value-of select="TabID"/>')</xsl:attribute>
      <div>
        <a>
          <xsl:attribute name="href"><xsl:value-of select="TabName"/>.aspx</xsl:attribute>
          <xsl:attribute cssClass="selecte"><xsl:value-of select="Select"/></xsl:attribute>
          <xsl:if test="Title=''"><xsl:value-of select="TabName"/></xsl:if>
          <xsl:if test="Title!=''"><xsl:value-of select="Title"/></xsl:if>
        </a>
      </div>
      <div style="display:none;position: absolute;background-color:#fff;">
        <xsl:attribute name="id">mnu<xsl:value-of select="TabID"/></xsl:attribute>
        <table style="border:1px solid #ccc;">
          <xsl:apply-templates select="child/page1"></xsl:apply-templates>
        </table>
      </div>
    </td>
  </xsl:template>

  <xsl:template match="page1">
    <tr>
      <td class="cssMenu1" onmouseover="this.className='cssMenu1Sel'" onmouseout="this.className='cssMenu1'">
        <a>
          <xsl:attribute name="href"><xsl:value-of select="TabName"/>.aspx</xsl:attribute>
          <xsl:if test="Title=''"><xsl:value-of select="TabName"/></xsl:if>
          <xsl:if test="Title!=''"><xsl:value-of select="Title"/></xsl:if>
        </a>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
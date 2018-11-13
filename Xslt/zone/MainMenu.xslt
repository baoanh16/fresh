<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <nav class="main-menu">
      <div class="menuoverlay"></div>
      <ul class="menulink">
        <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
      </ul>
    </nav>
  </xsl:template>

  <xsl:template match="Zone">
    <li>
      <xsl:if test="count(Zone) > 0">
        <xsl:if test="ZoneId != 95">
          <xsl:attribute name="class">
            <xsl:text>hassub</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="ZoneId = 95">
          <xsl:attribute name="class">
            <xsl:text>hassub hasmega</xsl:text>
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
      <a class="hvr-underline-from-center">
        <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>hvr-underline-from-center active</xsl:text>
        </xsl:attribute>
      </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
      <xsl:if test="count(Zone) > 0">
        <xsl:if test="ZoneId != 95">
          <div class="btn-showsub"></div>
          <div class="sub">
            <ul>
              <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
            </ul>
          </div>
        </xsl:if>
        <xsl:if test="ZoneId = 95">
          <div class="btn-showsub"></div>
          <div class="sub mega">
            <ul>
              <xsl:apply-templates select="Zone" mode="Product"></xsl:apply-templates>
            </ul>
          </div>
        </xsl:if>
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="Zone" mode="Child">
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>
  <xsl:template match="Zone" mode="Product">
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
      <xsl:if test="count(Zone) > 0">
        <xsl:if test="ZoneId != 99">
          <div class="btn-showmega"></div>
          <div class="submega">
            <ul>
              <xsl:apply-templates select="Zone" mode="ProductChild"></xsl:apply-templates>
            </ul>
          </div>
        </xsl:if>
        <xsl:if test="ZoneId = 99">
          <div class="btn-showmega"></div>
          <div class="submega">
            <ul>
              <xsl:apply-templates select="Zone" mode="ProductChild2"></xsl:apply-templates>
            </ul>
          </div>
        </xsl:if>
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="Zone" mode="ProductChild">
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>
  <xsl:template match="Zone" mode="ProductChild2">
    <xsl:if test ="(position() mod 6) = 1">
      <xsl:text disable-output-escaping="yes">&lt;div class='menu-col' &gt;</xsl:text>
    </xsl:if>
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
    <xsl:if test ="(position() mod 6) = 0">
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
    <xsl:if test ="position()=last()">
      <xsl:if test ="last() mod 6 != 0">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
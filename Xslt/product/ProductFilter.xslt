<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="banner filter-banner">
      <div class="step-number">
        <ul class="filter-steps list-inline">
          <xsl:apply-templates select="/ProductFilter/Group" mode="Step"></xsl:apply-templates>
          <li class="list-inline-item item item-result">
            <a href="javascript:void();">
              <xsl:text>Kết quả</xsl:text>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="content">
      <div class="container filter-groups">
        <xsl:apply-templates select="/ProductFilter/Group" mode="Main"></xsl:apply-templates>
        <div class="ajaxresponseresults" style="display:none"></div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Group" mode="Step">
    <li class="list-inline-item item">
      <xsl:if test="position()=1">
        <xsl:attribute name="class">
          <xsl:text>list-inline-item item active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a href="javascript:void();">
        <xsl:value-of select="position()"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="Group" mode="Main">
    <div class="filter-group">
      <xsl:if test="position()>1">
        <xsl:attribute name="style">
          <xsl:text>display:none</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <div class="filter-title row">
        <div class="col">
          <h1>
            <xsl:value-of select="Title"></xsl:value-of>
          </h1>
        </div>
      </div>
      <div class="product-options row selection">
        <xsl:apply-templates select="Option"></xsl:apply-templates>
      </div>
      <div class="button">
        <a class="ajaxfilternext disabled btn btn-primary btn-more" href="#">
          <xsl:text>Tiếp tục</xsl:text>
          <span class="lnr lnr-arrow-right"></span>
        </a>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Option">
    <div class="col-md-6">
      <a class="filter-option" href="#">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>filter-option active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="data-id">
          <xsl:value-of select="OptionId"></xsl:value-of>
        </xsl:attribute>
        <div class="item">
          <figure>
            <div class="img-block">
              <xsl:if test="Color!=''">
                <img class="img-fluid">
                  <xsl:attribute name="src">
                    <xsl:value-of select="Color"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </xsl:if>
            </div>
            <figcaption>
              <span>
                <xsl:value-of select="Title"></xsl:value-of>
              </span>
            </figcaption>
          </figure>
        </div>
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>
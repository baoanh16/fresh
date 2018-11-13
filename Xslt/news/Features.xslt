<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<section class="about-2">
			<article>
				<div class="container">
					<div class="row">
						<h2>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
					</div>
				</div>
			</article>
		</section>
	</xsl:template>
	<xsl:template match="NewsImages">
		<xsl:if test="position()=1">
			<div class="col-12 text-center d-none d-sm-block">
				<div class="img-pc">
					<img class="img-fluid">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>

			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-12 text-center d-block d-sm-none"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="img-mobile">
				<img class="img-fluid">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
		<xsl:if test="position()=3">
			<div class="img-mobile">
				<img class="img-fluid">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
		<xsl:if test="position()=4">
			<div class="img-mobile">
				<img class="img-fluid">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
		<xsl:if test="position()=5">
			<div class="img-mobile">
				<img class="img-fluid">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
		<xsl:if test="position()=6">
			<div class="img-mobile pr-4">
				<img class="img-fluid">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
		<xsl:if test="position()=6">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>

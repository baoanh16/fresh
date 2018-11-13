<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="row justify-content-center">
			<div class="feedback owl-carousel owl-theme">
				<xsl:apply-templates select="News"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-9 item">
			<figure>
				<div class="img-block">
					<xsl:attribute name="bg-img">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
				</div>
				<figcaption>
						<h3><xsl:value-of select="Title"></xsl:value-of></h3><span><xsl:value-of select="SubTitle"></xsl:value-of></span>
						<h4><xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of></h4>
						<p><xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of></p>
					  </figcaption>
			</figure>
		</div>
	</xsl:template>

</xsl:stylesheet>

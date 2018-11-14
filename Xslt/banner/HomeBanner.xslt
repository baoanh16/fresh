<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="home-banner">
			<article class="swiper-container list-items">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
				</div>
				<div class="swiper-pagination"></div>
				<i class="swiper-button-next mdi mdi-chevron-right"></i>
				<i class="swiper-button-prev mdi mdi-chevron-left"></i>
			</article>
		</section>
	</xsl:template>


	<xsl:template match="Banner">
		<a class="swiper-slide">
			<xsl:attribute name="bg-img">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
		</a>
	</xsl:template>
</xsl:stylesheet>

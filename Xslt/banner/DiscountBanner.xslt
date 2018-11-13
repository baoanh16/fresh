<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="page-banner">
			<article class="swiper-container list-items">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
				</div>
				<i class="swiper-button-next mdi mdi-chevron-right"></i>
				<i class="swiper-button-prev mdi mdi-chevron-left"></i>
			</article>
		</section>
	</xsl:template>


	<xsl:template match="Banner">
		<a class="swiper-slide" href="#">
			<img class="img-fluid" src="./img/fresh/home/home_saleoff.png">
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			</img>
			<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
			<span class="btn btn-primary btn-buy">Đặt
				hàng<em class="lnr lnr-arrow-right"></em></span>
			</a>
	</xsl:template>
</xsl:stylesheet>

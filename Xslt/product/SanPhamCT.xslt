<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="canhcam-product-detail-1">
			<article>
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<xsl:apply-templates select="/ProductDetail/ProductImages"></xsl:apply-templates>
							
								<!-- <img>
								<xsl:attribute name="src">
									<xsl:value-of select="/ProductDetail/ImageUrl"></xsl:value-of> 
								</xsl:attribute>
								</img> -->
							<!-- </div> -->
						</div>
						<div class="col-lg-7">
							<div class="info">
								<h2>
									<xsl:value-of select="/ProductDetail/SubTitle"></xsl:value-of>
									<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>

								<xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
								<a class="btn btn-primary buy" href="#">
									Mua ngay
									<xsl:value-of select="/ProductDetail/Buy" />
									<span class="lnr lnr-arrow-right"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<section class="nav-product-detail">
			<article>
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<h2> <span>Thông tin </span>sản phẩm</h2>
							<div class="menu">
								<a class="toggle" href="#">
									Danh mục<span class="fa fa-caret-down"></span>
								</a>
								<ul class="list-inline nav nav-tabs">
									<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="Nav"> </xsl:apply-templates>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<section class="canhcam-product-detail-2">
			<article>
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="tab-content">
								<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="Content"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Nav">
		<li class="list-inline-item">
			<xsl:attribute name="class">
				<xsl:text>list-inline-item active</xsl:text>
			</xsl:attribute>
			<a class="nav-link" data-toggle="tab">
				<xsl:if test="position() =1">
					<xsl:attribute name="class">
						<xsl:text>nav-link active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:text>#detail-</xsl:text>
					<xsl:value-of select="position()"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Content">
		<div class="tab-pane fade">
			<xsl:if test="position() =1">
				<xsl:attribute name="class">
					<xsl:text>tab-pane fade show active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text>detail-</xsl:text>
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>

	<xsl:template match="ProductImages">
		<div class="img-block">
		<img>
		<xsl:attribute name="src">
			<xsl:value-of select="ImageUrl"></xsl:value-of>
		</xsl:attribute>
		</img></div>
	</xsl:template>
</xsl:stylesheet>

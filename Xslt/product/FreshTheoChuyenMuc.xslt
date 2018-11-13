<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="nav-product">
			<article>
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<div class="menu"><a class="toggle" href="#">Danh mục<span class="fa fa-caret-down"></span></a>
								<ul class="list-inline nav nav-tabs">
									<li class="list-inline-item">
										<a data-toggle="tab" href="#product-99"> Tất cả
										</a>
									</li>
									<xsl:apply-templates select="/ZoneList/Zone" mode="Nav" />
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<section class="canhcam-product">
			<article>
				<div class="container">
					<div class="tab-content">
						<div class="tab-pane fade" id="product-99">
							<div class="row justify-content-center">
								<xsl:apply-templates select="/ZoneList/Zone" mode="All" />
							</div>
							<div class="row">
								<div class="more">
									<a class="btn btn-primary" href="javascript:void(0)">
										<xsl:value-of select="/BannerList/ViewMore"></xsl:value-of>
										<span>Xem thêm
											<em>(15 sản phẩm)</em>
										</span>
										<span class="lnr lnr-arrow-right"></span>

									</a>
								</div>
							</div>

						</div>
						<xsl:apply-templates select="/ZoneList/Zone" mode="Content" />

					</div>
				</div>
			</article>
		</section>

	</xsl:template>

	<xsl:template match="Zone" mode="All">
		<xsl:apply-templates select="Product" />
	</xsl:template>

	<xsl:template match="Zone" mode="Nav">
		<li class="list-inline-item">
			<a data-toggle="tab">
				<xsl:if test="position() =1">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:text>#product-</xsl:text>
					<xsl:value-of select="position()"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="Content">
		<div class="tab-pane fade">
			<xsl:if test="position() =1">
				<xsl:attribute name="class">
					<xsl:text>tab-pane fade active show</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text>product-</xsl:text>
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:attribute>
			<div class="row justify-content-center">
				<xsl:apply-templates select="Product" />
			</div>
			<div class="row">
				<div class="more">
					<a class="btn btn-primary">
						<xsl:attribute name="href">
							<xsl:value-of select="/BannerList/ViewMore"></xsl:value-of>
						</xsl:attribute>

						<span>Xem thêm
							<em>(15 sản phẩm)</em>
						</span>
						<span class="lnr lnr-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Product">
		<div class="col-md-6 col-lg-4 item">
			<figure class="figure">
				<div class="img-block">
					<img class="img-fluid" alt="">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<figcaption class="figcaption">
					<h4>
						<xsl:value-of select="SubTitle"></xsl:value-of>
					</h4>
					<p>
						<xsl:value-of select="BriefContent"></xsl:value-of>
					</p>
					<a class="btn btn-primary">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>Chi tiết<em class="lnr lnr-arrow-right"></em>
					</a>
				</figcaption>
				<a class="link" href="#">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
				</a>
			</figure>
			<h3>
				<xsl:value-of select="Title"></xsl:value-of>
			</h3>
		</div>
	</xsl:template>

</xsl:stylesheet>

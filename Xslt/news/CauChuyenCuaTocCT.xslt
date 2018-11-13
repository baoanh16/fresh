<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
	<section class="canhcam-news-details-1">
			<article class="news-details">
			  <div class="container">
				<div class="row">
				  <div class="col-lg-9">
					<div class="news-read">
					  <h1><xsl:value-of select="/NewsDetail/Title"></xsl:value-of></h1>
					  <div class="social-networks nav">
						<div class="nav-item">
						  <div class="fb-like" data-action="like" data-href="" data-layout="button_count" data-share="true" data-show-faces="false" data-width="520"></div>
						</div>
					  </div>
					  <p class="lead">
						  <xsl:value-of select="/NewsDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</p>
					  <div class="content">
						  <p>
							<xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of></p>
					  </div>
					  <div class="social-networks nav">
						<div class="nav-item">
						  <div class="fb-share-button" data-href="" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="">Chia sẻ</a></div>
						</div>
						<div class="nav-item">
						  <div class="fb-like" data-action="like" data-href="" data-layout="button_count" data-share="false" data-show-faces="false" data-width="520"></div>
						</div>
					  </div>
					</div>
				  </div>
						<div class="col-lg-3">
							<div class="othernews" data-fix="80" data-fix-type="initial" data-fix-change="sticky">
								<h2 class="section-title">
									<xsl:value-of select="/NewsDetail/NewsOtherText"></xsl:value-of>
								</h2>
								<div class="lists">
									<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</xsl:template>

	<xsl:template match="NewsOther">
		<!--item-->
		<a class="item">
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<figure>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
				<figcaption>
					<h3>
						<xsl:value-of select="Title"></xsl:value-of>
					</h3>
				</figcaption>
			</figure>
		</a>
	</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<xsl:if test="position() = 1 ">
			<xsl:text disable-output-escaping="yes">&lt;article class="news-hot"&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;div class="container"&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;div class="row"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position() = 1 ">
			<div class="col-lg-8 top-list">
				<a class="item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure class="figure">
						<img class="img-fluid">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						</img>
						<figcaption>
							<h3>
								<xsl:value-of select="Title"></xsl:value-of>
							</h3>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>
		<xsl:if test="position() = 2 ">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-4 part-list"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position() = 2">
			<a class="item">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<figure class="row">
					<div class="img-block col-6 col-lg-8">
						<img class="img-fluid">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<figcaption class="col-6 col-lg-4">
						<h3><xsl:value-of select="Title"></xsl:value-of></h3>
					</figcaption>
				</figure>
			</a>
		</xsl:if>
		<xsl:if test="position() = 3">
				<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<figure class="row">
							<div class="img-block col-6 col-lg-8">
								<img class="img-fluid">
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption class="col-6 col-lg-4">
								<h3><xsl:value-of select="Title"></xsl:value-of></h3>
							</figcaption>
						</figure>
					</a>
		</xsl:if>
		<xsl:if test="position() = 4">
				<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<figure class="row">
							<div class="img-block col-6 col-lg-8">
								<img class="img-fluid">
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption class="col-6 col-lg-4">
								<h3><xsl:value-of select="Title"></xsl:value-of></h3>
							</figcaption>
						</figure>
					</a>
		</xsl:if>
		<xsl:if test="position() = 4 ">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/article&gt;</xsl:text>
		</xsl:if>



		<xsl:if test="position() = 5 ">
				<xsl:text disable-output-escaping="yes">&lt;article class="news-list"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;div class="container"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;div class="row"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position() > 4 ">
			<div class="col-sm-6 col-lg-4">
					<a class="item">
							<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
							<figure>
									<img class="img-fluid">
									<xsl:attribute name="src">
										<xsl:value-of select="ImageUrl"></xsl:value-of>
									</xsl:attribute>
									</img>
								<figcaption>
									<h3><xsl:value-of select="Title"></xsl:value-of></h3>
									<p>
										<time><xsl:value-of select="CreatedDate"></xsl:value-of></time><span>Chi tiết<em class="lnr lnr-arrow-right"></em></span>
									</p>
								</figcaption>
							</figure>
						</a>
			</div>
		</xsl:if>
		<xsl:if test="position() = 10 ">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;/article&gt;</xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

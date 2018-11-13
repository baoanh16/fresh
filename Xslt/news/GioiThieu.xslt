<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<xsl:if test="position() = 1 ">
			<section class="about-1">
				<article>
					<div class="container">
						<div class="row">
							<h2>
								<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							</h2>
							<div class="col-lg-6 text-center text-lg-right">
								<div class="img">
									<img class="img-fluid">
									<xsl:attribute name="src">
										<xsl:value-of select="ImageUrl"></xsl:value-of>
									</xsl:attribute>
									</img>
								</div>
							</div>
							<div class="col-lg-6">
									<div class="text">
										<p><xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of></p>
									</div>
								</div>
							</div>
						</div>
					</article>
				</section>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>

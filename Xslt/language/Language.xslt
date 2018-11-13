<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<ul class="list-inline mb-0" k-menu-map-to="#language">
			<li class="list-inline-item"><span>Ngôn ngữ </span></li>
			<xsl:apply-templates select="/LanguageList/Language"></xsl:apply-templates>
		</ul>
	</xsl:template>


	<xsl:template match="Language">
		<li class="list-inline-item">
			<xsl:if test="IsActive='true'">
			<xsl:attribute name="class">
					<xsl:text>list-inline-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
			
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>

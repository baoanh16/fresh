<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="canhcam-shop section-with-line">
			<article>
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<input type="hidden" id="hdnDealerLocatorSiteId">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdnDealerLocatorLanguageId">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdfDealerLocatorSelectCountry">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdfDealerLocatorSelectProvince">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdfDealerLocatorSelectDistrict">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdfDealerLocatorSelectZone">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
							</xsl:attribute>
							</input>
							<input type="hidden" id="hdfDealerLocatorCulture">
							<xsl:attribute name="value">
								<xsl:value-of select="/DealerList/Culture"></xsl:value-of>
							</xsl:attribute>
							</input>
							<h2> <span>Hệ thống </span>cửa hàng</h2>
							<ul class="list-inline">
								<li class="list-inline-item" style="display:none">
									<div class="select-box field form_desc">
										<select id="ddlCountry"></select>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="select-box field form_desc">
										<select id="ddlProvince">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
												</xsl:attribute>
											</option>
										</select>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="select-box field form_desc">
										<select id="ddlDistrict">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
												</xsl:attribute>
											</option>
										</select>
									</div>
								</li>
								<li class="list-inline-item" style="display:none">
									<div class="select-box field form_desc">
										<select id="ddlZone">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
												</xsl:attribute>
											</option>
										</select>
									</div>
								</li>
							</ul>
						</div>
						<div class="d-none">
							<div class="searh-text">
							  <label>
								<xsl:value-of select="/DealerList/OrText"></xsl:value-of>
							  </label>
							  <input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
								<xsl:attribute name="placeholder">
								  <xsl:value-of select="/DealerList/EnterLocationText"></xsl:value-of>
								</xsl:attribute>
							  </input>
							  <input type="submit" id="edit-submit" class="btn btn-large btn-primary">
								<xsl:attribute name="value">
								  <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
								</xsl:attribute>
							  </input>
							</div>
						</div>
					  
					</div>
				</div>
			</article>
			<article>
				<div class="container-fluid pr-0">
					<div class="row no-gutters">
						<div class="col-lg-6 col-xl-5 offset-xl-1 pr-3 pl-5">
              <div id="ajax_msg" class="locate mrb15"></div>
							<div class="shop-list">
								<ul class="list-unstyled list_system" style="display:block" id="list">
									<li>
										<xsl:value-of select="txtAddress" disable-output-escaping="yes"></xsl:value-of>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="map">
								<input type="hidden" id="distance" name="distance" value="1" />
								<div id="map_canvas" class="map_system">
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
    
	</xsl:template>
</xsl:stylesheet>

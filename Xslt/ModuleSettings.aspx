<%@ Page CodeBehind="ModuleSettings.aspx.cs" MaintainScrollPositionOnPostback="true"
    Language="c#" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false"
    Inherits="CanhCam.Web.AdminUI.ModuleSettingsPage" EnableEventValidation="false" %>

<%@ Register TagPrefix="portal" TagName="PublishType" Src="~/Controls/PublishTypeSetting.ascx" %>
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <div class="admin-content col-md-12">
        <asp:UpdatePanel ID="upButton" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <portal:HeadingPanel ID="heading" runat="server">
                    <asp:Button SkinID="SaveButton" ID="btnSave" runat="server" ValidationGroup="ModuleSettings" />
                    <asp:HyperLink SkinID="DefaultButton" ID="lnkEditContent" runat="server" Visible="false"
                        EnableViewState="false" />
                    <asp:HyperLink SkinID="DefaultButton" ID="lnkPublishing" runat="server" Visible="false"
                        EnableViewState="false" />
                    <asp:HyperLink SkinID="CancelButton" ID="lnkCancel" runat="server" />
                    <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" CausesValidation="false" />
                    <asp:Button SkinID="DeleteButton" ID="btnDeleteLanguage" Visible="false" OnClick="btnDeleteLanguage_Click" Text="<%$Resources:Resource, DeleteLanguageButton %>" runat="server" CausesValidation="false" />
                </portal:HeadingPanel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="divtabs" class="workplace tabs">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active" id="liFeatureSpecificSettings" runat="server">
                    <asp:Literal ID="litFeatureSpecificSettingsTab" runat="server" EnableViewState="false" /></li>
                <li role="presentation" id="liGeneralSettings" runat="server">
                    <asp:Literal ID="litGeneralSettingsTabLink" runat="server" EnableViewState="false" /></li>
                <li role="presentation" id="liSecurity" runat="server">
                    <asp:Literal ID="litSecurityLink" runat="server" /></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="tabFeatureSpecificSettings" runat="server">
                    <div class="form-horizontal">
                        <div class="settingrow form-group" id="divWebParts" runat="server" visible="false">
                            <gb:SiteLabel ID="lblWebParts" runat="server" ForControl="ddWebParts" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="WebPartModuleWebPartSetting" EnableViewState="false" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddWebParts" runat="server" DataValueField="WebPartID" DataTextField="ClassName">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:Panel ID="pnlcustomSettings" runat="server">
                        </asp:Panel>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tabGeneralSettings" runat="server">
                    <div class="form-horizontal">
                        <div class="settingrow form-group" visible="false" runat="server">
                            <gb:SiteLabel ID="lblFeatureNameLabel" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="ModuleSettingsFeatureNameLabel"
                                UseLabelTag="false" />
                            <div class="col-sm-9">
                                <asp:Label ID="lblFeatureName" runat="server" EnableViewState="false" CssClass="forminput" />
                            </div>
                        </div>
                        <div class="settingrow form-group" visible="false" runat="server">
                            <gb:SiteLabel ID="lblInstanceId" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="InstanceId"
                                UseLabelTag="false" />
                            <div class="col-sm-9">
                                <asp:Label ID="lblModuleId" runat="server" EnableViewState="false" CssClass="forminput" />
                            </div>
                        </div>
                        <div id="divCacheTimeout" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblCacheTime" runat="server" ForControl="cacheTime" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsCacheTimeLabel" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="cacheTime" runat="server" MaxLength="8" Text="0" EnableViewState="false"
                                    CssClass="forminput smalltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqCacheTime" runat="server" Display="Dynamic" ValidationGroup="ModuleSettings"
                                    ControlToValidate="cacheTime" Enabled="false" EnableViewState="false"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexCacheTime" runat="server" Display="Dynamic"
                                    ValidationGroup="ModuleSettings" ControlToValidate="cacheTime" ValidationExpression="^[0-9][0-9]{0,8}$"
                                    EnableViewState="false" />
                            </div>
                        </div>
                        <div class="settingrow form-group" id="divParentPage" runat="server" visible="false">
                            <gb:SiteLabel ID="lblParentPage" runat="server" ForControl="ddPages" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="PageLayoutParentPageLabel" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddPages" runat="server" EnableTheming="false" DataTextField="PageName"
                                    DataValueField="PageID" CssClass="forminput">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div id="divTitleElement" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblTitleElement" runat="server" ForControl="txtTitleElement" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsTitleElement" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtTitleElement" runat="server" EnableViewState="false" CssClass="forminput smalltextbox"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divPublishMode" class="settingrow form-group" visible="false" runat="server">
                            <gb:SiteLabel ID="lblPublishMode" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="PublishMode" />
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <portal:PublishType ID="publishType" runat="server" />
                                    <portal:gbHelpLink ID="gbHelpLink38" runat="server" HelpKey="module-settings-publish-mode-help" />
                                </div>
                            </div>
                        </div>
                        <div id="divXsltFile" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblXsltFile" runat="server" ForControl="txtXsltFile" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="XsltFileName" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtXsltFile" MaxLength="255" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divCssClass" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblCssClass" runat="server" ForControl="txtCssClass" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsCssClassLabel" />
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <asp:TextBox ID="txtCssClass" MaxLength="50" runat="server" EnableViewState="false"
                                        CssClass="forminput widetextbox"></asp:TextBox>
                                    <portal:gbHelpLink ID="GbHelpLink1" runat="server" HelpKey="custom-module-css-class-help" />
                                </div>
                            </div>
                        </div>
                        <div id="divWrapperTop" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblWrapperTop" runat="server" ForControl="txtWrapperTop" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsWrapperTopLabel" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtWrapperTop" MaxLength="255" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divWrapperBottom" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblWrapperBottom" runat="server" ForControl="txtWrapperBottom" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsWrapperBottomLabel" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtWrapperBottom" MaxLength="255" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divResourceFile" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblResourceFile" runat="server" ForControl="txtResourceFile" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleDefinitionsResourceFileLabel" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtResourceFile" MaxLength="255" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divResourceKey" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="lblResourceKey" runat="server" ForControl="txtResourceKey" ConfigKey="ModuleSettingsResourceKeyLabel"
                                CssClass="settinglabel control-label col-sm-3" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtResourceKey" runat="server" MaxLength="255" EnableViewState="false" CssClass="forminput" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="lblShowTitle" runat="server" ForControl="chkShowTitle" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsShowTitleLabel" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkShowTitle" runat="server" EnableViewState="false" CssClass="forminput">
                                </asp:CheckBox>
                            </div>
                        </div>
                        <div id="divIncludeInSearch" runat="server" visible="false" class="settingrow form-group">
                            <gb:SiteLabel ID="SiteLabel12" runat="server" ForControl="chkIncludeInSearch" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="IncludeInSearchSetting" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkIncludeInSearch" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:CheckBox>
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="SiteLabel6" runat="server" ForControl="chkHideFromAuth" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsHideFromAuthenticatedLabel" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkHideFromAuth" runat="server" EnableViewState="false" CssClass="forminput">
                                </asp:CheckBox>
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="SiteLabel7" runat="server" ForControl="chkHideFromUnauth" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsHideFromUnauthenticatedLabel" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkHideFromUnauth" runat="server" EnableViewState="false" CssClass="forminput">
                                </asp:CheckBox>
                            </div>
                        </div>
                        <%--<div id="divMyPage" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="SiteLabel2" runat="server" ForControl="chkAvailableForMyPage" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsAvailableForMyPageLabel" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkAvailableForMyPage" runat="server" EnableViewState="false" CssClass="forminput">
                                </asp:CheckBox>
                            </div>
                        </div>
                        <div id="divMyPageMulti" runat="server" class="settingrow form-group">
                            <gb:SiteLabel ID="SiteLabel3" runat="server" CssClass="settinglabel control-label col-sm-3" ForControl="chkAllowMultipleInstancesOnMyPage"
                                ConfigKey="ModuleSettingsAllowMultipleInstancesOnMyPageLabel" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkAllowMultipleInstancesOnMyPage" runat="server" EnableViewState="false"
                                    CssClass="forminput"></asp:CheckBox>
                            </div>
                        </div>--%>
                        <div class="settingrow form-group" visible="false" runat="server">
                            <gb:SiteLabel ID="lblIcon" runat="server" ForControl="ddIcons" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsIconLabel" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddIcons" runat="server" EnableTheming="false" DataValueField="Name"
                                    DataTextField="Name" CssClass="forminput">
                                </asp:DropDownList>
                                <img id="imgIcon" alt="" src="" runat="server" />
                            </div>
                        </div>
                        <asp:UpdatePanel ID="up" runat="server">
                            <ContentTemplate>
                                <telerik:RadTabStrip ID="tabLanguage" OnTabClick="tabLanguage_TabClick" 
                                    EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" 
                                    CssClass="subtabs" SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="lblModuleName" runat="server" ForControl="moduleTitle" CssClass="settinglabel control-label col-sm-3"
                                        ConfigKey="ModuleSettingsModuleNameLabel" />
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="moduleTitle" MaxLength="255" runat="server" EnableViewState="false"
                                            CssClass="forminput widetextbox"></asp:TextBox>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tabSecurity" runat="server">
                    <div class="form-horizontal">
                        <div id="divIsGlobal" runat="server" visible="false" class="settingrow form-group">
                            <gb:SiteLabel ID="lblIsGlobal" runat="server" ForControl="chkIsGlobal" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsIsGlobal" />
                            <div class="col-sm-9">
                                <asp:CheckBox ID="chkIsGlobal" runat="server" EnableViewState="false" CssClass="forminput" />
                                <portal:gbHelpLink ID="gbHelpLink2" runat="server" RenderWrapper="false" HelpKey="modulesettings-isglobal-help" />
                            </div>
                        </div>
                        <div id="divRoles" runat="server">
                            <div class="accordion">
                                <h3 id="h3ViewRoles" runat="server">
                                    <gb:SiteLabel ID="lblAuthorizedRoles" runat="server" ConfigKey="ModuleSettingsViewRolesLabel"
                                        UseLabelTag="false" />
                                </h3>
                                <div id="divViewRoles" runat="server">
                                    <asp:RadioButton ID="rbViewAdminOnly" runat="server" GroupName="rdoviewroles" CssClass="rbroles rbadminonly" />
                                    <div>
                                        <asp:RadioButton ID="rbViewUseRoles" runat="server" GroupName="rdoviewroles" CssClass="rbroles" />
                                    </div>
                                    <asp:CheckBoxList ID="cblViewRoles" runat="server"></asp:CheckBoxList>
                                </div>
                                <h3 id="h1" visible="false" runat="server">
                                    <gb:SiteLabel ID="SiteLabel8" runat="server" ConfigKey="ModuleSettingsEditRolesLabel"
                                        UseLabelTag="false" />
                                </h3>
                                <div visible="false" runat="server">
                                    <asp:RadioButton ID="rbEditAdminsOnly" runat="server" GroupName="rdoeditroles" CssClass="rbroles rbadminonly" />
                                    <div>
                                        <asp:RadioButton ID="rbEditUseRoles" runat="server" GroupName="rdoeditroles" CssClass="rbroles" />
                                    </div>
                                        <asp:CheckBoxList ID="authEditRoles" runat="server"></asp:CheckBoxList>
                                </div>
                                <h3 id="h2DraftEditRoles" visible="false" runat="server">
                                    <gb:SiteLabel ID="lblDraftEditRoles" runat="server" ConfigKey="ModuleSettingsDraftEditRolesLabel"
                                        UseLabelTag="false" />
                                </h3>
                                <div id="divDraftEditRoles" visible="false" runat="server">
                                    <asp:CheckBoxList ID="draftEditRoles" runat="server"></asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div id="divRoleLinks" runat="server" visible="false" enableviewstate="false">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <asp:HyperLink ID="lnkPageViewRoles" runat="server" CssClass="lnkPageViewRoles" EnableViewState="false" />
                                </li>
                                <li class="list-group-item" visible="false" runat="server">
                                    <asp:HyperLink ID="lnkPageEditRoles" runat="server" CssClass="lnkPageEditRoles" EnableViewState="false" />
                                </li>
                                <li class="list-group-item" visible="false" runat="server">
                                    <asp:HyperLink ID="lnkPageDraftRoles" runat="server" CssClass="lnkPageDraftRoles"
                                        EnableViewState="false" />
                                </li>
                            </ul>
                        </div>
                        <div id="divEditUser" runat="server" class="settingrow form-group wrap01">
                            <gb:SiteLabel ID="lblEditUser" runat="server" ForControl="scUser" CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ModuleSettingsEditUserLabel" />
                            <div class="col-sm-9">
                                <gb:SmartCombo ID="scUser" runat="server" DataUrl="../Services/UserDropDownXml.aspx?query="
                                    ShowValueField="True" ValueCssClass="TextLabel" ValueColumns="5" ValueLabelText="UserID:"
                                    ValueLabelCssClass="" ButtonImageUrl="../Data/SiteImages/DownArrow.gif" ScriptDirectory="~/ClientScript"
                                    Columns="45" MaxLength="50"></gb:SmartCombo>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />

<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="List.aspx.cs" Inherits="CanhCam.Web.DealerUI.ListPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.DealerLocator" Namespace="CanhCam.Web.DealerUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:DealerDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server" 
        CurrentPageTitle="<%$Resources:DealerResources, DealersListHeading %>" CurrentPageUrl="~/DealerLocator/List.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button SkinID="UpdateButton" ID="btnUpdate" Text="<%$Resources:DealerResources, UpdateButton %>" runat="server" />
            <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:DealerResources, AddNewLink %>" runat="server" />
            <asp:HyperLink SkinID="InsertButton" Visible="false" ID="lnkImportExport" Text="<%$Resources:DealerResources, ExcelImportExportTitle %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:DealerResources, DeleteSelectedButton %>" runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                                ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddZones" AutoPostBack="true" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <div class="col-sm-3 col-sm-offset-3">
                                <asp:DropDownList ID="ddCountry" runat="server" DataTextField="Name" DataValueField="Guid"
                                    AutoPostBack="true" AppendDataBoundItems="true" />
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ddProvince" runat="server" DataTextField="Name" DataValueField="Guid"
                                    AutoPostBack="true" AppendDataBoundItems="true" />
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ddDistrict" runat="server" DataTextField="Name" DataValueField="Guid"
                                    AutoPostBack="true" AppendDataBoundItems="true" />
                            </div>
                        </div>
                    </div>
                    <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                        <MasterTableView DataKeyNames="ItemID,DisplayOrder" AllowFilteringByColumn="true" AllowSorting="false">
                            <Columns>
                                <telerik:GridTemplateColumn HeaderStyle-Width="35" HeaderText="<%$Resources:Resource, RowNumber %>" AllowFiltering="false">
                                    <ItemTemplate>
                                        <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="<%$Resources:DealerResources, EditPageNameLabel %>" DataField="Name"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" 
                                        ShowFilterIcon="false" FilterControlWidth="100%" />
                                <telerik:GridBoundColumn HeaderText="<%$Resources:DealerResources, EditPageAddressLabel %>" DataField="Address"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" 
                                        ShowFilterIcon="false" FilterControlWidth="100%" />
                                <telerik:GridBoundColumn HeaderText="<%$Resources:DealerResources, EditPagePhoneLabel %>" DataField="Phone"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" 
                                        ShowFilterIcon="false" FilterControlWidth="100%" />
                                <telerik:GridTemplateColumn HeaderText="<%$Resources:DealerResources, DisplayOrderLabel %>" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtDisplayOrder" SkinID="NumericTextBox" MaxLength="4" Text='<%# Eval("DisplayOrder") %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderStyle-Width="100" AllowFiltering="false" >
                                    <ItemTemplate>
                                        <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server" Text="<%# Resources.DealerResources.EditLink %>" 
                                            NavigateUrl='<%# this.SiteRoot + "/DealerLocator/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
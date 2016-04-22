<%@ Control Language="C#" Inherits="VNPT.Modules.NhanVien.ViewNhanVien" CodeFile="ViewNhanVien.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
    
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
    
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
    
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
        
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx1" %>
<div>    
<dx:ASPxCallbackPanel runat="server" ID="cbpnTransfer" 
    ClientInstanceName="cbpnTransfer" 
    OnCallback="cbpnTransfer_Callback">
    <PanelCollection>
        <dx:PanelContent runat="server">        
        
    <table width="100%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse; background-color:#d8e8ff;" class="dxgvControl_Aqua">
        <tr>
            <th style="text-align: left;">
               Cấp quyền truy xuất portal cho các user hiện có
            </th>
        </tr>            
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="170px">
                            <dx:ASPxComboBox runat="server" ID="cbbDestPortal" ClientInstanceName="cbbDestPortal" TextField="HTTPAlias" ValueField="PortalId" OnInit="loadPortalDestForTransfer">
                            </dx:ASPxComboBox>
                        </td>
                        <td style="padding-left: 5px;">
                            <dx:ASPxButton AutoPostBack="false" runat="server" ID="btnTransferUser" Text="Cấp quyền">
                                <ClientSideEvents 
                                    Click='function(s,e){
                                        var destPortal = cbbDestPortal.GetValue();
                                        if (destPortal != -2)
                                        {
                                            cbpnTransfer.PerformCallback(destPortal);
                                        }
                                    }' 
                                />
                            </dx:ASPxButton>
                        </td>  
                        <td>
                            <dx:ASPxButton runat="server" AutoPostBack="false" Text="Xem danh sách user">
                                <ClientSideEvents Click='function(s,e){
                                    popUserInfo.Show();
                                }' />
                            </dx:ASPxButton>
                        </td>                  
                    </tr>
                </table>
            </td>            
        </tr>
    </table>
    
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
</div>
<div style="height: 10px;"></div>
<div style="width: 30%; float: left; clear: both; height: 600px; overflow: auto;">
    <dx:ASPxTreeList ID="treeList" runat="server" Width="100%" AutoGenerateColumns="False"
        OnCustomCallback="treeList_Callback" KeyFieldName="Id" ClientInstanceName="treeList"
        OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating" 
        OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
        <SettingsCookies Enabled="True" StoreExpandedNodes="false" />
        <Border BorderColor="#99ccff" BorderStyle="Solid" BorderWidth="1" />
        <Columns>
            <dx:TreeListTextColumn FieldName="Name">
                <PropertiesTextEdit EncodeHtml="false" Size="9" />
            </dx:TreeListTextColumn>
        </Columns>
        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            <LoadingPanel Url="~/App_Themes/Aqua/TreeList/Loading.gif">
            </LoadingPanel>
        </Images>
        <SettingsBehavior ProcessFocusedNodeChangedOnServer="false" AllowFocusedNode="True"
            ExpandCollapseAction="NodeDblClick" />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Settings ShowColumnHeaders="False" />
        <ClientSideEvents FocusedNodeChanged="function(s, e) { 
			var key = treeList.GetFocusedNodeKey();
			gridThanhVien.PerformCallback(key);		
			
		}" />
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <CustomizationWindowContent VerticalAlign="Top" HorizontalAlign="Left">
            </CustomizationWindowContent>
        </Styles>
        <Templates>
            <DataCell>
                <table cellpadding="0" cellspacing="0"">
                    <tr>
                        <td valign="top">
                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>'
                                Width="16" Height="16" IsPng="true">
                            </dx:ASPxImage>
                        </td>
                        <td valign="top">
                        </td>
                        <td valign="top" style="padding-bottom: 1px; text-align: left;">
                            <font size="2" face="Tahoma"><b>&nbsp;
                                <%# Container.Text %></b></font>
                        </td>
                    </tr>
                </table>
            </DataCell>
        </Templates>
        <ImagesEditors>
            <DropDownEditDropDown>
                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
            </DropDownEditDropDown>
            <SpinEditIncrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
            </SpinEditIncrement>
            <SpinEditDecrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
            </SpinEditDecrement>
            <SpinEditLargeIncrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
            </SpinEditLargeIncrement>
            <SpinEditLargeDecrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
            </SpinEditLargeDecrement>
        </ImagesEditors>
    </dx:ASPxTreeList>
</div>

<div style="width: 70%; float: right; padding-top: 0;">

<dx:ASPxCallbackPanel OnCallback="cbpnQuyen_Callback" runat="server" ID="cbpnQuyen" ClientInstanceName="cbpnQuyen">
    <ClientSideEvents EndCallback='function(s,e){
        if (cbpnQuyen.cpOP == 1)
        {
            alert("Cấp user thành công");
        }
        else if (cbpnQuyen.cpOP == 2)
        {
            alert("Có lỗi khi cấp user");
        }
        else if (cbpnQuyen.cpOP == 3)
        {
            alert("Đổi password thành công");
        }
        else if (cbpnQuyen.cpOP == 4)
        {
            alert("Có lỗi khi đổi password");
        }
    }' />
    <PanelCollection>
        <dx:PanelContent runat="server">   
              
    
    <dx:ASPxGridView ID="gridThanhVien" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" AutoGenerateColumns="False" 
        OnHtmlDataCellPrepared="gridThanhVien_HtmlDataCellPrepared"
        OnHtmlRowCreated="gridThanhVien_HtmlRowCreated" 
        ClientInstanceName="gridThanhVien" KeyFieldName="id" 
        
        OnCustomCallback="gridThanhVien_CustomCallback">
        <SettingsBehavior ConfirmDelete="true" />
        <Settings ShowFooter="true" />
        <ClientSideEvents 
            RowDblClick='function(s, e) 
            {               
                gridThanhVien.StartEditRow(e.visibleIndex);
            }' 
            
        />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Columns>
            <%--<dx:GridViewCommandColumn ShowSelectCheckbox="true" VisibleIndex="0" />--%>
            <dx:GridViewDataTextColumn FieldName="empcode" Caption="Mã nhân viên" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="fullname" Caption="Họ tên" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="positionid" Caption="Chức vụ" VisibleIndex="3">
                <DataItemTemplate>
                    <dx:ASPxLabel ID="lblChucVu" runat="server">
                    </dx:ASPxLabel>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tài khoản" VisibleIndex="5" FieldName="id">
                <DataItemTemplate>                  
                    <asp:LinkButton ID="linkTaiKhoan" runat="server" CommandName="taiKhoan" CommandArgument='<%# Eval("id") %>'>
                    </asp:LinkButton>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mật khẩu" VisibleIndex="6">
                <DataItemTemplate>
                    <asp:LinkButton ID="linkMatkhau" runat="server" CommandName="phucHoi" CommandArgument='<%# Eval("id") %>'>Phục hồi
                    </asp:LinkButton>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsText PopupEditFormCaption="Hiệu chỉnh quyền" ConfirmDelete="Bạn có muốn xóa thông tin này không?" />
        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="Above"
            PopupEditFormWidth="520px" Mode="PopupEditForm" PopupEditFormAllowResize="true" />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesEditors>
            <DropDownEditDropDown>
                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
            </DropDownEditDropDown>
            <SpinEditIncrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
            </SpinEditIncrement>
            <SpinEditDecrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
            </SpinEditDecrement>
            <SpinEditLargeIncrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
            </SpinEditLargeIncrement>
            <SpinEditLargeDecrement>
                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
            </SpinEditLargeDecrement>
        </ImagesEditors>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <LoadingPanel ImageSpacing="8px">
            </LoadingPanel>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
        </StylesEditors>
        <SettingsPager>
            <Summary AllPagesText="{0} - {1} " Visible="False" />
        </SettingsPager>
        <SettingsPager PageSize="20">
        </SettingsPager>
        <Templates>
            <EditForm>
                <table style="font-size: 10pt" width="100%"> 
                    <tr>
                        <td>
                            <dx:ASPxComboBox ID="cbbPortal" ClientInstanceName="cbbPortal" runat="server" ValueField="PortalId" TextField="HTTPAlias" OnInit="loadPortal" >
                                <ClientSideEvents SelectedIndexChanged='function(s,e)
                                {
                                    var value = s.GetValue();
                                    if (value != -2)
                                    {
                                        cbpnQuyen.PerformCallback();
                                    }
                                }' />
                            </dx:ASPxComboBox>
                            <br />
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="portal" style="font-size: xx-small;">   
                            </dx:ASPxLabel>
                        </td>
                    </tr>                          
                    <tr valign="top">
                        <td>
                            <asp:HiddenField ID="hdId" OnLoad="hdId_Load" runat="server"></asp:HiddenField>
                            <dx:ASPxListBox SelectionMode="CheckColumn" ValueField="roleid" ID="lstQuyen" runat="server"
                                AutoPostBack="false" ClientInstanceName="lstQuyen" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                ValueType="System.String" Width="100%" Height="200px">
                                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <Columns>
                                    <dx:ListBoxColumn FieldName="rolename" Caption="Quyền" Width="100%" />
                                </Columns>
                                <ClientSideEvents 
                                    SelectedIndexChanged='function(s,e)
                                    {
                                        var arRole = s.GetSelectedValues();
                                        var strRole = arRole.toString();
                                        hdf_RoleId.Set("RoleList", strRole);
                                    }' 
                                />
                            </dx:ASPxListBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div style="width: 200px; height: 25px;">
                                <div style="width: 30px; height: 25px; float: left;">
                                    <a style="text-decoration: none;" href="#" onclick='if(ASPxClientEdit.ValidateGroup("editForm")){cbpnQuyen.PerformCallback("UpdateRole")}'>
                                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                            alt="" border="0" />
                                    </a>
                                </div>
                                <div style="width: 70px; height: 25px; float: left; padding-top: 2px; text-align: left;">
                                    <a style="text-decoration: none;" href="#" onclick='if(ASPxClientEdit.ValidateGroup("editForm")){cbpnQuyen.PerformCallback("UpdateRole")}'>
                                        <font size="2">Chỉnh sửa</font> </a>
                                </div>
                                <div style="width: 30px; height: 25px; float: left;">
                                    <a style="text-decoration: none;" href="#" onclick="gridThanhVien.CancelEdit()">
                                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                            alt="" border="0" />
                                    </a>
                                </div>
                                <div style="width: 70px; height: 25px; float: left; text-align: left; padding-top: 2px;">
                                    <a style="text-decoration: none;" href="#" onclick="gridThanhVien.CancelEdit()"><font
                                        size="2">Đóng</font></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        <dx:ASPxHiddenField ID="hdf_RoleId" runat="server" ClientInstanceName="hdf_RoleId"></dx:ASPxHiddenField>
    </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
</div>


<dx:ASPxPopupControl ID="popUserInfo" runat="server" ClientInstanceName="popUserInfo"
        Width="700px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" Modal="true"
        PopupVerticalAlign="TopSides" AutoUpdatePosition="True" CloseAction="CloseButton" ResizingMode="Live"
        HeaderText="Danh sách user" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <ContentStyle VerticalAlign="Top">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <div style="overflow: scroll; height: 400px;">
                
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Username" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DisplayName" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" 
                        SelectCommand="SELECT [Username], [FirstName], [LastName], [DisplayName] FROM [dnn_Users]">
                    </asp:SqlDataSource>
                
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
        
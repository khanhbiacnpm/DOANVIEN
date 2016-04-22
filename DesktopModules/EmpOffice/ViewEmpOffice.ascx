<%@ Control Language="C#" Inherits="Philip.Modules.EmpOffice.ViewEmpOffice" CodeFile="ViewEmpOffice.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Xpo.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>

<script type="text/javascript">
    function OnLuongAChanged(cboUnit) {
        cboEmp.PerformCallback(cboUnit.GetValue().toString());
    }
    function OnTypeChanged(cboEmp) {
        ASPxCallbackPanel21.PerformCallback(cboEmp.GetValue().toString());
    }
</script>

<div style="width: 36%; float: left; overflow: auto; height: 400px;">
    <dx:ASPxTreeList ID="treeList" runat="server" Width="100%" AutoGenerateColumns="False"
        KeyFieldName="Id" ClientInstanceName="treeList" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua">
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
			CallbackPanel.PerformCallback(key);			
		}" />
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <CustomizationWindowContent VerticalAlign="Top">
            </CustomizationWindowContent>
        </Styles>
        <Templates>
            <DataCell>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>'
                                Width="16" Height="16" IsPng="true">
                            </dx:ASPxImage>
                        </td>
                        <td>
                        </td>
                        <td style="padding-bottom: 1px;">
                            <%# Container.Text %>
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
<div style="width: 63%; float: right">
    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel121" runat="server" ClientInstanceName="CallbackPanel"
        OnCallback="ASPxCallbackPanel1_Callback">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <dx:ASPxGridView ID="grid" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" OnHtmlRowCreated="grid_HtmlRowCreated" KeyFieldName="id"                     
                    ClientInstanceName="grid" 
                    OnRowUpdating="grid_RowUpdating"
                    OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared"
                    OnRowInserting="grid_RowInserting" 
                    OnRowDeleting="grid_RowDeleting">
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                    <ClientSideEvents RowDblClick="function(s, e) {
            grid.StartEditRow(e.visibleIndex);
        }" />
                    <Templates>
                        <EditForm>
                            <div style="padding: 4px 4px 3px 4px">
                                <table width="500px" cellpadding="4" cellspacing="0">
                                    <tr>
                                        <td style="width: 20%">
                                            <font size="2"><b>Id</b></font>
                                        </td>
                                        <td style="width: 80%">
                                            <dx:ASPxTextBox ID="txtId" runat="server" Enabled="false" OnLoad="txtId_Load" Width="20%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <font size="2"><b>Đơn vị</b></font>
                                        </td>
                                        <td style="width: 80%">
                                            <dx:ASPxComboBox ID="cboUnit" ClientInstanceName="cboUnit" runat="server" Width="95%"
                                                OnLoad="cboUnit_Load">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                      OnLuongAChanged(s); 
                                                }" />
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <font size="2"><b>Nhân viên</b></font>
                                        </td>
                                        <td style="width: 80%">
                                            <dx:ASPxComboBox OnCallback="cboEmp_CallBack" ID="cboEmp" ClientInstanceName="cboEmp"
                                                runat="server" Width="95%" OnLoad="cboEmp_Load">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                              OnTypeChanged(s); 
                                                        }" />
                                            </dx:ASPxComboBox>
                                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel21" ClientInstanceName="ASPxCallbackPanel21"
                                                runat="server" OnCallback="ASPxCallbackPanel21_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent ID="PanelContent1" runat="server">
                                                        <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
                                                        </dx:ASPxHiddenField>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <font size="2"><b>Quản lý nhà nước</b></font>
                                        </td>
                                        <td style="width: 80%">
                                            <dx:ASPxComboBox ID="cboState" runat="server" Width="95%" OnLoad="cboState_Load">
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <font size="2"><b>Chức danh</b></font>
                                        </td>
                                        <td style="width: 80%">
                                            <dx:ASPxComboBox ID="cboOffice" runat="server" Width="95%" OnLoad="cboOffice_Load">
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <table cellpadding="2" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}">
                                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/save_f2.png"
                                                                alt="" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}"><font size="2">Chỉnh sửa</font></a>
                                                    </td>
                                                    <td style="width: 5px;">
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="grid.CancelEdit()">
                                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/restore_f2.png"
                                                                alt="" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="grid.CancelEdit()"><font size="2">Đóng</font></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </EditForm>
                        <StatusBar>
                            <a style="text-decoration: none;" onclick="grid.AddNewRow()">
                                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/add.png"
                                    alt="" />
                            </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                                mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                    <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/edit_f2.png"
                                        alt="" />
                                </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/cancel_f2.png"
                                            alt="" />
                                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                        <font size="2">Xóa</font> </a>&nbsp;
                        </StatusBar>
                    </Templates>
                    <Columns>
                        <dx:GridViewDataColumn Caption="id" FieldName="id" VisibleIndex="6" Visible="false">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="uid" FieldName="uid" VisibleIndex="8" Visible="false">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="unitid" FieldName="unitid" VisibleIndex="2" Visible="false">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn CellStyle-HorizontalAlign="Left" FieldName="empid" Caption="Họ và tên"
                            VisibleIndex="1">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="lblEmp" runat="server">
                                </dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn CellStyle-HorizontalAlign="Left" FieldName="officeid" Caption="Chức danh"
                            VisibleIndex="2">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="lblOffice" runat="server">
                                </dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn CellStyle-HorizontalAlign="Left" FieldName="statemanagementid"
                            Caption="Quản lý nhà nước" VisibleIndex="3">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="lblState" runat="server">
                                </dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                    <Settings ShowStatusBar="Visible" />
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <Header Font-Bold="True">
                        </Header>
                        <HeaderPanel Font-Bold="True">
                        </HeaderPanel>
                        <LoadingPanel ImageSpacing="8px">
                        </LoadingPanel>
                        <TitlePanel Font-Bold="True">
                        </TitlePanel>
                    </Styles>
                    <SettingsText PopupEditFormCaption="Hiệu chỉnh viên chức chuyên môn nghiệp vụ" ConfirmDelete="Bạn có muốn xóa" />
                    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
                        PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="600px" />
                    <SettingsLoadingPanel ImagePosition="Top" />
                    <SettingsPager PageSize="1000">
                        <Summary AllPagesText="{0} - {1} " Visible="False" />
                    </SettingsPager>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <StylesEditors>
                        <CalendarHeader Spacing="1px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
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
                </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</div>
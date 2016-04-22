<%@ Control Language="C#" Inherits="Philip.Modules.Office.ViewOffice" CodeFile="ViewOffice.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<script type="text/javascript">
    function OnGridFocusedRowChanged() {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'id', OnGetRowValues);
    }
    function OnGetRowValues(values) {
        gridQLNN_NL.PerformCallback(values);
    }
</script>

<div style="width: 1000px; height: auto;">
    <div style="width: 590px; height: auto; float: left; text-align: left;">
        <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị chức danh" OnCancelRowEditing="grid_CancelRowEditing"
            ClientInstanceName="grid" OnHtmlDataCellPrepared="grid_OnHtmlDataCellPrepared"
            OnInitNewRow="grid_InitNewRow" OnRowUpdating="grid_RowUpdating" OnRowInserting="grid_RowInserting"
            OnRowDeleting="grid_RowDeleting">
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
            <ClientSideEvents RowDblClick="function(s, e) {
                grid.StartEditRow(e.visibleIndex);
            }"
                FocusedRowChanged="function(s, e) {
                OnGridFocusedRowChanged();
            }" />
            <Templates>
                <EditForm>
                    <div style="padding: 4px 4px 3px 4px">
                        <table width="600px" cellpadding="1" cellspacing="1" style="font-family: Verdana; font-size: 9pt;">
                            <tr>
                                <td valign="top" style="width: 100px;"></td>
                                <td valign="top" style="width: ">
                                    <dx:ASPxTextBox ID="txtId" runat="server" Enabled="false" OnLoad="txtId_Load" Width="20%"
                                        Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 100px;">Mã bảng lương
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCode" runat="server" OnLoad="txtCode_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 100px;">Chức danh
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ClientInstanceName="Name" ID="txtName" runat="server" OnLoad="txtName_Load"
                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Nhập chức danh"></RequiredField>
                                            <ErrorFrameStyle ForeColor="Red">
                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                <ErrorTextPaddings PaddingRight="3px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 100px;">Môi trường làm việc
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbMoiTruongLamViec" runat="server" OnLoad="cmbMoiTruongLamViec_Load"
                                        IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <Items>
                                            <dx:ListEditItem Value="0" Text="Bình thường" Selected="true" />
                                            <dx:ListEditItem Value="1" Text="Độc hại" />
                                            <dx:ListEditItem Value="2" Text="Đặc biệt độc hại" />
                                        </Items>
                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 100px;">Ghi chú
                                </td>
                                <td valign="top">
                                    <dx:ASPxMemo ID="memoGhiChuChucDanh" runat="server" Height="40" Width="100%" OnLoad="memoGhiChuChucDanh_Load"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top"></td>
                                <td valign="top">
                                    <dx:ASPxGridView ID="gridQLNNuoc" runat="server" ClientInstanceName="gridQLNNuoc"
                                        Width="95%" Theme="Glass" Font-Size="12px"
                                        KeyFieldName="id" OnLoad="gridQLNNuoc_Load"
                                        OnRowUpdating="gridQLNNuoc_RowUpdating"
                                        OnCancelRowEditing="gridQLNNuoc_CancelRowEditing"
                                        OnRowInserting="gridQLNNuoc_RowInserting"
                                        OnRowDeleting="gridQLNNuoc_RowDeleting" OnHtmlDataCellPrepared="gridQLNNuoc_OnHtmlDataCellPrepared">
                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                        <ClientSideEvents RowDblClick="function(s, e) {
    gridQLNNuoc.StartEditRow(e.visibleIndex);
}" />
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px">
                                                    <table width="100%" cellpadding="1" cellspacing="1" style="font-family: Verdana; font-size: 9pt;">
                                                        <tr>
                                                            <td valign="top" colspan="2">
                                                                <asp:HiddenField ID="hiddenId" runat="server" OnLoad="hiddenId_Load" />
                                                                <asp:HiddenField ID="hiddenIdChucDanh" runat="server" OnLoad="hiddenIdChucDanh_Load" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" style="width: 50%;">
                                                                <dx:ASPxComboBox ID="cmbQLNNuoc" runat="server" IncrementalFilteringMode="Contains"
                                                                    OnLoad="cmbQLNNuoc_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                                    </LoadingPanelImage>
                                                                    <DropDownButton>
                                                                        <Image>
                                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                                        </Image>
                                                                    </DropDownButton>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxComboBox ID="cmbNhomLuong" runat="server" OnLoad="cmbNhomLuong_Load" IncrementalFilteringMode="Contains"
                                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                                    </LoadingPanelImage>
                                                                    <DropDownButton>
                                                                        <Image>
                                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                                        </Image>
                                                                    </DropDownButton>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" colspan="2">
                                                                <table cellpadding="2" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             gridQLNNuoc.UpdateEdit();OnGridFocusedRowChanged();}">
                                                                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                                                    alt="" />
                                                                            </a>
                                                                        </td>
                                                                        <td>
                                                                            <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             gridQLNNuoc.UpdateEdit();OnGridFocusedRowChanged();}"><font size="2">Lưu</font></a>
                                                                        </td>
                                                                        <td style="width: 5px;"></td>
                                                                        <td>
                                                                            <a style="text-decoration: none;" onclick="gridQLNNuoc.CancelEdit();">
                                                                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                                                    alt="" />
                                                                            </a>
                                                                        </td>
                                                                        <td>
                                                                            <a style="text-decoration: none;" onclick="gridQLNNuoc.CancelEdit();"><font size="2">
                                                                                Đóng</font></a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </EditForm>
                                            <StatusBar>
                                                <a style="text-decoration: none;" onclick="gridQLNNuoc.AddNewRow()">
                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                                                        alt="" />
                                                </a><a style="text-decoration: none;" onclick="gridQLNNuoc.AddNewRow()"><font size="2">
                                                    Thêm</font></a>&nbsp; <a style="text-decoration: none;" onclick="gridQLNNuoc.StartEditRow(gridQLNNuoc.GetFocusedRowIndex());">
                                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                                                            alt="" />
                                                    </a><a style="text-decoration: none;" onclick="gridQLNNuoc.StartEditRow(gridQLNNuoc.GetFocusedRowIndex());">
                                                        <font size="2">Sửa</font></a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {gridQLNNuoc.DeleteRow(gridQLNNuoc.GetFocusedRowIndex());}">
                                                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/stop.png"
                                                                alt="" />
                                                        </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {gridQLNNuoc.DeleteRow(gridQLNNuoc.GetFocusedRowIndex());}">
                                                            <font size="2">Xóa</font></a>&nbsp;
                                            </StatusBar>
                                        </Templates>
                                        <Columns>
                                            <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
                                            <dx:GridViewDataColumn FieldName="IdChucDanh" Caption="Mã" VisibleIndex="1" Visible="false" />
                                            <dx:GridViewDataColumn FieldName="IdQLNNuoc" Caption="QL nhà nước" VisibleIndex="2">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="lbl_QLNNuoc" runat="server">
                                                    </dx:ASPxLabel>
                                                </DataItemTemplate>
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="IdNhomLuong" Caption="Nhóm lương" VisibleIndex="3">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="lbl_NhomLuong" runat="server">
                                                    </dx:ASPxLabel>
                                                </DataItemTemplate>
                                            </dx:GridViewDataColumn>
                                        </Columns>
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
                                        <Settings ShowStatusBar="Visible" />
                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                        <SettingsText PopupEditFormCaption="Chọn QL nhà nước và Nhóm lương thuộc chức danh"
                                            ConfirmDelete="Bạn có muốn xóa" />
                                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
                                            PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="300px" />
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
                                        <ClientSideEvents Init="function(s,e){gridQLNNuoc.Refresh();}" EndCallback="function(s,e)
                                    {
                                        if(gridQLNNuoc.cpResult==true)
                                        {
                                            alert('Lương chức danh này đã tồn tại!');
                                            gridQLNNuoc.cpResult=false;
                                        }
                                    }" />
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" colspan="2">
                                    <table cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td>
                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit();OnGridFocusedRowChanged();}">
                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                        alt="" />
                                                </a>
                                            </td>
                                            <td>
                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit();OnGridFocusedRowChanged();}"><font size="2">Lưu</font></a>
                                            </td>
                                            <td style="width: 5px;"></td>
                                            <td>
                                                <a style="text-decoration: none;" onclick="OnGridFocusedRowChanged();grid.CancelEdit()">
                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                        alt="" />
                                                </a>
                                            </td>
                                            <td>
                                                <a style="text-decoration: none;" onclick="OnGridFocusedRowChanged();grid.CancelEdit()">
                                                    <font size="2">Đóng</font></a>
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
                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                            alt="" />
                    </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                        mới</font></a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                                alt="" />
                        </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                            <font size="2">Chỉnh sửa</font></a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                    alt="" />
                            </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                <font size="2">Xóa</font></a>&nbsp;
                </StatusBar>
            </Templates>
            <Columns>
                <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
                <dx:GridViewDataColumn FieldName="code" Caption="Mã bảng lương" VisibleIndex="1" />
                <dx:GridViewDataColumn FieldName="name" Caption="Chức danh" VisibleIndex="2" />
                <dx:GridViewDataColumn FieldName="DocHai" Caption="MT làm việc" VisibleIndex="3">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lbl_DocHai" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="note" Caption="Ghi chú" VisibleIndex="4" />
            </Columns>
            <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                <Header Font-Bold="True">
                </Header>
                <HeaderPanel Font-Bold="True">
                </HeaderPanel>
                <LoadingPanel ImageSpacing="1px">
                </LoadingPanel>
                <TitlePanel Font-Bold="True">
                </TitlePanel>
            </Styles>
            <Settings ShowStatusBar="Visible" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
            <SettingsText PopupEditFormCaption="Hiệu chỉnh chức danh" ConfirmDelete="Bạn có muốn xóa" />
            <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="Above"
                PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="500px" />
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
    </div>
    <div style="width: 400px; height: auto; float: left; margin-left: 5px;">
        <dx:ASPxGridView ID="gridQLNN_NL" runat="server" ClientInstanceName="gridQLNN_NL"
            Theme="Glass" Font-Size="12px"
            OnCustomCallback="gridQLNN_NL_CustomCallback"
            OnHtmlDataCellPrepared="gridQLNN_NL_OnHtmlDataCellPrepared" Width="400px" Caption="QL nhà nước, Nhóm lương thuộc chức danh">
            <Columns>
                <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
                <dx:GridViewDataColumn FieldName="IdChucDanh" Caption="Mã" VisibleIndex="1" Visible="false" />
                <dx:GridViewDataColumn FieldName="IdQLNNuoc" Caption="QL nhà nước" VisibleIndex="2">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lbl_QLNNuoc1" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="IdNhomLuong" Caption="Nhóm lương" VisibleIndex="3">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lbl_NhomLuong1" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:GridViewDataColumn>
            </Columns>
            <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                <LoadingPanel ImageSpacing="8px">
                </LoadingPanel>
            </Styles>
            <SettingsLoadingPanel ImagePosition="Top" />
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
    </div>
</div>

<%@ Control Language="C#" Inherits="VNPT.Modules.LaborContractType.ViewLaborContractType"
    CodeFile="ViewLaborContractType.ascx.cs" AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<dx:ASPxGridView ID="grdNotice" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdNotice"
    Theme="Glass" Font-Size="12px" KeyFieldName="id"
    Caption="Quản lý loại hợp đồng" OnRowDeleting="grdNotice_RowDeleting" OnRowInserting="grdNotice_RowInserting"
    OnRowUpdating="grdNotice_RowUpdating" Width="100%">
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdNotice.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn FieldName="name" Caption="Loại hợp đồng" Visible="true" VisibleIndex="4">
        </dx:GridViewDataColumn>
    </Columns>
    <SettingsPager PageSize="1000">
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="EditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormVerticalAlign="TopSides" PopupEditFormModal="True" PopupEditFormWidth="400px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh loại hợp đồng" />
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
        <Header Font-Bold="True">
        </Header>
        <HeaderPanel Font-Bold="True">
        </HeaderPanel>
        <LoadingPanel ImageSpacing="8px">
        </LoadingPanel>
        <TitlePanel Font-Bold="True">
        </TitlePanel>
    </Styles>
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table cellpadding="1" cellspacing="1" width="400px" style="font-family:Verdana; font-size:10pt;">
                    <tr>
                        <td>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtId" runat="server" Visible="false" OnLoad="txtId_Load" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px;">
                            Loại hợp đồng
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtName" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                OnLoad="txtName_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField ErrorText="Nhập loại hợp đồng" IsRequired="True" />
                                    <ErrorFrameStyle ForeColor="Red">
                                        <Paddings Padding="3px" PaddingLeft="4px" />
                                        <ErrorTextPaddings PaddingRight="3px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <table cellpadding="2" cellspacing="0">
                                <tr>
                                    <td>
                                        <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
     grdNotice.UpdateEdit()}" style="text-decoration: none;">
                                            <img alt="" height="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                width="16" />
                                        </a>
                                    </td>
                                    <td>
                                        <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
     grdNotice.UpdateEdit()}" style="text-decoration: none;"><font size="2">Lưu</font></a>
                                    </td>
                                    <td style="width: 5px;">
                                    </td>
                                    <td>
                                        <a onclick="grdNotice.CancelEdit()" style="text-decoration: none;">
                                            <img alt="" height="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                width="16" />
                                        </a>
                                    </td>
                                    <td>
                                        <a onclick="grdNotice.CancelEdit()" style="text-decoration: none;"><font size="2">Đóng</font></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </EditForm>
        <StatusBar>
            <a style="text-decoration: none;" onclick="grdNotice.AddNewRow()">
                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                    alt="" />
            </a><a style="text-decoration: none;" onclick="grdNotice.AddNewRow()"><font size="2">
                Thêm mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grdNotice.StartEditRow(grdNotice.GetFocusedRowIndex());">
                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                        alt="" />
                </a><a style="text-decoration: none;" onclick="grdNotice.StartEditRow(grdNotice.GetFocusedRowIndex());">
                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdNotice.DeleteRow(grdNotice.GetFocusedRowIndex());}">
                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                            alt="" />
                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdNotice.DeleteRow(grdNotice.GetFocusedRowIndex());}">
                        <font size="2">Xóa</font> </a>&nbsp;
        </StatusBar>
    </Templates>
    <Settings ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
</dx:ASPxGridView>

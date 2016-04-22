<%@ Control Language="C#" Inherits="VNPT.Modules.Notices.ViewNotices" CodeFile="ViewNotices.ascx.cs"
    AutoEventWireup="true" %>
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
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="Id"
    Caption="Danh sách nhắc nhở công việc"
    OnRowDeleting="grdNotice_RowDeleting"
    OnRowInserting="grdNotice_RowInserting" 
    OnRowUpdating="grdNotice_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
    <ClientSideEvents RowDblClick="function(s, e) {
                grdNotice.StartEditRow(e.visibleIndex);
            }" />
    <Columns>
        <dx:GridViewDataColumn FieldName="Title" Caption="Tiêu đề" Visible="true" VisibleIndex="4">
        </dx:GridViewDataColumn>
    </Columns>
    <SettingsPager>
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh nhắc nhở công việc" />
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
    <EmptyDataRow>
    <dx:ASPxHyperLink ID="hpThemMoi" Text="Thêm mới" runat="server">
    <ClientSideEvents Click="function(s,e){grdNotice.AddNewRow();}" />
    </dx:ASPxHyperLink>
    </EmptyDataRow>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table cellpadding="4" cellspacing="0" width="500px" style="font-family: Verdana;
                    font-size: 10pt;">
                 
                    <tr>
                        <td style="width: 70px;">
                            Tiêu đề
                        </td>
                        <td>
                            <dx:ASPxTextBox  ID="txtTitle" OnLoad="txtTitle_Load" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                 Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                              
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
                                            <img alt="" height="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/save_f2.png"
                                                width="20" />
                                        </a>
                                    </td>
                                    <td>
                                        <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
     grdNotice.UpdateEdit()}" style="text-decoration: none;"><font size="2">Chỉnh sửa</font></a>
                                    </td>
                                    <td style="width: 5px;">
                                    </td>
                                    <td>
                                        <a onclick="grdNotice.CancelEdit()" style="text-decoration: none;">
                                            <img alt="" height="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/restore_f2.png"
                                                width="20" />
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
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/add.png"
                    alt="" />
            </a><a style="text-decoration: none;" onclick="grdNotice.AddNewRow()"><font size="2">
                Thêm mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grdNotice.StartEditRow(grdNotice.GetFocusedRowIndex());">
                    <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/edit_f2.png"
                        alt="" />
                </a><a style="text-decoration: none;" onclick="grdNotice.StartEditRow(grdNotice.GetFocusedRowIndex());">
                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdNotice.DeleteRow(grdNotice.GetFocusedRowIndex());}">
                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/cancel_f2.png"
                            alt="" />
                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdNotice.DeleteRow(grdNotice.GetFocusedRowIndex());}">
                        <font size="2">Xóa</font> </a>&nbsp;
        </StatusBar>
    </Templates>
    <Settings ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
</dx:ASPxGridView>

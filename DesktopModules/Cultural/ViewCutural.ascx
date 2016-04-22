<%@ Control Language="C#" Inherits="Philip.Modules.Cultural.ViewCutural" CodeFile="ViewCutural.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị trình độ văn hóa"
    OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid" OnInitNewRow="grid_InitNewRow"
    OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting">
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
    <ClientSideEvents RowDblClick="function(s, e) {
    grid.StartEditRow(e.visibleIndex);
}" />
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table width="500px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                    font-size: 10pt;">
                    <tr>
                        <td>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtId" runat="server" Visible="false" OnLoad="txtId_Load" Width="20%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:80px;">
                            Trình độ
                        </td>
                        <td>
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtName"
                                runat="server" OnLoad="txtName_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Nhập trình độ "></RequiredField>
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
                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}">
                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                alt="" />
                                        </a>
                                    </td>
                                    <td>
                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}"><font size="2">Lưu</font></a>
                                    </td>
                                    <td style="width: 5px;">
                                    </td>
                                    <td>
                                        <a style="text-decoration: none;" onclick="grid.CancelEdit()">
                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
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
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                    alt="" />
            </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                    <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                        alt="" />
                </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                            alt="" />
                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                        <font size="2">Xóa</font> </a>&nbsp;
        </StatusBar>
    </Templates>
    <Columns>
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
        <dx:GridViewDataColumn FieldName="name" Caption="Trình độ" VisibleIndex="1" />
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
    <SettingsText PopupEditFormCaption="Hiệu chỉnh trình độ văn hóa" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
        PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="500px" />
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

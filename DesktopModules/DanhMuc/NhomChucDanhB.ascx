<%@ Control Language="C#" Inherits="VNPT.Modules.DanhMuc.NhomChucDanhB" CodeFile="NhomChucDanhB.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>



<dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="Id" Caption="Quản trị nhóm chức danh B"
    OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid" 
    OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting" >
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
                        <td style="width: 150px;">
                          Thứ tự
                        </td>
                        <td>
                            <dx:ASPxSpinEdit EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtThuTu" MinValue="0"
                                runat="server" OnLoad="txtThuTu_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                              
                            </dx:ASPxSpinEdit>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;">
                            Mã nhóm 
                        </td>
                        <td>
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtMaNhom"
                                runat="server" OnLoad="txtMaNhom_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                              
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">
                            Nhóm chức danh B
                        </td>
                        <td>
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtName"
                                runat="server" OnLoad="txtName_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                              
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>
                           Nhóm nguồn nhân lực
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbNNL" runat="server" AutoPostBack="false" ClientInstanceName="cmbNNL"
                                IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" ShowLoadingPanel="true"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" OnLoad="cmbNNL_Load"
                                ValueType="System.String" Width="100%">
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
                                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
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
                                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
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
                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                    alt="" />
            </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                        alt="" />
                </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                            alt="" />
                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                        <font size="2">Xóa</font> </a>&nbsp;
        </StatusBar>
    </Templates>
    <Columns>
        <dx:GridViewDataColumn FieldName="Id" VisibleIndex="3" Visible="false" />
        <dx:GridViewDataColumn FieldName="ThuTu" Caption="Thứ tự" Visible="false" VisibleIndex="2" />
        <dx:GridViewDataColumn FieldName="MaNhom" Caption="Mã nhóm " VisibleIndex="3" />
        <dx:GridViewDataColumn FieldName="NhomChucDanh" Caption="Nhóm chức danh B" VisibleIndex="4" />
        <dx:GridViewDataColumn FieldName="NhomNNl" Caption="Mã nhóm NNL " VisibleIndex="0" />
        <dx:GridViewDataColumn FieldName="TenNNL" Caption="Nhóm nguồn nhân lực" VisibleIndex="1" />
         
    </Columns>
    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
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
    <SettingsText PopupEditFormCaption="Hiệu chỉnh nhóm máu" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
        PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="500px" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <SettingsPager PageSize="1000">
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
    <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
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
            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
        </DropDownEditDropDown>
        <SpinEditIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Glass" />
        </SpinEditIncrement>
        <SpinEditDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Glass" />
        </SpinEditDecrement>
        <SpinEditLargeIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Glass" />
        </SpinEditLargeIncrement>
        <SpinEditLargeDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Glass" />
        </SpinEditLargeDecrement>
    </ImagesEditors>
</dx:ASPxGridView>

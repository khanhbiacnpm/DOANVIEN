<%@ Control Language="C#" Inherits="Philip.Modules.BaoHiem.ViewLuongCB" CodeFile="ViewLuongCB.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị lương cơ bản" ClientInstanceName="grid"
    OnRowUpdating="grid_RowUpdating" OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting"
    OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared">
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grid.StartEditRow(e.visibleIndex);
    }" />
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table width="400px" cellpadding="4" cellspacing="0" style="font-family: Verdana;
                    font-size: 10pt;">
                    <tr>
                        <td valign="top" style="width: 120px;">
                            Lương cơ bản
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtLuongCB"
                                runat="server" OnLoad="txtLuongCB_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" DisplayFormatString="N0">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Nhập lương cơ bản!"></RequiredField>
                                    <ErrorFrameStyle ForeColor="Red">
                                        <Paddings Padding="3px" PaddingLeft="4px" />
                                        <ErrorTextPaddings PaddingRight="3px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                                <MaskSettings IncludeLiterals="None" Mask="###,###,###" />
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Thời điểm
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="txtThoiDiem" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                OnLoad="txtThoiDiem_Load" CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                Width="100%">
                                <CalendarProperties>
                                    <HeaderStyle Spacing="1px" />
                                    <FooterStyle Spacing="17px" />
                                </CalendarProperties>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Theo nghị định
                        </td>
                        <td colspan="3">
                            <dx:ASPxTextBox ID="txtQuyetDinh" runat="server" OnLoad="txtQuyetDinh_Load" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px">
                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="G" 
                                    SetFocusOnError="true">
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />                                                            
                                    </ErrorFrameStyle>                                                        
                                    <RequiredField ErrorText="Nhập số Quyết định " IsRequired="true" />                                                        
                                </ValidationSettings>                                                    
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            File đính kèm
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID ="txtfilekem" runat ="server" OnLoad ="txtfilekem_Load" Visible="false"></dx:ASPxTextBox>
                            <dx:ASPxHiddenField ID="HiddentfileKem" runat="server" ClientInstanceName="fileKem">
                            </dx:ASPxHiddenField>
                            <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                ClientInstanceName="uploadFileDinhKem" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxUploadControl>
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
                                             uploadFileDinhKem.UploadFile();
                                             fileKem.Set('filekem',uploadFileDinhKem.GetText().toString());
                                             grid.UpdateEdit()}">
                                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                alt="" />
                                        </a>
                                    </td>
                                    <td>
                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             uploadFileDinhKem.UploadFile();
                                             fileKem.Set('filekem',uploadFileDinhKem.GetText().toString());
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
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
        <dx:GridViewDataColumn Caption="Lương CB" FieldName="luongcb" Width="200px" VisibleIndex="3"
            HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_LuongCB" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thời điểm" FieldName="thoidiem" VisibleIndex="4"
            HeaderStyle-HorizontalAlign="Left">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_thoidiem" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Left">
            </CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Theo nghị định" FieldName="soqd" VisibleIndex="5">
            <DataItemTemplate>
                <dx:ASPxImage ID="imgFile" runat="server" Width="12px" Height="12px" Style="float: left; margin-top: 2px;">
                </dx:ASPxImage>
                <dx:ASPxHyperLink ID="hyperDowload" runat="server" Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="fileKem" VisibleIndex="0" Visible="false" />
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
    <SettingsText PopupEditFormCaption="Hiệu chỉnh lương cơ bản" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
        PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="400px" />
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

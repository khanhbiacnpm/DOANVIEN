<%@ Control Language="C#" Inherits="Philip.Modules.BaoHiem.ViewBaoHiem" CodeFile="ViewBaoHiem.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<table cellpadding="1" cellspacing="1" width="95%">
    <tr>
        <td align="right" style="padding-left:5px;">Chọn loại bảo hiểm</td>        
        <td valign="top">            
            <dx:ASPxComboBox ID="cmbLoaiBH" runat="server" ClientInstanceName="cmbLoaiBH" IncrementalFilteringMode="Contains"
                Width="250px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                </LoadingPanelImage>
                <DropDownButton>
                    <Image>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                    </Image>
                </DropDownButton>
                <ClientSideEvents SelectedIndexChanged="function(s,e){
                    HiddenIdLoaiBH.Set('idLoaiBH',cmbLoaiBH.GetValue());
                    grid.PerformCallback(cmbLoaiBH.GetValue());}" />
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <dx:ASPxHiddenField ID="HiddenIdLoaiBH" runat="server" ClientInstanceName="HiddenIdLoaiBH">
            </dx:ASPxHiddenField>
        </td>
    </tr>
</table>
<dx:ASPxGridView ID="grid" runat="server" Width="100%"
    Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị bảo hiểm" 
    ClientInstanceName="grid"
    OnCustomCallback="grid_Callback"
    OnRowUpdating="grid_RowUpdating" 
    OnRowInserting="grid_RowInserting" 
    OnRowDeleting="grid_RowDeleting"
    OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared" 
    AutoGenerateColumns="False">
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grid.StartEditRow(e.visibleIndex);
    }" />
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table width="500px" cellpadding="4" cellspacing="0" style="font-family: Verdana;
                    font-size: 10pt;">                    
                    <tr>
                        <td valign="top" style="width:150px;">
                            Tỉ lệ người SDLĐ đóng
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtTLNSDLDong"
                                runat="server" OnLoad="txtTLNSDLDong_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Nhập tỉ lệ người sử dụng lao động phải đóng!">
                                    </RequiredField>
                                    <RegularExpression ErrorText="Nhập theo định dạng thập phân!" ValidationExpression="\d+(\.\d+)?" />
                                    <ErrorFrameStyle ForeColor="Red">
                                        <Paddings Padding="3px" PaddingLeft="4px" />
                                        <ErrorTextPaddings PaddingRight="3px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Tỉ lệ người LĐ đóng
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtTLNLaoDong"
                                runat="server" OnLoad="txtTLNLaoDong_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Nhập tỉ lệ người lao động phải đóng">
                                    </RequiredField>
                                    <RegularExpression ErrorText="Nhập theo định dạng thập phân!" ValidationExpression="\d+(\.\d+)?" />
                                    <ErrorFrameStyle ForeColor="Red">
                                        <Paddings Padding="3px" PaddingLeft="4px" />
                                        <ErrorTextPaddings PaddingRight="3px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
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
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
        <dx:GridViewDataColumn FieldName="idloaibh" Caption="Bảo hiểm" VisibleIndex="1">
            <HeaderStyle HorizontalAlign="Center" />
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_BaoHiem" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Tỉ lệ người SDLĐ đóng" FieldName="tlnsudunglaodong"
            VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Tỉ lệ người LĐ đóng" FieldName="tllaodong" VisibleIndex="3"
            HeaderStyle-HorizontalAlign="Center" >
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thời điểm" FieldName="thoidiem" VisibleIndex="4"
            HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_thoidiem" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>
    </Columns>
    <Settings ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
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
    <SettingsText PopupEditFormCaption="Hiệu chỉnh bảo hiểm" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
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
        <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif"></LoadingPanel>
    </Images>
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
    <ImagesEditors>
        <DropDownEditDropDown>
            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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

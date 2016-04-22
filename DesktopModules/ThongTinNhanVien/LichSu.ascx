<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LichSu.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.LichSu" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
   
<dx:ASPxGridView ID="grdLichSu" runat="server" AutoGenerateColumns="False" 
    ClientInstanceName="grdLichSu"
    Theme="Glass" Font-Size="12px" KeyFieldName="id"
    OnRowDeleting="grdLichSu_RowDeleting"
    OnRowInserting="grdLichSu_RowInserting" 
    OnRowUpdating="grdLichSu_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <Settings ShowStatusBar="Visible" />    
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh lịch sử bản thân" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdLichSu.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" Width="30px">
            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
            <CellStyle HorizontalAlign="Center" />
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thời gian" FieldName="thoigian"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Nội dung" FieldName="noidung"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="tuthangnam" Visible="false"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="denthangnam" Visible="false"></dx:GridViewDataColumn>
    </Columns>    
    <SettingsLoadingPanel ImagePosition="Top" />
    <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
        </LoadingPanel>
    </Images>
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
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
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
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table cellpadding="1" cellspacing="1" width="500px" style="font-family: Verdana;
                    font-size: 9pt;">                   
                    <tr>
                        <td valign="top" style="width: 120px;">
                            Từ Tháng/Năm
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_tuthangnam" runat="server" NullText="MM/YYYY" Text='<%# Eval("tuthangnam") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đến Tháng/Năm
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_denthangnam" runat="server" NullText="MM/YYYY" Text='<%# Eval("denthangnam") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                              
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Nội dung
                        </td>
                        <td valign="top">
                            <dx:ASPxMemo ID="memo_noidung" runat="server" Height="71px" Width="100%" Text='<%# Eval("noidung") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                               
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){if(ASPxClientEdit.ValidateGroup('editForm')){grdLichSu.UpdateEdit();}}" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){grdLichSu.CancelEdit();}" />
                                </dx:ASPxButton>
                            </div>
                        </td>                        
                    </tr>
                </table>
            </div>
        </EditForm>
        <StatusBar>
            <div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdLichSu.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            grdLichSu.StartEditRow(grdLichSu.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            grdLichSu.DeleteRow(grdLichSu.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
        </StatusBar>        
    </Templates>
</dx:ASPxGridView>

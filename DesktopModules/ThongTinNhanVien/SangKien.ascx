<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SangKien.ascx.cs"
    Inherits="VNPT.Modules.ThongTinNhanVien.SangKien" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    
<script type="text/javascript">

    var startUpload = false;
    function CapNhatSangKien() {
        var fileA = upFile.GetText();
        var hasFileA = fileA.length != 0;
        if (!hasFileA) {
            grdSangKien.UpdateEdit();
        }
        else {
            startUpload = true;
            upFile.Upload();
            waitUploadComplete();

        }
    }
    function SaveSangKien() {


        if (txtSoQD.GetText() == "") {

            txtSoQD.SetFocus();
            alert('Xin vui lòng nhập số quyết định !');
            return false;
        }
        else if (txtCapQD.GetText() == "") {

            txtCapQD.SetFocus();
            alert('Xin vui lòng nhập cấp quyết định !');
            return false;
        }
        else if (dateNgayQD.GetText() == "") {

            dateNgayQD.SetFocus();
            alert('Xin vui lòng chọn ngày quyết định !');
            return false;
        }
        else if (txtTenSangKien.GetText() == "") {

            txtTenSangKien.SetFocus();
            alert('Xin vui lòng nhập tên sáng kiến !');
            return false;
        }
        else { CapNhatSangKien(); }

    }


    function waitUploadComplete() {
        if (!startUpload) {
            grdSangKien.UpdateEdit();

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }
   
</script>



<div style="height:430px;overflow:scroll;">
<dx:ASPxGridView ID="grdSangKien" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdSangKien"
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" KeyFieldName="Id"   
    OnRowDeleting="grdSangKien_RowDeleting"
    OnRowInserting="grdSangKien_RowInserting" 
    OnRowUpdating="grdSangKien_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh đề tài sáng kiến" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdSangKien.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" Width="30px" HeaderStyle-HorizontalAlign="Center"
            CellStyle-HorizontalAlign="Center">                       
            <DataItemTemplate>
                <%# Container.ItemIndex + 1 %>
            </DataItemTemplate>
        </dx:GridViewDataColumn>        
        <dx:GridViewDataColumn Caption="Số quyết định" FieldName="SoQD" HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <a href='<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/fileQD/<%# Eval("FileQD") %>' target="_blank"><%# Eval("SoQD") %></a>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Cấp quyết định" FieldName="CapQD" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Ngày quyết định" FieldName="NgayQD" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Tên sáng kiến" FieldName="TenSangKien" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Giải thưởng" FieldName="GiaiThuong" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Ghi Chú" FieldName="GhiChu" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="File quyết định" FieldName="FileQD" Visible="false" />
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
                <table cellpadding="1" cellspacing="1" width="100%" style="font-family: Verdana;
                    font-size: 9pt;">                    
                    <tr>
                        <td valign="top" style="width: 100px;">
                           Số QĐ
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtSoQD" ClientInstanceName="txtSoQD" runat="server" Width = "100%" Text='<%# Eval("SoQD") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign="top">
                           Cấp QĐ
                        </td>                        
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtCapQD" ClientInstanceName="txtCapQD" runat="server"  Width = "100%" Text='<%# Eval("CapQD") %>'
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign="top">
                            Ngày QĐ
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID = "dateNgayQD" runat="server" Width = "100%" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                ClientInstanceName="dateNgayQD" Date= '<%# Eval("NgayQD") == null ? DateTime.Now : (DateTime)Eval("NgayQD") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                             </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Tên sáng kiến
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtTenSangKien" ClientInstanceName="txtTenSangKien" runat="server" Width = "100%" Text='<%# Eval("TenSangKien") %>'
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign = "top">
                            Giải thưởng
                        </td>
                        <td>
                             <dx:ASPxTextBox ID="txtGiaiThuong" ClientInstanceName="txtGiaiThuong" runat="server" Width = "100%" Text='<%# Eval("giaithuong") %>'
                             CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign = "top">Ghi chú</td>
                        <td>
                            <dx:ASPxMemo ID="memoGhiChu" runat="server" Height="71px" Width = "100%" Text='<%# Eval("GhiChu") %>'
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td>File quyết định</td>
                        <td>
                            <dx:ASPxUploadControl ID="upFile" runat="server" Width = "100%" OnFileUploadComplete="upFile_OnFileUploadComplete"
                                ClientInstanceName="upFile" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                               <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />           
                                <ProgressBarSettings ShowPosition="true" />
                            </dx:ASPxUploadControl>
                            <dx:ASPxLabel runat="server" ClientInstanceName="lblTrangThaiDoi"></dx:ASPxLabel>
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
                                    <ClientSideEvents Click="function(s,e){
                                        
                                            SaveSangKien();
                                        
                                     }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        grdSangKien.CancelEdit();
                                    }" />
                                </dx:ASPxButton>
                            </div>
                        </td>                  
                    </tr>
                </table>
            </div>
        </EditForm>
         
    </Templates>
</dx:ASPxGridView>
</div>


            <div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdSangKien.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            grdSangKien.StartEditRow(grdSangKien.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                            grdSangKien.DeleteRow(grdSangKien.GetFocusedRowIndex());
                            }
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
    
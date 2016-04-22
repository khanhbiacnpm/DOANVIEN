<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KiemNhiem.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.KiemNhiem" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<script type="text/javascript">
    var startUpload = false;
    function save() {
        var sFile = uploadFileDinhKem.GetText();
        if (sFile != "") {
            startUpload = true;
            uploadFileDinhKem.Upload();
            waitUploadComplete();
        }
        else {
            gridKiemNhiem.UpdateEdit();
        }
    }

    var uplText = "Đang gửi file.Xin vui lòng chờ";
    function waitUploadComplete() {
        if (startUpload) {
            if (uplText.length < 40)
                uplText = uplText + ".";
            else
                uplText = "Đang gửi file. Xin vui lòng chờ";
            lblUploading.SetText(uplText);
            setTimeout("waitUploadComplete()", 1000);
        }
        else {
            gridKiemNhiem.UpdateEdit();
        }
    }
    function chon_kiemnhiem(s, e) {
        var value = s.GetValue();
        if (value == 1) {
            $("#chucvudang").show();
            $("#donvitochuc").show();
            $("#chucvu").hide();
            $("#chucdanh").hide();
            $("#donvi").hide();
        }
        else if (value == 2 || value == 5) {
            $("#chucvu").show();
            $("#donvitochuc").show();
            $("#chucvudang").hide();
            $("#chucdanh").hide();
            $("#donvi").hide();
        }
        else if (value == 3) {
            $("#donvi").show();
            $("#chucdanh").show();
            $("#donvitochuc").hide();                                   
            $("#chucvu").hide();
            txt_tochuc.SetText('');
        }
    }
    function load_text(s, e) {
        if (gridKiemNhiem.IsNewRowEditing()) {
            s.InsertItem(0, '-- Chọn --', '0');
            s.SetSelectedIndex(0);
        }
        else {
            var idx = gridKiemNhiem.GetFocusedRowIndex();
            gridKiemNhiem.GetRowValues(idx, "idloaikiemnhiem", function (value) {                
                if (value == 1) {
                    $("#chucvudang").show();
                    $("#donvitochuc").show();
                    $("#chucvu").hide();
                    $("#chucdanh").hide();
                    $("#donvi").hide();
                }
                else if (value == 2 || value == 5) {
                    $("#chucvu").show();
                    $("#donvitochuc").show();
                    $("#chucvudang").hide();
                    $("#chucdanh").hide();
                    $("#donvi").hide();
                }
                else if (value == 3) {
                    $("#donvi").show();
                    $("#chucdanh").show();
                    $("#donvitochuc").hide();
                    $("#chucvu").hide();
                    $("#chucvudang").hide();
                    txt_tochuc.SetText('');
                }
            });            
        }
    }
</script>   
<dx:ASPxGridView ID="gridKiemNhiem" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridKiemNhiem"
    Theme="Glass" KeyFieldName="id" Font-Size="12px" 
    OnRowDeleting="gridKiemNhiem_RowDeleting" 
    OnRowInserting="gridKiemNhiem_RowInserting"
    OnRowUpdating="gridKiemNhiem_RowUpdating"
    OnHtmlEditFormCreated="gridKiemNhiem_OnHtmlEditFormCreated" Width="100%">
    <SettingsBehavior  AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh chức vụ kiêm nhiệm" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <ClientSideEvents RowDblClick="function(s, e) {
            gridKiemNhiem.StartEditRow(e.visibleIndex);
        }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" Width="30px">
            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
            <CellStyle HorizontalAlign="Center" />
        </dx:GridViewDataColumn>        
        <dx:GridViewDataTextColumn Caption="Số quyết định" FieldName="soqd">
            <DataItemTemplate>
                <a href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>' target="_blank"><%# Eval("soqd") %></a>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>        
        <dx:GridViewDataTextColumn Caption="Thời gian" FieldName="thoidiem" />
        <dx:GridViewDataTextColumn Caption="Cấp QĐ" FieldName="capqd" />
        <dx:GridViewDataTextColumn Caption="Đơn vị/Tổ chức" FieldName="tentochuc" />
        <dx:GridViewDataTextColumn Caption="Chức vụ" FieldName="chucvu" />
        <dx:GridViewDataTextColumn Caption="Loại kiêm nhiệm" FieldName="loaikiemnhiem" />
        <dx:GridViewDataTextColumn Caption="Ghi chú" FieldName="ghichu" />
        <dx:GridViewDataTextColumn FieldName="idloaikiemnhiem" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="idchucvu" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="idchucvudang" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="idchucdanh" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="iddonvi" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="tochuc" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="ngayqd" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="ngayhetqd" Visible="false" />
    </Columns>       
    <Templates>    
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table cellpadding="1" cellspacing="1" width="500px" style="font-size: 9pt;">  
                    <tr>
                        <td valign="top" style="width:120px;">
                            Loại kiêm nhiệm:
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_loaikiemnhiem" runat="server" Width="100%" ClientInstanceName="cmb_loaikiemnhiem"                                 
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents SelectedIndexChanged ="chon_kiemnhiem" Init="load_text" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>                                     
                    <tr>
                        <td valign="top" style="width: 100px;">
                            Số quyết định:
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_soqd" runat="server" Text = '<%# Eval("soqd") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Thời điểm từ ngày:
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_ngayqd" runat="server" Value = '<%# Eval("ngayqd") %>'
                                DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                Theme="Glass" >
                            </dx:ASPxDateEdit> 
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đến ngày:
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_ngayhetqd" runat="server" Value = '<%# Eval("ngayhetqd") %>'
                                DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                Theme="Glass">
                            </dx:ASPxDateEdit> 
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Cấp quyết định:
                        </td>
                        <td valign="top">
                             <dx:ASPxTextBox ID="txt_capqd" runat="server" Text='<%# Eval("capqd") %>'
                                Width="100%" Theme="Glass">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr id="donvi" style="display:none;">
                        <td valign="top">
                            Đơn vị/Tổ chức:
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_donvi" runat="server" Width="100%" ClientInstanceName="cmb_donvi"                                 
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                Theme="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False">
                                <ClientSideEvents Init="load_text" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr> 
                    <tr id="donvitochuc">
                        <td valign="top">
                            Đơn vị/Tổ chức:
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_tochuc" runat="server" Width="100%" Text = '<%# Eval("tochuc") %>' ClientInstanceName="txt_tochuc"
                                Theme="Glass">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr id ="chucdanh" style="display:none;">
                        <td valign="top">
                            Chức danh:
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucdanh" runat="server" Width="100%" ClientInstanceName="cmb_chucdanh"                                 
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                Theme="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False">
                                <ClientSideEvents Init="load_text" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>    
                    <tr id ="chucvu" style="display:none;">
                        <td valign="top">
                            Chức vụ:
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucvu" runat="server" Width="100%" ClientInstanceName="cmb_chucvu"                                 
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                Theme="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False">
                                <ClientSideEvents Init="load_text" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr id ="chucvudang">
                        <td valign="top">
                            Chức vụ:
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucvudang" runat="server" Width="100%" ClientInstanceName="cmb_chucvudang"                                 
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                Theme="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" >
                                <ClientSideEvents Init="load_text" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>         
                    <tr>
                        <td valign="top">
                            File quyết định:
                        </td>
                        <td valign="top">
                            <dx:ASPxLabel ID ="lblUploading" runat="server" ClientInstanceName="lblUploading" ForeColor="Red" />                        
                            <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" 
                                OnFileUploadComplete="uploadFileDinhKem_Load"
                                ClientInstanceName="uploadFileDinhKem" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents FileUploadStart='function(s,e)
                                {
                                    startUpload = true;                                           
                                }' FilesUploadComplete='function(s,e)
                                {
                                    lblUploading.SetText("Gửi file hoàn tất.");
                                    startUpload = false;
                                }' />                              
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>                            
                    <tr>
                        <td valign="top">
                            Ghi chú:
                        </td>
                        <td valign="top">
                            <dx:ASPxMemo ID="txt_ghichu" runat="server" Height="41px" Text = '<%# Eval("ghichu") %>'
                                Width = "100%"
                                Theme="Glass" Font-Size="12px">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                            save();
                                        }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        gridKiemNhiem.CancelEdit();
                                     }" />
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
                         Theme="Glass" Font-Size="12px" Width="81px" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {
                            gridKiemNhiem.AddNewRow();
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            gridKiemNhiem.StartEditRow(gridKiemNhiem.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            gridKiemNhiem.DeleteRow(gridKiemNhiem.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
        </StatusBar>
    </Templates>   
</dx:ASPxGridView>

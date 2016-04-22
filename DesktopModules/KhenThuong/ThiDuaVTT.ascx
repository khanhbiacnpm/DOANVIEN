<%@ Control Language="C#" Inherits="DotNetNuke.Modules.KhenThuong.ThiDuaVTT" CodeFile="ThiDuaVTT.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
    
<script type="text/javascript">
    function Validate() {
        if (cmbNamThiDua.GetSelectedIndex() == -1) {

            cmbNamThiDua.SetFocus();
            alert('Xin vui lòng chọn năm thi đua !');
            return false;
        }
        if (cmbThanhTich.GetValue() == 0) {

            cmbThanhTich.SetFocus();
            alert('Xin vui lòng chọn thành tích thi đua !');
            return false;
        }
        if (cmbDanhHieuThiDua.GetSelectedIndex() == -1 || cmbDanhHieuThiDua.GetValue() == 0) {

            cmbDanhHieuThiDua.SetFocus();
            alert('Xin vui lòng chọn danh hiệu thi đua !');
            return false;
        }

        if (txtQuyetDinh.GetText() == "") {
            alert("Bạn chưa nhập số quyết định !");
            txtQuyetDinh.Focus();
            return false;
        }
        if (dateNgayQuyetDinh.GetText() == "") {
            alert("Bạn chưa chọn ngày quyết định !");
            dateNgayQuyetDinh.Focus();
            return false;
        }
        if (txtNguoiKy.GetText() == "") {
            alert("Bạn chưa nhập người ký !");
            txtNguoiKy.Focus();
            return false;
        }
        return true;
    }
    var startUpload = false;

    function waitUploadComplete() {
        if (!startUpload) {
            gridKhenThuong.UpdateEdit();

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }

    function send() {
        var file = UploadControl.GetText();

        var hasFile = file.length != 0;

        if (!hasFile) {
            gridKhenThuong.UpdateEdit();
        }
        else {
            startUpload = true;
            UploadControl.Upload();
            waituploadcomplete();
        }
    }
    function show_capquyetdinh(s,e) {
        var url = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1966';
        popup_capkhenthuong.SetContentUrl(url);
        popup_capkhenthuong.Show();
        gridKhenThuong.CancelEdit();
    }
    
    function load_combo(s, e) {
        if (gridKhenThuong.IsNewRowEditing()) {
            s.InsertItem(0, '-- Chọn --', 0);
            s.SetSelectedIndex(0);
        }
    }
</script>
<style type="text/css">
 .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 2px 10px 2px 2px;
}

.dxnbGroupHeader_Glass12
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 3px;
    }

    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
</style>
   <table cellpadding="2" cellspacing="0" width="798px" border="0" style="font-family:Times New Roman;font-size:11pt;" >

<tr >
   
        <td  class="dxnbGroupHeader_Glass12" style="width:80px;">
            Năm thi đua
        </td>
        <td  class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID="cmbNam" runat="server" ClientInstanceName="cmbNam" Width="100px"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                ValueType="System.Int32">
                <ClientSideEvents SelectedIndexChanged="function(s,e){                 
                  gridKhenThuong.PerformCallback(cmbNam.GetValue());
                }" />
            </dx:ASPxComboBox>
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                <ClientSideEvents Click="function(s, e) {
                        gridKhenThuong.AddNewRow();
                        }" />
                <Image Url="../../images/imgadmin/add.png" Width="14" Height="14">
                </Image>
            </dx:ASPxButton>
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {    
              
                            gridKhenThuong.StartEditRow(gridKhenThuong.GetFocusedRowIndex());
                        }" />
                <Image Url="../../images/imgadmin/edit.png">
                </Image>
            </dx:ASPxButton>
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                AutoPostBack="False" Height="23">
                <ClientSideEvents Click="function(s, e) {
                         if ( confirm('Bạn có muốn xóa ?') ) {gridKhenThuong.DeleteRow(gridKhenThuong.GetFocusedRowIndex());}
                        }" />
                <Image Url="../../images/imgadmin/delete_16.png" Width="14" Height="14">
                </Image>
            </dx:ASPxButton>
        </td>
        <td style="width: 320px;" class="dxnbGroupHeader_Glass12">&nbsp;
        </td>
    </tr>
    <tr style="height:5px;">
        <td></td>
    </tr>
    <tr>
    <td colspan="6"><dx:ASPxGridView ID="gridKhenThuong" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="Id" Caption="Danh hiệu thi đua VTT"
                ClientInstanceName="gridKhenThuong" 
                OnRowUpdating="grid_RowUpdating" 
                OnRowInserting="grid_RowInserting"
                OnRowDeleting="grid_RowDeleting" 
                OnCustomCallback="grid_CustomerCallback"
                OnHtmlEditFormCreated="grid_OnHtmlEditFormCreated"
                AutoGenerateColumns="False">
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
                
                <Templates>
                    <EditForm>
                        <div style="padding: 4px 4px 3px 4px">
                         <table cellpadding="2" cellspacing="0" width="794" border="0" style="font-family:Times New Roman;font-size:11pt;">
                            <tr>
                                <td valign="top" style="width: 150px;">
                                    Năm thi đua
                                </td>
                                <td valign="top" style="width: 190px;">
                                    <dx:ASPxComboBox ID="cmbNamThiDua" runat="server"  ValueType="System.Int32" 
                                        ClientInstanceName="cmbNamThiDua" Width="100%"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                       SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxComboBox>
                                </td>
                                <td>
                                    Cấp khen thưởng
                                </td>
                                <td>
                                    <div style="width:230px; height:25px;">
                                        <div style="width:200px; height:25px; float:left;">
                                            <dx:ASPxComboBox ID="cmb_capkhenthuong" runat="server" Width="100%" ClientInstanceName="cmb_capkhenthuong" ValueType="System.Int32"
                                               CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                               SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                <ClientSideEvents Init="load_combo" />
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div style="width:28px; height:25px; float:right;">
                                            <dx:ASPxButton ID="bt_themcapkhenthuong" runat="server" Width="25px" AutoPostBack="false" Theme="Glass" Font-Size="12px"
                                               HorizontalAlign="Center" Paddings-Padding="0" Border-BorderColor="#C0E0E3">
                                               <Image Url="../../images/imgadmin/add.png" Width="12" Height="12" />
                                               <ClientSideEvents Click="show_capquyetdinh" />
                                            </dx:ASPxButton>
                                        </div>
                                    </div>                                    
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 120px;">
                                    Thành tích
                                </td>
                                <td valign="top" style="width: 230px;">
                                    <dx:ASPxComboBox ID="cmbThanhTich" runat="server" ValueType="System.Int32" 
                                        ClientInstanceName="cmbThanhTich" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ClientSideEvents
                                       Init="function(s,e){
                                       if(gridKhenThuong.IsNewRowEditing()){
                                        s.InsertItem(0, '-- Chọn --', '0');
                                        s.SetSelectedIndex(0);
                                    }
                                       }"
                                         SelectedIndexChanged="function(s,e){
                
                    cmbDanhHieuThiDua.PerformCallback(cmbThanhTich.GetValue()+',0');
                 
                }" />
                                    </dx:ASPxComboBox>
                                </td>
                                <td valign="top" style="width: 140px;">
                                    Danh hiệu thi đua
                                </td>
                                <td valign="top" style="width: 230px;">
                                    <dx:ASPxComboBox OnCallback="cmbDanhHieu_Callback" ID="cmbDanhHieuThiDua" runat="server"
                                        DropDownStyle="DropDown" ValueType="System.Int32" ClientInstanceName="cmbDanhHieuThiDua" 
                                        IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80px;">
                                    Quyết định
                                </td>
                                <td style="width: 100px;">
                                    <dx:ASPxTextBox ID="txtQuyetDinh" Text='<%# Eval("Desicion") %>' runat="server" ClientInstanceName="txtQuyetDinh"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Width="100%">
                                        <ValidationSettings SetFocusOnError="True">
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td valign="top" style="width: 50px;">
                                    File
                                </td>
                                <td style="width: 200px;">
                                    <dx:ASPxUploadControl ID="UploadControlDanhHieu" runat="server" OnFileUploadComplete="UploadControl_FileUploadComplete"
                                        ClientInstanceName="UploadControl" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />
                                    </dx:ASPxUploadControl>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="width: 120px;">
                                    Ngày quyết định
                                </td>
                                <td valign="top" style="width: 100px;">
                                    <dx:ASPxDateEdit ID="dateNgayQuyetDinh" Text='<%# Eval("DesicionDate") %>' ClientInstanceName="dateNgayQuyetDinh"
                                        runat="server" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td style="width: 80px;">
                                    Người ký
                                </td>
                                <td style="width: 100px;">
                                    <dx:ASPxTextBox ID="txtNguoiKy" runat="server" Text='<%# Eval("NguoiKyQuyetDinh") %>'
                                        ClientInstanceName="txtNguoiKy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Nội dung khen thưởng
                                </td>
                                <td valign="top" colspan="3">
                                    <dx:ASPxTextBox ID="txtGhiChu" Text='<%# Eval("Title") %>' runat="server" ClientInstanceName="txtGhiChu"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Width="100%">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="3">
                                <table cellpadding="2" cellspacing="0" width="100%" >
                            <tr>
                             <td style="width: 140px;">
                                    <dx:ASPxButton ID="btnSend" runat="server" AutoPostBack="false" Theme="Glass" Font-Size="12px" Text="Lưu khen thưởng">
                                        <Image Url="../../images/imgadmin/email_send.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s, e) { 
                    
                    if(Validate()){
                        send();
                    }                    
                    }" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 90px;">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Theme="Glass" Font-Size="12px" Text="Đóng">
                                        <Image Url="../../images/imgadmin/delete_16.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s, e) {gridKhenThuong.CancelEdit();}" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 350px;">
                                </td>
                            </tr>
                            </table>
                                </td>
                               
                            </tr>
                        </table>
                        </div>
                    </EditForm>
                    
                </Templates>
               <Columns>
               
                    <dx:GridViewDataTextColumn FieldName="NguoiKyQuyetDinh" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="HinhThucThiDua" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idThanhTich" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Nam" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ThanhTichKhenThuong" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Desicion" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DanhHieu" Caption="Danh hiệu thi đua" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="loaidanhhieu" Caption="Thành tích khen thưởng"
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CapKhenThuong" Caption="Cấp khen thưởng" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" Caption="Nội dung khen thưởng" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DesicionDate" Caption="Ngày quyết định" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn Caption="Quyết định" FieldName="filekem" VisibleIndex="2">
                        <DataItemTemplate>
                            <a href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("filekem") %>'
                                target="_blank">
                                <%# Eval("Desicion") %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                  <dx:GridViewDataTextColumn FieldName="idcapkhenthuong" Visible="false" />
                </Columns>
                <Settings ShowStatusBar="Visible" />
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
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
                <SettingsText PopupEditFormCaption="Hiệu chỉnh loại bảo hiểm" ConfirmDelete="Bạn có muốn xóa" />
                <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                    PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="400px" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <SettingsPager PageSize="1000">
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
             
            </dx:ASPxGridView></td>
    </tr>

            </table>

<dx:ASPxPopupControl ID="popup_capkhenthuong" runat="server" Width="750px" Height="500px" 
    HeaderText="Thêm thông tin cấp khen thưởng" ClientInstanceName="popup_capkhenthuong" 
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ContentStyle-Paddings-Padding="0">    
</dx:ASPxPopupControl>

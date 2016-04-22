<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GiayKhenDonVi.ascx.cs" Inherits="DotNetNuke.Modules.KhenThuong.GiayKhenDonVi" %>
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



<style type="text/css">
    .dxbButton_Glass div.dxb {
        border: 0 none;
        padding: 2px 8px 2px 8px;
    }

    .dxnbGroupHeader_Glass12 {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 3px;
    }

    .dxnbControl_Glass1 {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
        font: 9pt Tahoma;
    }
</style>

<script type="text/javascript">



    function DongPopupNhanVien(s, e) {
        listNhanVienChon.SelectAll();
        listNhanVien.ClearItems();
        listNhanVien.BeginUpdate();
        var s1 = "";
        var items = listNhanVienChon.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            s1 += items[i].value + ",";
            listNhanVien.AddItem(items[i].text, items[i].value);
        }
        listChiTiet.PerformCallback(s1);
        listNhanVien.EndUpdate();
        //        listNhanVienChon.ClearItems();
        popupNhanVien.Hide();
        //countNhanVien.SetText(nNV + ' nhân viên được chọn');
        gridNhanVien.UnselectAllRowsOnPage();
    }
    function listNhanVienTolistNhanVienChon(s, e) {
        popupNhanVien.Show();
        listNhanVien.SelectAll();
        listNhanVienChon.ClearItems();
        listNhanVienChon.BeginUpdate();

        var items = listNhanVien.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            listNhanVienChon.AddItem(items[i].text, items[i].value);
        }
        listNhanVienChon.EndUpdate();
    }

    function Validate() {


        if (cmbNamThiDua.GetSelectedIndex() == -1) {

            cmbNamThiDua.SetFocus();
            alert('Xin vui lòng chọn năm thi đua !');
            return false;
        }
        if (cmbThanhTich.GetSelectedIndex() == -1 || cmbThanhTich.GetValue() == 0) {

            cmbThanhTich.SetFocus();
            alert('Xin vui lòng chọn thành tích thi đua !');
            return false;
        }

        //        if (cmbHinhThucKhenThuong.GetSelectedIndex() == -1 || cmbHinhThucKhenThuong.GetValue() == 0) {

        //            cmbHinhThucKhenThuong.SetFocus();
        //            alert('Xin vui lòng chọn hình thức khen thưởng !');
        //            return false;
        //        }
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


        if (listNhanVien.GetItemCount() == 0) {
            alert("Vui lòng chọn đơn vị !");
            return false;
        }

        return true;
    }


    function DonVi(cmbUnit) {
        listNV.PerformCallback(cmbUnit.GetValue().toString());
    }
    function NhomTin(nhomtin) {
        var count = listNhanVienChon.GetItemCount();
        var s = "";
        for (var j = 0; j < count; j++) {
            var item = listNhanVienChon.GetItem(j);
            s += item.value + ",";
        }
        listNhanVienChon.PerformCallback(s);
        btpopup_huyNhanVien.SetEnabled(true);
    }
    var flagNhanVien = false, nNV = 0
    function gridNhanVien_SelectionChanged(s, e) {
        gridNhanVien.GetSelectedFieldValues('id;name', GetSelectedFieldValuesCallback_NhanVien);
    }
    function GetSelectedFieldValuesCallback_NhanVien(values) {
        var listtext = "", listevalue = "";
        var count = listNhanVienChon.GetItemCount();
        listNhanVienChon.BeginUpdate();
        try {
            for (var i = 0; i < values.length; i++) {
                for (var j = 0; j < values[i].length; j++) {
                    listtext = values[i][1];
                    listevalue = values[i][0];
                }
                if (count > 0) {
                    nNV = count;
                    for (var p = 0; p < count; p++) {
                        var item = listNhanVienChon.GetItem(p);
                        if (item.value == listevalue) {
                            flagNhanVien = true;
                            break;
                        }
                        else {
                            flagNhanVien = false;
                        }
                    }
                } else {
                    flagNhanVien = false;
                }
                if (flagNhanVien == false) {

                    listNhanVienChon.AddItem(listtext, listevalue);
                    nNV++;
                }
            }
        } finally {
            listNhanVienChon.EndUpdate();
            gridNhanVien.UnselectAllRowsOnPage();
            btpopup_huyNhanVien.SetEnabled(true);
        }
    }
    function RemoveItemListNhanVien(s, e) {
        listNhanVienChon.BeginUpdate();
        var items = listNhanVienChon.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            listNhanVienChon.RemoveItem(items[i].index);
            nNV--;
        }
        listNhanVienChon.EndUpdate();
    }


    function nguoinhan(values) {

        gridNguoiNhan.PerformCallback(values);
        popUpNguoiNhan.Show();

    }
    function listNhanVienChonTolistNhanVien(s, e) {
        listNhanVienChon.SelectAll();
        listNhanVien.ClearItems();
        listNhanVien.BeginUpdate();
        var s1 = "";
        var items = listNhanVienChon.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            s1 += items[i].value + ",";
            listNhanVien.AddItem(items[i].text, items[i].value);
        }
        listChiTiet.PerformCallback(s1);
        listNhanVien.EndUpdate();
        listNhanVienChon.ClearItems();
        popupNhanVien.Hide();
        //countNhanVien.SetText(nNV + ' nhân viên được chọn');
        gridNhanVien.UnselectAllRowsOnPage();
    }


    var startUpload = false;

    function waitUploadComplete() {
        if (!startUpload) {
            CallbackPanel.PerformCallback('send');

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }


    function send() {


        var count = listNhanVien.GetItemCount();

        var s = "";
        for (var j = 0; j < count; j++) {

            var item = listNhanVien.GetItem(j);
            s += item.value + ",";

        }

        listnv.Set("s", s);
        var file = UploadControl.GetText();

        var hasFile = file.length != 0;

        if (!hasFile) {
            CallbackPanel.PerformCallback('send');
        }
        else {

            startUpload = true;
            UploadControl.Upload();




            waituploadcomplete();
        }


    }

    function EndCallBack() {

        if (CallbackPanel.cpResult == 1) {
            pnlList.SetVisible(true);
            CallbackPanel.SetVisible(false);
            pnlChiTietKhenThuong.SetVisible(false);
            gridKhenThuong.PerformCallback('0,' + cmbNamThiDua.GetValue());
            delete CallbackPanel.cpResult;
        }
    }
    function KhenThuong(nhom) {
        hiddenNhom.Set("nhom", nhom);
        pnlList.SetVisible(false);
        CallbackPanel.SetVisible(true);
        pnlChiTietKhenThuong.SetVisible(true);
        CallbackPanel.PerformCallback(nhom);
        pnlChiTietKhenThuong.PerformCallback(nhom);

    }

    function DanhSachKhenThuong() {


        pnlList.SetVisible(true);
        CallbackPanel.SetVisible(false);
        pnlChiTietKhenThuong.SetVisible(false);


    }
    function ThemKhenTHuong() {

        pnlList.SetVisible(false);
        CallbackPanel.SetVisible(true);
        pnlChiTietKhenThuong.SetVisible(true);
        txtQuyetDinh.SetText("");
        dateNgayQuyetDinh.SetText("");
        txtNguoiKy.SetText("");
        cmbThanhTich.SetSelectedIndex(0);
        cmbDanhHieuThiDua.SetSelectedIndex(0);
        txtGhiChu.SetText("");
        txtCapKhenThuong.SetText("");
        CallbackPanel.PerformCallback("reset");

    }

    function OnGridFocusedRowChanged() {

        gridKhenThuong.GetRowValues(gridKhenThuong.GetFocusedRowIndex(), 'Nhom', OnGetRowValues);
    }

    //Value array contains "EmployeeID" and "Notes" field values returned from the server
    function OnGetRowValues(values) {

        pnlList.PerformCallback("xoa" + values);

    }
    function show_capquyetdinh(s, e) {
        var url = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1966';
        popup_capkhenthuong.SetContentUrl(url);
        popup_capkhenthuong.Show();
        gridKhenThuong.CancelEdit();
    }
    function close_popup(s, e) {
        cmb_capkhenthuong.PerformCallback();
    }
    function load_combo(s, e) {
        if (gridKhenThuong.IsNewRowEditing()) {
            s.InsertItem(0, '-- Chọn --', 0);
            s.SetSelectedIndex(0);
        }
    }
</script>
<dx:ASPxPopupControl ID="popup_capkhenthuong" runat="server" Width="750px" Height="500px" 
    HeaderText="Thêm thông tin cấp khen thưởng" ClientInstanceName="popup_capkhenthuong" 
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ClientSideEvents CloseUp="close_popup" />    
</dx:ASPxPopupControl>

<dx:ASPxCallbackPanel ID="pnlList" runat="server" Width="798" LoadingPanelStyle-VerticalAlign="Top"
    LoadingPanelStyle-HorizontalAlign="Center" ClientInstanceName="pnlList"
    OnCallback="pnlList_Callback" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" LoadingPanelImagePosition="Top" Border-BorderWidth="0">
    <ClientSideEvents EndCallback="function(s,e){gridKhenThuong.PerformCallback(cmbThanhTichKhenThuong.GetValue()+','+cmbNam.GetValue());}" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent3" runat="server" Width="100%">
            <table cellpadding="0" cellspacing="0" align="center" width="100%" style="font-family: Times New Roman; font-size: 11pt;">

                <tr>

                    <td class="dxnbGroupHeader_Glass12">Năm thi đua
                    </td>
                    <td class="dxnbGroupHeader_Glass12">
                        <dx:ASPxComboBox ID="cmbNam" runat="server" ClientInstanceName="cmbNam"
                            Width="100px"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
                            <ClientSideEvents SelectedIndexChanged="function(s,e){
                 
                  gridKhenThuong.PerformCallback(cmbThanhTichKhenThuong.GetValue()+','+cmbNam.GetValue());
                }" />
                        </dx:ASPxComboBox>

                    </td>
                    <td class="dxnbGroupHeader_Glass12">Thành tích khen thưởng
                    </td>
                    <td class="dxnbGroupHeader_Glass12">
                        <dx:ASPxComboBox ID="cmbThanhTichKhenThuong" runat="server" ClientInstanceName="cmbThanhTichKhenThuong"
                            Width="250px"
                            TextField="ten" ValueField="id"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
                            <ClientSideEvents SelectedIndexChanged="function(s,e){
                   
                    gridKhenThuong.PerformCallback(cmbThanhTichKhenThuong.GetValue()+','+cmbNam.GetValue());
                }" />
                        </dx:ASPxComboBox>
                        <dx:ASPxHiddenField ID="hfidthanhtich" runat="server" ClientInstanceName="hfidthanhtich">
                        </dx:ASPxHiddenField>
                    </td>
                    <td style="width: 80px;" class="dxnbGroupHeader_Glass12">
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                            AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                            <ClientSideEvents Click="function(s, e) {
                           ThemKhenTHuong();
                        }" />
                            <Image Url="../../images/imgadmin/add.png" Width="14" Height="14"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td style="width: 60px;" class="dxnbGroupHeader_Glass12">

                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                            AutoPostBack="False" Height="23">
                            <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                         OnGridFocusedRowChanged();
                            }
                        }" />
                            <Image Url="../../images/imgadmin/delete_16.png" Width="14" Height="14"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td style="width: 20px;" class="dxnbGroupHeader_Glass12">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7" style="padding: 3px;">
                        <dx:ASPxGridView ID="gridKhenThuong" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="Id" Caption="Danh sách tập thể " ClientInstanceName="gridKhenThuong"
                            OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared" OnCustomCallback="grid_CustomerCallback"
                            AutoGenerateColumns="False">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
                            <Columns>

                                <dx:GridViewDataTextColumn FieldName="idthanhtich" Visible="false" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nhom" Visible="false" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Loai" Visible="false" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Desicion" Visible="false" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="songuoi" Visible="false" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Ten" Caption="Hình thức khen thưởng" VisibleIndex="1">
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
                                        <a href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("filekem") %>' target="_blank"><%# Eval("Desicion") %></a>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>


                                <%--  <dx:GridViewDataTextColumn FieldName="CapKhenThuong" Visible="false" Caption="Cấp khen thưởng" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataTextColumn FieldName="Id" Caption="Danh sách chi tiết" Width="150px">
                                    <DataItemTemplate>
                                        <asp:LinkButton ID="ltChiTiet" runat="server"></asp:LinkButton>

                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowStatusBar="Visible" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                            <SettingsPager PageSize="1000">
                                <Summary AllPagesText="{0} - {1} " Visible="False" />
                            </SettingsPager>
                        </dx:ASPxGridView>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>




<dx:ASPxCallbackPanel ID="pnlChiTietKhenThuong" runat="server" Width="794" LoadingPanelStyle-VerticalAlign="Top"
    LoadingPanelStyle-HorizontalAlign="Center" ClientInstanceName="pnlChiTietKhenThuong"
    OnCallback="pnlChiTietKhenThuong_Callback" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" LoadingPanelImagePosition="Top">
    <ClientSideEvents Init="function(s,e){pnlChiTietKhenThuong.SetVisible(false);}" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent2" runat="server">
            <table cellpadding="2" cellspacing="0" width="794">
                <tr>
                    <td valign="top" style="width: 170px;">Năm thi đua
                    </td>
                    <td valign="top" style="width: 220px;">
                        <dx:ASPxComboBox ID="cmbNamThiDua" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                            ClientInstanceName="cmbNamThiDua" IncrementalFilteringMode="Contains" Width="220px"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                            ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxComboBox>
                    </td>
                    <td>Cấp khen thưởng
                    </td>
                    <td>
                        <div style="width: 230px; height: 25px;">
                            <div style="width: 200px; height: 25px; float: left;">
                                <dx:ASPxComboBox ID="cmb_capkhenthuong" runat="server" Width="100%"
                                    OnCallback="cmb_capkhenthuong_OnCallback"
                                    ClientInstanceName="cmb_capkhenthuong" ValueType="System.Int32"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    <ClientSideEvents Init="load_combo" />
                                </dx:ASPxComboBox>
                            </div>
                            <div style="width: 28px; height: 25px; float: right;">
                                <dx:ASPxButton ID="bt_themcapkhenthuong" runat="server" Width="25px" AutoPostBack="false"
                                    HorizontalAlign="Center" Paddings-Padding="0" Border-BorderColor="#C0E0E3">
                                    <Image Url="../../images/imgadmin/add.png" Width="12" Height="12" />
                                    <ClientSideEvents Click="show_capquyetdinh" />
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="width: 170px;">Thành tích
                    </td>
                    <td valign="top" style="width: 220px;">
                        <dx:ASPxComboBox ID="cmbThanhTich" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                            ClientInstanceName="cmbThanhTich" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxComboBox>
                    </td>
                    <td valign="top" style="width: 170px;">Hình thức khen thưởng
                    </td>
                    <td valign="top" style="width: 220px;">
                        <dx:ASPxComboBox ID="cmbDanhHieuThiDua" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                            ClientInstanceName="cmbDanhHieuThiDua" IncrementalFilteringMode="Contains" Width="100%"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                            ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>Quyết định
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtQuyetDinh" runat="server" ClientInstanceName="txtQuyetDinh"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">
                            <ValidationSettings SetFocusOnError="True">
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td valign="top">File
                    </td>
                    <td>
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

                    <td valign="top">Ngày quyết định
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="dateNgayQuyetDinh" ClientInstanceName="dateNgayQuyetDinh" runat="server"
                            DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td>Người ký
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNguoiKy" runat="server" ClientInstanceName="txtNguoiKy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Nội dung khen thưởng
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txtGhiChu" runat="server" ClientInstanceName="txtGhiChu" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>                
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="794" LoadingPanelStyle-VerticalAlign="Top"
    LoadingPanelStyle-HorizontalAlign="Center" ClientInstanceName="CallbackPanel"
    OnCallback="ASPxCallbackPanel1_Callback" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" LoadingPanelImagePosition="Top">
    <ClientSideEvents Init="function(s,e){CallbackPanel.SetVisible(false);}" EndCallback="function(s,e){EndCallBack();}" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <dx:ASPxHiddenField ID="listnv" runat="server" ClientInstanceName="listnv">
            </dx:ASPxHiddenField>
            <table cellpadding="2" cellspacing="0" align="center" width="794">
                <tr>
                    <td>
                        <dx:ASPxHiddenField ID="hiddenNhom" runat="server" ClientInstanceName="hiddenNhom">
                        </dx:ASPxHiddenField>
                        <dx:ASPxButton ID="btGuiNhanVien" runat="server" Text="Danh sách đơn vị" AutoPostBack="false"
                            Width="200px" 
                            ClientInstanceName="btGuiNhanVien" Theme="Glass" Font-Size="12px">
                            <Image Url="../../images/imgadmin/user_blue.png">
                            </Image>
                            <ClientSideEvents Click="listNhanVienTolistNhanVienChon" />
                        </dx:ASPxButton>
                    </td>
                    <td style="width: 160px;">
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
                    <td style="width: 80px;">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Theme="Glass" Font-Size="12px" Text="Đóng">
                            <Image Url="../../images/imgadmin/delete_16.png">
                            </Image>
                            <ClientSideEvents Click="function(s, e) {DanhSachKhenThuong();}" />
                        </dx:ASPxButton>
                    </td>

                    <td style="width: 300px;"></td>
                    <td style="visibility: hidden; height: 0px">
                        <dx:ASPxListBox ID="listNhanVien" runat="server" Width="100%" Height="0px" ClientInstanceName="listNhanVien"
                            SelectionMode="CheckColumn" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanelImage>
                        </dx:ASPxListBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <dx:ASPxGridView ID="listChiTiet" runat="server" AutoGenerateColumns="False" Theme="Glass" Font-Size="12px" Width="100%" ClientInstanceName="listChiTiet" KeyFieldName="id"
                            OnCustomCallback="listChiTiet_CustomCallback" OnHtmlDataCellPrepared="listChiTiet_HtmlDataCellPrepared">
                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                <Table Font-Bold="False">
                                </Table>
                                <Header Font-Bold="True" ForeColor="#ffffff" BackgroundImage-ImageUrl="~/Images/OMS/head_center.png"
                                    CssClass="dxgvHeader">
                                    <BackgroundImage ImageUrl="~/Images/OMS/head_center.png"></BackgroundImage>
                                </Header>
                                <LoadingPanel ImageSpacing="8px">
                                </LoadingPanel>
                                <Cell Font-Bold="False">
                                </Cell>
                                <TitlePanel Font-Bold="True">
                                </TitlePanel>
                            </Styles>
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <SettingsPager Mode="ShowAllRecords">
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
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="700px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormVerticalAlign="TopSides" />
                            <SettingsText PopupEditFormCaption="Hiệu chỉnh thành viên nhóm tin" />
                            <Columns>

                                <dx:GridViewDataTextColumn Caption="Đơn vị" VisibleIndex="1" FieldName="name"
                                    Width="250px">
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="Đơn vị chủ quản" VisibleIndex="3" FieldName="parentid">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lblDV" runat="server">
                                        </dx:ASPxLabel>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowStatusBar="Hidden" ShowVerticalScrollBar="True" VerticalScrollBarStyle="Standard" VerticalScrollableHeight="260" />

                        </dx:ASPxGridView>
                    </td>
                </tr>
                <tr>
                </tr>

            </table>
        </dx:PanelContent>
    </PanelCollection>
    <LoadingPanelStyle HorizontalAlign="Center" VerticalAlign="Top">
    </LoadingPanelStyle>
</dx:ASPxCallbackPanel>



<dx:ASPxPopupControl ID="popupNhanVien" runat="server" ClientInstanceName="popupNhanVien"
    Width="750px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above"
    AutoUpdatePosition="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
    <ClientSideEvents CloseUp="function(s,e){DongPopupNhanVien()}" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
            <table cellpadding="2" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 45%" valign="top">
                        <table cellpadding="2" cellspacing="0" width="100%">
                            <tr>
                                <td align="center" style="font-family: Verdana; font-size: 10pt;" valign="top">
                                    <dx:ASPxComboBox ID="cmbUnit" ClientInstanceName="cmbUnit" runat="server" Width="100%"
                                        IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ClientSideEvents Init="function(s,e){ s.InsertItem(0,'-- Chọn --','0'); s.SetSelectedIndex(0)}"
                                            SelectedIndexChanged="function(s,e){gridNhanVien.PerformCallback(cmbUnit.GetValue());}" />
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="gridNhanVien" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridNhanVien"
                                        Theme="Glass" Font-Size="12px" KeyFieldName="id"
                                        OnCustomCallback="gridNhanVien_CustomCallback" Width="100%">
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="30px">
                                                <HeaderTemplate>
                                                    <input onclick="gridNhanVien.SelectAllRowsOnPage(this.checked);" type="checkbox" />
                                                </HeaderTemplate>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="name" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="370" />
                                        <SettingsLoadingPanel ImagePosition="Top" />
                                        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                                            </LoadingPanelOnStatusBar>
                                            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                                            </LoadingPanel>
                                        </Images>
                                        <SettingsBehavior AllowSort="false" />
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 10%">
                        <div style="height: 30px">
                            <dx:ASPxButton ID="btpopup_huyNhanVien" runat="server" ClientInstanceName="btpopup_huyNhanVien"
                                Text="Hủy" AutoPostBack="false" 
                                Width="70px" Theme="Glass" Font-Size="12px">
                                <ClientSideEvents Click="RemoveItemListNhanVien" />
                            </dx:ASPxButton>
                        </div>
                        <dx:ASPxButton ID="btpopup_chonNhanVien" runat="server" Text="Chọn >>" AutoPostBack="false"
                            Width="70px" Theme="Glass" Font-Size="12px">
                            <ClientSideEvents Click="gridNhanVien_SelectionChanged" />
                        </dx:ASPxButton>
                    </td>
                    <td style="width: 45%" valign="top">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="width: 300px; font-family: Verdana; font-size: 10pt;" valign="top">Danh sách đơn vị được chọn
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <dx:ASPxListBox ID="listNhanVienChon" runat="server" Width="100%" ClientInstanceName="listNhanVienChon"
                                        SelectionMode="CheckColumn" ValueField="id" TextField="name" EnableSynchronization="False"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Height="400px" OnSelectedIndexChanged="listNhanVienChon_SelectedIndexChanged"
                                        OnCallback="listNhanVienChon_Callback">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
</dx:ASPxPopupControl>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SangKien.ascx.cs" Inherits="VNPT.Modules.SangKien.SangKien" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    
<script type="text/javascript">
    var startUpload = false;
    function save() {            
        var sFile = uploadFile.GetText();
        if (sFile != "") {
            startUpload = true;
            uploadFile.Upload();
            waitUploadComplete();
        }
        else {
            if (hf_sangkien.Get('idsangkien') == 0)
                cb_luusangkien.PerformCallback('save');
            else
                cb_luusangkien.PerformCallback('update' + hf_sangkien.Get('idsangkien'));
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
            if (hf_sangkien.Get('idsangkien') == 0)
                cb_luusangkien.PerformCallback('save');
            else
                cb_luusangkien.PerformCallback('update' + hf_sangkien.Get('idsangkien'));
        }
    }

    function AddSelectedItems() {
        MoveSelectedItems(lbAvailable, lbChoosen);        
        UpdateButtonState();        
    }
    function AddAllItems() {
        MoveAllItems(lbAvailable, lbChoosen);
        UpdateButtonState();
    }
    function RemoveSelectedItems() {
        MoveSelectedItems(lbChoosen, lbAvailable);
        UpdateButtonState();
    }
    function RemoveAllItems() {
        MoveAllItems(lbChoosen, lbAvailable);
        UpdateButtonState();
    }
    function MoveSelectedItems(srcListBox, dstListBox) {        
        srcListBox.BeginUpdate();
        dstListBox.BeginUpdate();

        var items = srcListBox.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            dstListBox.AddItem(items[i].text, items[i].value);            
            srcListBox.RemoveItem(items[i].index);
        }        
        srcListBox.EndUpdate();
        dstListBox.EndUpdate();        
    }
    function MoveAllItems(srcListBox, dstListBox) {
        srcListBox.BeginUpdate();
        var count = srcListBox.GetItemCount();
        for (var i = 0; i < count; i++) {
            var item = srcListBox.GetItem(i);
            dstListBox.AddItem(item.text, item.value);
        }
        srcListBox.EndUpdate();
        srcListBox.ClearItems();
    }
    function UpdateButtonState() {
        btnMoveAllItemsToRight.SetEnabled(lbAvailable.GetItemCount() > 0);
        btnMoveAllItemsToLeft.SetEnabled(lbChoosen.GetItemCount() > 0);
        btnMoveSelectedItemsToRight.SetEnabled(lbAvailable.GetSelectedItems().length > 0);
        btnMoveSelectedItemsToLeft.SetEnabled(lbChoosen.GetSelectedItems().length > 0);
    }
    function OnDonViChaChanged(cmbDonVi) {
        lbAvailable.PerformCallback(cmbDonVi.GetValue());
    }
    function OnMoreInfoClick(key) {
        ShowNhanVien();
        hf_sangkien.Set('idsangkien', key);
        cb_luusangkien.PerformCallback('loadedit' + key);        
    }
    function chonNam(s, e) {
        grid_sangkien.PerformCallback(s.GetValue());
    }
    function loadNam(s, e) {
        var item = s.FindItemByValue(s.cpNam);        
        if (item != null)
            s.SetSelectedIndex(item.index);        
        grid_sangkien.PerformCallback(s.GetValue());
    }
    function ShowNhanVien() {
        $("#idnhanvien").show();
        $("#idbttrolai").show();
        $("#idbtthem").hide();
        $("#idkhoa").hide();
        hf_sangkien.Set('idsangkien', 0);       
    }
    function ShowKhoa() {
        $("#idkhoa").show();
        $("#idbtthem").show();
        $("#idnhanvien").hide();
        $("#idbttrolai").hide();        
    }
    function dongpupop(s,e) {
        lbChoosen.SelectAll();       
        var s1 = "";
        var items = lbChoosen.GetSelectedItems();        
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            s1 += items[i].value + ",";
        }        
        grid_nhanvien.PerformCallback('load'+s1);
        popup.Hide();
    }
    function checkluu() {
        if (txt_soqd.GetText() == "") {
            alert('Vui lòng nhập số quyết định.');
            txt_soqd.Focus();
            return false;
        } else if (cmb_loai.GetValue() == 0) {
            alert('Vui lòng chọn loại sáng kiến.');
            cmb_loai.Focus();
            return false;
        } else if (cmb_capquyetdinh.GetValue() == 0) {
            alert('Vui lòng chọn cấp quyết định sáng kiến.');
            cmb_capquyetdinh.Focus();
            return false;
        } else if (date_ngayqd.GetText() == "") {
            alert('Vui lòng chọn ngày quyết định');
            date_ngayqd.Focus();
            return false;
        } else if (txt_ten.GetText() == "") {
            alert('Vui lòng nhập tên sáng kiến.');
            txt_ten.Focus();
            return false;
        }else if (lbChoosen.GetItemCount() == 0) {
            alert('Vui lòng chọn danh sách nhân viên')
            return false;
        }        
        return true;
    }

    function xuly_sangkien(s,e) {
        if (cb_luusangkien.cpOP == 0) {
            ShowKhoa();
            cmb_nam.PerformCallback();
            delete cb_luusangkien.cpOP;
            alert('Lưu thông tin thành công.');
        }
        else if (cb_luusangkien.cpOP == 1) {
            var list = $.parseJSON(cb_luusangkien.cpListNV);
            lbAvailable.ClearItems();
            lbChoosen.ClearItems();
            lbChoosen.BeginUpdate();
            for (var i = 0; i < list.length; i++) {
                lbChoosen.AddItem(list[i].hoten, list[i].id);
            }
            lbChoosen.EndUpdate();
            delete cb_luusangkien.cpOP;
            showhide_button(1);
        } else if (cb_luusangkien.cpOP == 2) {
            cmb_khoadaotao.ClearItems();
            lbChoosen.ClearItems();
            cmb_nam.PerformCallback();
            delete cb_luusangkien.cpOP;
            alert('Xóa thông tin thành công.');
        }
    }
    
    function xoasangkien(s, e) {
        grid_sangkien.GetRowValues(grid_sangkien.GetFocusedRowIndex(), 'id', function (value)
        { cb_luusangkien.PerformCallback('delete' + value); });
    }

    function showhide_button(trangthai) {
        if (trangthai == 0) {
            $("#idthemsangkien").show();
            $("#idcapnhatsangkien").hide();
        }
        else {
            $("#idthemsangkien").hide();
            $("#idcapnhatsangkien").show();
        }
    }
    function show_pupop(trangthai) {
        var url = null;
        if (trangthai == 0) {
            hf_sangkien.Set('trangthai', trangthai);
            url = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1969'; //loai
        }
        else {
            hf_sangkien.Set('trangthai', trangthai);
            url = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1968'; //cap
        }
        popup_capduyet_loai.SetContentUrl(url);
        popup_capduyet_loai.Show();        
    }
    function close_popup(s,e) {
        if (hf_sangkien.Get('trangthai') == 0)
            cmb_loai.PerformCallback();
        else if (hf_sangkien.Get('trangthai') == 1)
            cmb_capquyetdinh.PerformCallback();
    }
    function init_combo(s, e) {
        s.InsertItem(0, '-- Chọn --', 0);
        s.SetSelectedIndex(0);
    }
</script>
<dx:ASPxPopupControl ID="popup_capduyet_loai" runat="server" Width="750px" Height="500px" 
    HeaderText="Thêm thông tin" ClientInstanceName="popup_capduyet_loai" 
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ClientSideEvents CloseUp="close_popup" />    
</dx:ASPxPopupControl>
 <style type="text/css">
    .dxbButton_Glass div.dxb
    {
        border: 0 none;
        padding: 1px 2px 1px 2px;
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
<dx:ASPxHiddenField ID="hf_sangkien" runat="server" ClientInstanceName="hf_sangkien">
</dx:ASPxHiddenField>
<table width="99%" cellpadding="2" cellspacing="0" align="center" border="0">
    <tr id="idbtthem">
        <td style="width: 90px;">
            Chọn năm:
        </td>
        <td style="width: 257px;">
            <dx:ASPxComboBox ID="cmb_nam" runat="server" ClientInstanceName="cmb_nam" Width="250px"
                ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnCallback="cmb_nam_OnCallback">
                <ClientSideEvents SelectedIndexChanged="chonNam" EndCallback="loadNam" />
            </dx:ASPxComboBox>
        </td>
        <td style="width: 90px;">
            <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                <ClientSideEvents Click="function(s, e) {
                                ShowNhanVien();
                                cb_luusangkien.PerformCallback('loadnull');
                            }" />
                <Image Url="../../images/imgadmin/add.png">
                </Image>
            </dx:ASPxButton>
        </td>
        <td style="width: 90px; left:0;">
            <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px"  Width="81px"
                AutoPostBack="False">
                <ClientSideEvents Click="xoasangkien" />
                <Image Url="../../images/imgadmin/delete_16.png">
                </Image>
            </dx:ASPxButton>
        </td>
        <td class="dxnbGroupHeader_Glass12">
            &nbsp;
        </td>
    </tr>
    <tr id="idkhoa">
        <td colspan="5">
            <dx:ASPxGridView ID="grid_sangkien" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid_sangkien"
                Theme="Glass" Font-Size="12px" KeyFieldName="id"
                Width="100%" OnCustomCallback="grid_sangkien_OnCustomCallback">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ten" Caption="Tên sáng kiến" />
                    <dx:GridViewDataTextColumn FieldName="soqd" Caption="Số QĐ">
                        <DataItemTemplate>
                            <a target="_blank" href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>'>
                                <%# Eval("soqd") %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="capqd" Caption="Cấp QĐ" />
                    <dx:GridViewDataTextColumn FieldName="noidung" Caption="Nội dung sáng kiến" />
                    <dx:GridViewDataTextColumn FieldName="nvchutri" Caption="Nhân viên chủ trì" />
                    <dx:GridViewDataTextColumn Caption="Danh sách nhân viên">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                <%# Eval("nvthamgia") + " Nhân viên" %></a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </td>
    </tr>
    <tr id="idnhanvien" style="display: none;">
        <td colspan="3">
            <dx:ASPxCallbackPanel ID="cb_luusangkien" runat="server" ClientInstanceName="cb_luusangkien"
                OnCallback="cb_luusangkien_OnCallback">
                <ClientSideEvents EndCallback="xuly_sangkien" />
                <PanelCollection>
                    <dx:PanelContent ID="pc">
                        <table width="100%" border="0" style="font-size: 11pt; font-family: Times New Roman;
                            border-top: 1px solid #C0E0E7;" cellpadding="2" cellspacing="0">
                            <tr>
                                <td style="width: 120px;">
                                    Số quyết định
                                </td>
                                <td style="width: 250px;">
                                    <dx:ASPxTextBox ID="txt_soqd" runat="server" ClientInstanceName="txt_soqd" Width="100%"
                                        Text='<%# Eval("soqd") %>' CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 100px;">
                                    Loại sáng kiến
                                </td>
                                <td style="width: 250px">
                                    <div style="width: 250px; height: 25px;">
                                        <div style="width: 220px; height: 25px; float: left;">
                                            <dx:ASPxComboBox ID="cmb_loai" runat="server" IncrementalFilteringMode="Contains"
                                                ClientInstanceName="cmb_loai" OnCallback="cmb_loai_OnCallback" DropDownStyle="DropDown"
                                                ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                <ClientSideEvents EndCallback="init_combo" />
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div style="width: 28px; height: 25px; float: right;">
                                            <dx:ASPxButton ID="bt_themloai" runat="server" Width="25px" AutoPostBack="false"
                                                HorizontalAlign="Center" Paddings-Padding="0" Border-BorderColor="#C0E0E3" Theme="Glass" Font-Size="12px" >
                                                <Image Url="../../images/imgadmin/add.png" Width="12px" Height="12px" ToolTip="Thêm loại sáng kiến" />
                                                <ClientSideEvents Click="function(s,e){show_pupop(0);}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </td>
                                <td style="width:auto;"></td>
                            </tr>
                            <tr>                                
                                <td>
                                    Ngày QĐ
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="date_ngayqd" runat="server" ClientInstanceName="date_ngayqd"
                                        Width="100%" Value='<%# Eval("ngayqd") %>' DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td>
                                    Cấp quyết định
                                </td>
                                <td>
                                    <div style="width: 250px; height: 25px;">
                                        <div style="width: 220px; height: 25px; float: left;">
                                            <dx:ASPxComboBox ID="cmb_capquyetdinh" runat="server" IncrementalFilteringMode="Contains"
                                                ClientInstanceName="cmb_capquyetdinh" OnCallback="cmb_capquyetdinh_OnCallback"
                                                DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                <ClientSideEvents EndCallback="init_combo" />
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div style="width: 28px; height: 25px; float: right;">
                                            <dx:ASPxButton ID="bt_themcapduyet" runat="server" Width="25px" AutoPostBack="false"
                                                HorizontalAlign="Center" Paddings-Padding="0" Border-BorderColor="#C0E0E3">
                                                <Image Url="../../images/imgadmin/add.png" Width="12" Height="12" ToolTip="thêm cấp duyệt sáng kiến" />
                                                <ClientSideEvents Click="function(s,e){show_pupop(1);}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </td>
                                <td style="width:auto;"></td>
                            </tr>                            
                            <tr>
                                <td>
                                    Tên sáng kiến
                                </td>
                                <td colspan="3">
                                    <dx:ASPxTextBox ID="txt_ten" runat="server" Width="100%" ClientInstanceName="txt_ten" Text='<%# Eval("ten") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Nội dung sáng kiến
                                </td>
                                <td colspan="3">
                                    <dx:ASPxMemo ID="memo_noidung" runat="server" Width="100%" Text='<%# Eval("noidung") %>' Height="35px"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Quyết định
                                </td>
                                <td valign="top" colspan="4">
                                    <dx:ASPxLabel ID="lblUploading" runat="server" ClientInstanceName="lblUploading"
                                        ForeColor="Red" />
                                    <dx:ASPxUploadControl ID="uploadFile" runat="server" OnFileUploadComplete="uploadFile_Load"
                                        ClientInstanceName="uploadFile" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
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
                                <td valign="top" colspan="5">
                                    <div style="width: 500px; height: 27px; float: left;">
                                        <div style="width: 204px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="bt_chonnhanvien" runat="server" Text="Chọn nhân viên tham gia"
                                               Paddings-Padding="0"  Border-BorderColor="#C0E0E3" Height="22px"
                                                Width="200px" AutoPostBack="False" Theme="Glass" Font-Size="12px" >
                                                <Image Url="../../images/imgadmin/addusers.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){
                                                        popup.Show();
                                                    }" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div id="idthemsangkien" style="width: 155px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu sáng kiến" AutoPostBack="false"
                                                Paddings-Padding="0"  Border-BorderColor="#C0E0E3" Height="22px"
                                                Width="150px" Theme="Glass" Font-Size="12px" >
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){                                                        
                                                            if(checkluu())
                                                            {
                                                                save();
                                                            }
                                                        }" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div id="idcapnhatsangkien" style="width: 154px; height: 25px; float: left; display: none;">
                                            <dx:ASPxButton ID="bt_capnhat" runat="server" Text="Cập nhật sáng kiến" AutoPostBack="false"
                                                Paddings-Padding="0"  Border-BorderColor="#C0E0E3" Height="22px"
                                                Width="150px" Theme="Glass" Font-Size="12px" >
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){                                                        
                                                        if(checkluu())
                                                        {
                                                            save();
                                                        }
                                                    }" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 90px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="bt_trolai" runat="server" Text="Trở lại" AutoPostBack="false"
                                                Paddings-Padding="0"  Border-BorderColor="#C0E0E3" Height="22px"
                                                Width="90px" Theme="Glass" Font-Size="12px" >
                                                <ClientSideEvents Click="function(s, e) {
                                                            ShowKhoa();
                                                        }" />
                                                <Image Url="../../images/imgadmin/reload.png">
                                                </Image>
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <dx:ASPxGridView ID="grid_nhanvien" runat="server" AutoGenerateColumns="false" ClientInstanceName="grid_nhanvien"
                                        Width="100%" KeyFieldName="idnhanvien" 
                                        OnCustomCallback="grid_nhanvien_Callback"
                                         Theme="Glass" Font-Size="12px" >
                                        <Settings ShowStatusBar="Hidden" ShowVerticalScrollBar="True" VerticalScrollBarStyle="Standard"
                                            VerticalScrollableHeight="270" />
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="STT" Width="5%">
                                                <DataItemTemplate>
                                                    <%# Container.ItemIndex +1 %></DataItemTemplate>
                                                <CellStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="hoten" Caption="Họ tên nhân viên" Width="140px" />
                                            <dx:GridViewDataTextColumn FieldName="donvi" Caption="Đơn vị" />
                                            <dx:GridViewDataTextColumn FieldName="chutri" Caption="Chọn nhân viên chủ trì">
                                                <DataItemTemplate>
                                                    <dx:ASPxCheckBox ID="chbox_chutri" runat="server" />
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="idnhanvien" Visible="false" />
                                        </Columns>
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="True"
    Width="750px" PopupHorizontalAlign="WindowCenter" HeaderText="Danh sách nhân viên được dự khoá đào tạo"
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
    <ClientSideEvents CloseUp="dongpupop" />
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <table width="100%">
                <tr>
                    <td colspan="3">
                        <div style="height: 25px; width: 100%">
                            <div style="font-family: Times New Roman; font-size: 12px; float: left; width: 90px;">
                                Chọn đơn vị:
                            </div>
                            <div style="height: 25px; width: 100%">
                                <dx:ASPxComboBox ID="cmb_donvi" runat="server" ClientInstanceName="cmb_donvi" IncrementalFilteringMode="Contains"
                                    DropDownStyle="DropDown" Width="350px" AutoPostBack="false"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    <ClientSideEvents Init="function(s,e){
                                            if(grid_sangkien.IsNewRowEditing()){
                                                s.InsertItem(0,'-- Chọn --','0');
                                                s.SetSelectedIndex(0);
                                            }
                                        }" SelectedIndexChanged="function(s,e){
                                            OnDonViChaChanged(cmb_donvi);
                                        }" />
                                </dx:ASPxComboBox>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dx:ASPxLabel ID="lblAvailable" runat="server" CssClass="DemoLabel NoLeftIndent CaptionLabelIndent"
                            Text="Danh sách nhân viên">
                        </dx:ASPxLabel>
                        <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable"
                            AutoPostBack="false" EnableSynchronization="False" Width="320px" Height="200px"
                            SelectionMode="CheckColumn" OnCallback="lbAvailable_callback" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                            </ClientSideEvents>
                        </dx:ASPxListBox>
                    </td>
                    <td style="width: 60px;">
                        <table cellpadding="0">
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnMoveSelectedItemsToRight" runat="server" ClientInstanceName="btnMoveSelectedItemsToRight"
                                        AutoPostBack="False" Text="&gt;" Width="50px" Height="23px" ClientEnabled="False"
                                        ToolTip="Add selected items" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents Click="function(s, e) { AddSelectedItems(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnMoveAllItemsToRight" runat="server" ClientInstanceName="btnMoveAllItemsToRight"
                                        AutoPostBack="False" Text="&gt;&gt;" Width="50px" Height="23px" ToolTip="Add all items"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents Click="function(s, e) { AddAllItems(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="Spacer" style="height: 10px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnMoveSelectedItemsToLeft" runat="server" ClientInstanceName="btnMoveSelectedItemsToLeft"
                                        AutoPostBack="False" Text="&lt;" Width="50px" ClientEnabled="False" ToolTip="Remove selected items"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents Click="function(s, e) { RemoveSelectedItems(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnMoveAllItemsToLeft" runat="server" ClientInstanceName="btnMoveAllItemsToLeft"
                                        AutoPostBack="False" Text="&lt;&lt;" Width="50px" Height="23px" ClientEnabled="False"
                                        ToolTip="Remove all items" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents Click="function(s, e) { RemoveAllItems(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblChoosen" runat="server" Text="Danh sách nhân viên được chọn">
                        </dx:ASPxLabel>
                        <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Width="320px"
                            EnableSynchronization="False" Height="200px" SelectionMode="CheckColumn" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                            </ClientSideEvents>
                        </dx:ASPxListBox>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

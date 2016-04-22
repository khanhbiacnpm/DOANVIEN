<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToChucBoiDuong.ascx.cs" Inherits="VNPT.Modules.DaoTao.ToChucBoiDuong" %>
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
            if (hf_khoahoc.Get('idkhoahoc') == 0)
                cb_luukhoadaotao.PerformCallback('save');
            else
                cb_luukhoadaotao.PerformCallback('update' + hf_khoahoc.Get('idkhoahoc'));
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
            if (hf_khoahoc.Get('idkhoahoc') == 0)
                cb_luukhoadaotao.PerformCallback('save');
            else
                cb_luukhoadaotao.PerformCallback('update' + hf_khoahoc.Get('idkhoahoc'));
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
        hf_khoahoc.Set('idkhoahoc', key);
        cb_luukhoadaotao.PerformCallback('loadedit' + key);        
    }
    function chonNam(s, e) {
        gridToChucBoiDuong.PerformCallback(s.GetValue());
    }
    function loadNam(s, e) {
        var item = s.FindItemByValue(s.cpNam);        
        if (item != null)
            s.SetSelectedIndex(item.index);        
        gridToChucBoiDuong.PerformCallback(s.GetValue());
    }
    function ShowNhanVien() {
        $("#idnhanvien").show();
        $("#idbttrolai").show();
        $("#idbtthem").hide();
        $("#idkhoa").hide();
        hf_khoahoc.Set('idkhoahoc', 0);       
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
        if (txt_madaotao.GetText() == "") {
            alert('Yêu cầu nhập Mã đào tạo/QĐ');
            txt_madaotao.Focus();
            return false;
        }
        else if (txt_khoadaotao.GetText() == "") {
            alert('Yêu cầu nhập khoá đào tạo');
            txt_khoadaotao.Focus();
            return false;
        }
        else if (cmb_chuyennganh.GetValue() == 0) {
            alert('Yêu cầu chọn ngành đào tạo');
            cmb_chuyennganh.Focus();
            return false;
        }
        else if (date_tungay.GetText() == "") {
            alert('yêu cầu nhập ngày bắt đầu');
            date_tungay.Focus();
            return false;
        }
        else if (date_denngay.GetText() == "") {
            alert('yêu cầu nhập ngày kết thúc');
            date_tungay.Focus();
            return false;
        }

        else if (lbChoosen.GetItemCount() == 0) {
            alert('yêu cầu chọn danh sách nhân viên')
            return false;
        }        
        return true;
    }

    function xuly_daotao(s,e) {
        if (cb_luukhoadaotao.cpOP == 0) {
            ShowKhoa();
            cmb_nam.PerformCallback();
            delete cb_luukhoadaotao.cpOP;
        }
        else if (cb_luukhoadaotao.cpOP == 1) {
            var list = $.parseJSON(cb_luukhoadaotao.cpListNV);
            lbAvailable.ClearItems();
            lbChoosen.ClearItems();
            lbChoosen.BeginUpdate();
            for (var i = 0; i < list.length; i++) {
                lbChoosen.AddItem(list[i].hoten, list[i].id);
            }
            lbChoosen.EndUpdate();
            delete cb_luukhoadaotao.cpOP;
            if (cb_luukhoadaotao.cpShow == 0) {                
                checkbox.SetChecked(true);
                showhide();
                delete cb_luukhoadaotao.cpShow;
            }
        } else if (cb_luukhoadaotao.cpOP == 2) {
            cmb_khoadaotao.ClearItems();
            lbChoosen.ClearItems();
            delete cb_luukhoadaotao.cpOP;
        }        
    }
    function xoakhoahoc(s, e) {
        gridToChucBoiDuong.GetRowValues(gridToChucBoiDuong.GetFocusedRowIndex(), 'id', function (value)
        { cb_luukhoadaotao.PerformCallback('delete' + value); });
    }
    function showhide() {
        if (checkbox.GetChecked()) {
            $("#idupdatekhoadaotao").show();
            $("#idtenkhoadaotao").hide();
        }
        else {
            $("#idtenkhoadaotao").show();
            $("#idupdatekhoadaotao").hide();            
        }
    }
    function selectComboChuyenNganh(s, e) {
        var thoidiem = date_tungay.GetValue();             
        if (thoidiem == null) {
            alert('Yêu cầu chọn thời điểm bắt đầu.')            
            return;
        } else {
            var nam = thoidiem.getFullYear();
            var idcn = s.GetValue();            
            cmb_khoadaotao.PerformCallback(nam + ',' + idcn);
        }
    }
</script>
<dx:ASPxHiddenField ID="hf_khoahoc" runat="server" ClientInstanceName="hf_khoahoc">
</dx:ASPxHiddenField>
<table width="100%" cellpadding="2" cellspacing="0" align="center" border="0">
    <tr id="idbtthem">
        <td style="width:90px;" class="dxnbGroupHeader_Glass12">Chọn năm:</td>
        <td style="width:257px;" class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID = "cmb_nam" runat="server" ClientInstanceName="cmb_nam"
                Width="250" ValueType="System.Int32"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                OnCallback="cmb_nam_OnCallback">
                <ClientSideEvents SelectedIndexChanged="chonNam" EndCallback="loadNam" />
            </dx:ASPxComboBox>
        </td>
      <td class="dxnbGroupHeader_Glass12">
                  
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                        AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                                ShowNhanVien();
                                cb_luukhoadaotao.PerformCallback('loadnull');
                            }" />
                        <Image Url="../../images/imgadmin/add.png">
                        </Image>
                    </dx:ASPxButton>
               
        </td>
        <td class="dxnbGroupHeader_Glass12">
        <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="xoakhoahoc" />
                        <Image Url="../../images/imgadmin/delete_16.png">
                        </Image>
                    </dx:ASPxButton>
        </td>
      <td class="dxnbGroupHeader_Glass12" style="width:300px;">&nbsp;</td>
    </tr>
    <tr id="idkhoa">
        <td colspan="5">
           <dx:ASPxGridView ID="gridToChucBoiDuong" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridToChucBoiDuong"
                Theme="Glass" Font-Size="12px" KeyFieldName="id"
                Width="100%"                               
                OnCustomCallback="gridToChucBoiDuong_OnCustomCallback">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords" />
                <SettingsEditing  Mode="EditForm" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
                    PopupEditFormModal="True" PopupEditFormWidth="700px" PopupEditFormHeight="640px" />
                <SettingsText PopupEditFormCaption="Hiệu chỉnh thông tin khoá đào tạo" />                
                <Settings ShowStatusBar="Visible"  />              
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="id" Caption="Danh sách nhân viên" >
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')"><%# Eval("sohocvien") + " Nhân viên" %></a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="madaotao" Caption="Mã đào tạo/QĐ" >
                        <DataItemTemplate>
                            <a target="_blank" href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("quyetdinh") %>'><%# Eval("madaotao") %></a> 
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="khoadaotao" Caption="Khoá đào tạo" />
                    <dx:GridViewDataTextColumn FieldName="chuyennganh" Caption="Chuyên ngành" />                    
                    <dx:GridViewDataTextColumn FieldName="kynang" Caption="Kỹ năng" Width="250px" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="kehoach_soluonghocvien" Visible="false">
                        <HeaderCaptionTemplate>
                            <div style="height:100%; border-bottom:1px solid #7EACB1;">
                                <div style="width:40px; height:30px; padding-top:3px; text-align:center;">Số nhân</div>
                                <div style="width:auto; height:35px;border-right:1px solid #7EACB1;border-top:1px solid #7EACB1; padding-top:3px;">Kế hoạch</div>
                            </div>
                        </HeaderCaptionTemplate> 
                        <HeaderStyle Paddings-Padding="0" Border-BorderStyle="None"  /> 
                        <CellStyle HorizontalAlign="Center" />                      
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="thuchien_soluonghocvien" Visible="false">
                        <HeaderCaptionTemplate>
                            <div style="height:100%; border-bottom:1px solid #7EACB1; border-right:1px solid #7EACB1;">
                                <div style="width:40px; height:30px; padding-top:3px; text-align:left; padding-left:3px;">lượng viên</div>
                                <div style="width:auto; height:35px;border-top:1px solid #7EACB1; padding-top:3px;">Thực hiện</div>
                            </div>
                        </HeaderCaptionTemplate> 
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle Paddings-Padding="0" Border-BorderStyle="None"  />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="kehoach_kinhphi" Visible="false">
                        <HeaderCaptionTemplate>
                            <div style="height:100%; border-bottom:1px solid #7EACB1;">
                                <div style="width:80px; height:30px; padding-top:3px; text-align:right;padding-right:3px;">Kinh</div>
                                <div style="width:auto; height:35px;border-top:1px solid #7EACB1; padding-top:3px;">Kế hoạch</div>
                            </div>
                        </HeaderCaptionTemplate>
                        <HeaderStyle Paddings-Padding="0" Border-BorderStyle="None"  />
                        <PropertiesTextEdit DisplayFormatString="#,###" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="thuchien_kinhphi" Visible="false">
                        <HeaderCaptionTemplate>
                            <div style="height:100%; border-bottom:1px solid #7EACB1; border-right:1px solid #7EACB1;">
                                <div style="width:80px; height:30px; padding-top:3px; text-align:left; padding-left:3px;">phí</div>
                                <div style="width:auto; height:35px; border-top:1px solid #7EACB1;border-left:1px solid #7EACB1; padding-top:3px;">Thực hiện</div>
                            </div>
                        </HeaderCaptionTemplate>
                        <HeaderStyle Paddings-Padding="0" Border-BorderStyle="None"  />
                        <PropertiesTextEdit DisplayFormatString="#,##" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nguonkinhphi" Caption="Nguồn kinh phí" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="cosodaotao" Caption="Cơ sở đào tạo" />
                    <dx:GridViewDataTextColumn FieldName="trinhdo" Caption="Trình độ" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="hinhthucdaotao" Caption="Hình thức đào tạo" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="thoigian" Caption="Thời gian" />
                    <dx:GridViewDataTextColumn FieldName="ghichu" Caption="ghi chú" Visible="false" />                    
                    <dx:GridViewDataTextColumn FieldName="idtrinhdo" Visible="false"/>
                    <dx:GridViewDataTextColumn FieldName="idchuyennganh" Visible="false"/>
                    <dx:GridViewDataTextColumn FieldName="idhinhthucdaotao" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="tungay" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="denngay" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="iddiadiemtochuc" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="cosodaotao" Visible="false" />  
                    <dx:GridViewDataTextColumn FieldName="quyetdinh" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="donvitochuc" Visible="false" />                   
                </Columns>
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
                    <Header Font-Bold="True" Wrap="True" HorizontalAlign="Center">
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
            </dx:ASPxGridView>            
        </td>
    </tr>
    <tr id="idnhanvien" style="display:none;">
        <td colspan="3"> 
             <dx:ASPxCallbackPanel ID="cb_luukhoadaotao" runat="server" ClientInstanceName="cb_luukhoadaotao"
    OnCallback="cb_luukhoadaotao_OnCallback">
    <ClientSideEvents EndCallback="xuly_daotao" />
    <PanelCollection>
        <dx:PanelContent ID="pc">        
           <table width="99%" border="0" style="font-size: 11pt; font-family: Times New Roman; border-top:1px solid #C0E0E7;" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td style="width:120px;">Mã khoá học/QĐ</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_madaotao" runat="server" ClientInstanceName="txt_madaotao" Width="100%" Text='<%# Eval("madaotao") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                    </td>                                   
                                    <td colspan="2">
                                        <dx:ASPxCheckBox ID="check_camket" runat="server" TextAlign="Left" Text="Cam kết" style="font-size: 12pt; font-family: Times New Roman;" Checked='<%# Eval("camket1") == "0"?false:true %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời điểm từ ngày</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="date_tungay" runat="server" ClientInstanceName = "date_tungay" Width="100%" Value = '<%# Eval("tungay") %>'
                                            DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:130px;">
                                        đến ngày
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="date_denngay" runat="server" ClientInstanceName="date_denngay" Width="100%" Value = '<%# Eval("denngay") %>'
                                            DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>       
                                <tr>
                                    <td>Lĩnh vực đào tạo</td>
                                    <td>
                                        <dx:ASPxComboBox ID="cmb_chuyennganh" runat="server" ClientInstanceName="cmb_chuyennganh" IncrementalFilteringMode="Contains" 
                                            DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridToChucBoiDuong.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" SelectedIndexChanged="selectComboChuyenNganh" />                                           
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>Cơ sở đào tạo</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_cosodaotao" runat="server" Width="100%" Text='<%# Eval("cosodaotao") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                                                      
                                        </dx:ASPxTextBox>
                                    </td>                                    
                                    
                                </tr>
                                <tr>
                                    <td style="width:100px">Tên khoá bồi dưỡng</td>
                                    <td>
                                        <div id="idtenkhoadaotao" style="width:auto; height:25px;">
                                                <dx:ASPxComboBox ID="cmb_khoadaotao" runat="server" 
                                                    OnCallback="cmb_khoadaotao_OnCallback" ValueType="System.Int32"
                                                    ClientInstanceName="cmb_khoadaotao" Width="100%"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <ClientSideEvents EndCallback="function(s,e){
                                                        if(s.cpOpcb == 0)
                                                        {
                                                            checkbox.SetChecked(true);
                                                            showhide();
                                                            delete s.cpOpcb;
                                                        }
                                                        else if(s.cpOpcb == 1)
                                                        {
                                                            checkbox.SetChecked(false);
                                                            showhide();
                                                            delete s.cpOpcb;
                                                            s.InsertItem(0,'-- Chọn -- ', '0');
                                                            s.SetSelectedIndex(0);
                                                        }
                                                    }" SelectedIndexChanged="function(s,e){
                                                        txt_khoadaotao.SetText(s.GetText());
                                                    }" />                                            
                                                </dx:ASPxComboBox>
                                            </div>                                           
                                        <div id="idupdatekhoadaotao" style="width:auto; height:25px; display:none;">
                                        <dx:ASPxTextBox ID="txt_khoadaotao" runat="server" ClientInstanceName="txt_khoadaotao" Width="100%" Text='<%# Eval("khoadaotao") %>'
                                        NullText="Nhập tên khoá bồi dưỡng..."
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                        </div>                                                                       
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="check_capnhat" runat="server" ClientInstanceName="checkbox" TextAlign="Left" Text="Thêm/Sửa" 
                                            ToolTip="chọn để cập nhật tên khoá đào tạo"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                                    <ClientSideEvents ValueChanged="function(s,e){showhide();}" />
</dx:ASPxCheckBox>
                                    </td>
                                </tr>                               
                                <%--<tr>                                   
                                    <td valign="top">
                                        Hình thức đào tạo
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmb_hinhthucdaotao" runat="server" IncrementalFilteringMode="Contains" 
                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridToChucBoiDuong.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />                                         
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td valign="top" >
                                        Trình độ
                                    </td>
                                    <td valign="top" >
                                        <dx:ASPxComboBox ID="cmb_trinhdo" runat="server" IncrementalFilteringMode="Contains" 
                                            DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridToChucBoiDuong.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />                                           
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>--%>
                                <tr>                                    
                                    <td valign="top">
                                        Địa điểm tổ chức
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmb_diadiemtochuc" runat="server" ClientInstanceName="cmb_diadiemtochuc"
                                            IncrementalFilteringMode="Contains" 
                                            DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridToChucBoiDuong.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />                                           
                                        </dx:ASPxComboBox>
                                    </td>    
                                    <td valign="top">
                                        Đơn vị tổ chức
                                    </td>
                                    <td valign="top" style="width:240px;">
                                        <dx:ASPxTextBox ID ="txt_donvitochuc" runat="server" Width="100%" Text='<%# Eval("donvitochuc") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                        
                                        </dx:ASPxTextBox>
                                    </td>                                
                                </tr>                                
                                <tr>
                                    <td>Nguồn kinh phí</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_nguonkinhphi" runat="server" Width="100%" Text='<%# Eval("nguonkinhphi") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                                                      
                                        </dx:ASPxTextBox>
                                    </td>                                   
                                    <td style="width:100px;padding-left:2px;">Thực hiện</td>
                                            <td>
                                               <dx:ASPxTextBox ID="txt_thuchien_kinhphi" runat="server" Width="100%" Text='<%# Eval("thuchien_kinhphi") %>' 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                            </td>
                                </tr>
                                                           
                                <tr>
                                    <td valign="top">
                                        Ghi chú
                                    </td>
                                    <td colspan="7">
                                        <dx:ASPxMemo ID="memo_ghichu" runat="server" Text='<%# Eval("ghichu") %>'
                                            Height="30px" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                           
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>                               
                    <tr>                        
                        <td valign="top" >
                            Quyết định
                        </td>
                        <td valign="top" colspan="4">
                            <dx:ASPxLabel ID ="lblUploading" runat="server" ClientInstanceName="lblUploading" ForeColor="Red" />                        
                            <dx:ASPxUploadControl ID="uploadFile" runat="server" 
                                OnFileUploadComplete="uploadFile_Load"
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
                                                <div style="width: 172px; height: 25px; float: left;">
                                                <dx:ASPxButton ID="bt_chonnhanvien" runat="server" Text="Danh sách nhân viên" Theme="Glass" Font-Size="12px" Width="170px"
                                                    AutoPostBack="False">
                                                    <Image Url="../../images/imgadmin/addusers.png">
                                                    </Image>
                                                    <ClientSideEvents Click="function(s,e){
                                                        popup.Show();
                                                    }" />
                                                </dx:ASPxButton>
                                            </div>
                                            <div style="width: 155px; height: 25px; float: left;">
                                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu khoá đào tạo" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="150px">
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
                                            <div id="idcapnhatkhoa" style="width: 155px; height: 25px; float: left; display:none;">
                                                <dx:ASPxButton ID="bt_capnhat" runat="server" Text="Cập nhật khoá đào tạo" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="150px">
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
                                                <dx:ASPxButton ID="bt_trolai" runat="server" Text="Trở lại"
                                                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="90px">
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
                                        <dx:ASPxGridView ID="grid_nhanvien" runat="server" AutoGenerateColumns="false" 
                    ClientInstanceName="grid_nhanvien" Width="100%" KeyFieldName="idnhanvien"
                    OnCustomCallback="grid_nhanvien_Callback"
                    Theme="Glass" Font-Size="12px">
                    <Settings ShowStatusBar="Hidden" ShowVerticalScrollBar="True" VerticalScrollBarStyle="Standard" VerticalScrollableHeight="270" /> 
                    <SettingsPager Mode="ShowAllRecords" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="STT" Width="30px">
                            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
                            <CellStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="hoten" Caption="Họ tên nhân viên" width="140px" />
                        <dx:GridViewDataTextColumn FieldName="donvi" Caption="Đơn vị" />
                        <dx:GridViewDataTextColumn FieldName="trinhdo" Caption="Trình độ" Visible="false" />
                        <dx:GridViewDataTextColumn FieldName="ketqua" Caption="Kết quả" Width="90px">
                            <DataItemTemplate>
                                <dx:ASPxComboBox ID="cmb_ketqua" runat="server" Width="80px" ValueType="System.Int32"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    <Items>
                                        <dx:ListEditItem Text="-- Chọn --" Value="0" Selected="true" />
                                        <dx:ListEditItem Text="Xuất sắc" Value="1" />
                                        <dx:ListEditItem Text="Giỏi" Value="2" />
                                        <dx:ListEditItem Text="Khá" Value="3" />
                                        <dx:ListEditItem Text="Trung bình khá" Value="4" />
                                        <dx:ListEditItem Text="Trung bình" Value="5" />
                                        <dx:ListEditItem Text="Yếu" Value="6" />
                                        <dx:ListEditItem Text="Kém" Value="7" />
                                        <dx:ListEditItem Text="Đạt" Value="8" />
                                        <dx:ListEditItem Text="Không đạt" Value="9" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>                        
                        <dx:GridViewDataTextColumn FieldName="idkhoadaotao" Visible="false" />
                        <dx:GridViewDataTextColumn FieldName="idnhanvien" Visible="false" />
                    </Columns>                
                    <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                    </Styles>
                    <StylesEditors>
                        <CalendarHeader Spacing="1px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>                    
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
 <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="True" Width="750px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Danh sách nhân viên được dự khoá đào tạo" 
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                            <div style="height:25px;width:100%">
                                <div style="font-family:Times New Roman; font-size:12px; float:left; width:90px;">
                                    Chọn đơn vị:
                                </div>
                                <div style="height:25px; width:100%">
                                    <dx:ASPxComboBox ID="cmb_donvi" runat="server" ClientInstanceName="cmb_donvi"
                                        IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                        Width="350px" AutoPostBack="false"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                        <ClientSideEvents Init="function(s,e){
                                            if(gridToChucBoiDuong.IsNewRowEditing()){
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
                            <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable" AutoPostBack="false" EnableSynchronization="False"
                                Width="320px" Height="130px"
                                SelectionMode="CheckColumn" OnCallback="lbAvailable_callback"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                               
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                                </ClientSideEvents>                                
                            </dx:ASPxListBox>
                        </td>
                        <td style="width:60px;">
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
                        <td valign="top"">
                            <dx:ASPxLabel ID="lblChoosen" runat="server" Text="Danh sách nhân viên được chọn">
                            </dx:ASPxLabel>
                            <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Width="320px" EnableSynchronization="False"
                                Height="130px" SelectionMode="CheckColumn" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
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

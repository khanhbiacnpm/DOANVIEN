<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DaoTaoATVSLD.ascx.cs" Inherits="VNPT.Modules.DaoTao.DaoTaoATVSLD" %>
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
            lbChoosen.SelectAll();
            gridKhoaDaoTao.UpdateEdit();
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
            lbChoosen.SelectAll();
            gridKhoaDaoTao.UpdateEdit();
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
        popup.Show();        
        grid_nhanvien.PerformCallback(key);
    }
    function load_tungay(s, e) {
        if (gridKhoaDaoTao.IsNewRowEditing()) {
            var tungay = new Date();
            s.SetDate(tungay);            
        }
    }
    function load_denngay(s, e) {
        if (gridKhoaDaoTao.IsNewRowEditing()) {
            var denngay = new Date();
            denngay.setDate(denngay.getDate() + 3);
            s.SetDate(denngay);
        }
    }
</script>

<table width="100%" cellpadding="3" cellspacing="0" align="center">    
    <tr>
        <td>
           <dx:ASPxGridView ID="gridKhoaDaoTao" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridKhoaDaoTao"
                Theme="Glass" Font-Size="12px" KeyFieldName="id"
                Width="100%" 
                OnRowDeleting="gridKhoaDaoTao_RowDeleting" 
                OnRowInserting="gridKhoaDaoTao_RowInserting"
                OnRowUpdating="gridKhoaDaoTao_RowUpdating"
                OnHtmlEditFormCreated="gridKhoaDaoTao_OnHtmlEditFormCreated">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords" />
                <SettingsEditing  Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
                    PopupEditFormModal="True" PopupEditFormWidth="550px" PopupEditFormHeight="400px" />
                <SettingsText PopupEditFormCaption="Hiệu chỉnh thông tin khoá đào tạo" />                
                <Settings ShowStatusBar="Visible" />
                <ClientSideEvents RowDblClick="function(s, e) {
                    gridKhoaDaoTao.StartEditRow(e.visibleIndex);
                }" />
                <Columns>                  
                    <dx:GridViewDataTextColumn Caption="STT" Width="40px">
                        <DataItemTemplate>
                            <%# Container.ItemIndex +1 %>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" />                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="madaotao" Caption="Mã đào tạo/QĐ">
                        <DataItemTemplate>
                            <a target="_blank" href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>'><%# Eval("makhoa") %></a> 
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="noidung" Caption="Nội dung đào tạo" />
                    <dx:GridViewDataTextColumn FieldName="ghichu" Caption="Ghi chú" />                    
                    <dx:GridViewDataTextColumn FieldName="thoigian" Caption="Thời gian" />                    
                    <dx:GridViewDataTextColumn FieldName="id" Caption="Danh sách nhân viên" >
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">Xem nhân viên ...</a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left" />
                    </dx:GridViewDataTextColumn>                    
                    <dx:GridViewDataTextColumn FieldName="tungay" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="denngay" Visible="false" />                    
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
                <Templates>
                    <EditForm>
                        <table style="font-size: 10pt; font-family: Verdana; padding:5px;" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td style="width:140px;">Mã khoá học/QĐ</td>
                                    <td colspan="3">
                                        <dx:ASPxTextBox ID="txt_madaotao" runat="server" Width="150px" Text='<%# Eval("makhoa") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời điểm từ ngày</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="date_tungay" runat="server" Width="100%" Value = '<%# Eval("tungay") %>'
                                            ClientInstanceName="date_tungay"
                                            DisplayFormatString = "dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ClientSideEvents Init="load_tungay" />                                            
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>đến ngày</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="date_denngay" runat="server" Width="100%" Value = '<%# Eval("denngay") %>'
                                            ClientInstanceName="date_denngay"
                                            DisplayFormatString = "dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ClientSideEvents Init="load_denngay" />                                            
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td valign="top">Nội dung</td>
                                    <td colspan="3">
                                        <dx:ASPxMemo ID="memo_noidung" runat="server" Width="100%" Height="41px" Text='<%# Eval("noidung") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Ghi chú</td>
                                    <td colspan="3">
                                        <dx:ASPxMemo ID="memo_ghichu" runat="server" Width="100%" Height="41px" Text='<%# Eval("ghichu") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                <td valign="top">
                                    Tệp đính kèm
                                </td>
                                <td valign="top">
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
                        <td>
                            Chọn đơn vị:
                        </td>
                        <td colspan="3">
                            <dx:ASPxComboBox ID="cmb_donvi" runat="server" ClientInstanceName="cmb_donvi"
                                IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                Width="350px" AutoPostBack="false"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                <ClientSideEvents Init="function(s,e){
                                    if(gridKhoaDaoTao.IsNewRowEditing()){
                                        s.InsertItem(0,'-- Chọn --','0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" SelectedIndexChanged="function(s,e){
                                    OnDonViChaChanged(cmb_donvi);
                                }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table width="100%" style="font-family:Verdana; font-size:10pt;">
                                <tr>
                                    <td valign="top">
                            <dx:ASPxLabel ID="lblAvailable" runat="server" CssClass="DemoLabel NoLeftIndent CaptionLabelIndent"
                                Text="Danh sách nhân viên">
                            </dx:ASPxLabel>
                            <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable" AutoPostBack="false"
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
                            <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Width="320px"
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
                        </td>
                    </tr>
                                <tr>
                                    <td valign="top">
                                    </td>
                                    <td valign="top" colspan="3">
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){
                                                    save();
                                                    }" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                                AutoPostBack="False">
                                                <Image Url="../../images/imgadmin/delete_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){gridKhoaDaoTao.CancelEdit();}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                    </EditForm>
                    <StatusBar>
                        <div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                    AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {
                                            gridKhoaDaoTao.AddNewRow()
                                        }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                            
                                            gridKhoaDaoTao.StartEditRow(gridKhoaDaoTao.GetFocusedRowIndex());
                                        }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                            gridKhoaDaoTao.DeleteRow(gridKhoaDaoTao.GetFocusedRowIndex());
                                        }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>
                </Templates>
            </dx:ASPxGridView>            
        </td>
    </tr>
</table>
 <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="True" Width="750px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Danh sách nhân viên được dự khoá đào tạo" 
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">       
        <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
        </LoadingPanelImage>
        <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
        </HeaderStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">                
                <dx:ASPxGridView ID="grid_nhanvien" runat="server" AutoGenerateColumns="false" 
                    ClientInstanceName="grid_nhanvien" Width="100%" KeyFieldName="id"
                    OnCustomCallback="grid_nhanvien_Callback"
                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                    <Settings ShowStatusBar="Visible" />
                    <ClientSideEvents EndCallback="function(s,e){
                        if(grid_nhanvien.cpoki == 1){
                            alert('Lưu thông tin thành công!');
                            popup.Hide();
                            delete grid_nhanvien.cpoki;
                        }
                    }" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="STT" Width="30px">
                            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
                            <CellStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="hoten" Caption="Họ tên nhân viên" />
                        <dx:GridViewDataTextColumn FieldName="ketqua" Caption="Kết quả">
                            <DataItemTemplate>
                                <dx:ASPxTextBox ID = "txt_ketqua" runat="server" Width="100%" Text = '<%# Eval("ketqua") %>'
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                </dx:ASPxTextBox>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="thoidiem" Caption="Ngày tốt nghiệp">
                            <DataItemTemplate>
                                <dx:ASPxDateEdit ID="date_thoidiem" runat="server" Value = '<%# Eval("thoidiem") %>'
                                    DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                </dx:ASPxDateEdit>
                            </DataItemTemplate>
                            <CellStyle HorizontalAlign="Left" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="id" Visible="false" />
                        <dx:GridViewDataTextColumn FieldName="idkhoa_atvsld" Visible="false" />
                        <dx:GridViewDataTextColumn FieldName="idnhanvien" Visible="false" />
                    </Columns>
                    <Templates>
                        <StatusBar>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" 
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        grid_nhanvien.PerformCallback('save');
                                    }" />                                    
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                   <ClientSideEvents Click="function(s,e){
                                        popup.Hide();
                                   }" />                                   
                                </dx:ASPxButton>
                            </div>
                        </StatusBar>
                    </Templates>
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
            </dx:PopupControlContentControl>
        </ContentCollection>        
    </dx:ASPxPopupControl>

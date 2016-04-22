<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KeHoachDaoTaoDaiHan.ascx.cs"
    Inherits="VNPT.Modules.DaoTao.KeHoachDaoTaoDaiHan" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
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
    function chonNam(s, e) {        
        gridKhoaDaoTaoKeHoach.PerformCallback(s.GetValue());
    }
    function loadNam(s, e) {
        var item = s.FindItemByValue(s.cpNam);
        if (item != null)
            s.SetSelectedIndex(item.index);
        gridKhoaDaoTaoKeHoach.PerformCallback(s.GetValue());
    }
    function combo_init(s, e) {
        if (gridKhoaDaoTaoKeHoach.IsNewRowEditing()) {
            s.InsertItem(0, '-- Chọn --', '0');
            s.SetSelectedIndex(0);
        }
    }
    function checktext() {
        var soluong = txt_soluonghocvien.GetText();
        var dongia = txt_dongia.GetText();
        if (cmb_trinhdo.GetValue() == 0) {
            alert('Yêu cầu chọn lĩnh vực/ngành đào tạo!');
            cmb_trinhdo.Focus();
            return;
        } else if (txt_tenkhoadaotao.GetText() == '') {
            alert('Yêu cầu nhập tên đào tạo!');
            txt_tenkhoadaotao.Focus();
            return;
        } else if (txt_cosodaotao.GetText() == '') {
            alert('Yêu cầu nhập tên đào tạo!');
            txt_cosodaotao.Focus();
            return;
        }else if (isNaN(soluong)) {
            alert('Yêu cầu nhập kiểu số!');
            txt_soluonghocvien.Focus();
            return;
        } else if (isNaN(dongia)) {
            alert('Yêu cầu nhập kiểu số!');
            txt_dongia.Focus();
            return;
        }else {
            xulycombonam();
            gridKhoaDaoTaoKeHoach.UpdateEdit();
        }
    }
    function xulycombonam() {
        var nam = cmb_namkehoach.GetValue();         
        var item = cmb_nam.FindItemByValue(nam)
        if (item != null)
            cmb_nam.SetSelectedIndex(item.index);
        else {            
            cmb_nam.InsertItem(0, 'Năm '+ nam, nam);
            cmb_nam.SetSelectedIndex(0);
        }
    }
</script>
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
<table width="100%" cellpadding="3" cellspacing="0" align="center">
    <tr>
        <td style="width:90px;" class="dxnbGroupHeader_Glass12">
            Chọn năm:
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID="cmb_nam" runat="server" ClientInstanceName="cmb_nam" Width="250"
                ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnCallback="cmb_nam_OnCallback">
                <ClientSideEvents SelectedIndexChanged="chonNam" />
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dx:ASPxGridView ID="gridKhoaDaoTaoKeHoach" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridKhoaDaoTaoKeHoach"
                Theme="Glass" Font-Size="12px" KeyFieldName="id"
                Width="100%" OnRowDeleting="gridKhoaDaoTaoKeHoach_RowDeleting" OnRowInserting="gridKhoaDaoTaoKeHoach_RowInserting"
                OnRowUpdating="gridKhoaDaoTaoKeHoach_RowUpdating" OnHtmlEditFormCreated="gridKhoaDaoTaoKeHoach_OnHtmlEditFormCreated"
                OnCustomCallback="gridKhoaDaoTaoKeHoach_OnCustomCallback">                
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords" />
                <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                    PopupEditFormVerticalAlign="TopSides" PopupEditFormModal="True" PopupEditFormWidth="700px"
                    PopupEditFormHeight="220px" />
                <SettingsText PopupEditFormCaption="Hiệu chỉnh thông tin kế hoạch đào tạo hạn" />
                <Settings ShowStatusBar="Visible" />
                <ClientSideEvents RowDblClick="function(s, e) {
                    gridKhoaDaoTaoKeHoach.StartEditRow(e.visibleIndex);
                }" />                
                <Columns>
                    <dx:GridViewDataTextColumn Caption="STT" Width="40px">
                        <DataItemTemplate>
                            <%# Container.ItemIndex +1 %>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="trinhdo" Caption="Trình độ đào tạo" />
                    <dx:GridViewDataTextColumn FieldName="tenkhoadaotao" Caption="Tên khoá đào tạo" />
                    <dx:GridViewDataTextColumn FieldName="cosodaotao" Caption="Cơ sở đào tạo" />                                       
                    <dx:GridViewDataTextColumn FieldName="soluonghocvien" Caption="Số lượng học viên">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="dongia" Caption="Đơn giá/Học viên (x1000đ)">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="thoigian" Caption="Thời điểm">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ghichu" Caption="Ghi chú" />
                    <dx:GridViewDataTextColumn FieldName="idtrinhdo" Visible="false" />
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
                        <table style="font-size: 12pt; font-family: Times New Roman; padding: 5px;" cellpadding="1"
                            cellspacing="1" width="100%">
                            <tr>
                                <td style="width: 130px;">
                                    Trình độ đào tạo
                                </td>
                                <td colspan="3">                                    
                                    <dx:ASPxComboBox ID="cmb_trinhdo" runat="server" ClientInstanceName="cmb_trinhdo"
                                        Width="250px" ValueType="System.Int32"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ClientSideEvents Init="combo_init" />
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 130px;">
                                    Tên khoá đào tạo
                                </td>
                                <td colspan="3">
                                    <dx:ASPxTextBox ID="txt_tenkhoadaotao" runat="server" Width="100%" ClientInstanceName="txt_tenkhoadaotao" Text='<%# Eval("tenkhoadaotao") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr> 
                            <tr>
                                <td style="width: 180px;">
                                    Cơ sở đào tạo
                                </td>
                                <td colspan="3">
                                    <dx:ASPxTextBox ID="txt_cosodaotao" runat="server" Width="100%" ClientInstanceName="txt_cosodaotao" Text='<%# Eval("cosodaotao") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>                            
                            <tr>
                                <td style="width: 130px;">
                                    Số lượng học viên
                                </td>
                                <td style="width: 200px;">
                                    <dx:ASPxTextBox ID="txt_soluonghocvien" runat="server" Width="100%" ClientInstanceName="txt_soluonghocvien" Text='<%# Eval("soluonghocvien") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 180px;">
                                    Đơn giá/Học viên(x1000)
                                </td>
                                <td style="width: 200px;">
                                    <dx:ASPxTextBox ID="txt_dongia" runat="server" Width="100%" ClientInstanceName="txt_dongia" Text='<%# Eval("dongia") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 130px;">
                                    Năm kế hoạch
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmb_namkehoach" runat="server" ClientInstanceName="cmb_namkehoach"
                                        Width="100%" ValueType="System.Int32"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ClientSideEvents Init="combo_init" />
                                    </dx:ASPxComboBox>                                    
                                </td>                               
                            </tr>
                            <tr>
                                <td valign="top">
                                    Ghi chú
                                </td>
                                <td colspan="3">
                                    <dx:ASPxMemo ID="memo_ghichu" runat="server" Width="100%" Height="41px" Text='<%# Eval("ghichu") %>'
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                </td>
                                <td valign="top" colspan="3">
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                            <Image Url="../../images/imgadmin/save_16.png" />
                                            <ClientSideEvents Click="function(s,e){
                                                checktext();
                                            }" />
                                        </dx:ASPxButton>
                                    </div>
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                            AutoPostBack="False">
                                            <Image Url="../../images/imgadmin/delete_16.png">
                                            </Image>
                                            <ClientSideEvents Click="function(s,e){
                                                gridKhoaDaoTaoKeHoach.CancelEdit();
                                            }" />       
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
                                    AutoPostBack="false" Theme="Glass" Font-Size="12px"  Width="81px">
                                    <ClientSideEvents Click="function(s, e) {
                                            gridKhoaDaoTaoKeHoach.AddNewRow()
                                        }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px"  Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                            
                                            gridKhoaDaoTaoKeHoach.StartEditRow(gridKhoaDaoTaoKeHoach.GetFocusedRowIndex());
                                        }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px"  Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                            gridKhoaDaoTaoKeHoach.DeleteRow(gridKhoaDaoTaoKeHoach.GetFocusedRowIndex());
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

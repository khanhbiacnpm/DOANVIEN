<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_TrienKhaiChuongTrinh.ascx.cs" Inherits="VNPT.Modules.QLDVIEN_NGHIEPVU.QLDV_TrienKhaiChuongTrinh" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<script type="text/javascript">
    function hienthi_chuongtrinh() {           
        hdfData.Set('ma_dv', cmb_tochuc.GetValue());
        hdfData.Set('ma_loaichuongtrinh', cmb_loaichuongtrinh.GetValue());
        hdfData.Set('trien_khai', cmb_trienkhai.GetValue());
        if (cmb_tochuc.GetValue() == 0) {
            alert('Vui lòng chọn tổ chức');
            cmb_tochuc.Focus();
            return false;
        }else
            grid_chuongtrinh.PerformCallback();
    }
    function trienkhai_chuongtrinh(ma_chuongtrinh) {
        var yPos = 10;
        var xPos = (($(window).width()) / 2) - 430;
        popup_tochuc.ShowAtPos(xPos, yPos);
        popup_tochuc.Show();
        hdfTrienKhai.Set('ma_dv', cmb_tochuc.GetValue());
        hdfTrienKhai.Set('ma_chuongtrinh',ma_chuongtrinh);
        gridTrienKhai.PerformCallback(ma_chuongtrinh);
    }
    function trienkhai_danhgia(s, e) {
        if (s.GetText() == 'Triển khai') {         
            cbox_trienkhai.SetChecked(true);
            cbox_danhgia.SetChecked(false);
        } else if (s.GetText() == 'Đánh giá') {
            cbox_trienkhai.SetChecked(false);
            cbox_danhgia.SetChecked(true);
            kiemtra_danhgia();
        }
    }
    function Kiemtra() {
        var elements = aspxGetControlCollection().elements;
        var kq = true;
        for (var i = 0; i < gridTrienKhai.cpVisibleRowCount; i++) {
            var cell_danhgia = gridTrienKhai.name + "_cell" + i + "_2_cmb_danhgia";

            var ctr_dg = elements[cell_danhgia];
            var ma_danhgia = ctr_dg.GetValue();           
            if (ma_danhgia != 0 && cbox_danhgia.GetChecked() == false) {
                alert('Vui lòng chọn trạng thái lưu đánh giá');
                kq = false;
                break;
            }
        }
        return kq;
    }
    function fillData() {
        var elements = aspxGetControlCollection().elements;
        var data = new Array();
        var ma_chuongtrinh = hdfTrienKhai.Get('ma_chuongtrinh');
        for (var i = 0; i < gridTrienKhai.cpVisibleRowCount; i++) {
            var cell_danhgia = gridTrienKhai.name + "_cell" + i + "_2_cmb_danhgia";
            var cell_ketqua = gridTrienKhai.name + "_cell" + i + "_3_txt_ketqua";
            var ctr_dg = elements[cell_danhgia];
            var ctr_kq = elements[cell_ketqua];

            var ma_danhgia = ctr_dg.GetValue();
            var ketqua = ctr_kq.GetText();

            var dataItem = {
                ma_dv: gridTrienKhai.cpMADV[i],
                ma_danhgia: ma_danhgia,
                ket_qua: ketqua,
                ma_ct:ma_chuongtrinh                
            };
            data.push(dataItem);
        }
        hdfTrienKhai.Set("data", data);
    }
    function luu_trienkhai() {
        var data = new Array();
        var ma_chuongtrinh = hdfTrienKhai.Get('ma_chuongtrinh');
        var elements = aspxGetControlCollection().elements;
        for (var i = 0; i < gridTrienKhai.cpVisibleRowCount; i++) {
            if (gridTrienKhai.IsRowSelectedOnPage(i)) {
                var dataItem = {
                    ma_dv: gridTrienKhai.cpMADV[i],
                    ma_ct: ma_chuongtrinh
                };
                data.push(dataItem);
            }
        }
        hdfTrienKhai.Set("rowData", data);
        fillData();
        popup_tochuc.Hide();
        hdfTrienKhai.Set('danhgia', cbox_danhgia.GetChecked());
        gridTrienKhai.PerformCallback('luu');
    }
    function tochuc_datrienkhai() {
        if (gridTrienKhai.cpTK == 0) {
            alert('Triển khai thành công');
            delete gridTrienKhai.cpTK;
            hienthi_chuongtrinh();
        } else {
            gridTrienKhai.SelectRowsByKey(gridTrienKhai.cpMADVTK);
            delete gridTrienKhai.cpMADVTK;
        }
    }
    function kiemtra_danhgia() {
        var elements = aspxGetControlCollection().elements;
        for (var i = 0; i < gridTrienKhai.cpVisibleRowCount; i++) {
            if (!gridTrienKhai.IsRowSelectedOnPage(i)) {
                var cell_danhgia = gridTrienKhai.name + "_cell" + i + "_2_cmb_danhgia";
                var cell_ketqua = gridTrienKhai.name + "_cell" + i + "_3_txt_ketqua";
                var ctr_dg = elements[cell_danhgia];
                var ctr_kq = elements[cell_ketqua];
                ctr_dg.SetEnabled(false);
                ctr_kq.SetEnabled(false);                
            }
        }
    }
</script>

<table width="100%">
    <tr>
        <td style="width:75px;">Tổ chức</td>
        <td>
            <dx:ASPxComboBox ID="cmb_tochuc" ClientInstanceName="cmb_tochuc" runat="server"
                Width="400px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                LoadingPanelImagePosition="Top" Theme="Glass"
                ShowShadow="False">
                <ClientSideEvents SelectedIndexChanged="
                    function(s,e){
                        hienthi_chuongtrinh();                        
                    }
                " />
            </dx:ASPxComboBox>
        </td>        
    </tr>
    <tr>
        <td style="width:135px;">
            Loại chương trình
        </td>
        <td>
            <dx:ASPxComboBox ID="cmb_loaichuongtrinh" ClientInstanceName="cmb_loaichuongtrinh" runat="server"
                Width="200px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                LoadingPanelImagePosition="Top" Theme="Glass"
                ShowShadow="False">
                <ClientSideEvents SelectedIndexChanged="
                    function(s,e){
                        hienthi_chuongtrinh();
                    }
                " />
            </dx:ASPxComboBox>
        </td>
    </tr>  
    <tr>
        <td style="width:135px;">Trạng thái triển khai</td>
        <td>
            <dx:ASPxComboBox ID="cmb_trienkhai" ClientInstanceName="cmb_trienkhai" runat="server"
            Width="200px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
            LoadingPanelImagePosition="Top" Theme="Glass"
            ShowShadow="False">
            <Items>
               <dx:ListEditItem Value="0" Text="--Tất cả" />
               <dx:ListEditItem Value="1" Text="Chưa triển khai" Selected="true" />
               <dx:ListEditItem Value="2" Text="Đã triển khai" />
            </Items>
            <ClientSideEvents SelectedIndexChanged="
                function(s,e){
                    hienthi_chuongtrinh();
                }
            " />
        </dx:ASPxComboBox>
        </td>
    </tr>  
    <tr>
        <td colspan="4">
            <dx:ASPxGridView ID="grid_chuongtrinh" runat="server" Width="100%" Theme="Glass" 
                KeyFieldName="MA_CHUONGTRINH" ClientInstanceName="grid_chuongtrinh"
                OnCustomCallback= "grid_chuongtrinh_CustomCallback" Font-Size="12px">                
                <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowFocusedRow="true" />
                <SettingsPager Visible="False" Mode="ShowAllRecords" />
                <Settings ShowGroupButtons="false" ShowStatusBar="Visible" ShowGroupFooter="VisibleIfExpanded"
                    ShowFooter="true" VerticalScrollBarMode="Visible" VerticalScrollableHeight="542" />
                <Templates>
                    <StatusBar>
                        <dx:ASPxHiddenField ID="hdfData" ClientInstanceName="hdfData" runat="server">
                        </dx:ASPxHiddenField>                       
                    </StatusBar>
                    <EmptyDataRow>
                        <div>
                        </div>
                    </EmptyDataRow>                    
                </Templates>
                <Columns>
                    <dx:GridViewDataColumn Caption="Stt" Width="50px" CellStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <%# Container.ItemIndex +1 %>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn Caption="Loại chương trình" FieldName="TEN_LOAICHUONGTRINH" Width="150px" />
                    <dx:GridViewDataTextColumn Caption="Tên chương trình" FieldName="TEN_CHUONGTRINH" />
                    <dx:GridViewDataTextColumn Caption="Mô tả" FieldName="MOTA_CHUONGTRINH" />
                    <dx:GridViewDataDateColumn Caption="Ngày bắt đầu" FieldName="NGAY_BATDAU" Width="90px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày kết thúc" FieldName="NGAY_KETTHUC" Width="90px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Văn bản" FieldName="SO_VANBAN" Width="100px" />
                    <dx:GridViewDataTextColumn Caption="Điểm" FieldName="DIEM_CHUONGTRINH" Width="40px" HeaderStyle-HorizontalAlign="Center" />
                    <dx:GridViewDataTextColumn Caption="Triển khai" Width="110px" HeaderStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <a style="cursor: pointer; text-decoration: none;" onclick="trienkhai_chuongtrinh(<%# Eval("MA_CHUONGTRINH") %>)"><%# Eval("trangthai_trienkhai")%></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MA_LOAICHUONGTRINH" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="MA_TOCHUC_TRIENKHAI" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="MA_CHUONGTRINH" Visible="false" />
                </Columns>                
            </dx:ASPxGridView>            
        </td>
    </tr>
</table>

<dx:ASPxPopupControl ID="popup_tochuc" runat="server" ClientInstanceName="popup_tochuc" Font-Size="12px" 
    Width="800px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    Height="450px" AutoUpdatePosition="True" HeaderText="Danh sách tổ chức"
    Theme="Glass">       
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <table style="width:100%;">
                <tr>
                    <td>
                        <div style="width:370px; height:25px;">
                            <div style="width:80px; height:25px; float:left;">
                                <dx:ASPxCheckBox ID="cbox_trienkhai" runat="server" Theme="Glass" ClientInstanceName="cbox_trienkhai" Text="Triển khai" TextAlign ="Right" Checked="true">
                                    <ClientSideEvents ValueChanged="trienkhai_danhgia" />
                                </dx:ASPxCheckBox>
                            </div>
                            <div style="width:80px; height:25px; float:left;">
                                <dx:ASPxCheckBox ID="cbox_danhgia" runat="server" Theme="Glass" ClientInstanceName="cbox_danhgia" Text="Đánh giá" TextAlign ="Right">
                                    <ClientSideEvents ValueChanged="trienkhai_danhgia" />
                                </dx:ASPxCheckBox>
                            </div>
                            <div style="width:72px; height:25px; float:left;">
                                <dx:ASPxButton ID="bt_luu" runat="server" ClientInstanceName="tb_luu" Width="70px" Font-Size="12px" Theme="Glass" Text="Lưu" AutoPostBack="false">
                                    <Image Url="../../images/imgadmin/save_16.png" />
                                    <ClientSideEvents Click="
                                        function(s,e){
                                            luu_trienkhai();
                                        }
                                    " />
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" ID="gridTrienKhai" ClientInstanceName="gridTrienKhai"
                            KeyFieldName="MA_DV"  Font-Size="12px"
                            OnCustomCallback="gridTrienKhai_CustomCallback"
                            OnHtmlDataCellPrepared="gridTrienKhai_HtmlDataCellPrepared"
                            OnCustomJSProperties="gridTrienKhai_CustomJSProperties">  
                            <ClientSideEvents EndCallback="
                                function(s,e){
                                    tochuc_datrienkhai();
                                }
                            " />                                            
                            <SettingsBehavior AllowDragDrop="false" AllowSort="false" />
                            <SettingsPager Visible="False" Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsEditing Mode="Inline" />
                            <Settings ShowGroupButtons="false" ShowStatusBar="Visible" VerticalScrollBarMode="Visible"
                                VerticalScrollableHeight="400" />
                            <Templates>
                                <StatusBar>
                                    <dx:ASPxHiddenField ID="hdfTrienKhai" ClientInstanceName="hdfTrienKhai" runat="server">
                                    </dx:ASPxHiddenField>                                    
                                </StatusBar>
                                <EmptyDataRow>
                                    <div>
                                    </div>
                                </EmptyDataRow>
                            </Templates>
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" Width="30px">                                    
                                </dx:GridViewCommandColumn>                                
                                <dx:GridViewDataTextColumn Caption="Tên tổ chức" FieldName="TEN" Width="400px" />
                                <dx:GridViewDataColumn Caption="Đánh giá" FieldName="MA_DANHGIA" Width="200px">
                                    <DataItemTemplate>
                                        <dx:ASPxComboBox Theme="Glass" Width="100%" runat="server" ID="cmb_danhgia" TextFormatString="{0}" DisplayFormatString="{0}" ValueField="MA_DANHGIA" ValueType="System.Int32">  
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="MA_DANHGIA" Visible="false" />
                                                <dx:ListBoxColumn FieldName="TEN_DANHGIA" Caption="Tên đánh giá" />
                                                <dx:ListBoxColumn FieldName="TYLE_DIEM" Caption="Tỷ lệ điểm" />
                                            </Columns>  
                                            <ClientSideEvents SelectedIndexChanged="
                                                function(s,e){
                                                    if(s.GetValue() > 0 && cbox_danhgia.GetChecked() == false){
                                                        cbox_danhgia.SetChecked(true);
                                                        cbox_trienkhai.SetChecked(false);
                                                    }
                                                }
                                            " />                                         
                                        </dx:ASPxComboBox>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataTextColumn Caption="Kết quả" FieldName="KETQUA_CHUONGTRINH" Width="200px">
                                    <DataItemTemplate>
                                        <dx:ASPxTextBox ID="txt_ketqua" runat="server" Theme="Glass" Width="100%" Text='<%# Eval("KETQUA_CHUONGTRINH") %>' />                                        
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>                                
                            </Columns>                            
                        </dx:ASPxGridView>                       
                    </td>
                </tr>               
            </table>            
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

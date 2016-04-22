<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_ChuongTrinh.ascx.cs" Inherits="VNPT.Modules.QLDVIEN_NGHIEPVU.QLDV_ChuongTrinh" %>
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
        grid_chuongtrinh.PerformCallback();
    }
    function chon_chuongtrinh() {
        var ridx = grid_chuongtrinh.GetFocusedRowIndex();
        grid_chuongtrinh.GetRowValues(ridx, "MA_CHUONGTRINH;MA_TOCHUC_TRIENKHAI;MA_LOAICHUONGTRINH;TEN_LOAICHUONGTRINH;TEN_CHUONGTRINH;MOTA_CHUONGTRINH;NGAY_BATDAU;NGAY_KETTHUC;SO_VANBAN;DIEM_CHUONGTRINH", function (values) {
            hdfData.Set('ma_chuongtrinh', values[0]);
            var item_tochuc = cmb_tochuc.FindItemByValue(values[1]);
            if (item_tochuc != null)
                cmb_tochuc.SetSelectedItem(item_tochuc);
            var item_loaichuongtrinh = cmb_loaichuongtrinh.FindItemByValue(values[2]);
            if (item_loaichuongtrinh != null)
                cmb_loaichuongtrinh.SetSelectedItem(item_loaichuongtrinh);
            txt_tenchuongtrinh.SetText(values[4]);
            txt_mota.SetText(values[5]);
            date_tungay.SetValue(values[6]);
            date_denngay.SetValue(values[7]);
            txt_sovanban.SetText(values[8]);
            txt_diem.SetText(values[9]);           
        });
    }
    function luu_thongtin() {
        if (cmb_tochuc.GetValue() == 0) {
            alert('Vui lòng chọn tổ chức');
            cmb_tochuc.Focus();
            return false;
        } else if (cmb_loaichuongtrinh.GetValue() == 0) {
            alert('Vui lòng chọn loại chương trình');
            cmb_loaichuongtrinh.Focus();
            return false;
        } else if (txt_tenchuongtrinh.GetText() == '') {
            alert('Vui lòng nhập tên chương trình');
            txt_tenchuongtrinh.Focus();
            return false;
        } else if (txt_sovanban.GetText() == '') {
            alert('Vui lòng nhập điểm chuẩn chương trình');
            txt_sovanban.Focus();
            return false;
        } else if (txt_diem.GetText() == '') {
            alert('Vui lòng nhập điểm chuẩn chương trình');
            txt_diem.Focus();
            return false;
        } else {            
            if (!hdfData.Contains('ma_chuongtrinh'))
                hdfData.Set('ma_chuongtrinh', 0);
            hdfData.Set('ma_dv', cmb_tochuc.GetValue());
            hdfData.Set('ma_loaichuongtrinh', cmb_loaichuongtrinh.GetValue());
            grid_chuongtrinh.PerformCallback('luu');
        }
    }
    function xoa_thongtin() {                        
        var ridx = grid_chuongtrinh.GetFocusedRowIndex();
        grid_chuongtrinh.GetRowValues(ridx, "MA_CHUONGTRINH", function (ma_chuongtrinh) {
            hdfData.Set('ma_chuongtrinh', ma_chuongtrinh);         
            var kq = confirm('Bạn có muốn xóa thông tin chương trình này không?');
            if (kq)
                grid_chuongtrinh.PerformCallback('xoa');
        });
        
    }
    function endcall_chuongtrinh() {
        if (grid_chuongtrinh.cpChuongTrinh == 0) {
            lammoi();
            hdfData.Set('ma_chuongtrinh', 0);
            delete grid_chuongtrinh.cpChuongTrinh;
        }
    }
    function lammoi() {
        hdfData.Set('ma_chuongtrinh', 0);
        txt_tenchuongtrinh.SetText('');
        txt_mota.SetText('');
        txt_sovanban.SetText('');
        txt_diem.SetText('');
    }
</script>

<table width="100%">
    <tr>
        <td style="width:75px;">Tổ chức</td>
        <td colspan="3">           
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
        <td style="width:150px;">
            Loại chương trình
        </td>
        <td colspan="3">
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
        <td style="width:150px;">Tên chương trình</td>
        <td colspan="3">
            <dx:ASPxMemo ID="txt_tenchuongtrinh" runat="server" Theme="Glass" Width="500px" ClientInstanceName="txt_tenchuongtrinh" Height="70px" />
        </td>        
    </tr>
    <tr>
        <td style="width:150px;">
            Mô tả
        </td>
        <td colspan="3">
            <dx:ASPxMemo ID="txt_mota" runat="server" Theme="Glass" Width="500px" ClientInstanceName="txt_mota" Height="70px" />
        </td>
    </tr>
    <tr>
        <td style="width:150px;">Thời điểm từ ngày</td>
        <td style="width:152px;">
            <dx:ASPxDateEdit ID="date_tungay" runat="server" Theme="Glass" Width="150px" ClientInstanceName="date_tungay"></dx:ASPxDateEdit>
        </td>
        <td style="width:75px;">
            đến ngày
        </td>
        <td>
            <dx:ASPxDateEdit ID="date_denngay" runat="server" Theme="Glass" Width="150px" ClientInstanceName="date_denngay"></dx:ASPxDateEdit>
        </td>
    </tr>
    <tr>
        <td style="width:150px;">
            Số văn bản
        </td>
        <td style="width:150px;">
            <dx:ASPxTextBox ID="txt_sovanban" runat="server" Theme="Glass" Width="150px" ClientInstanceName="txt_sovanban" />
        </td>
        <td style="width:75px;">
            Điểm
        </td>        
        <td>
            <dx:ASPxSpinEdit ID="txt_diem" runat="server" Theme="Glass" Width="80px" ClientInstanceName="txt_diem" >               
            </dx:ASPxSpinEdit>
        </td>
    </tr>
    <tr>
        <td></td>
        <td colspan="3">   
            <div style="width:300px;">
                <div style="width:102px; float:left;">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Theme="Glass" Width="100px" Text="Làm mới" Font-Size="12px" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){
                            lammoi();
                        }" />
                        <Image Url="../../images/imgadmin/reload.png" />
                    </dx:ASPxButton>
                </div>
                <div style="width:92px; float:left;">
                    <dx:ASPxButton ID="bt_luu" runat="server" Theme="Glass" Width="90px" Text="Lưu" Font-Size="12px" AutoPostBack="false">
                    <ClientSideEvents Click="function(s,e){
                        luu_thongtin('luu');
                    }" />
                    <Image Url="../../images/imgadmin/save_16.png" />
                </dx:ASPxButton>
                </div>
                <div style="width:92px; float:left;">
                    <dx:ASPxButton ID="ASPxButton2" runat="server" Theme="Glass" Width="100px" Text="Xóa" Font-Size="12px" AutoPostBack="false">
                    <ClientSideEvents Click="function(s,e){
                        xoa_thongtin('xoa');
                    }" />
                    <Image Url="../../images/imgadmin/stop.png" />
                </dx:ASPxButton>
                </div>
            </div>                     
        </td>        
    </tr>
    <tr>
        <td colspan="4" style="font-family:Times New Roman; font-size:15px; color:Red; font-weight:bold; padding-left:15px;">
            Vui lòng RowDblClick vào dòng danh sách bên dưới khi muốn chỉnh sửa hoặc xóa thông tin chương trình
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <dx:ASPxGridView ID="grid_chuongtrinh" runat="server" Width="100%" Theme="Glass" KeyFieldName="MA_CHUONGTRINH" ClientInstanceName="grid_chuongtrinh"
                OnCustomCallback= "grid_chuongtrinh_CustomCallback" Font-Size="12px">
                <ClientSideEvents RowDblClick="
                    function(s,e){
                        chon_chuongtrinh();
                    }
                " EndCallback="function(s,e){endcall_chuongtrinh();}" />
                <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowFocusedRow="true" />
                <SettingsPager Visible="False" Mode="ShowAllRecords" />
                <Settings ShowGroupButtons="false" ShowStatusBar="Visible" ShowGroupFooter="VisibleIfExpanded"
                    ShowFooter="true" VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
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
                    <dx:GridViewDataTextColumn FieldName="MA_LOAICHUONGTRINH" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="MA_TOCHUC_TRIENKHAI" Visible="false" />
                    <dx:GridViewDataTextColumn FieldName="MA_CHUONGTRINH" Visible="false" />
                </Columns>                
            </dx:ASPxGridView>            
        </td>
    </tr>
</table>

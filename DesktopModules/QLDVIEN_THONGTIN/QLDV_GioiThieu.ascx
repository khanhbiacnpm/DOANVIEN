<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_GioiThieu.ascx.cs" Inherits="VNPT.Modules.QLDVIEN_THONGTIN.QLDV_GioiThieu" %>
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
        <td>
            <dx:ASPxGridView ID="gridGioiThieu" runat="server" Width="100%" Theme="Glass" KeyFieldName="MA_CHUONGTRINH" ClientInstanceName="gridGioiThieu"
                OnCustomCallback= "gridGioiThieu_CustomCallback" Font-Size="12px">
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

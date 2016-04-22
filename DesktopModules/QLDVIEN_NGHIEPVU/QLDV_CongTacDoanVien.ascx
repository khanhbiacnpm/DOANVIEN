<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_CongTacDoanVien.ascx.cs"
    Inherits="DotNetNuke.Modules.QLDVIEN_NGHIEPVU.QLDV_CongTacDoanVien" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<script type="text/javascript">
    function showchitiet_congtacdoan(ma_thanhvien,ten_thanhvien, ma_dv) {
        var yPos = 10;
        var xPos = (($(window).width()) / 2) - 500;
        hdfData.Set('ma_thanhvien', ma_thanhvien);
        hdfData.Set('ma_dv_di', ma_dv);
        pupop_chitiet.SetHeaderText('Danh sách lịch sử công tác đoàn của thành viên: ' + ten_thanhvien);
        pupop_chitiet.ShowAtPos(xPos, yPos);
        pupop_chitiet.Show();
        gridDVChiTiet.PerformCallback('hienthi;' + ma_thanhvien + ';' + ma_dv);
    }
    var startUpload = false;
    function save() {
        var fileA = uploadFileDinhKem.GetText();
        var hasFileA = fileA.length != 0;
        if (!hasFileA) {            
            gridDVChiTiet.PerformCallback('luu;' + hdfData.Get('ma_thanhvien') + ';' + hdfData.Get('ma_dv_di') + ';' + cmb_tochuc1.GetValue());
        }
        else {
            startUpload = true;
            uploadFileDinhKem.Upload();
            waitUploadComplete();
        }
    }

    function waitUploadComplete() {
        if (!startUpload) {
            gridDVChiTiet.PerformCallback('hienthi;' + hdfData.Get('ma_thanhvien'));
        }
        else {
            setTimeout("waitUploadComplete()", 1000);
        }
    }
    function xoa_thongtin() {
        var ridx = gridDVChiTiet.GetFocusedRowIndex();
        gridDVChiTiet.GetRowValues(ridx, "ma_lichsu", function (ma_lichsu) {
            var kq = confirm('Bạn có muốn xóa thông tin chương trình này không?');
            if (kq)
                gridDVChiTiet.PerformCallback('xoa;' + hdfData.Get('ma_thanhvien') + ';' + ma_lichsu);
        });
    }
    function gridChiTiet_EndCallback(s,e) {
        if (gridDVChiTiet.cpHT == 0) {
            var item = cmb_tochuc1.FindItemByValue(gridDVChiTiet.cpMADV);
            if (item != null)
                cmb_tochuc1.SetSelectedItem(item);            
            delete gridDVChiTiet.MADV;
        } else if (gridDVChiTiet.cpHT == 1) {
            alert('Lưu thông tin lịch sử thành công');        
        }else if(gridDVChiTiet.cpHT == 2) {
            alert('Xóa thông tin lịch sử thành công');        
        }
        delete gridDVChiTiet.cpHT;
    }   

</script>

<table width="100%">
    <tr>
        <td style="width:75px;">Tổ chức</td>
        <td style="width:402px;">
            <dx:ASPxComboBox ID="cmb_tochuc" ClientInstanceName="cmb_tochuc" runat="server"
                Width="400px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                LoadingPanelImagePosition="Top" Theme="Glass"
                ShowShadow="False">
                <ClientSideEvents SelectedIndexChanged="
                    function(s,e){
                        gridDoanVien.PerformCallback(cmb_tochuc.GetValue()+';0');
                    }
                " />
            </dx:ASPxComboBox>
        </td>        
        <td style="width:80px;">
            <dx:ASPxButton ID="bt_xem" runat="server" Text="Xem" AutoPostBack="false" Theme="Glass" Width="80px" Font-Size="12px">   
                <Image Url="../../images/imgadmin/thongke.png" />
                <ClientSideEvents Click="
                    function(s,e){
                        gridDoanVien.PerformCallback(cmb_tochuc.GetValue()+';0');
                    }
                " />
            </dx:ASPxButton>
        </td>
        <td style="width:130px;">
            <dx:ASPxButton ID="bt_dsthanhvien_khongtochuc" runat="server" Text="Đoàn viên mới" AutoPostBack="false" Theme="Glass" Width="130px" Font-Size="12px">   
                <Image Url="../../images/imgadmin/OK.gif" />
                <ClientSideEvents Click="
                    function(s,e){
                        gridDoanVien.PerformCallback(cmb_tochuc.GetValue()+';1');
                    }
                " />
            </dx:ASPxButton>
        </td>
        <td>
            <dx:ASPxButton ID="btexcel" runat="server" Text="Excel" AutoPostBack="false" Theme="Glass" Width="80px" Font-Size="12px"
                OnClick="btexcel_OnClick">  
                <Image Url="../../images/imgadmin/Excel.png" />
            </dx:ASPxButton>
        </td>
    </tr>    
    <tr>
        <td colspan="5">
           <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" ID="gridDoanVien" ClientInstanceName="gridDoanVien"
                KeyFieldName="ma_thanhvien" OnCustomCallback="gridDoanVien_CustomCallback">                
                <Styles>
                    <Header HorizontalAlign="Center" Font-Size="12px" Font-Names="Arial" Wrap="True">
                    </Header>
                    <Cell Font-Size="12px" Font-Names="Arial" Paddings-Padding="2">
                        <Paddings Padding="2px"></Paddings>
                    </Cell>
                    <Footer Font-Bold="true" Font-Size="12px">
                    </Footer>
                    <GroupRow Font-Size="12px" Font-Names="Arial">
                    </GroupRow>
                    <GroupFooter Font-Size="12px" Font-Names="Arial" Font-Bold="true">
                    </GroupFooter>
                </Styles>
                <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowFocusedRow="true" />
                <SettingsPager Visible="False" Mode="ShowAllRecords" />
                <Settings ShowGroupButtons="false" ShowStatusBar="Visible" ShowGroupFooter="VisibleIfExpanded"
                    ShowFooter="true" VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />                     
                <Columns>
                    <dx:GridViewDataColumn Caption="Stt" Width="50px" CellStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <%# Container.ItemIndex +1 %>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Tên thành viên" FieldName="ten_thanhvien" Width="250px" />
                    <dx:GridViewDataColumn Caption="Giới tính" FieldName="gioi_tinh" Width="70px" />
                    <dx:GridViewDataDateColumn Caption="Ngày sinh" FieldName="ngay_sinh" width="80px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataColumn Caption="Tuổi" FieldName="tuoi" Width="50px" />
                    <dx:GridViewDataColumn Caption="Đảng viên" FieldName="dang_vien" Width="50px" />
                    <dx:GridViewDataColumn Caption="Chức vụ" FieldName="chuc_vu" Width="150px" />
                    <dx:GridViewDataColumn Caption="Tổ chức" FieldName="to_chuc" />                    
                    <dx:GridViewDataColumn FieldName="ma_dv" Visible="false" />
                    <dx:GridViewDataTextColumn Caption="Lịch sử công tác đoàn" FieldName="ma_thanhvien" Width="100px">
                        <DataItemTemplate>
                            <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_congtacdoan('<%# Eval("ma_thanhvien") %>','<%# Eval("ten_thanhvien") %>','<%# Eval("ma_dv") %>')">Chi tiết</a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>                   
                </Columns>                                 
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="GridExporter" runat="server">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="pupop_chitiet" runat="server" ClientInstanceName="pupop_chitiet"
    Width="1000px" Height="400px" ShowCloseButton="true" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="TopSides" PopupAnimationType="Slide" Modal="true" Theme="Glass"
    AllowDragging="true" HeaderText="Danh sách lịch sử công tác đoàn"
    Font-Names="arial" Font-Size="12px">
    <ContentCollection>
        <dx:PopupControlContentControl ID="content">
            <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2" width="100%"
                    border="0">
                    <tr>
                        <td valign="top" style="width: 100px;">
                            Loại biến động
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_biendong" ClientInstanceName="cmb_biendong" runat="server"
                                Width="150px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                LoadingPanelImagePosition="Top" Theme="Glass"
                                ShowShadow="False">
                            </dx:ASPxComboBox>
                        </td>  
                        <td style="width:100px;">
                            Ngày hiệu lực
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="date_hieuluc" ClientInstanceName="date_hieuluc" runat="server"
                                Theme="Glass" ShowShadow="False" Width="150px">
                            </dx:ASPxDateEdit>
                        </td>                      
                    </tr> 
                    <tr>
                        <td valign="top" style="width: 100px;" >
                            <dx:ASPxLabel ID="lbl_donvi" runat="server" ClientInstanceName="lbl_donvi" Text="Đơn vị" />
                        </td>
                        <td valign="top" colspan="3">
                            <dx:ASPxComboBox ID="cmb_tochuc1" ClientInstanceName="cmb_tochuc1" runat="server"
                                Width="350px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                LoadingPanelImagePosition="Top" Theme="Glass"
                                ShowShadow="False">
                            </dx:ASPxComboBox>
                        </td>                        
                    </tr>
                    <tr>
                        <td style="width: 100px;">
                            Quyết định
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtQuyetDinh" ClientInstanceName="txtQuyetDinh" runat="server"
                                Theme="Glass"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                        <td valign="top">
                            File đính kèm
                        </td>
                        <td valign="top">
                            <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                ClientInstanceName="uploadFileDinhKem" Width="350px" Theme="Glass">
                                <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>              
                    <tr>
                        <td style="width: 100px;">
                            Lý do
                        </td>
                        <td colspan="3">
                            <dx:ASPxTextBox ID="txt_lydo" runat="server" 
                                ClientInstanceName="txt_lydo" Theme="Glass"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>                        
                    </tr>                                     
                    <tr>
                        <td>
                        </td>
                        <td colspan="3" align="left" style="padding: 5px;">
                           <div style="width:200px; height:25px;">
                            <div style="width:92px; height:25px; float:left;">
                                <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Lưu" Width="80px"
                                    AutoPostBack="false"
                                    Theme="Glass" Font-Size="12px">
                                    <Image Url="../../images/imgadmin/save_16.png" />
                                    <ClientSideEvents Click="function(s,e){save();}" />                                
                                </dx:ASPxButton>
                            </div>
                            <div style="width:92px; height:25px; float:left;">
                                <dx:ASPxButton ID="bt_xoa" runat="server" Text="Xóa" Width="80px"
                                    Image-Url="~/images/imgadmin/delete_16.png" AutoPostBack="false"
                                    Theme="Glass" Font-Size="12px">
                                    <ClientSideEvents Click="function(s,e){xoa_thongtin();}" />                                
                                </dx:ASPxButton>
                            </div>
                           </div>                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" 
                                ID="gridDVChiTiet" ClientInstanceName="gridDVChiTiet"
                                KeyFieldName="ma_lichsu" OnCustomCallback="gridDVChiTiet_CustomCallback">    
                                <ClientSideEvents EndCallback="gridChiTiet_EndCallback" />            
                                <Styles>
                                    <Header HorizontalAlign="Center" Font-Size="12px" Font-Names="Arial" Wrap="True">
                                    </Header>
                                    <Cell Font-Size="12px" Font-Names="Arial" Paddings-Padding="2">
                                        <Paddings Padding="2px"></Paddings>
                                    </Cell>
                                    <Footer Font-Bold="true" Font-Size="12px">
                                    </Footer>
                                    <GroupRow Font-Size="12px" Font-Names="Arial">
                                    </GroupRow>
                                    <GroupFooter Font-Size="12px" Font-Names="Arial" Font-Bold="true">
                                    </GroupFooter>
                                </Styles>
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
                                    <dx:GridViewDataTextColumn Caption="Tên biến động" FieldName="ten_biendong">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lý do" FieldName="ly_do" />                    
                                    <dx:GridViewDataTextColumn Caption="Quyết định" FieldName="quyet_dinh" />
                                    <dx:GridViewDataDateColumn Caption="Thời điểm" FieldName="thoi_diem" width="80px">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                                    </dx:GridViewDataDateColumn> 
                                    <dx:GridViewDataTextColumn FieldName="ma_lichsu" Visible="false" />                                                         
                                </Columns>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>                                          
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
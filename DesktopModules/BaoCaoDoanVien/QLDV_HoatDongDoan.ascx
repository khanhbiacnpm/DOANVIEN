<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_HoatDongDoan.ascx.cs"
    Inherits="DotNetNuke.Modules.BaoCaoDoanVien.QLDV_HoatDongDoan" %>
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
    function showchitiet_chuongtrinh(ma_dv) {
        var yPos = 10;
        var xPos = (($(window).width()) / 2) - 500;        
        pupop_chitiet.ShowAtPos(xPos, yPos);
        pupop_chitiet.Show();        
        gridDVChiTiet.PerformCallback(ma_dv);
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
                        gridDoanVien.PerformCallback(cmb_tochuc.GetValue());
                    }
                " />
            </dx:ASPxComboBox>
        </td>        
        <td style="width:80px;">
            <dx:ASPxButton ID="bt_xem" runat="server" Text="Xem" AutoPostBack="false" Theme="Glass" Width="80px" Font-Size="12px">   
                <Image Url="../../images/imgadmin/thongke.png" />
                <ClientSideEvents Click="
                    function(s,e){
                        gridDoanVien.PerformCallback(cmb_tochuc.GetValue());
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
        <td colspan="4">
           <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" ID="gridDoanVien" ClientInstanceName="gridDoanVien"
                KeyFieldName="ma_dv" OnCustomCallback="gridDoanVien_CustomCallback">                
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
                    <dx:GridViewDataColumn Caption="Tổ chức" FieldName="TEN" Width="250px">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Tổng điểm đạt" FieldName="diemtong">                        
                    </dx:GridViewDataColumn>                    
                    <dx:GridViewBandColumn Caption="Chương trình đoàn">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Tổng số" FieldName="tongctr" />
                            <dx:GridViewDataTextColumn Caption="Cấp trên triển khai" FieldName="ctrcaptren" />
                            <dx:GridViewDataTextColumn Caption="Tự triển khai" FieldName="ctrtutrienkhai" />                            
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn Caption="Chi tiết tính điểm" FieldName="so_dvketnapmoi">
                        <DataItemTemplate>
                            <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_chuongtrinh(<%# Eval("ma_dv") %>)">Xem chi tiết</a>
                        </DataItemTemplate>
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
    AllowDragging="true" HeaderText="Danh sách chương trình"
    Font-Names="arial" Font-Size="12px">
    <ContentCollection>
        <dx:PopupControlContentControl ID="content">                        
            <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" ID="gridDVChiTiet" ClientInstanceName="gridDVChiTiet"
                KeyFieldName="MA_CHUONGTRINH" OnCustomCallback="gridDVChiTiet_CustomCallback">                
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
                    <dx:GridViewDataTextColumn Caption="Tên chương trình" FieldName="TEN_CHUONGTRINH">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Mô trả chương trình" FieldName="MOTA_CHUONGTRINH">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày bắt đầu" FieldName="NGAY_BATDAU" width="80px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày kết thúc" FieldName="NGAY_KETTHUC" width="80px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Kết quả" FieldName="KETQUA_CHUONGTRINH" width="100px"/>                    
                    <dx:GridViewDataTextColumn Caption="Tên đánh giá" FieldName="TEN_DANHGIA" width="100px"/>
                    <dx:GridViewDataTextColumn Caption="Điểm" FieldName="DIEM"  width="50px"/>                    
                </Columns>
            </dx:ASPxGridView>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
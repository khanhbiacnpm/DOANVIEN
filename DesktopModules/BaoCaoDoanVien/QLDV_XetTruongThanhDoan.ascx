<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_XetTruongThanhDoan.ascx.cs"
    Inherits="DotNetNuke.Modules.BaoCaoDoanVien.QLDV_XetTruongThanhDoan" %>
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
                    <dx:GridViewDataColumn Caption="Tên thành viên" FieldName="ten_thanhvien" Width="250px" />
                    <dx:GridViewDataColumn Caption="Giới tính" FieldName="gioi_tinh" Width="70px" />
                    <dx:GridViewDataDateColumn Caption="Ngày sinh" FieldName="ngay_sinh" width="80px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataColumn Caption="Tuổi" FieldName="tuoi" Width="50px" />
                    <dx:GridViewDataColumn Caption="Đảng viên" FieldName="dang_vien" Width="50px" />
                    <dx:GridViewDataColumn Caption="Chức vụ" FieldName="chuc_vu" />
                    <dx:GridViewDataColumn Caption="Tổ chức" FieldName="to_chuc">
                    </dx:GridViewDataColumn>                    
                </Columns>                                 
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="GridExporter" runat="server">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
</table>
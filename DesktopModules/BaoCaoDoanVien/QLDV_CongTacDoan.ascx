<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QLDV_CongTacDoan.ascx.cs"
    Inherits="DotNetNuke.Modules.BaoCaoDoanVien.QLDV_CongTacDoan" %>
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
    function showchitiet_doanvien(ma_dv, ma_biendong) {
        var yPos = 10;
        var xPos = (($(window).width()) / 2) - 500;
        if (ma_biendong == 0)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên hiện tại");
        else if (ma_biendong == 1)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên kết nạp mới");
        else if (ma_biendong == 2)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên chuyển đến");
        else if (ma_biendong == 3)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên chuyển đi");
        else if (ma_biendong == 4)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên đã trưởng thành");
        else if (ma_biendong == 5)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên học cảm tình đảng");
        else if (ma_biendong == 6)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên ra NQ giới thiệu");
        else if (ma_biendong == 7)
            pupop_chitiet.SetHeaderText("Danh sách đoàn viên kết Nạp đảng");
        pupop_chitiet.ShowAtPos(xPos, yPos);
        pupop_chitiet.Show();        
        gridDVChiTiet.PerformCallback(ma_dv + ';' + ma_biendong);
    }
</script>
<table>
    <tr>
        <td style="width:75px;">Tổ chức</td>
        <td>
            <dx:ASPxComboBox ID="cmb_tochuc" ClientInstanceName="cmb_tochuc" runat="server"
                Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                LoadingPanelImagePosition="Top" Theme="Glass"
                ShowShadow="False">
            </dx:ASPxComboBox>
        </td>
        <td style="width:75px;">
            Từ ngày
        </td>
        <td style="width:150px;">
            <dx:ASPxDateEdit ID="date_tu" runat="server" Theme="Glass" Width="150px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">                
            </dx:ASPxDateEdit>
        </td>
        <td style="width:75px;">
            đến ngày
        </td>
        <td style="width:150px;">
            <dx:ASPxDateEdit ID="date_den" runat="server" Theme="Glass" Width="150px"  DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" />
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
        <td colspan="8">
           <dx:ASPxGridView runat="server" Width="100%" Theme="Glass" ID="gridDoanVien" ClientInstanceName="gridDoanVien"
                KeyFieldName="MA_DV" OnCustomCallback="gridDoanVien_CustomCallback">                
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
                    <dx:GridViewDataColumn Caption="Tổng số thành viên hiện có" FieldName="so_doanvienhientai">
                        <DataItemTemplate>
                            <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 0)"><%# Eval("so_doanvienhientai") %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>                    
                    <dx:GridViewBandColumn Caption="Cơ cấu đoàn viên">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Nam" FieldName="nam" />
                            <dx:GridViewDataTextColumn Caption="Nữ" FieldName="nu" />
                            <dx:GridViewDataTextColumn Caption="Độ tuổi trung bình" FieldName="tuoi_trungbinh" />
                            <dx:GridViewDataTextColumn Caption="Số đoàn viên vào đảng" FieldName="so_dvvaodang" />
                            <dx:GridViewDataTextColumn Caption="Số Cán bộ đoàn (UVBCH Chi đoàn trở lên)" FieldName="so_canbodoan" />
                            <dx:GridViewDataTextColumn Caption="Số ĐV dân tộc" FieldName="so_dvdantoc" />
                            <dx:GridViewDataTextColumn Caption="Số ĐV tôn giáo" FieldName="so_dvtongiao" />                            
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Quản lý đoàn viên">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Kết nạp mới" FieldName="so_dvketnapmoi">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 1)"><%# Eval("so_dvketnapmoi") %></a>
                                </DataItemTemplate>                                
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Số ĐV chuyển đến" FieldName="so_dvchuyenden">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 2)"><%# Eval("so_dvchuyenden")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Số ĐV chuyển đi" FieldName="so_dvchuyendi">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 3)"><%# Eval("so_dvchuyendi")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Số ĐV trưởng thành" FieldName="so_dvtruongthanh">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 4)"><%# Eval("so_dvtruongthanh")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SL ĐV học cảm tình đảng" FieldName="so_dvhocdang">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 5)"><%# Eval("so_dvhocdang")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SL ĐV ra NQ giới thiệu kết nạp Đảng" FieldName="so_dvgioithieuvaodang">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 6)"><%# Eval("so_dvgioithieuvaodang")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SL ĐV Kết Nạp đảng" FieldName="so_dvketnap">
                                <DataItemTemplate>
                                    <a style="cursor: pointer; text-decoration: none;" onclick="showchitiet_doanvien(<%# Eval("MA_DV") %>, 7)"><%# Eval("so_dvketnap")%></a>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>                        
                        </Columns>
                    </dx:GridViewBandColumn>                                    
                </Columns>   
                <TotalSummary>                    
                    <dx:ASPxSummaryItem FieldName="so_doanvienhientai" ShowInColumn="so_doanvienhientai" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="nam" ShowInColumn="nam" SummaryType="Sum" DisplayFormat="#,##" />                    
                    <dx:ASPxSummaryItem FieldName="nu" ShowInColumn="nu" SummaryType="Sum" DisplayFormat="#.##" />
                    <dx:ASPxSummaryItem FieldName="so_dvvaodang" ShowInColumn="so_dvvaodang" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_canbodoan" ShowInColumn="so_canbodoan" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvdantoc" ShowInColumn="so_dvdantoc" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvtongiao" ShowInColumn="so_dvtongiao" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvketnapmoi" ShowInColumn="so_dvketnapmoi" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvchuyenden" ShowInColumn="so_dvchuyenden" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvchuyendi" ShowInColumn="so_dvchuyendi" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvtruongthanh" ShowInColumn="so_dvtruongthanh" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvhocdang" ShowInColumn="so_dvhocdang" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvgioithieuvaodang" ShowInColumn="so_dvgioithieuvaodang" SummaryType="Sum" DisplayFormat="#,##" />
                    <dx:ASPxSummaryItem FieldName="so_dvketnap" ShowInColumn="so_dvketnap" SummaryType="Sum" DisplayFormat="#,##" />                    
                </TotalSummary>               
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="GridExporter" runat="server">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="pupop_chitiet" runat="server" ClientInstanceName="pupop_chitiet"
    Width="1000px" Height="400px" ShowCloseButton="true" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="TopSides" PopupAnimationType="Slide" Modal="true" Theme="Glass"
    AllowDragging="true" HeaderText="Danh sách đoàn viên"
    Font-Names="arial" Font-Size="12px">
    <ContentCollection>
        <dx:PopupControlContentControl ID="content">                        
            <dx:ASPxGridView runat="server" Width="100%" Theme="Aqua" ID="gridDVChiTiet" ClientInstanceName="gridDVChiTiet"
                KeyFieldName="id" OnCustomCallback="gridDVChiTiet_CustomCallback">                
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
                    <dx:GridViewDataTextColumn Caption="Tên thành viên" FieldName="hoten">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày sinh" FieldName="ngay_sinh" Width="100px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Giới tính" FieldName="gioi_tinh" Width="70px" />
                    <dx:GridViewDataDateColumn Caption="Ngày vào đoàn" FieldName="ngay_vao_doan" Width="100px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Đơn vị đi" FieldName="dv_di" Visible="false" />
                    <dx:GridViewDataTextColumn Caption="Đơn vị đến" FieldName="dv_den" Visible="false" />
                    <dx:GridViewDataTextColumn Caption="Lý do" FieldName="ly_do" />
                    <dx:GridViewDataDateColumn Caption="Ngày hiệu lực" FieldName="thoi_diem" Width="100px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataDateColumn>
                </Columns>
            </dx:ASPxGridView>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
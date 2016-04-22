<%@ Control Language="C#" Inherits="Philip.Modules.BaoHiem.ViewDSBaoHiem" CodeFile="ViewDSBaoHiem.ascx.cs"
    AutoEventWireup="true" %>
<%--<%@ Register Assembly="DevExpress.Web.v12.2.Export, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>--%>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
    
<style type="text/css">
    .dxnbControl_Glass2
    {
        color: #000000;
        font: 9pt Tahoma;
    }
    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
    .dxnbGroupHeader_Glass
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 1px 3px;
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
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
            .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 1px;
}
</style>
<table cellpadding="0" cellspacing="0" width="100%" border="0">
    <tr>
        <td class="dxnbGroupHeader_Glass12" style="width:100px;">
            Chọn đơn vị
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:280px;">
            <dx:ASPxComboBox ID="cmbDonVi" runat="server" ClientInstanceName="cmbDonVi" 
                IncrementalFilteringMode="Contains" Height="23px"
                Width="250px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                
            </dx:ASPxComboBox>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:80px">
            Thời điểm
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxDateEdit ID="dateThongKe" runat="server"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" Height="23px"
                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Width="100%">
                
            </dx:ASPxDateEdit>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:105px;">
            <dx:ASPxButton ID="btXemThongKe" runat="server" Width="100px" Text="Hiển thị"  Height="23px" 
                AutoPostBack="false"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" TextSpacing="2px">
                <Image Url="~/images/imgadmin/reload.png">
                </Image>
                <ClientSideEvents Click="function(s,e){
                        if(ASPxClientEdit.ValidateGroup('ThongKe'))
                        {
                            gridThongKeDSBaoHiem.PerformCallback();
                        }
                    }
                    " />
            </dx:ASPxButton>            
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="btXuatExcel" runat="server" Width="120px"  Height="23px" Text="Xuất Excel" OnClick="btXuatExcel_Click"                
                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" TextSpacing="2px">
                <Image Url="../../images/imgadmin/Excel.png" ></Image>             
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="padding:3px;">
            <asp:HiddenField ID ="hiddenEmpID" runat="server" />
            <dx:ASPxGridView ID="gridThongKeDSBaoHiem" runat="server"
                ClientInstanceName="gridThongKeDSBaoHiem" Width="784px"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                KeyFieldName="Id"
                OnCustomCallback = "gridThongKeDSBaoHiem_CallBack" 
                onhtmldatacellprepared="gridThongKeDSBaoHiem_HtmlDataCellPrepared" >
                <Settings ShowHorizontalScrollBar="true" ShowVerticalScrollBar="true" VerticalScrollableHeight ="350" />
                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />                                
                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="STT" FieldName="Id" VisibleIndex="0" FixedStyle="Left" Width="40px" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxLabel ID ="lbl_STT" runat="server"></dx:ASPxLabel>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Họ và Tên" FieldName="hoTen" FixedStyle="Left" 
                        VisibleIndex="1" HeaderStyle-HorizontalAlign="Center" Width="150px" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số CMND" FieldName="soCMDN" 
                        VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" 
                        CellStyle-HorizontalAlign="Center" Width="80px" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số sổ BHXH" FieldName="soBHXH" 
                        VisibleIndex="3" Width="90px" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ngày, tháng, năm sinh" FieldName="ngaySinh" VisibleIndex="4" 
                        Width="100px">
                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}"></PropertiesTextEdit>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Giới tính (Nữ X)" FieldName="gioiTinh" VisibleIndex="5" Width="70px">
                        <HeaderStyle HorizontalAlign ="Center" />
                        <CellStyle HorizontalAlign="Center" />                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Địa chỉ" FieldName="tenTT" VisibleIndex="6" Width="150px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Nơi ĐK KCB" FieldName="noiKhamBenh" VisibleIndex="7" Width="150px">                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Tiền lương" FieldName="tienLuong" VisibleIndex="8" Width="200px">                        
                        <HeaderTemplate>
                            <div style="width:200px;">
                                <div style="width:200px; height:20px; padding-top:5px;">Căn cứ đóng BHXH-BHYT</div>
                                <div style="width:200px; height:25px;">
                                    <div style="width:99px; height:30px; float:left; border-top:1px solid #A3C0E8 ;">Tiền lương, tiền công</div>
                                    <div style="width:98px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8; border-left:1px solid #A3C0E8;">Phụ cấp CV</div>
                                </div>
                        </HeaderTemplate>
                        <DataItemTemplate>
                                <div style="width:200px; height:100%; float:left;">
                                    <div style="width:99px; min-height: 35px;  height:100%; float:left; padding-top:15px; text-align:center;">
                                        <dx:ASPxLabel ID ="lbl_heSoLuong" runat="server" style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                    <div style="width:98px; min-height: 35px; height:100%; float:left; padding-top:15px; text-align:center; border-left:1px solid #A3C0E8;">
                                        <dx:ASPxLabel ID ="lbl_heSoCV" runat="server"  style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                </div>
                        </DataItemTemplate>
                        <HeaderStyle Paddings-Padding="0" >
<Paddings Padding="0px"></Paddings>
                        </HeaderStyle>
                        <CellStyle Paddings-Padding="0">
<Paddings Padding="0px"></Paddings>
                        </CellStyle>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Họ và Tên" Visible="false" FieldName="phuCapCV" FixedStyle="Left" 
                        VisibleIndex="1" HeaderStyle-HorizontalAlign="Center" Width="150px" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NLD_BHXH" VisibleIndex="9" Width="200px">                        
                        <HeaderTemplate>
                            <div style="width:200px;">
                                <div style="width:200px; height:20px; padding-top:5px;">Tiền lương đóng BHXH</div>
                                <div style="width:200px; height:25px;">
                                    <div style="width:99px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8 ;">NLĐ</div>
                                    <div style="width:98px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8; border-left:1px solid #A3C0E8;">NSDLĐ</div>
                                </div>
                        </HeaderTemplate>
                        <DataItemTemplate>
                                <div style="width:200px; height:100%; float:left;">
                                    <div style="width:99px; min-height: 35px;  height:100%; float:left;padding-top:15px; text-align:center;">
                                        <dx:ASPxLabel ID ="lbl_nldBHXH" runat="server" style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                    <div style="width:98px; min-height: 35px; height:100%; float:left; padding-top:15px; text-align:center; border-left:1px solid #A3C0E8;">
                                        <dx:ASPxLabel ID ="lbl_nsdldBHXH" runat="server"  style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                </div>
                        </DataItemTemplate>
                        <HeaderStyle Paddings-Padding="0" >
<Paddings Padding="0px"></Paddings>
                        </HeaderStyle>
                        <CellStyle Paddings-Padding="0">
<Paddings Padding="0px"></Paddings>
                        </CellStyle>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </dx:GridViewDataTextColumn>    
                    <dx:GridViewDataTextColumn FieldName="NLD_BHYT" VisibleIndex="10" Width="200px">                        
                        <HeaderTemplate>
                            <div style="width:200px;">
                                <div style="width:200px; height:20px; padding-top:5px;">Tiền lương đóng BHYT</div>
                                <div style="width:200px; height:25px;">
                                    <div style="width:99px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8 ;">NLĐ</div>
                                    <div style="width:98px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8; border-left:1px solid #A3C0E8;">NSDLĐ</div>
                                </div>
                        </HeaderTemplate>
                        <DataItemTemplate>
                                <div style="width:200px; height:100%; float:left;">
                                    <div style="width:99px; min-height: 35px;  height:100%; float:left;padding-top:15px; text-align:center;">
                                        <dx:ASPxLabel ID ="lbl_nldBHYT" runat="server" style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                    <div style="width:98px; min-height: 35px; height:100%; float:left; padding-top:15px; text-align:center; border-left:1px solid #A3C0E8;">
                                        <dx:ASPxLabel ID ="lbl_nsdldBHYT" runat="server"  style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                </div>
                        </DataItemTemplate>
                        <HeaderStyle Paddings-Padding="0" >
<Paddings Padding="0px"></Paddings>
                        </HeaderStyle>
                        <CellStyle Paddings-Padding="0">
<Paddings Padding="0px"></Paddings>
                        </CellStyle>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </dx:GridViewDataTextColumn> 
                    <dx:GridViewDataTextColumn FieldName="NLD_BHTN" VisibleIndex="11" Width="200px">                        
                        <HeaderTemplate>
                            <div style="width:200px;">
                                <div style="width:200px; height:20px; padding-top:5px;">Tiền lương đóng BHTN</div>
                                <div style="width:200px; height:25px;">
                                    <div style="width:99px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8 ;">NLĐ</div>
                                    <div style="width:98px; height:25px; padding-top:5px; float:left; border-top:1px solid #A3C0E8; border-left:1px solid #A3C0E8;">NSDLĐ</div>
                                </div>
                        </HeaderTemplate>
                        <DataItemTemplate>
                                <div style="width:200px; height:100%; float:left;">
                                    <div style="width:99px; min-height: 35px;  height:100%; float:left;padding-top:15px; text-align:center;">
                                        <dx:ASPxLabel ID ="lbl_nldBHTN" runat="server" style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                    <div style="width:98px; min-height: 35px; height:100%; float:left; padding-top:15px; text-align:center; border-left:1px solid #A3C0E8;">
                                        <dx:ASPxLabel ID ="lbl_nsdldBHTN" runat="server"  style="margin-bottom:100px;"></dx:ASPxLabel>
                                    </div>
                                </div>
                        </DataItemTemplate>
                        <HeaderStyle Paddings-Padding="0" >
<Paddings Padding="0px"></Paddings>
                        </HeaderStyle>
                        <CellStyle Paddings-Padding="0">
<Paddings Padding="0px"></Paddings>
                        </CellStyle>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </dx:GridViewDataTextColumn>                 
                    <dx:GridViewDataTextColumn Caption="Đóng từ ngày, tháng, năm" FieldName="ngayDongBHXH" VisibleIndex="12" 
                        Width="100px">
                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}"></PropertiesTextEdit>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataTextColumn>                    
                </Columns>
                <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                    <LoadingPanel ImageSpacing="8px">
                    </LoadingPanel>
                    <Header Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle"></Header>                    
                </Styles>
                <SettingsLoadingPanel ImagePosition="Top" />                
                <ImagesFilterControl>
                    <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <StylesEditors>
                    <CalendarHeader Spacing="1px">
                    </CalendarHeader>
                    <ProgressBar Height="25px">
                    </ProgressBar>
                </StylesEditors>
                
            </dx:ASPxGridView>                        
            <dx:ReportViewer ID="ReportViewer1" runat="server">
            </dx:ReportViewer>
        </td>
    </tr>
</table>

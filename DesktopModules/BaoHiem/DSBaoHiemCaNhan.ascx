<%@ Control Language="C#" Inherits="Philip.Modules.BaoHiem.DSBaoHiemCaNhan" CodeFile="DSBaoHiemCaNhan.ascx.cs"
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

  
<table cellpadding="0" cellspacing="0" width="100%" border="0">
    <tr>
       
        <td valign="top" align="left">
            <dx:ASPxButton ID="btXuatExcel" runat="server" Width="120px" Height="25px" Text="Xuất Excel"
                OnClick="btXuatExcel_Click" Theme="Glass" Font-Size="12px" TextSpacing="2px">
                <Image Url="../../images/imgadmin/Excel.png">
                </Image>
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td >           
                                <table cellpadding="2" cellspacing="1" width="100%" border = "0" style="font-family:Verdana; font-size:12pt;">
                            <tr>
                                <td style="font-weight: bold;" align="center">
                                    TỜ KHAI
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;" align="center">
                                    THAM GIA BẢO HIỂM XÃ HỘI, BẢO HIỂM Y TẾ, BẢO HIỂM THẤT NGHIỆP
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;" align="center">
                                    <dx:ASPxLabel ID="lbl_soBHXH" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; text-decoration: underline;">
                                    A. NGƯỜI LAO ĐỘNG
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong1" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong2" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong3" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong4" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong5" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong6" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong7" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong8" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong9" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong10" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong11" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_dong12" runat="server">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td>
                                    <asp:HiddenField ID ="hiddenEmpID" runat="server" />
                                    <dx:ASPxGridView ID="gridThongKeDSBaoHiem" runat="server" ClientInstanceName="gridThongKeDSBaoHiem"
                                        Width="100%" Theme=Glass Font-Size="12px"
                                        KeyFieldName="Id" 
                                        OnHtmlDataCellPrepared="gridThongKeDSBaoHiem_HtmlDataCellPrepared">                                                                                
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        
                                        <Columns>

                                            <dx:GridViewDataTextColumn Caption="#" FieldName="Id" 
                                                Width="10px">
                                                <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                                                <CellStyle Paddings-Padding="2" HorizontalAlign="Center">
                                                </CellStyle>
                                                
                                                 <DataItemTemplate><%# Container.ItemIndex + 1 %></DataItemTemplate>
                                                
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Từ ngày, tháng, năm" FieldName="tuNgay"
                                                HeaderStyle-HorizontalAlign="Center" Width="50px">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <CellStyle Paddings-Padding="2"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Đến ngày, tháng, năm" FieldName="denNgay"
                                                HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="50px">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <CellStyle Paddings-Padding="2" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Cấp bậc, chức vụ, chức danh nghề, công việc, nơi làm việc (tên cơ quan, đơn vị, địa chỉ)"
                                                FieldName="chucVu_DonVi" Width="500px">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <CellStyle Paddings-Padding="2" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tiền lương" FieldName="tienLuong" Width="80px">
                                                <HeaderTemplate>
                                                    <div style="width: 80px; height:100%">
                                                        <div style="width: 80px; height: 35px;padding-top:1px;">
                                                            Căn cứ đóng BHXH-BHYT</div>
                                                        <div style="width: 80px; height: 80px;">
                                                            <div style="width: 40px; height: 74px; padding-top:5px; float: left; border-top: 1px solid #A3C0E8;">
                                                                Tiền lương, tiền công</div>
                                                            <div style="width: 39px; height: 69px; padding-top:10px; float: left; border-top: 1px solid #A3C0E8;
                                                                border-left: 1px solid #A3C0E8;">
                                                                Phụ cấp CV</div>
                                                        </div>
                                                </HeaderTemplate>
                                                <DataItemTemplate>
                                               
                                                <div style="width: 80px; height: 100%; float: left;">
                                                        <div style="width: 40px; float: left; 
                                                            text-align: center;">
                                                             <dx:ASPxLabel ID="lbl_heSoLuong" runat="server">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                        <div style="width: 39px;float: left;min-height:40px; 
                                                            text-align: center; border-left: 1px solid #A3C0E8;">
                                                           <dx:ASPxLabel ID="lbl_heSoCV" runat="server">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                    </div>
                                                </DataItemTemplate>
                                                <HeaderStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </HeaderStyle>
                                                <CellStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </CellStyle>
                                                <FooterTemplate>
                                                    </div>
                                                </FooterTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Visible="false" FieldName="phuCapCV"
                                                HeaderStyle-HorizontalAlign="Center" Width="80px">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NLD_BHXH" Width="120px">
                                                <HeaderTemplate>
                                                    <div style="width: 120px;">
                                                        <div style="width: 120px; height: 32px; padding-top: 5px;">
                                                            Tiền lương đóng BHXH</div>
                                                        <div style="width: 120px; height: 80px;">
                                                            <div style="width: 60px; height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;">
                                                                NLĐ</div>
                                                            <div style="width: 59px; height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;border-left: 1px solid #A3C0E8;
                                                                ">
                                                                NSDLĐ</div>
                                                        </div>
                                                </HeaderTemplate>
                                                <DataItemTemplate>
                                                <div style="width: 120px; height: 100%; float: left;">
                                                        <div style="width: 60px;  float: left;
                                                            text-align: center;">
                                                            <dx:ASPxLabel ID="lbl_nldBHXH" runat="server">                                                                
                                                            </dx:ASPxLabel>
                                                        
                                                        </div>
                                                        <div style="width: 59px; float: left;min-height:40px; 
                                                            text-align: center; border-left: 1px solid #A3C0E8;">
                                                             <dx:ASPxLabel ID="lbl_nsdldBHXH" runat="server">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                    </div>
                                                </DataItemTemplate>
                                                <HeaderStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </HeaderStyle>
                                                <CellStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </CellStyle>
                                                <FooterTemplate>
                                                    </div>
                                                </FooterTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NLD_BHYT" Width="90px">
                                                <HeaderTemplate>
                                                    <div style="width: 90px;">
                                                        <div style="width: 90px; height: 32px; padding-top: 5px;">
                                                            Tiền lương đóng BHYT</div>
                                                        <div style="width: 90px; height: 80px;">
                                                            <div style="width: 45px; height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;">
                                                                NLĐ</div>
                                                            <div style="width: 44px; height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;
                                                                border-left: 1px solid #A3C0E8;">
                                                                NSDLĐ</div>
                                                        </div>
                                                </HeaderTemplate>
                                                <DataItemTemplate>
                                                    <div style="width: 90px; height: 100%; float: left;">
                                                        <div style="width: 45px;  float: left;
                                                            text-align: center;">
                                                            <dx:ASPxLabel ID="lbl_nldBHYT" runat="server" Style="margin-bottom: 100px;">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                        <div style="width: 44px; float: left;min-height:40px; 
                                                            text-align: center; border-left: 1px solid #A3C0E8;">
                                                            <dx:ASPxLabel ID="lbl_nsdldBHYT" runat="server" Style="margin-bottom: 100px;">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                    </div>
                                                </DataItemTemplate>
                                                <HeaderStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </HeaderStyle>
                                                <CellStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </CellStyle>
                                                <FooterTemplate>
                                                    </div>
                                                </FooterTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NLD_BHTN" Width="90px">
                                                <HeaderTemplate>
                                                    <div style="width: 90px;">
                                                        <div style="width: 90px; height: 32px; padding-top: 5px;">
                                                            Tiền lương đóng BHTN</div>
                                                        <div style="width: 90px; height: 80px;">
                                                            <div style="width: 45px; height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;">
                                                                NLĐ</div>
                                                            <div style="width: 44px;height: 63px; padding-top:17px; float: left; border-top: 1px solid #A3C0E8;
                                                                border-left: 1px solid #A3C0E8;">
                                                                NSDLĐ</div>
                                                        </div>
                                                </HeaderTemplate>
                                                <DataItemTemplate>
                                                    <div style="width: 90px; height: 100%; float: left;">
                                                        <div style="width: 45px;  float: left;
                                                            text-align: center;">
                                                            <dx:ASPxLabel ID="lbl_nldBHTN" runat="server" Style="margin-bottom: 100px;">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                        <div style="width: 44px; float: left;min-height:40px; 
                                                            text-align: center; border-left: 1px solid #A3C0E8;">
                                                            <dx:ASPxLabel ID="lbl_nsdldBHTN" runat="server" Style="margin-bottom: 100px;">
                                                            </dx:ASPxLabel>
                                                        </div>
                                                    </div>
                                                </DataItemTemplate>
                                                <HeaderStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </HeaderStyle>
                                                <CellStyle Paddings-Padding="0">
                                                    <Paddings Padding="0px"></Paddings>
                                                </CellStyle>
                                                <FooterTemplate>
                                                    </div>
                                                </FooterTemplate>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                            <LoadingPanel ImageSpacing="8px">
                                            </LoadingPanel>
                                            <Header Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle">
                                            </Header>
                                        </Styles>
                                        <SettingsLoadingPanel ImagePosition="Top" />
                                        <ImagesFilterControl>
                                            <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                            </LoadingPanel>
                                        </ImagesFilterControl>
                                        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                            </LoadingPanelOnStatusBar>
                                            <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                                            </LoadingPanel>
                                        </Images>
                                        <StylesEditors>
                                            <CalendarHeader Spacing="1px">
                                            </CalendarHeader>
                                            <ProgressBar Height="30px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <ImagesEditors>
                                            <DropDownEditDropDown>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </DropDownEditDropDown>
                                            <SpinEditIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                                            </SpinEditIncrement>
                                            <SpinEditDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                                            </SpinEditDecrement>
                                            <SpinEditLargeIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                                            </SpinEditLargeIncrement>
                                            <SpinEditLargeDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                                            </SpinEditLargeDecrement>
                                        </ImagesEditors>
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                               
            <dx:ReportViewer ID="ReportViewer1" runat="server">
            </dx:ReportViewer>
        </td>
    </tr>
</table>

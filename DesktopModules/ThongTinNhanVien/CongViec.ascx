<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CongViec.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.CongViec" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

  
<dx:ASPxCallbackPanel runat="server" ID="cbp_congviec" ClientInstanceName="cbp_congviec" 
                OnCallback="cbp_congviec_Callback"                
                ShowLoadingPanel="false">
                <ClientSideEvents EndCallback="function(s,e){
                        if(cbp_congviec.cpresult != 0)
                            {
                                alert('Thông tin lưu thành công');
                                delete cbp_congviec.cpresult;
                            }
                    }" />
                <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
                </LoadingPanelImage>
                <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
                </LoadingPanelStyle>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent4" runat="server">
                       <table width="100%" cellpadding="3" cellspacing="0" border="0" style="background:#edf3f4;font-size:11pt;font-family:Times New Roman;">
                       <tr>
                        <td class="tieude" style="width:160px;">Nghề nghiệp tuyển dụng</td>
                            <td>
                                <dx:ASPxTextBox ID="txt_nghekhiduoctuyendung" runat="server" Width="100%"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                </dx:ASPxTextBox>
                            </td>
                       </tr>
                       <tr>
                        <td valign="top" class="tieude">
                            Ngày tuyển dụng
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_ngaytuyendung" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxDateEdit>
                        </td>                        
                    </tr>
                    <tr>
                        <td class="tieude">Cơ quan tuyển dụng</td>
                        <td>
                            <dx:ASPxTextBox ID="txt_coquantuyendung" runat="server" Width="100%"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td>Loại hợp đồng</td>
                        <td>
                            <dx:ASPxLabel ID="lbl_hopdong" runat="server" />                            
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="tieude">
                            Đơn vị
                        </td>
                        <td valign="top">
                            <dx:ASPxLabel ID="lbl_donvi" runat="server" />                            
                        </td>                                                
                    </tr>
                    <tr>
                        <td valign="top">
                            Chức vụ
                        </td>
                        <td valign="top">
                            <dx:ASPxLabel ID="lbl_chucvu" runat="server" />                            
                        </td>
                    </tr> 
                    <tr>
                        <td valign="top">Chức danh</td>
                        <td valign="top">
                            <dx:ASPxLabel ID="lbl_chucdanh" runat="server" />                            
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="font-size:11pt;font-family:Times New Roman;" id = "hopdong" runat="server" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="width:167px;padding: 2px 0px;">
                                        Quản lý nhà nước
                                    </td>
                                <td valign="top" style="padding: 2px 0px;">   
                                    <dx:ASPxLabel ID="lbl_quanlynhanuoc" runat="server">                                        
                                    </dx:ASPxLabel>
                                </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="padding: 2px 0px;">Nhóm lương</td>
                                    <td valign="top">
                                        <dx:ASPxLabel ID="lbl_nhomluong" runat="server" />                            
                                    </td>                        
                                </tr> 
                                <tr>
                                    <td valign="top" style="padding: 2px 0px;">Bậc lương</td>
                                    <td valign="top">
                                        <dx:ASPxLabel ID="lbl_bacluong" runat="server" />                           
                                    </td>                                           
                                </tr>                       
                                <tr>
                                    <td valign="top" style="padding: 2px 0px;">Hệ Số</td>
                                    <td valign="top">
                                        <dx:ASPxLabel ID="lbl_heso" runat="server" />                            
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="hopdongthuviec" runat="server">
                        <td>Lương cơ bản:</td>                        
                        <td valign="top">
                            <dx:ASPxLabel ID="lbl_luongcb" runat="server" />                        
                        </td>
                    </tr>                                  
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">                               
                                <dx:ASPxButton ID="bt_luu" runat="server" Text="Lưu" AutoPostBack="false" 
                                    Theme="Glass" Font-Size="12px" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>                                    
                                    <ClientSideEvents Click="function(s,e){
                                        cbp_congviec.PerformCallback();
                                    }" />
                                </dx:ASPxButton>
                            </div>                            
                        </td>                         
                    </tr>
                </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>       

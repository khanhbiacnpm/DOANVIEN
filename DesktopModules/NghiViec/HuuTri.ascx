<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HuuTri.ascx.cs" Inherits="DotNetNuke.Modules.NghiViec.HuuTri" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js"
    type="text/javascript" language="javascript"></script>
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript"
    language="javascript"></script>
<script type="text/javascript" language="javascript">
function save() {
    

    if (lbl_TenNV.GetText() == "") {           
            alert('Xin vui lòng chọn nhân viên !');
            return false;
        }
        else if (dateNgayHieuLuc.GetText() == "") {
           
            dateNgayHieuLuc.SetFocus();
            alert('Xin vui lòng chọn ngày hiệu lực !');
            return false;
        }
        else if (txtQuyetDinh.GetText() == "") {

            txtQuyetDinh.SetFocus();
            alert('Xin vui lòng nhập quyết định !');
            return false;
        }
         else { CallbackPanel_HuuTri.PerformCallback('H'); }
    

    }
</script>
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
        padding: 5px 3px;
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
        padding: 3px 5px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
</style>
                            <dx:ASPxCallbackPanel ID="CallbackPanel_HuuTri" runat="server" ClientInstanceName="CallbackPanel_HuuTri"
                                OnCallback="CallbackPanel_HuuTri_Callback">
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent12" runat="server">
                                        <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2px" width="100%"
                                            border="0">
                                            
                                            <tr>
                                                <td valign="top" style="width: 120px;">
                                                    <asp:HiddenField ID="hiddenIdEmp" runat="server" />
                                                    Họ và Tên
                                                </td>
                                                <td style="font-weight: bold; width: 200px;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_TenNV" ClientInstanceName="lbl_TenNV" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td style="font-size: 10pt; width: 100px;" valign="top">
                                                    Số sổ BHXH:
                                                </td>
                                                <td style="font-weight: bold;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_soBHXH" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Ngày sinh
                                                </td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID="lbl_NgaySinh" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Nơi sinh
                                                </td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID="lbl_NoiSinh" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Chức vụ
                                                </td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID="lbl_ChucVu" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Đơn vị công tác
                                                </td>
                                                <td colspan="3" valign="top">
                                                    <dx:ASPxLabel ID="lbl_DonViHienTai" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ngày hiệu lực
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxDateEdit ID="dateNgayHieuLuc" ClientInstanceName="dateNgayHieuLuc" runat="server" DisplayFormatString="dd/MM/yyyy" 
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                                                      
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Quyết định
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxTextBox ID="txtQuyetDinh" ClientInstanceName="txtQuyetDinh" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                                                        
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   Lý do 
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxComboBox ID="cmb_lydo" ClientInstanceName="cmb_lydo" runat="server" 
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                                                        <Items>
                                                            <dx:ListEditItem Value="1" Text="Hưu trí" Selected="true" />
                                                            <dx:ListEditItem Value="2" Text="Hết hạn hợp đồng" />
                                                            <dx:ListEditItem Value="4" Text="Cá nhân xin chấm dứt hợp đồng" />
                                                            <dx:ListEditItem Value="3" Text="Chuyển công tác" />
                                                            <dx:ListEditItem Value="5" Text="Kỷ luật sa thải" />
                                                            
                                                        </Items>                                                     
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                                <td align="left" style="padding-top: 5px;">
                                                     <dx:ASPxButton ID="btHuuTri" runat="server" Text="Nghỉ việc" ClientInstanceName="btHuuTri"
                                                                Width="120px" Image-Url="~/images/imgadmin/reload.png" AutoPostBack="false" Theme="Glass" Font-Size="12px">
                                                                <ClientSideEvents Click="function(s,e){                                                                                                          
                                                                    save();
                                                                   
                                                                }" />
                                                                <Image Url="~/images/imgadmin/delete_16.png">
                                                                </Image>
                                                            </dx:ASPxButton>
                                                </td>
                                               
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                                <ClientSideEvents EndCallback="function(s,e){
                    if(CallbackPanel_HuuTri.cpErrorNgayHT == true){
                        alert('Nhân viên này chưa tới hạn nghỉ hưu!');
                    }
                    if(CallbackPanel_HuuTri.cpErrorNgayHT == false){
                       alert('Lưu thành công');
                       dateNgayHieuLuc.SetText('');
                    
                       delete CallbackPanel_HuuTri.cpErrorNgayHT;
                    }
                }" />
                            </dx:ASPxCallbackPanel>
                            
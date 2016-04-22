<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/menu5.ascx" %>
<link href="skin.css" rel="stylesheet" type="text/css" />
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<table style="width: 100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td class="logo">
                    </td>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                 <td style="width:170px;"></td>
                                <td class="userinfor" valign="top">
                                    
                                </td>
                               
                                <td style="color:#293852;">
                                   <dnn:USER runat="server" ID="dnnUSER" CssClass="user" />
                                </td>
                                <td>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;
                                </td>
                                <td class="exit" valign="top">
                                </td>
                                <td>
                                    <dnn:LOGIN runat="server" ID="dnnLOGIN" style="color: #000099; padding-right: 20px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="left">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>
                                    <dnn:NAV runat="server" ID="dnnNAVVinh" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr style="height: 5px;">
                    <td colspan="2">
                    </td>
                </tr>
                <tr>                    
                    <td valign="top" style="width: 70%">
                        <div id="ContentPane" align="center" runat="server" style="min-height:350px;">                    
                        </div>
                    </td>
                    <td id="RightPane" align="center" runat="server" valign="top" style="width: 30%">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="background-color: #0066b3; height: 90px;">
        <td>
            <table width="100%" border="0" cellpadding="2" cellspacing="0">
                <tr>
                    <td align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>VNPT Đắk Lắk </b> </font>
                    </td>
                  
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>Địa chỉ : 06 Lê Duẩn - TP.Buôn Ma Thuột
                            - Đắk Lắk</b> </font>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>Địện thoại : 05003 813665 - 05003 853999</b>
                        </font>
                    </td>
                </tr>
                <tr>
                  <td align="center">
                        <a href="#">
                            <img src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/backhome.png"
                                border="0" />
                            &nbsp; <font size="2" color="#ffffff" face="Tahoma"><b>Trở về đầu trang</b></font>&nbsp;&nbsp;
                        </a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

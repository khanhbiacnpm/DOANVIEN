<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/menu5.ascx" %>
<%--<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>--%>
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


<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0" style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/bg.png);
    background-repeat: repeat-x; background-color: #0e69c5;">
    <tr>
        <td>
            <table width="603px" cellpadding="0" cellspacing="0" align="center" border="0">
                <tr style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/banner_oms_2.png) no-repeat;
                    height: 134px">
                    <td>
                    </td>
                </tr>
                <tr style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/banner_oms_3.png) no-repeat;
                    height: 459px">
                    <td id="ContentPane" runat="server" valign="top" align="center"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height: 88px; background-repeat: repeat-x; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/login_4.png')">
        <td>
            <table width="603px" cellpadding="2" cellspacing="0" align="center" border="0">
                <tr>
                    <td align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>VNPT Đắk Lắk</b></font>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>Địa chỉ : 06 Lê Duẩn, Buôn
                            Ma Thuột, Đắk Lắk </b></font>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>ĐT : 05003.845678 - Fax : 05003.813222
                            - Email : cskh.dlc@vnpt.vn</b></font>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <font size="2" color="#ffffff" face="Tahoma"><b>Website : <a href="http://1080daklak.vn">
                            <font size="2" color="#ffffff">1080daklak.vn</font></a></b></font>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

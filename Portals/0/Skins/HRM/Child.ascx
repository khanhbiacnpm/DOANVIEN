<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/menu5.ascx" %>
<%--<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>--%>
<link href="skin.css" rel="stylesheet" type="text/css"/>

<table style="width:100%" border="0" border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td align="center">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="logo"></td>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        
                        <td class="userinfor" valign="top"></td>
                        <td style="color:#293852;">
                           Xin chào đồng chí: <dnn:USER runat="server" ID="dnnUSER" CssClass="user" />
                        </td>
                        <td>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
                        <td class="exit" valign="top"></td>
                        <td>
                            <dnn:LOGIN runat="server" id="dnnLOGIN"  style="color:#000099; padding-right:20px" />
                        </td>
                    </tr>                   
              </table>
            </td>
        </tr>
         <tr style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/bg_menu.png);">
                     <td colspan="6" align="left">
                        <dnn:NAV runat="server" id="dnnNAVVinh" />
                    </td>
                    </tr>
    </table>
</td>
</tr>

<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr style="height:5px;"><td colspan="2"></td></tr>
        <tr>          
            <td valign="top">
                <div id="ContentPane" align="center" runat="server" style="min-height:350px;"></div>
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
                        <font size="2" color="#ffffff" face="Tahoma"><b>Trung tâm Công Nghệ
                            & Dịch Vụ Nội Dung - VNPT Đắk Lắk Đắk Nông</b> </font>
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


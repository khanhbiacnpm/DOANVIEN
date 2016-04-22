<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/menu5.ascx" %>
<%--<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>--%>
<link href="skin.css" rel="stylesheet" type="text/css"/>

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
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<table style="width:100%"  border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td align="center">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
      
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
            <td id="ContentPane" align="center"   runat="server" valign="top" style="width: 100%" ></td>
        </tr>
        </table>
    </td>
</tr>
<tr style=" height: 100px;background: none repeat scroll 0% 0% rgb(0, 94, 189);">
		<td colspan="2">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody><tr>
					<td style="width: 178px;">
					<img alt="" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/nguoidep.png" />
					</td>
					<td>
					<table width="100%" cellspacing="0" cellpadding="3" border="0">
						<tbody><tr>
						<td align="center">
						<font  color="#f8ec98"><b> VNPT ĐẮK LẮK</b></font>
						</td>
						</tr>
						<tr>
						<td align="center">
						<font  color="#ffffff"><b>Địa chỉ : 06 Lê Duẩn - TP.Buôn Ma Thuột - Tỉnh Đắk Lắk</b></font>
						</td>
						</tr>
						<tr>
						<td align="center">
						<font  color="#ffffff"><b>Điện thoại : 0500 - 3845678</b></font>
						</td>
						</tr>
					</tbody></table>
					</td>
					<td style="width: 214px;">
					<img alt="" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/bacthang.png">
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
</table>


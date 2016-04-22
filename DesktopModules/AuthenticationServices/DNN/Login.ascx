<%@ Control language="vb" Inherits="DotNetNuke.Modules.Admin.Authentication.Login" CodeFile="Login.ascx.vb" AutoEventWireup="false" Explicit="True" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%--<style type="text/css">
    .account1{background:url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/account.png') left no-repeat; height:35px; width:260px; border:1px solid #ccc; color:#999; text-indent:5px; font-size:11px; margin:10px 0; padding-left:40px; overflow:hidden}  
    .pass1{background:url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/pass.png') left no-repeat; height:35px; width:260px; border:1px solid #ccc; color:#999; text-indent:5px; font-size:11px; margin:10px 0; padding-left:40px; overflow:hidden}  
</style>--%>
<link href="./Portals/3/Skins/OMS/Styles/Style.css" rel="stylesheet" type="text/css" />

<div class="body">
    <asp:TextBox ID="txtUsername" runat="server" CssClass="txt rdu5 account" />
    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="txt rdu5 pass" />
    <asp:Button ID="cmdLogin" CssClass="button rdu5 btn-add" runat="server" Text="Đăng nhập" />
</div>
<table cellspacing="0" cellpadding="0" border="0">
   <tr id="rowVerification1" runat="server" visible="false">
        <td >
            <dnn:Label ID="plVerification" ControlName="txtVerification" runat="server" />
        </td>
    </tr>
    <tr id="rowVerification2" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtVerification" Columns="9" Width="150" 
                runat="server" />
        </td>
    </tr>
    <tr style="visibility: hidden; height: 0px;" id="trCaptcha1" runat="server">
        <td style="visibility: hidden; height: 0px;" align="left">
            <dnn:Label ID="plCaptcha" ControlName="ctlCaptcha" runat="server" ResourceKey="Captcha" />
        </td>
    </tr>
    <tr style="visibility: hidden; height: 0px;" id="trCaptcha2" runat="server">
        <td style="visibility: hidden; height: 0px;">
            <dnn:CaptchaControl ID="ctlCaptcha" CaptchaWidth="130" CaptchaHeight="10" CssClass="Normal"
                runat="server" ErrorStyle-CssClass="NormalRed" TextBoxStyle-CssClass="NormalTextBox" />
        </td>
    </tr>   
</table>

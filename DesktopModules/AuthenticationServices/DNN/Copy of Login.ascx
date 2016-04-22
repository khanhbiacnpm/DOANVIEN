<%@ Control language="vb" Inherits="DotNetNuke.Modules.Admin.Authentication.Login" CodeFile="Copy of Login.ascx.vb" AutoEventWireup="false" Explicit="True" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>


<table cellspacing="0" cellpadding="0" border="0" style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/oms/banner_oms_3.png) no-repeat; height: 459px; width: 603px; ">
    <tr>
        <td style="width: 323px;"></td>
        <td>
            <table width="280px" cellpadding="0" cellspacing="0"  border="0">
                <tr style="height: 50px;">
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUsername" Columns="9" Width="100%" runat="server" />
                    </td>
                </tr>
                <tr style="height: 25px;">
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPassword" Columns="9" Width="100%" TextMode="Password" 
                            runat="server" />
                    </td>
                </tr>
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
                <tr style="height: 30px;">
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--<dx:ASPxButton ID="btnLogin" ClientInstanceName="btnLogin" runat="server"  AutoPostBack="False" 
                            ImageSpacing="0px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                            CssPostfix="Glass" HorizontalAlign="Left" 
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Height="30px" 
                            Width="90px">
                            <ClientSideEvents Click="function(s,e){
                                CheckAccount();
                            }" />

                            <Paddings Padding="0px" />
                            <BackgroundImage ImageUrl="~/images/hrm/bt_login.png" />
                            <Border BorderWidth="0px" />
                        </dx:ASPxButton>--%>
                        <dx:ASPxButton ID="cmdLogin" ClientInstanceName="cmdLogin" runat="server" ImageSpacing="0px"
                            Theme="Glass" Font-Size="12px" HorizontalAlign="Left" 
                            Height="30px" Width="90px">
                            <BackgroundImage ImageUrl="~/images/hrm/bt_login.png" />
                        </dx:ASPxButton>
                    </td>
                </tr>
               <tr style="height:50px;">
                    <td>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 210px;"></td>
    </tr>     
</table>

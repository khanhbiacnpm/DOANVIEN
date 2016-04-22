<%@ Control Language="C#" Inherits="VNPT.Modules.NhanVien.ChangePass" CodeFile="ChangePass.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPager" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Mvc.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.Mvc" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
    
     <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
                ClientInstanceName="CallbackPanel" OnCallback="ASPxCallbackPanel1_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
<table width="40%" cellpadding="0" cellspacing="0" align="center" border="0">
    <tr style="height: 3px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/bg_home.png');
        background-repeat: repeat-x;">
        <td colspan="3">
        </td>
    </tr>
    <tr style="height: 30px;">
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #cfe7ff; font-size: 10pt; color: #000000; font-weight: bold;">
            Đổi mật khẩu
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
    <tr style="height: 1px;">
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #004fab;">
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
    <tr style="height: 10px;">
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #cfe7ff;">
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
    <tr>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #cfe7ff;">
            <table width="100%" cellpadding="3" cellspacing="0" align="center" border="0">
                <tr>
                    <td style="width: 50%">
                        <font size="2">Mật khẩu mới</font>
                    </td>
                    <td style="width: 50%">
                        <dx:ASPxTextBox ID="txtNewPass" Password="true" runat="server" Width="80%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font size="2">Nhập lại mật khẩu mới</font>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtConfirm" Password="true" runat="server" Width="80%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
</table>
</dx:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s,e){ 
                        if(CallbackPanel.cpResult){
                             alert('Đổi mật khẩu thành công');
                              delete CallbackPanel.cpResult;
                        }  
                        if(CallbackPanel.cpResult1){
                             alert('Nhập lại mật khẩu không khớp với mật khẩu mới');
                              delete CallbackPanel.cpResult1;
                        }  
                   } "  />
            </dx:ASPxCallbackPanel>
<table width="40%" cellpadding="0" cellspacing="0" align="center" border="0">
    <tr>
        <td style="width: 13px; background-color: #cfe7ff; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #cfe7ff;">
            <table width="100%" cellpadding="3" cellspacing="0" align="center" border="0">
                <tr>
                    <td style="background-color: #cfe7ff; width: 50%">
                    </td>
                    <td style="background-color: #cfe7ff; width: 50%">
                        <dx:ASPxButton ID="btChange" runat="server" Text="Đổi mật khẩu"
                            AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){
                                CallbackPanel.PerformCallback();
                            }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
    <tr style="height: 10px;">
        <td style="width: 13px; background-color: #cfe7ff; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/left_home.png');
            background-repeat: repeat-y;">
        </td>
        <td style="background-color: #cfe7ff;">
        </td>
        <td style="width: 13px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/right_home.png');
            background-repeat: repeat-y;">
        </td>
    </tr>
    <tr style="height: 3px; background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/foot_home.png');
        background-repeat: repeat-x;">
        <td colspan="3">
        </td>
    </tr>
</table>

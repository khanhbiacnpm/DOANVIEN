<%@ Page Language="C#" AutoEventWireup="true" CodeFile="direct_login.aspx.cs" Inherits="direct_login" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="<%= SkinPath %>/qlbh.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>

<div id="qlbh_wrapper" style="background-color: #005EBD;">
    <div style="background-color:#0869c6;">
       <table cellspacing="0" cellpadding="0" border="0"  width="100%">
            <tr style="height:130px">
                <td colspan="2" ></td>
            </tr>
            <tr>
                <td id="ten" colspan="2" align="center" style="color:#ffffff;"></td>
            </tr>             
            <tr>
                <td id="diachi" colspan="2" align="center">
                                                           
                </td>
            </tr>
            <tr style="height:10px">
                <td colspan="2" ></td>
            </tr>
           <tr>
               <td colspan="2">
                   <table cellspacing="0" cellpadding="0" border="0" width="100%">
                       <tr>
                           <td style="width: 420px;">
                           </td>
                           <td valign="top" align="center" style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/logo1.png);background-repeat:no-repeat;height:69px;">&nbsp;
                           </td>
                       </tr>
                   </table>
               </td>
           </tr>
            <tr>
                <td colspan="2" align="center">
                    <div style="width: 603px" runat="server" id="login_control">


<table cellspacing="0" cellpadding="0" border="0" style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/banner_oms_3.png) no-repeat; width: 603px;">
    <tr>
        <td style="width: 323px;"></td>
        <td valign="top">
            <table width="280px" cellpadding="0" cellspacing="0"  border="0">               
                <tr style="height: 60px;">
                    <td>&nbsp;
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
                <tr style="height: 40px;">
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnLogin" ClientInstanceName="btnLogin" runat="server" Theme="Aqua"
                            AutoPostBack="false" ImageSpacing="0px" Height="25px" Width="85px">
							<BackgroundImage ImageUrl="~/images/hrm/bt_login.png" />
                            <Paddings Padding="0px" />
							<Border BorderWidth="0px" />
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

                    
                    </div>
                </td>
            </tr>           
        </table>
    </div>
</div>
        
    </div>
    </form>
</body>
</html>

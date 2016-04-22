<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu5.ascx.cs" Inherits="admin_Skins_menu5" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

 <style type="text/css">              
        .menu a{           
	        text-decoration:none;
        }        
        .submenu a{
           text-decoration:none;
        }
        .imgCollapse {
            background-position: -18px -3px;
            width: 11px;
            height: 12px;
        }
        .dxmMenuItem_Youthful menu 
        {
        	padding:0px !important;
        	
        }
        .dxmMenuFullHeightSeparator_Youthful 
        {
        	padding:0px !important;
        }
        
   
        
    </style>      

<div style="background:#f6931e; height:auto;">
<div style=" width:1000px; margin:auto">
 <dx:ASPxMenu ID="ASPxMenu1" runat="server" AllowSelectItem="True" Height="40px" CssClass="menu"
    EnableTheming="True" Font-Size="12px"
    AutoSeparators="RootOnly" 
    ShowSubMenuShadow="False"
    Paddings-Padding="0" Border-BorderWidth="0"
    BackgroundImage-VerticalPosition="bottom"
    BackColor="#f6931e"
    ForeColor="#ffffff"
    Font-Names="Arial">     
     <ItemStyle DropDownButtonSpacing="10px"
         Border-BorderWidth="0" Paddings-Padding="8" Height="33px"
         BackgroundImage-VerticalPosition="top"         
         HoverStyle-BackColor="#F8AD36"
         HoverStyle-ForeColor="#ffffff"   
         HoverStyle-Font-Size="12px"   
         SelectedStyle-ForeColor="#ffffff"
         SelectedStyle-BackColor="#F8AD36"        
          />         
     <SubMenuStyle GutterWidth="0px" Border-BorderStyle="Solid" Border-BorderColor="#eeeeee" CssClass="submenu" />
     <SubMenuItemStyle 
         Height="30px"
         Width="210px"
         BackColor="#ffffff"
         ForeColor="#000"         
         BorderBottom-BorderStyle="Solid"
         BorderBottom-BorderWidth="1"
         BorderBottom-BorderColor="#cccccc"
         HoverStyle-Border-BorderStyle="None"
         HoverStyle-BackColor="#eeeeee">
     </SubMenuItemStyle>
</dx:ASPxMenu>
</div>
 </div>
  
<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/menu5.ascx" %>
<%--<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>--%>

<style type="text/css">              
    
    
        @font-face
        {
        font-family:'sege';
        src: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/segoeui.eot');
        src:     url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/segoeui.eot?#iefix') format('embedded-opentype'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/segoeui.woff') format('woff'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/segoeui.ttf') format('truetype'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/segoeui.svg#sege') format('svg');
        }


        @font-face
        {
        font-family:'UTMAvoRegular';
        src: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/UTMAvoRegular.eot');
        src:     url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/UTMAvoRegular.eot?#iefix') format('embedded-opentype'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/UTMAvoRegular.woff') format('woff'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/UTMAvoRegular.ttf') format('truetype'),
                 url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/fonts/UTMAvoRegular.svg#UTMAvoRegular') format('svg');
        }

    
    
    #topbar{ height:40px; background:#18244a; padding:5px 0; overflow:hidden}
    .logo{width:330px; height:40px; background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/logo.png) left no-repeat; float:left; display:block}    
    .user{ list-style:none; text-align:right; float:right; margin:0 10px 0 0}
    .user li{ display:inline-block; margin:0 5px; height:40px}
    .user li span{padding:0 5px; cursor:pointer}
    .user li:first-child{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/user.png) left no-repeat; padding-left:35px}
    .user li:last-child{ background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/li-bg.png) no-repeat left; padding-left: 10px}
    .user li a{color:white; line-height:40px; font-family:'sege'; font-size:14px}
    .user li a:hover{ color:#f6931e}
    
    /*----------------------------Footer---------------*/
    #social-wrap{ padding:0px 0; float:left;}
    #social-wrap .social{ list-style:none; text-align:left;  line-height:30px}
    #social-wrap .social li{ padding:0 0px; display:inline-block}
    #social-wrap .social li:first-child{ font-style:italic; font-weight:bold; float:left; line-height:25px; padding-right:10px; font-size:11px; color:#fff}
    #social-wrap .social li a{display:block; width:25px; height:25px}
    #social-wrap .social li a.fb{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_f.png) no-repeat}
    #social-wrap .social li a.tw{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_t.png) no-repeat}
    #social-wrap .social li a.goo{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_google.png) no-repeat}
    #social-wrap .social li a.yout{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_y.png) no-repeat}


    #social-wrap{ padding:0px 0;}
#social-wrap .social{ list-style:none; text-align:left;  line-height:30px; padding-left:0px}
#social-wrap .social li{ padding:0 0px; display:inline-block}
#social-wrap .social li:first-child{ font-style:italic; font-weight:bold; float:left; line-height:25px; padding-right:10px; font-size:11px; color:#fff}
#social-wrap .social li a{display:block; width:25px; height:25px}
#social-wrap .social li a.fb{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_f.png) no-repeat}
#social-wrap .social li a.tw{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_t.png) no-repeat}
#social-wrap .social li a.goo{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_google.png) no-repeat}
#social-wrap .social li a.yout{background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/btn_top_y.png) no-repeat}
.ct{width:1000px; margin:auto}

/*----------------------------Footer---------------*/

#footer_a{ background:#5d5d5d; padding:10px 0; margin-top:20px}
#footer_a .left,#footer .right{ width:45%; line-height:60px; font-family:Arial; font-size:12px}
.left{float:left}
.right{float:right}
#footer_a, #footer a{color:white !important;}
#footer_a ul{ list-style: none; text-align:right}
#footer_a ul li{ display:inline-block; padding:0 10px;}
#footer_a ul li a{color:White !important;font-family:Arial; font-size:12px }
.clearfix{clear:both}
    
    
</style>
<table style="width:100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td align="center">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>            
            <td>
                <div id="topbar">
    	            <div class="ct">
    		            <a href="#" class="logo"></a>
                        <ul class="user">
            	            <li><a href="#"><dnn:USER runat="server" ID="USER1" CssClass="a"/></a><span><img src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/Menu/nav-down.png" /></span></li>                
                            <li><a href="#"><dnn:LOGIN runat="server" id="dnnLOGIN" CssClass="a" /></a></li>
                        </ul>
                        <div class="clearfix"></div>            
                     </div>
                </div> 
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

</table>

  <!--Footer-->        
       <div id="footer_a">
       		<div class="ctb" style="width:1000px; margin:auto">
            	<div class="left">
                    <div>Copyright©  2015  VNPT</div>                
                     <!--Social -->
                     <div id="social-wrap">
                        <ul class="social">
                            <li>Follow us on:</li>
                            <li><a href="#" class="fb"></a></li>
                            <li><a href="#" class="goo"></a></li>
                            <li><a href="#" class="yout"></a></li>
                            <li><a href="#" class="tw"></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div> 
                <!--End Social -->
                </div>
                
                <div class="right">
                	<ul>
                    	<li><a href="#">Điều khoản sử dụng</a></li>
                        <li><a href="#"> Sitemap </a></li>
                        <li><a href="#">Tìm kiếm</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
             </div>
       </div>       
     <!--End footer-->


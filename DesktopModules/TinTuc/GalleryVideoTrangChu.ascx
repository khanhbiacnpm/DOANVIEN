<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GalleryVideoTrangChu.ascx.cs" 
Inherits="Philip.Modules.TinTuc.GalleryVideoTrangChu" %>

<link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/Portals/0/Skins/SkinMotobycle/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery.ui.rcarousel.js" type="text/javascript" charset="utf-8"></script>

<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="<%=DotNetNuke.Common.Globals.ApplicationPath %>/Portals/0/Skins/SkinMotobycle/rcarousel.css" />

<style type="text/css">
  #ui-carousel1-next, #ui-carousel1-prev
    {
        width: 60px;
        margin-top: 40px;
        height: 40px;
        width: 26px;
        background: url(<%=DotNetNuke.Common.Globals.ApplicationPath %>/images/arrow-left.png) #fff center center no-repeat;
        display: block;
        position: absolute;
        top: 0;
        z-index: 100;
        opacity: 0.5;
    }
    
    #ui-carousel1-next
    {
        right: 0;
        background-image: url(<%=DotNetNuke.Common.Globals.ApplicationPath %>/images/arrow-right.png);
        opacity: 0.5;
    }
    
    #ui-carousel1-prev
    {
        left: 0;
    }
    #carousel1
    {
        left:0px;
        right:0px;
       
        }
</style>

<script type="text/javascript">
    $(document).ready(function () {

        $("a[rel^='prettyPhoto']").prettyPhoto();

        $("#carousel1").rcarousel({
        width: 120,
            height: 130,
            visible: 6,
            step: 1,
            margin: 12,
            auto: {
                enabled: true,
                direction: "next",
                interval: 3000
            },
            navigation: {
                next: "#ui-carousel1-next",
                prev: "#ui-carousel1-prev"
            }
        });
        $("#ui-carousel1-next")
					.add("#ui-carousel1-prev")
					.add(".bullet")
					.hover(
						function () {
						    $(this).css("opacity", 0.7);
						},
						function () {
						    $(this).css("opacity", 1.0);
						}
					);

        $("#carousel1").css({ "width": "571px" });

    });
</script>

<table width="585px" border="0" cellpadding="0" cellspacing="0">
<tr style="height:10px"><td></td></tr>
<tr><td class="Main_top_585_2">

  <a style="color:#BD1E03" href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/gallery.aspx'> Thư viện ảnh</a>
</td></tr>
  <tr>
            <td  style="padding: 6px; border-left:1px solid #fed41d; border-right:1px solid #fed41d;border-bottom:1px solid #fed41d" valign="top" >
<div class="s_content" style="position: relative;">
                    <div id="carousel1">
                        <asp:Repeater runat="server" ID="rptHinhAnh">
                            <ItemTemplate>
                                <a rel="prettyPhoto" href='<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/TinTuc/<%# Eval("anh") %>'
                                    title='<%# Eval("tieude") %>'>
                                    <img height="120px" width="110px" style="border: 1px solid #999;padding:3px;background:#ffffff;"
                                        src="<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/TinTuc/<%# Eval("anh") %>"
                                        alt="" />
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <a href="#" id="ui-carousel1-next"><span></span></a> 
                <a href="#" id="ui-carousel1-prev"><span></span></a>
                </div>

</td>
        </tr>
     
        <tr style="height:3px"><td></td></tr>


</table>

                
           
  
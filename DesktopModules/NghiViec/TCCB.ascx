<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TCCB.ascx.cs" Inherits="DotNetNuke.Modules.NghiViec.TCCB" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSiteMapControl" TagPrefix="dx" %>
<link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js"
    type="text/javascript" language="javascript"></script>
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript"
    language="javascript"></script>
<link href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery.css" rel="stylesheet"
    media="screen" />
<link href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/site.css" rel="stylesheet"
    media="screen" />

<script type="text/javascript" language="javascript">


    $(document).ready(function () {
        document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=930';
        document.getElementById('frameTCCB').style = 'display:none';
    });
    function SetUrl(id) {


        idNV = hdKey.Get("key");

        // if (id == 'tt_5')        

        // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=245&IdNv='+idNV;
        //  else if (id == 'tt_1')
        //   document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=236&IdNv='+idNV;
        //  else if (id == 'tt_2')
        //   document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=238&IdNv='+idNV;
        //  else if (id == 'tt_3')
        // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=239&IdNv='+idNV;
        // else if (id == 'tt_4')
        // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=242&IdNv='+idNV;
        //   else if (id == 'tt_6')
        // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=887';
        //   else if (id == 'tt_7')
        // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=888';
        //  else if (id == 'tt_8')
        //    document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=890';
        //  else if (id == 'tt_9')
        //    document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1967';

        if (id == 'tt_14')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=930';

        }
</script>
<style type="text/css">
    .dxnbControl_Glass2 {
        color: #000000;
        font: 9pt Tahoma;
    }

    .dxnbControl_Glass1 {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
        font: 9pt Tahoma;
    }

    .dxnbGroupHeader_Glass {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 5px 3px;
    }

    .dxnbGroupHeader_Glass12 {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 5px 3px 5px;
    }

    .dxnbImgCellLeft_Glass {
        width: 24px;
        padding: 4px;
    }
</style>

<table width="1000px" cellpadding="0" cellspacing="0" class="dxnbControl_Glass1">
    <tr>
        <td valign="top" style="width: 200px; border-right: 1px solid #7EACB1;">
            <dx:ASPxHiddenField ID="hdKey" runat="server" ClientInstanceName="hdKey"></dx:ASPxHiddenField>
            <dx:ASPxNavBar ID="navTab" ClientInstanceName="navTab" BorderLeft-BorderWidth="0px"
                BorderRight-BorderWidth="0px" BorderBottom-BorderWidth="0px" BorderTop-BorderWidth="0px"
                runat="server" Width="100%" LoadingPanelImagePosition="Top" ShowShadow="true"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                AllowSelectItem="true">
                <ClientSideEvents ItemClick="function(s,e){SetUrl(e.item.name);Display(e.item.name);}" />
                <CollapseImage Height="0" Width="0">
                </CollapseImage>
                <Groups>
                    <dx:NavBarGroup Name="thongtin" Text="Chức năng">
                        <Items>
                            <dx:NavBarItem Name="tt_14" Text="Mô hình tổ chức">
                                <Image Url='~/images/chinhtri.png' Width="24" Height="24" />
                            </dx:NavBarItem>



                        </Items>
                    </dx:NavBarGroup>
                    <%--  <dx:NavBarGroup Name="thongtin" Text="Biểu mẫu- Thống kê">
                     
                        <Items>
                          <dx:NavBarItem Name="tt_5" Text="Danh sách nghỉ việc">
                          
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>    
                             <dx:NavBarItem Name="tt_6" Text="Lao động có mặt trong quý">
                                <Image Url='~/images/icon_dashboard_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_7" Text="Lao động có mặt trong tháng">
                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_8" Text="Danh sách dân tộc thiểu số">
                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                                        
                           
                        </Items>
                        </dx:NavBarGroup>--%>
                </Groups>
            </dx:ASPxNavBar>
        </td>
        <td valign="top" style="width: 800px;">
            <table width="100%" cellpadding="0" cellspacing="0">

                <tr>
                    <td>

                        <iframe id="idframe" src='' height="550px" width="100%" frameborder="0"></iframe>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>



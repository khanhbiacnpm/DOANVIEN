<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DaoTaoBoiDuong.ascx.cs" Inherits="DotNetNuke.Modules.DaoTao.DaoTaoBoiDuong" %>
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
  <style type="text/css">
    .dxnbControl_Glass2
    {
        color: #000000;
        font: 9pt Tahoma;
    }
    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
    .dxnbGroupHeader_Glass
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 5px 3px;
    }
    .dxnbGroupHeader_Glass12
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 3px 5px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
</style>
<script type="text/javascript" language="javascript">

   
    function SetUrl(id) {
      
       
        idNV = hdKey.Get("key");
    
       
        if (id == 'tt_1')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=880';
        else if (id == 'tt_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=906';
//            else if (id == 'tt_3')
//            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=889';
            else if (id == 'tt_4')
                document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=891';
            else if (id == 'tt_5')
                document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=892';
             else if (id == 'tt_6')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=905';
             else if (id == 'tt_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=900';
             else if (id == 'tt_8')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=904';
             else if (id == 'tt_9')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=909';
             else if (id == 'tt_10')
                 document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=929';
             else if (id == 'tt_11')
                 document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1943';
             else if (id == 'tt_12')
                 document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1945';
          
            

        }
        $(document).ready(function () {


            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=929';
           
        });
</script>
<table width="1000px" cellpadding="0" cellspacing="0" class="dxnbControl_Glass1" >
    <tr style="height:520px;">
        <td valign="top" style="width: 200px; border-right: 1px solid #7EACB1;">
            <dx:ASPxHiddenField ID="hdKey" runat="server" ClientInstanceName="hdKey"></dx:ASPxHiddenField>
            <dx:ASPxNavBar ID="navTab" ClientInstanceName="navTab" BorderLeft-BorderWidth="0px"
                BorderRight-BorderWidth="0px" BorderBottom-BorderWidth="0px" BorderTop-BorderWidth="0px"
                runat="server" Width="100%" LoadingPanelImagePosition="Top" ShowShadow="true"
                Theme="Glass" Font-Size="12px"
                AllowSelectItem="true">
                <ClientSideEvents ItemClick="function(s,e){SetUrl(e.item.name);}" />
                <CollapseImage Height="0" Width="0">
                </CollapseImage>
                <Groups>
                    <dx:NavBarGroup Name="thongtin" Text="Chức năng">
                        <Items>
                         
                           <dx:NavBarItem Name="tt_10" Text="Tổng quan">
                                <Image Url='~/images/icon_skins_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                             <dx:NavBarItem Name="tt_1" Text="Tổ chức bồi dưỡng">
                                <Image Url='~/images/daotao.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_2" Text="Quản lý đào tạo">
                                <Image Url='~/images/hopdong.png' Width="24" Height="24" />
                            </dx:NavBarItem>                                                 
                             <dx:NavBarItem Name="tt_11" Text="Kế hoạch  bồi dưỡng">
                                <Image Url='~/images/t1.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_12" Text="Kế hoạch đào tạo">
                                <Image Url='~/images/kiemnhiem.png' Width="24" Height="24" />
                            </dx:NavBarItem>     
                        </Items>
                    </dx:NavBarGroup>

                     <dx:NavBarGroup Name="thongtin" Text="Biểu mẫu - Thống kê">
                     
                        <Items>
                         <%-- <dx:NavBarItem Name="tt_3" Text="Lý lịch đào tạo cá nhân">
                          
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>    --%>
                             <dx:NavBarItem Name="tt_4" Text="Số liệu bồi dưỡng cán bộ">
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                             <dx:NavBarItem Name="tt_5" Text="Số liệu bồi dưỡng cán bộ dài hạn">
                                <Image Url='~/images/icon_users_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>                              
                             <dx:NavBarItem Name="tt_6" Text="Số liệu nguồn nhân lực 05">
                                <Image Url='~/images/icon_dashboard_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                             <dx:NavBarItem Name="tt_7" Text="Số liệu nguồn nhân lực(5A)">
                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>   
                            <dx:NavBarItem Name="tt_8" Text="Số liệu nguồn nhân lực(5C)">
                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>   
                            <dx:NavBarItem Name="tt_9" Text="Số liệu ATVSLĐ">
                                <Image Url='~/images/icon_hostusers_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>   
                        </Items>
                        </dx:NavBarGroup>
                        
                </Groups>
            </dx:ASPxNavBar>
        </td>
        <td valign="top" style="width:800px;">
   <table width="100%" cellpadding="0" cellspacing="0">
                <tr><td>
                <iframe id="idframe" src='' height="520px" width="100%" frameborder="0"></iframe>
            </td></tr></table>
        </td>
    </tr>
</table>

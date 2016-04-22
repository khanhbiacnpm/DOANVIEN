<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThiDuaKhenThuong.ascx.cs" Inherits="DotNetNuke.Modules.KhenThuong.ThiDuaKhenThuong" %>
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

<script type="text/javascript" language="javascript">

   
    function SetUrl(id) {
      
       
        idNV = hdKey.Get("key");
    
       
        if (id == 'tt_1')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=893';
        else if (id == 'tt_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=897';
            else if (id == 'tt_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=903';
            else if (id == 'tt_4')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=902';
             else if (id == 'tt_5')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=915';
             else if (id == 'tt_6')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=912';
             else if (id == 'tt_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=913';
             else if (id == 'tt_8')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=914';
             else if (id == 'tt_9')
                 document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=911';
             else if (id == 'tt_10')
                 document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=934';
                         else if (id == 'tt_11')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1965';
//            else if (id == 'tt_12')
//            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=899';

        }
        $(document).ready(function () {


            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=934';
           
        });
</script>
<style type="text/css">
    .dxnbControl_Glass2
    {
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
    
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
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

    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
</style>

<table width="1000px" cellpadding="0" cellspacing="0" class="dxnbControl_Glass1" >
    <tr style="height:550px;">
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
                             <dx:NavBarItem Name="tt_11" Text="Sáng kiến">
                                <Image Url='~/images/t1.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                              </Items>
                    </dx:NavBarGroup>
                    <dx:NavBarGroup Name="thongtin" Text="Thi đua">
                        <Items>
                         
                           <dx:NavBarItem Name="tt_7" Text="Viễn thông tỉnh">
                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                             <dx:NavBarItem Name="tt_1" Text="Đơn vị">
                                <Image Url='~/images/daotao.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_2" Text="Nhân viên">
                                <Image Url='~/images/hopdong.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                                                 
                           
                        </Items>
                    </dx:NavBarGroup>
                     <dx:NavBarGroup Name="thongtin" Text="Khen thưởng">
                     
                        <Items>
                         <dx:NavBarItem Name="tt_8" Text="Viễn thông tỉnh">
                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                          <dx:NavBarItem Name="tt_3" Text="Đơn vị">
                          
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>    
                             <dx:NavBarItem Name="tt_4" Text="Nhân viên">
                                <Image Url='~/images/icon_dashboard_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                        </Items>
                        </dx:NavBarGroup>
                   
                         <dx:NavBarGroup Name="thongtin" Text="Biểu mẫu - thống kê">
                     
                        <Items>
                            
                        <dx:NavBarItem Name="tt_5" Text="Thi đua khen thưởng VTT">
                                <Image Url='~/images/icon_dashboard_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>   
                            <dx:NavBarItem Name="tt_6" Text="Thi đua khen thưởng đơn vị">
                                <Image Url='~/images/icon_users_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>   
                            <dx:NavBarItem Name="tt_9" Text="Thi đua khen thưởng cá nhân">
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
                        
                            <iframe id="idframe" src='' height="550px" width="100%" frameborder="0"></iframe>
                      
                       </td></tr></table>
        </td>
    </tr>
</table>

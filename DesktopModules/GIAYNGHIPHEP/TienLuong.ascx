<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TienLuong.ascx.cs" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.TienLuong" %>
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
    <link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js"
    type="text/javascript" language="javascript"></script>
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript"
    language="javascript"></script>
<script type="text/javascript" language="javascript">
    
    
    function Display(id) {
    if (id == 'tt_4' || id == 'tt_6'|| id == 'tt_7'|| id == 'tt_8'|| id == 'tt_9'|| id == 'tt_10'|| id == 'tt_11' || id == 'tt_12' || id == 'tt_16')
    {
       document.getElementById('frameTCCB').style = 'display:none';
    }
    else{
        document.getElementById('frameTCCB').style = 'display:inline';
    }
     
     
    }
   
    function SetUrl(id) {
      
       
        idNV = hdKey.Get("key");
    
       
       if (id == 'tt_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=237&IdNv='+idNV;
            else if (id == 'tt_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=910&IdNv='+idNV;
            else if (id == 'tt_4')
                document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=251';
                else if (id == 'tt_5')
                document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=235&IdNv='+idNV;
               
                else if (id == 'tt_8')
                document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=933';
                else if (id == 'bd_4')
                    document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=926&IdNv='+idNV;
            else if (id == 'tt_14')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=937';
           // else if (id == 'tt_15')
           // document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=938';
            else if (id == 'tt_16')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=943';
            

        }
        $(document).ready(function () {
          
           LoadList();
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=933';
            document.getElementById('frameTCCB').style = 'display:none';
          

        });
    
         function LoadList()
    {        
                        
             
        var ds=null;
        ds = <%=listFilter %>;
            $( "#txtCountry" ).autocomplete({
              source: ds,
                select: function (event, ui) { loaddata(ui.item.id); } 
            });

            
         
    }
    
    function loaddata(empid) {

        hdKey.Set("key", empid);        
        SetUrl(navTab.GetSelectedItem().name);
       Display(navTab.GetSelectedItem().name);
    }
</script>
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

<table width="1000px" cellpadding="0" cellspacing="0" class="dxnbControl_Glass1" >
    <tr style="height:550px;">
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
                            <dx:NavBarItem Name="tt_8" Text="Tổng quan">
                                <Image Url='~/images/icon_skins_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>
                           
                          <dx:NavBarItem Name="bd_4" Text="DS sắp tăng lương">
                                <Image Url='~/images/chinhtri.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                             <dx:NavBarItem Name="tt_2" Text="Nâng bậc lương chính sách">
                                <Image Url='~/images/daotao.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                                       <dx:NavBarItem Name="tt_5" Text="Nghỉ phép">
                                <Image Url='~/images/icon_skins_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>          
                           
                        </Items>
                    </dx:NavBarGroup>
                     <dx:NavBarGroup Name="thongtin" Text="Biểu mẫu - Thống kê">
                     
                        <Items>
                          <dx:NavBarItem Name="tt_4" Text="Danh sách tham gia BHXH">
                          
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>    
                               <dx:NavBarItem Name="tt_16" Text="BHXH, BHYT Mẫu 02">
                          
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>   
                             <dx:NavBarItem Name="tt_14" Text="Thang bảng lương chính sách">
                          
                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="24" Height="24" />
                            </dx:NavBarItem>    
                         
                        </Items>
                        </dx:NavBarGroup>
                       
                        
                </Groups>
            </dx:ASPxNavBar>
        </td>
        <td valign="top" style="width:800px;">
   <table width="100%" cellpadding="0" cellspacing="0">
  <tr  id="frameTCCB">
                    <td class="dxnbGroupHeader_Glass12">
                        <input id="txtCountry" style="width: 800px; font-weight: bold; font-family: Times New Roman;" />
                    </td>
                </tr>
                <tr><td>
                        
                            <iframe id="idframe" src='' height="550px" width="100%" frameborder="0"></iframe>
                      
                       </td></tr></table>
        </td>
    </tr>
</table>

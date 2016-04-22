<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MHTC.ascx.cs" Inherits="DotNetNuke.Modules.NghiViec.MHTC" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
           <link href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery.css" rel="stylesheet" media="screen" />
        <link href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/site.css" rel="stylesheet" media="screen" />

        <script type="text/javascript">
    

    function ShowMHTC(id) {
      
        popupMHTC.Show();
        callbackMHTC.PerformCallback(id);
          
    }
    </script>
    <style type="text/css">
        .dxnbGroupHeader_Glass12
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 4px 5px 4px 5px;
    }
    .nodexuongca
    {
            background-image:url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/nhansu.png');
             background-repeat:repeat;
            height:22px;
            background-position:left;
           
            width:9px;
        }
         .nodexuongca1
    {
            background-image:url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/nhansu1.png');
             background-repeat:repeat;
            height:36px;
            background-position:bottom;
           
            width:10px;
        }
        .dxpcContent_Glass {
    
    color: #010000;
    font: 10pt Times New Roman;
    padding: 2px 2px 2px;
    vertical-align: top;
    white-space: normal;
}
    </style>
<div class="dxnbGroupHeader_Glass12" >
<asp:Label ID="lblVTT" runat="server"></asp:Label>
</div>
<div id="org-chart-container">
    <div class="orgChart">
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr class="nodes">
                    <td colspan="<%=sodonvi %>" class="node" align="center">
                    <asp:Label ID="lblNode" runat="server"></asp:Label>
                        
                    </td>
                </tr>
                <tr class="lines">
                    <td colspan="<%=sodonvi %>">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr class="lines x">
                                    <td class="line left">&nbsp;
                                    </td>
                                    <td class="line right">&nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                      <asp:Label ID="tochuc" runat="server"></asp:Label>
                   
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 310px;" valign="top">
                                    <table border="0" cellpadding="0" cellspacing="0" >
                                        <tr>
                                            <td>
                                                <div class="node level1 node0 level1-node0 drama-title" style="width: 310px; height: 20px;">
                                                  <asp:Label ID="lblKQL" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:290px;">
                                                <asp:Label ID="lblDonVi" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </td>
                                <td style="width: 430px;" valign="top">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <div class="node level1 node0 level1-node0 drama-title" style="width: 430px; height: 20px;">
                                                     <asp:Label ID="lblDonViTrucThuoc" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td style="width:380px;">
                                                <asp:Label ID="lblDonViChucNang" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                        </table>
                   
                    </td>
                </tr>
             
                
            </tbody>
        </table>
    </div>
</div>


<dx:ASPxPopupControl ID="popupMHTC" runat="server" ClientInstanceName="popupMHTC"
    Width="100%" AllowDragging="True" PopupHorizontalAlign="WindowCenter" Modal="true"
    PopupVerticalAlign="Above" AutoUpdatePosition="True" CloseAction="CloseButton"
    HeaderText="Mô hình tổ chức" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxCallbackPanel ID="callbackMHTC" runat="server" Width="750px" ClientInstanceName="callbackMHTC"
                OnCallback="callbackPanelEmployees_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent7" runat="server">
                   
    <div class="orgChart" style="width:740px">
        <table border="0" cellpadding="0" cellspacing="0" style="font-family:Times New Roman;font-size:11pt;">
            <tbody>
                <tr class="nodes">
                    <td class="node" align="center">
                    <asp:Label ID="lblDonVi_1" runat="server"></asp:Label>
                        
                    </td>
                </tr>
               
                <tr id="donvicap2" runat="server">
                    <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr class="lines x">
                                    <td style="width:360px;" class="line left">  <asp:Label ID="lblDonVi_5" runat="server"></asp:Label>
                                    </td>
                                    <td style="width:360px;" class="line right"><asp:Label ID="lblDonVi_4" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
         
                   
                    </td>
                </tr>
                <tr>
                    <td>
                      <asp:Label ID="lblDonVi_2" runat="server"></asp:Label>
                   
                    </td>
                </tr>
                 
              <tr>
                    <td>
          <asp:Label ID="lblDonVi_3" runat="server"></asp:Label>
                   
                    </td>
                </tr>
                
            </tbody>
        </table>
    </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
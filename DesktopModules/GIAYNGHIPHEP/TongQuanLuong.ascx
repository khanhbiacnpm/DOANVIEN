<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TongQuanLuong.ascx.cs" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.TongQuanLuong" %>
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
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    <link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js"
    type="text/javascript" language="javascript"></script>
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript"
    language="javascript"></script>
    <%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
    <%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>



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

<table width="780px" cellpadding="2" cellspacing="0" style="font-family:Times New Roman;font-size:11pt;" >
 <tr>
                            <td valign="top" colspan="2" align="center">
                                <asp:Literal ID="lblLaoDong" runat="server"></asp:Literal>
                            </td>
                        </tr>
    <tr >
     <td  valign="top">
        <table width="100%" cellpadding="2" cellspacing="0">
            <tr>
                <td style="width:45%;vertical-align:top">
                    <table width="100%" cellpadding="0" cellspacing="0">
                       

                        <tr>
                            <td valign="top">
                                <dx:ASPxGridView ID="gridGioiTinh" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" KeyFieldName="so_luong" Caption="Giới tính" ClientInstanceName="grid">
                                    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="true" />
                                    <Columns>
                                        <dx:GridViewDataColumn FieldName="gioi_tinh" Caption="Giới tính" VisibleIndex="1"
                                            Width="350px" />
                                        <dx:GridViewDataColumn FieldName="so_luong" Caption="SL" VisibleIndex="2" Width="30px" />
                                    </Columns>
                                    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                        <Header Font-Bold="True">
                                        </Header>
                                        <HeaderPanel Font-Bold="True">
                                        </HeaderPanel>
                                    </Styles>
                                   
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                    <SettingsText PopupEditFormCaption="Hiệu chỉnh nhóm máu" ConfirmDelete="Bạn có muốn xóa" />
                                    <SettingsPager PageSize="1000">
                                        <Summary AllPagesText="{0} - {1} " Visible="False" />
                                    </SettingsPager>
                                </dx:ASPxGridView>
                              
                            </td>
                        </tr>
                        <tr style="height:5px;">
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                            <dx:ASPxGridView ID="gridHopDong" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" KeyFieldName="so_luong" Caption="Hợp đồng" ClientInstanceName="grid">
                                    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="true" />
                                    <Columns>
                                        <dx:GridViewDataColumn FieldName="loai_hd" Caption="Hợp đồng" VisibleIndex="1"
                                            Width="350px" />
                                        <dx:GridViewDataColumn FieldName="so_luong" Caption="SL" VisibleIndex="2" Width="30px" />
                                    </Columns>
                                    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                        <Header Font-Bold="True">
                                        </Header>
                                        <HeaderPanel Font-Bold="True">
                                        </HeaderPanel>
                                    </Styles>
                                  
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                    <SettingsText  ConfirmDelete="Bạn có muốn xóa" />
                                    <SettingsPager PageSize="1000">
                                        <Summary AllPagesText="{0} - {1} " Visible="False" />
                                    </SettingsPager>
                                </dx:ASPxGridView>
                                
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                   <dx:ASPxGridView ID="gridTrinhDo" runat="server" Width="98%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" KeyFieldName="so_luong" Caption="Trình độ" ClientInstanceName="grid">
                                    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="true" />
                                    <Columns>
                                        <dx:GridViewDataColumn FieldName="loai_trinhdo" Caption="Trình độ" VisibleIndex="1"
                                            Width="350px" />
                                        <dx:GridViewDataColumn FieldName="so_luong" Caption="SL" VisibleIndex="2" Width="30px" />
                                    </Columns>
                                    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                        <Header Font-Bold="True">
                                        </Header>
                                        <HeaderPanel Font-Bold="True">
                                        </HeaderPanel>
                                    </Styles>
    
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                    <SettingsText  ConfirmDelete="Bạn có muốn xóa" />
                                    <SettingsPager PageSize="1000">
                                        <Summary AllPagesText="{0} - {1} " Visible="False" />
                                    </SettingsPager>
                                </dx:ASPxGridView>
                </td>
              
            </tr>

           
             
        </table>
       
        </td>
          <td valign="top">
                <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="240px" 

                            Width="380px" AppearanceName="Chameleon">
                                 <borderoptions visible="False" />
                            <diagramserializable>
                    <cc1:SimpleDiagram3D RotationMatrixSerializable="0.948433887323014;-0.099125609091736;-0.301076858957255;0;0;-0.949844129180633;0.312723728330803;0;-0.316975016960916;-0.296597781318927;-0.900864359789729;0;0;0;0;1" 
                        RotationType="UseMouseStandard" Dimension="2" PerspectiveEnabled="False">
                    </cc1:SimpleDiagram3D>
                </diagramserializable>
                            <fillstyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                            <legend equallyspaceditems="False" AlignmentHorizontal="Right"></legend>
                            <seriesserializable>
                    <cc1:Series Name="Series 1" SynchronizePointOptions="False">
                        <viewserializable>
                            <cc1:Pie3DSeriesView Depth="10" ExplodedDistancePercentage="9" 
                                ExplodeMode="MinValue">
                                <piefillstyle fillmode="Gradient">
                                    <optionsserializable>
                                        <cc1:PolygonGradientFillOptions />
                                    </optionsserializable>
                                </piefillstyle>
                            </cc1:Pie3DSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:Pie3DSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                            </cc1:Pie3DSeriesLabel>
                        </labelserializable>
                        <pointoptionsserializable>
                            <cc1:PiePointOptions PointView="ArgumentAndValues" Pattern="{A}:{V}" 
                                PercentOptions-PercentageAccuracy="4">
                                <valuenumericoptions format="Percent" />
<ValueNumericOptions Format="Percent"></ValueNumericOptions>
                            </cc1:PiePointOptions>
                        </pointoptionsserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                PercentOptions-ValueAsPercent="False">
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </cc1:Series>
                </seriesserializable>
                            <seriestemplate><ViewSerializable>
    <cc1:Pie3DSeriesView>
    </cc1:Pie3DSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:Pie3DSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
    </cc1:Pie3DSeriesLabel>
</LabelSerializable>
<PointOptionsSerializable>
    <cc1:PiePointOptions>
    </cc1:PiePointOptions>
</PointOptionsSerializable>
<LegendPointOptionsSerializable>
    <cc1:PiePointOptions>
    </cc1:PiePointOptions>
</LegendPointOptionsSerializable>
</seriestemplate>
                            <titles>
                  
                </titles>
                        </dxchartsui:WebChartControl>
                </td>
        </tr>
        <tr>
        <td valign="top" style="width: 100%;" colspan="2">
            <dx:ASPxGridView ID="grid" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" KeyFieldName="nhomluong" Caption="Lương chính sách" ClientInstanceName="grid">
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
               
                <Columns>
                    <dx:GridViewDataColumn FieldName="nhomluong" Caption="Ngạch lương" VisibleIndex="1"
                        Width="350px" />
                    <dx:GridViewDataColumn FieldName="soluong" Caption="SL" VisibleIndex="2" Width="30px" />
                </Columns>
                <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                    <Header Font-Bold="True">
                    </Header>
                    <HeaderPanel Font-Bold="True">
                    </HeaderPanel>
                  
                </Styles>
                <Settings ShowStatusBar="Visible" />
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                <SettingsText PopupEditFormCaption="Hiệu chỉnh nhóm máu" ConfirmDelete="Bạn có muốn xóa" />
                
                <SettingsPager PageSize="1000">
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
            </dx:ASPxGridView>

        </td>
      
       
    </tr>
</table>

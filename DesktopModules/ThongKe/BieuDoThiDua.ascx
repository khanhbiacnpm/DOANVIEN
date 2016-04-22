<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoThiDua.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoThiDua" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<asp:SqlDataSource ID="sdsDonVi" runat="server" ConnectionString="<%$ ConnectionStrings:HRM %>"
    SelectCommand="sp_getlist_donvi" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


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
       
        font: 9pt Tahoma;
        padding: 1px 2px 2px 2px ;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
            .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 2px 10px 2px 2px;
}
</style>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="font-size: 13px; width: 70px;"  class="dxnbGroupHeader_Glass12">
            Chọn năm
        </td>
        <td style="width: 100px;"  class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID="cbbNam" ClientInstanceName="cbbNam" runat="server" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
                <ButtonStyle Width="13px">
                </ButtonStyle>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxComboBox>
        </td>
        <td style="padding-left: 5px;"  class="dxnbGroupHeader_Glass12">
           
             <dx:ASPxButton OnClick="ASPxButton1_Click" ID="ASPxButton2" runat="server" Text="Xem biểu đồ" ClientInstanceName="btThemMoi"
                         Theme="Glass" Font-Size="12px" Width="110px">                       
                        <Image Url="../../images/view.gif"  Width="14" Height="14"></Image>
                    </dx:ASPxButton>
        </td>
        <td  class="dxnbGroupHeader_Glass12">&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table>
                <tr>
                    <td valign="top" style="width: 250px;">
                        <div style="background-color: #fbf5e9; border: 1px solid #d2c7b5; padding: 5px; margin-top: 10px;">
                        <asp:Repeater runat="server" ID="rptTD">
                            <HeaderTemplate>
                                <div style="font-weight: bold; font-size: 20px; margin-bottom: 10px;">Khen thưởng cá nhân</div>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <div style="margin-bottom: 10px;">
                                <div style='width: 15px; height: 15px; background-color: <%# GetColor(Container.ItemIndex) %>; position: absolute;'></div>
                                <div style="padding-left: 20px; font-family: Tahoma; font-size: 12px;">
                                    <%# Eval("loai") %> : <%# Eval("so_luong") %>
                                </div>
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                    </td>
                    <td style="width: 510px;" valign="top">
                        <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="180px" Width="510px">
                            <borderoptions visible="False" />
<BorderOptions Visible="False"></BorderOptions>
                            <diagramserializable>
                    <cc1:SimpleDiagram3D RotationMatrixSerializable="0.943999892686908;-0.0726814921644642;-0.321840959642913;0;0;-0.975435970151496;0.220283154450456;0;-0.329945757067919;-0.207947274161962;-0.92081145114596;0;0;0;0;1" 
                        RotationType="UseMouseStandard" Dimension="2" PerspectiveEnabled="False" 
                                    LabelsResolveOverlappingMinIndent="2">
                    </cc1:SimpleDiagram3D>
                </diagramserializable>
                            <fillstyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                            <legend equallyspaceditems="False" alignmenthorizontal="LeftOutside" 
                                AlignmentVertical="Center"></legend>
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
                            <cc1:PiePointOptions 
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
                    <cc1:ChartTitle Text="" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>


            <table>
                <tr>
                    <td valign="top" style="width: 250px;">
                        <div style="background-color: #fbf5e9; border: 1px solid #d2c7b5; padding: 5px; margin-top: 10px;">
                        <asp:Repeater runat="server" ID="rptTD2">
                            <HeaderTemplate>
                            <div style="font-weight: bold; font-size: 20px; margin-bottom: 10px;">Khen thưởng tập thể</div>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <div style="margin-bottom: 10px;">
                                <div style='width: 15px; height: 15px; background-color: <%# GetColor(Container.ItemIndex) %>; position: absolute;'></div>
                                <div style="padding-left: 20px; font-family: Tahoma; font-size: 12px;">
                                    <%# Eval("loai") %> : <%# Eval("so_luong") %>
                                </div>
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                    </td>
                    <td style="width: 510px;" valign="top">
                        <dxchartsui:WebChartControl ID="wccBieudoTapthe" runat="server" Height="180px" Width="510px">
                            <borderoptions visible="False" />
<BorderOptions Visible="False"></BorderOptions>
                            <diagramserializable>
                    <cc1:SimpleDiagram3D RotationMatrixSerializable="0.943999892686908;-0.0726814921644642;-0.321840959642913;0;0;-0.975435970151496;0.220283154450456;0;-0.329945757067919;-0.207947274161962;-0.92081145114596;0;0;0;0;1" 
                        RotationType="UseMouseStandard" Dimension="2" PerspectiveEnabled="False" 
                                    LabelsResolveOverlappingMinIndent="2">
                    </cc1:SimpleDiagram3D>
                </diagramserializable>
                            <fillstyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                            <legend equallyspaceditems="False" alignmenthorizontal="LeftOutside" 
                                AlignmentVertical="Center"></legend>
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
                            <cc1:PiePointOptions 
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
                    <cc1:ChartTitle Text="" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

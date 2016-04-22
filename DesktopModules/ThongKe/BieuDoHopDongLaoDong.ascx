<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoHopDongLaoDong.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoHopDongLaoDong" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>


            <table border="0" cellpadding="0" cellspacing="0" width="100%">
               
                <tr>
                    <td colspan="4">
                        <dxchartsui:WebChartControl ID="wccBieuDo" runat="server"  Height="380px" Width="780px">
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
                            <cc1:PiePointOptions PointView="Values" Pattern="{V}" 
                                PercentOptions-PercentageAccuracy="4">
                                <valuenumericoptions format="Percent" />
<ValueNumericOptions Format="Percent"></ValueNumericOptions>
                            </cc1:PiePointOptions>
                        </pointoptionsserializable>
                        <legendpointoptionsserializable>
                           <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                Pattern="{A}: {V} (Người)" PercentOptions-ValueAsPercent="False">
                                 <valuenumericoptions format="Number" />
<ValueNumericOptions Format="Number" precision="0"></ValueNumericOptions>
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
                    <cc1:ChartTitle Text="Kết cấu lao động theo loại hợp đồng" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>
        
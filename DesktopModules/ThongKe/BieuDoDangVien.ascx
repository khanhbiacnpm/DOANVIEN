<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoDangVien.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoDangVien" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="500px" Width="780px"
                AppearanceName="Chameleon">
                  <borderoptions visible="False" />
                <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                        <label angle="90" />
<Label Angle="90"></Label>

<Range SideMarginsEnabled="True"></Range>
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
<Range SideMarginsEnabled="True"></Range>
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                <fillstyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                <legend equallyspaceditems="False"></legend>
                
<SeriesTemplate><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
            </dxchartsui:WebChartControl>
        </td>
    </tr>
</table>

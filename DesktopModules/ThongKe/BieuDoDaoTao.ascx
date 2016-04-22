<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoDaoTao.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoDaoTao" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width:60px;">Từ</td>
        <td style="width: 100px;">
            <dx:ASPxDateEdit runat="server" ID="dteTu" ClientInstanceName="dteTu" 
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <CalendarProperties>
                    <HeaderStyle Spacing="1px" />
                    <FooterStyle Spacing="4px" />
                </CalendarProperties>
                <ButtonStyle Width="13px">
                </ButtonStyle>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxDateEdit>
        </td>
        <td style="width:60px; padding-left:10px;">Đến</td>
        <td style="width:100px;">
            <dx:ASPxDateEdit runat="server" ID="dteDen" ClientInstanceName="dteDen" 
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <CalendarProperties>
                    <HeaderStyle Spacing="1px" />
                    <FooterStyle Spacing="4px" />
                </CalendarProperties>
                <ButtonStyle Width="13px">
                </ButtonStyle>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxDateEdit>
        </td>
        <td style="padding-left: 5px; width:120px;">
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Xem biểu đồ" Width="100px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnClick="ASPxButton1_Click">
                <ClientSideEvents Click="function(s,e){
                    
                }" />
            </dx:ASPxButton>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="6">
            <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="500px" Width="600px"
                AppearanceName="Chameleon">
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
                <seriesserializable>
                                <cc1:Series LegendText="A" Name="Series 1" ShowInLegend="False">
                                    <points>
                                        <cc1:SeriesPoint ArgumentSerializable="A" Values="100">
                                        </cc1:SeriesPoint>
                                    </points>
<ViewSerializable>
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
                                </cc1:Series>
                                <cc1:Series LegendText="B" Name="Series 2" ShowInLegend="False">
                                    <points>
                                        <cc1:SeriesPoint ArgumentSerializable="B" Values="111">
                                        </cc1:SeriesPoint>
                                    </points>
<ViewSerializable>
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
                                </cc1:Series>
                                <cc1:Series LegendText="C" Name="Series 3" ShowInLegend="False">
                                    <points>
                                        <cc1:SeriesPoint ArgumentSerializable="C" Values="121">
                                        </cc1:SeriesPoint>
                                    </points>
<ViewSerializable>
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
                                </cc1:Series>
                            </seriesserializable>

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

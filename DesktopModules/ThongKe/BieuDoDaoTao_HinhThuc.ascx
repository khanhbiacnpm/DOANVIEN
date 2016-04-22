<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoDaoTao_HinhThuc.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoDaoTao_HinhThuc" %>
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
        <td align="center">
            <asp:SqlDataSource ID="sdsDonVi" runat="server" ConnectionString="<%$ ConnectionStrings:HRM %>"
                SelectCommand="sp_getlist_donvi" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width:60px;">Từ</td>
                    <td style="width: 100px;">
                        <dx:ASPxDateEdit Width="100px" runat="server" ID="dteTu" ClientInstanceName="dteTu" 
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
                        <dx:ASPxDateEdit Width="100px" runat="server" ID="dteDen" ClientInstanceName="dteDen" 
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
                    <td style="padding-left: 10px; font-size: 13px; width: 70px;">
                        Đơn vị
                    </td>
                    <td style="width: 280px;">
                        <dx:ASPxComboBox Width="100%" runat="server" ID="cbbDonVi" runat="server" ValueType="System.Int32"
                            ValueField="Id" TextField="Name" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" DataSourceID="sdsDonVi" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                            <ClientSideEvents Init="function(s,e){
                                var item = s.GetItem(0);
                                if (item != null && item.value != 0)
                                {
                                    s.InsertItem(0, '---Chọn đơn vị----', 0);
                                    s.SetSelectedIndex(0);
                                }
                            }" />
                        </dx:ASPxComboBox>
                    </td>
                    <td style="padding-left: 5px;">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Xem biểu đồ" Width="127px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnClick="ASPxButton1_Click"
                            Height="22px">
                            <Paddings PaddingLeft="10px" />
                            <BackgroundImage HorizontalPosition="10px" ImageUrl="~/images/view.gif" Repeat="NoRepeat"
                                VerticalPosition="center" />
                        </dx:ASPxButton>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="500px" Width="600px">
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
                            <legend equallyspaceditems="False" AlignmentHorizontal="Right" 
                                AlignmentVertical="TopOutside"></legend>
                            <seriesserializable>
                    <cc1:Series Name="Series 1" SynchronizePointOptions="False">
                        <points>
                            <cc1:SeriesPoint ArgumentSerializable="x" SeriesPointID="0" Values="123">
                            </cc1:SeriesPoint>
                            <cc1:SeriesPoint ArgumentSerializable="y" SeriesPointID="1" Values="341">
                            </cc1:SeriesPoint>
                            <cc1:SeriesPoint ArgumentSerializable="z" SeriesPointID="3" Values="2">
                            </cc1:SeriesPoint>
                            <cc1:SeriesPoint ArgumentSerializable="t" SeriesPointID="4" Values="1">
                            </cc1:SeriesPoint>
                        </points>
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
                            <cc1:Pie3DSeriesLabel LineVisible="True" Antialiasing="True" 
                                Position="TwoColumns" ResolveOverlappingMode="Default">
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
                    <cc1:ChartTitle Text="" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

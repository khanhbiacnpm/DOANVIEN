<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoThiDua_TapThe.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoThiDua_TapThe" %>
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
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="font-size: 13px; width: 70px;">
            Chọn năm
        </td>
        <td style="width: 100px;">
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
        <td colspan="6">
            <table>
                <tr>
                    <td valign="top" style="width: 300px;">
                        <div style="background-color: #fbf5e9; border: 1px solid #d2c7b5; padding: 5px; margin-top: 10px;">
                            <div style="font-weight: bold; font-size: 20px; margin-bottom: 10px;">Thành tích khen thưởng</div>
                        <asp:Repeater runat="server" ID="rptTD">
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
                    <td style="width: 510px;">
                        <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="380px" Width="500px">
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
                            <legend equallyspaceditems="False" alignmenthorizontal="Right" 
                                AlignmentVertical="TopOutside"></legend>
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
                    <cc1:ChartTitle Text="Thành tích thi đua" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuDoDaoTao_ChuyenNganh.ascx.cs"
    Inherits="VNPT.Modules.ThongKe.BieuDoDaoTao_ChuyenNganh" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
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


<asp:SqlDataSource ID="sdsDonVi" runat="server" ConnectionString="<%$ ConnectionStrings:HRM %>"
    SelectCommand="sp_getlist_donvi" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<table border="0" cellpadding="0" cellspacing="0" width="100%" >
    <tr>
        <td style="width: 40px;"  class="dxnbGroupHeader_Glass12">
            Từ
        </td>
        <td style="width: 100px;"  class="dxnbGroupHeader_Glass12">
            <dx:ASPxDateEdit Width="100px" runat="server" ID="dteTu" ClientInstanceName="dteTu"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DisplayFormatString="dd/MM/yyyy"
                EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
        <td style="width: 40px;" class="dxnbGroupHeader_Glass12">
            Đến
        </td>
        <td style="width: 100px;"  class="dxnbGroupHeader_Glass12">
            <dx:ASPxDateEdit Width="100px" runat="server" ID="dteDen" ClientInstanceName="dteDen"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DisplayFormatString="dd/MM/yyyy"
                EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
        <td style="padding-left: 5px;"  class="dxnbGroupHeader_Glass12">
           
              <dx:ASPxButton OnClick="ASPxButton1_Click" ID="ASPxButton2" runat="server" Text="Xem biểu đồ" ClientInstanceName="btThemMoi"
                        AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="110px">                       
                        <Image Url="../../images/view.gif"  Width="14" Height="14"></Image>
                    </dx:ASPxButton>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:540px;">&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table>
                <tr>
                    <td valign="top" style="width: 200px;">
                        <%--<div style="background-color: #fbf5e9;  padding: 5px; margin-top: 10px;">
                            <div>
                                <div style="width: 15px; height: 15px; background-color: #d0c8b5; position: absolute;">
                                </div>
                                <div style="padding-left: 20px; font-family: Tahoma; font-size: 12px;">
                                    Số lớp:
                                    <asp:Literal ID="litSoLop" runat="server"></asp:Literal></div>
                            </div>
                            <div style="margin-top: 5px;">
                                <div style="width: 15px; height: 15px; background-color: #7ab622; position: absolute;">
                                </div>
                                <div style="padding-left: 20px; font-family: Tahoma; font-size: 12px;">
                                    Số người:
                                    <asp:Literal ID="litSoNguoi" runat="server"></asp:Literal></div>
                            </div>
                            <div style="margin-top: 5px;">
                                <div style="width: 15px; height: 15px; background-color: #d75e2f; position: absolute;">
                                </div>
                                <div style="padding-left: 20px; font-family: Tahoma; font-size: 12px;">
                                    Số lượt đào tạo:
                                    <asp:Literal ID="litSoLuot" runat="server"></asp:Literal></div>
                            </div>
                        </div>--%>
                        <div style="width:100%; height:auto;">
                        <dxchartsui:WebChartControl ID="wccBieuDo1" runat="server" Height="380px" Width="380px">
                            <borderoptions visible="False" />
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
                            <cc1:Pie3DSeriesLabel LineVisible="True" 
                                Position="TwoColumns" ResolveOverlappingMode="Default">
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
                    <cc1:ChartTitle Text="" />
                </titles>
                        </dxchartsui:WebChartControl>
                        </div>
                    </td>
                    <td style="width: 510px;">
                        <dxchartsui:WebChartControl ID="wccBieuDo" runat="server" Height="380px" Width="380px">
                            <borderoptions visible="False" />
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
                            <cc1:Pie3DSeriesLabel LineVisible="True" 
                                Position="TwoColumns" ResolveOverlappingMode="Default">
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
                    <cc1:ChartTitle Text="" />
                </titles>
                        </dxchartsui:WebChartControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

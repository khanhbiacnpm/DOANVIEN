<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Report_NguonNhanLuc.ascx.cs" Inherits="VNPT.Modules.ThongKe.Report_NguonNhanLuc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<style type="text/css">
    .dxbButton_Glass div.dxb {
        border: 0 none;
        padding: 1px 2px 1px 2px;
    }

    .dxnbGroupHeader_Glass12 {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 3px;
    }

    .dxnbControl_Glass1 {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
        font: 9pt Tahoma;
    }
</style>
<table cellpadding="0" cellspacing="0" width="100%" style="font-family: Times New Roman; font-size: 11pt;" align="center">
    <tr>
        <td class="dxnbGroupHeader_Glass12" style="width: 100px;">Chọn đơn vị
              
        </td>
        <td style="width: 100px;" class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID="cmb_donvi" runat="server" Width="300px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <ClientSideEvents SelectedIndexChanged="function(s,e){
                        cbp_report.PerformCallback();
                    }" />
            </dx:ASPxComboBox>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width: 600px;">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" colspan="3" style="padding: 3px;">
            <dx:ASPxCallbackPanel ID="cbp_report" runat="server" ClientInstanceName="cbp_report"
                OnCallback="cbp_report_CallbackPanel">
                <PanelCollection>
                    <dx:PanelContent ID="pc">

                        <dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False' Width="100%" Theme="Glass"
                            ReportViewer='<%# ReportViewer1 %>' BorderColor="#A3C0E8" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" ItemSpacing="2px"
                            SeparatorColor="#A3C0E8" SeparatorHeight="100%" SeparatorWidth="1px">
                            <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </Images>
                            <Items>
                                <dx:ReportToolbarButton ItemKind='Search' />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarButton ItemKind='PrintReport' />
                                <dx:ReportToolbarButton ItemKind='PrintPage' />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarButton Enabled='False' ItemKind='FirstPage' />
                                <dx:ReportToolbarButton Enabled='False' ItemKind='PreviousPage' />
                                <dx:ReportToolbarLabel ItemKind='PageLabel' />
                                <dx:ReportToolbarComboBox ItemKind='PageNumber' Width='65px'>
                                </dx:ReportToolbarComboBox>
                                <dx:ReportToolbarLabel ItemKind='OfLabel' />
                                <dx:ReportToolbarTextBox IsReadOnly='True' ItemKind='PageCount' />
                                <dx:ReportToolbarButton ItemKind='NextPage' />
                                <dx:ReportToolbarButton ItemKind='LastPage' />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarButton ItemKind='SaveToDisk' />
                                <dx:ReportToolbarButton ItemKind='SaveToWindow' />
                                <dx:ReportToolbarComboBox ItemKind='SaveFormat' Width='70px'>
                                    <Elements>
                                        <dx:ListElement Value='pdf' />
                                        <dx:ListElement Value='xls' />
                                        <dx:ListElement Value='xlsx' />
                                        <dx:ListElement Value='rtf' />
                                        <dx:ListElement Value='mht' />
                                        <dx:ListElement Value='html' />
                                        <dx:ListElement Value='txt' />
                                        <dx:ListElement Value='csv' />
                                        <dx:ListElement Value='png' />
                                    </Elements>
                                </dx:ReportToolbarComboBox>
                            </Items>
                            <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                <LabelStyle ForeColor="#2C4D79">
                                    <Margins MarginLeft='3px' MarginRight='3px' />
                                </LabelStyle>
                                <ComboBoxStyle>
                                    <Margins MarginLeft="3px" MarginRight="3px" />
                                </ComboBoxStyle>
                                <ComboBoxButtonStyle>
                                    <DropDownButtonImage>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua"
                                            PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </DropDownButtonImage>
                                </ComboBoxButtonStyle>
                                <TextBoxStyle>
                                    <Margins MarginLeft="2px" MarginRight="2px" />
                                </TextBoxStyle>
                                <ButtonStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </ButtonStyle>
                            </Styles>
                            <Border BorderColor="#A3C0E8" BorderStyle="Solid" BorderWidth="1px" />
                        </dx:ReportToolbar>
                        <dx:ReportViewer ID="ReportViewer1" runat="server"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            LoadingPanelText="" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <LoadingPanelStyle ForeColor="#303030">
                            </LoadingPanelStyle>
                        </dx:ReportViewer>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>

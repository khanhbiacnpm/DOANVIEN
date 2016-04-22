<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Report_GIAYNGHIPHEP.ascx.cs" Inherits="DotNetNuke.Modules.GIAYNGHIPHEP.Report_GIAYNGHIPHEP" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False'
    ReportViewer="<%# ReportViewer1 %>" 
    Font-Names="Tahoma" Font-Size="9pt" ItemSpacing="2px" SeparatorColor="#A3C0E8" 
    SeparatorHeight="100%" SeparatorWidth="1px" Width="100%">
    <Border BorderColor="#A3C0E8" BorderStyle="Solid" BorderWidth="1px" />
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
    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    </Images>
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
</dx:ReportToolbar>
<dx:ReportViewer ID="ReportViewer1" runat="server"  
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    LoadingPanelText="" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle ForeColor="#303030">
    </LoadingPanelStyle>
</dx:ReportViewer>
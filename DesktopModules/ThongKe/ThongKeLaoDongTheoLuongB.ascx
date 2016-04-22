<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThongKeLaoDongTheoLuongB.ascx.cs" Inherits="VNPT.Modules.ThongKe.ThongKeLaoDongTheoLuongB" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<table width="100%" border="0" cellpadding="2" cellspacing="0">
    <tr>
        <td>
            <dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False' ReportViewer="<%# ReportViewer1 %>">
                <Items>
                    <dx:ReportToolbarButton ItemKind='PrintReport' Text="In" ToolTip="In" />
                    <dx:ReportToolbarButton ItemKind='PrintPage' Text="In trang hiện tại" ToolTip="In trang hiện tại" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton Enabled='False' ItemKind='FirstPage' Text="Trang đầu" ToolTip="Trang đầu" />
                    <dx:ReportToolbarButton Enabled='False' ItemKind='PreviousPage' Text="Trang trước"
                        ToolTip="Trang trước" />
                    <dx:ReportToolbarLabel ItemKind='PageLabel' Text="Trang" />
                    <dx:ReportToolbarComboBox ItemKind='PageNumber' Width='65px'>
                    </dx:ReportToolbarComboBox>
                    <dx:ReportToolbarLabel ItemKind='OfLabel' Text="/" />
                    <dx:ReportToolbarTextBox IsReadOnly='True' ItemKind='PageCount' />
                    <dx:ReportToolbarButton ItemKind='NextPage' Text="Trang kế" ToolTip="Trang kế" />
                    <dx:ReportToolbarButton ItemKind='LastPage' Text="Trang cuối" ToolTip="Trang cuối" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind='SaveToDisk' Text="Lưu" ToolTip="Lưu" />
                    <dx:ReportToolbarButton ItemKind='SaveToWindow' Text="Mở ở cửa sổ khác" ToolTip="Mở ở cửa sổ khác" />
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
                <Styles>
                    <LabelStyle>
                        <Margins MarginLeft='3px' MarginRight='3px' />
                    </LabelStyle>
                </Styles>
            </dx:ReportToolbar>
            
            <dx:ReportViewer ID="ReportViewer1" runat="server" OnUnload="ReportViewer1_Unload">
            </dx:ReportViewer>
        </td>
    </tr>
</table>

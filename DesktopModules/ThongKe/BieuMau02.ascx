<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BieuMau02.ascx.cs" Inherits="VNPT.Modules.ThongKe.BieuMau02" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
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
        padding: 2px 3px;
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
        padding: 2px 3px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
             .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 1px 2px 1px 2px;
}
</style>


            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="dxnbGroupHeader_Glass12" style="font-size: 13px; width: 70px;">
                        Chọn ngày
                    </td>
                    <td class="dxnbGroupHeader_Glass12" style="width: 100px;">
                        <dx:ASPxDateEdit runat="server" ID="dteNgay" ClientInstanceName="dteNgay" 
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
                    <td class="dxnbGroupHeader_Glass12" style="padding-left: 5px;">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Thống kê" Width="100px" Theme="Glass" Font-Size="12px" OnClick="ASPxButton1_Click">
                             <Image Url="~/images/imgadmin/reload.png">
                </Image>
                            <ClientSideEvents Click="function(s,e){
                                if (dteNgay.GetText().trim() == ''){
                                    e.processOnServer = false;
                                    alert('Xin vui lòng ngày!');
                                }
                            }" />
                        </dx:ASPxButton>
                    </td>
                    <td class="dxnbGroupHeader_Glass12">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding:3px;">
                     <dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False' ReportViewer="<%# ReportViewer1 %>" Theme="Glass" Font-Size="12px">
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
           
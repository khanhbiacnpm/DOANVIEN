<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThanhTichCaNhan.ascx.cs" Inherits="VNPT.Modules.ThongKe.ThanhTichCaNhan" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
    
    
<style type="text/css">
 .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 1px 2px 1px 2px;
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

    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
</style>

            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="dxnbGroupHeader_Glass12" style="width:60px;">
                        Từ năm
                    </td>
                    <td class="dxnbGroupHeader_Glass12" style="width:100px;">
                        <dx:ASPxComboBox ID="cbbTuNam" ClientInstanceName="cbbTuNam" runat="server" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
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
                    <td class="dxnbGroupHeader_Glass12" style="width:60px;">
                        Đến năm
                    </td>
                    <td class="dxnbGroupHeader_Glass12" style="width:100px;">
                        <dx:ASPxComboBox ID="cbbDenNam" ClientInstanceName="cbbDenNam" runat="server" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
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
                    <td class="dxnbGroupHeader_Glass12" style="width:60px;">
                        Đơn vị
                    </td>
                    <td class="dxnbGroupHeader_Glass12" style="width:200px;">
                        <dx:ASPxComboBox runat="server" ID="cbbDonVi" runat="server" ValueField="Id" TextField="Name"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" Width="200px"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                    <td class="dxnbGroupHeader_Glass12">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Thống kê" Width="100px" Theme="Glass" Font-Size="12px" OnClick="ASPxButton1_Click">
                            <ClientSideEvents Click="function(s,e){
                                var tunam = cbbTuNam.GetValue();
                                var dennam = cbbDenNam.GetValue();
                                if (tunam == 0 || dennam == 0){
                                    e.processOnServer = false;
                                    alert('Xin vui lòng chọn năm!');
                                }

                            }" />
                             <Image Url="../../images/imgadmin/thongke.png" />
                        </dx:ASPxButton>
                    </td>
                    <td style="width:250px;" class="dxnbGroupHeader_Glass12">&nbsp;
                    </td>
                </tr>
                <tr>
                   <td colspan="8" style="padding:3px;">
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

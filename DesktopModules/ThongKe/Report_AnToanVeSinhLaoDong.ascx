<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Report_AnToanVeSinhLaoDong.ascx.cs" Inherits="VNPT.Modules.ThongKe.Report_AnToanVeSinhLaoDong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

     <style type="text/css">
    .dxbButton_Glass div.dxb
    {
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
<table cellpadding="0" cellspacing="0" width="100%" style="font-family:Times New Roman; font-size:11pt;" align ="center">
    <tr>
        <td class="dxnbGroupHeader_Glass12" style="width:145px; text-align:right;">Chọn năm:</td>
        <td class="dxnbGroupHeader_Glass12" style="width:100px;">
            <dx:ASPxComboBox ID="cmb_nam" runat="server" Width="100%" ValueType="System.Int32"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            </dx:ASPxComboBox>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:120px;">
            <dx:ASPxRadioButton ID="lcheck" runat="server" Text="6 tháng đầu năm" TextAlign="Right" GroupName="C" Checked="true"></dx:ASPxRadioButton>
        </td>
        <td class="dxnbGroupHeader_Glass12" style="width:150px;">                        
            <dx:ASPxRadioButton ID="rcheck" runat="server" Text="6 tháng cuối năm" TextAlign="Right" GroupName="C"></dx:ASPxRadioButton>
        </td>
        <td class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="bt_thongke" runat="server" Width="110px" Text = "Thống kê" AutoPostBack="false"
                Theme="Glass" Font-Size="12px">
                <Image Url="../../images/imgadmin/thongke.png" />
                <ClientSideEvents Click="function(s,e){
                    gridATVSLD.PerformCallback();
                }" />
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="center" style="padding:3px;">
            <dx:ASPxGridView ID="gridATVSLD" runat="server" ClientInstanceName="gridATVSLD"
                Width="100%" Theme="Glass" Font-Size="12px"
                OnCustomCallback="gridATVSLD_CustomCallback" KeyFieldName="Id">
                <SettingsBehavior AllowSort="false" />
                <SettingsPager PageSize="20">
                    <Summary Visible="False" />
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataColumn FieldName="stt" Caption="STT" Width="25px" VisibleIndex="0">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="text" Caption="Các chỉ tiêu trong kỳ báo cáo" />
                    <dx:GridViewDataColumn FieldName="dvt" Caption="Kinh nghiệm" />                    
                    <dx:GridViewDataColumn FieldName="value" Caption="Số liệu" />                        
                    <dx:GridViewDataColumn Caption="Ghi chú" />                    
                </Columns>               
            </dx:ASPxGridView>        
        </td>
    </tr>
</table>

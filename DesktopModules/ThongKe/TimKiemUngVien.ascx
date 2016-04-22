<%@ Control Language="C#" Inherits="VNPT.Modules.ThongKe.TimKiemUngVien" CodeFile="TimKiemUngVien.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<style type="text/css">
    .Grid
    {
        border-style: dotted;
        border-width: 0px;
        border-bottom-color: #bcbcbc;
        font-size: 10px;
    }
    .Grid a
    {
        color: #0066b3;
    }
</style>
<script type="text/javascript">
    function loadtrinhdokhac(id) {

        popupTrinhDoKhac.Show();
        pnlTrinhDoKhac.PerformCallback(id);
    }
    function loadchitiet(id) {

        popupChiTiet.Show();
        pnlChiTiet.PerformCallback(id);
    }
    function Search() {

        var data = "";
        var chuyennganh = "", trinhdo = "", trinhdokhac = "", kynang = "", kinhnghiem = "", lyluan = "0";
        var itemChuyennganh = lstChuyenNganh.GetSelectedItems();
        var itemTrinhDo = listTrinhDo.GetSelectedItems();
        var itemKinhNghiem = listKinhNghiem.GetSelectedItems();
        var itemKyNang = lstKyNang.GetSelectedItems();
        var itemTrinhDoKhac = listTrinhDoKhac.GetSelectedItems();
        var itemLyLuan = lstLyLuanChinhTri.GetSelectedItems();

        for (var i = itemChuyennganh.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                chuyennganh += itemChuyennganh[i].value + ",";
            }
            else {
                chuyennganh += itemChuyennganh[i].value;
            }
        }
        for (var i = itemTrinhDo.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                trinhdo += itemTrinhDo[i].value + ",";
            }
            else {
                trinhdo += itemTrinhDo[i].value;
            }
        }
        for (var i = itemKinhNghiem.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                kinhnghiem += itemKinhNghiem[i].value + ",";
            }
            else {
                kinhnghiem += itemKinhNghiem[i].value;
            }
        }
        for (var i = itemKyNang.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                kynang += itemKyNang[i].value + ",";
            }
            else {
                kynang += itemKyNang[i].value;
            }
        }
        for (var i = itemTrinhDoKhac.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                trinhdokhac += itemTrinhDoKhac[i].value + ",";
            }
            else {
                trinhdokhac += itemTrinhDoKhac[i].value;
            }
        }
        for (var i = itemLyLuan.length - 1; i >= 0; i = i - 1) {
            if (i > 0) {
                lyluan += itemLyLuan[i].value + ",";
            }
            else {
                lyluan += itemLyLuan[i].value;
            }
        }

        data = data + chuyennganh + ";" + trinhdo + ";" + kinhnghiem + ";" + kynang + ";" + trinhdokhac + ";" + lyluan;
        hdKey.Set("data", data);
        gridThongKe.PerformCallback(data);
    }

</script>
<dx:ASPxHiddenField ID="hdKey" runat="server" ClientInstanceName="hdKey">
</dx:ASPxHiddenField>
<table width="780px" cellpadding="2" cellspacing="0" style="border: Solid 1px #e7e7e7;
    font-size: 11pt; background: #dbeafe" align="center" border="0">
    <tr>
        <td style="width: 400px; vertical-align: top;">
            <font color="#023971">Chuyên ngành :</font>
            <br />
            <dx:ASPxListBox ID="lstChuyenNganh" runat="server" Width="100%" ClientInstanceName="lstChuyenNganh"
                SelectionMode="CheckColumn" ValueField="id" TextField="ten" EnableSynchronization="False"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
        <td style="width: 185px; vertical-align: top;">
            <font color="#023971">Trình độ :</font>
            <br />
            <dx:ASPxListBox ID="listTrinhDo" runat="server" Width="100%" ClientInstanceName="listTrinhDo"
                SelectionMode="CheckColumn" ValueField="id" TextField="ten" EnableSynchronization="False"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
        <td style="width: 185px; vertical-align: top;">
            <font color="#023971">Kinh nghiệm :</font>
            <br />
            <dx:ASPxListBox ID="listKinhNghiem" runat="server" Width="100%" ClientInstanceName="listKinhNghiem"
                SelectionMode="CheckColumn" ValueField="Id" TextField="KinhNghiem" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top;">            
            <font color="#023971">Kỹ năng :</font>
            <br />
            <dx:ASPxListBox ID="lstKyNang" runat="server" Width="100%" ClientInstanceName="lstKyNang"
                SelectionMode="CheckColumn" ValueField="Id" TextField="KyNang" EnableSynchronization="False"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
        <td style="vertical-align: top;">
            <font color="#023971">Trình độ khác :</font>
            <br />
            <dx:ASPxListBox ID="listTrinhDoKhac" runat="server" Width="100%" ClientInstanceName="listTrinhDoKhac"
                SelectionMode="CheckColumn" ValueField="Id" TextField="TrinhDo" EnableSynchronization="False"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
        <td style="vertical-align: top;">
            <font color="#023971">Lý luận chính trị :</font>
            <br />
            <dx:ASPxListBox ID="lstLyLuanChinhTri" runat="server" Width="100%" ClientInstanceName="lstLyLuanChinhTri"
                SelectionMode="CheckColumn" ValueField="id" TextField="ten" EnableSynchronization="False"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                Height="160px">
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
            </dx:ASPxListBox>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <div style="float: left;">
                <dx:ASPxButton ID="btThongKe" runat="server" Text="Thống kê" AutoPostBack="false"
                    Theme="Glass" Font-Size="12px"
                    Width="150px">
                    <Image Url="../../images/imgadmin/thongke.png">
                    </Image>
                    <ClientSideEvents Click="function(s,e){Search();}" />
                </dx:ASPxButton>
            </div>
            <div style="float: left; margin-left: 5px;">
                <dx:ASPxButton ID="btExcel" runat="server" Text="Xuất Excel" AutoPostBack="true"
                    OnClick="btExcel_Click" Theme="Glass" Font-Size="12px" Width="150px">
                    <Image Url="../../images/imgadmin/Excel.png">
                    </Image>
                </dx:ASPxButton>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <dx:ASPxGridView ID="gridThongKe" runat="server" ClientInstanceName="gridThongKe"
                Width="100%" Theme="Glass" Font-Size="12px"
                OnCustomCallback="gridThongKe_CustomCallback" KeyFieldName="Id" OnPageIndexChanged="gridThongKe_PageIndexChanged">
                <SettingsBehavior AllowSort="false" />
                <SettingsPager PageSize="20">
                    <Summary Visible="False" />
                </SettingsPager>
                <SettingsLoadingPanel ImagePosition="Top" />
                <Columns>
                    <dx:GridViewDataColumn FieldName="stt" Caption="STT" Width="25px" VisibleIndex="0">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="FullName" Caption="Họ tên" Width="150px" VisibleIndex="1">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="kinhnghiem" Caption="Kinh nghiệm" VisibleIndex="4"
                        Width="40px">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="bangcap" Caption="Bằng cấp" VisibleIndex="5" Width="200px">
                        <CellStyle HorizontalAlign="Justify" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="lyluan" Caption="Lý luận chính trị" Width="80px"
                        VisibleIndex="6">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="chucvu" Caption="Chức vụ" VisibleIndex="2" Width="80px">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="donvi" Caption="Đơn vị" VisibleIndex="3" Width="150px">
                        <CellStyle HorizontalAlign="Center" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn FieldName="Id" Caption="#" Width="70px" VisibleIndex="7">
                        <DataItemTemplate>
                            <a style='cursor: pointer;' onclick="loadchitiet(<%# Eval("Id") %>)">Kỹ năng</a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="unitid" Caption="#" Width="110px" VisibleIndex="8">
                        <DataItemTemplate>
                            <a style='cursor: pointer;' onclick="loadtrinhdokhac(<%# Eval("Id") %>)">Trình độ khác</a>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesEditors>
                    <DropDownEditDropDown>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                    </DropDownEditDropDown>
                    <SpinEditIncrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                            PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                    </SpinEditIncrement>
                    <SpinEditDecrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                            PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                    </SpinEditDecrement>
                    <SpinEditLargeIncrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                            PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                    </SpinEditLargeIncrement>
                    <SpinEditLargeDecrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                            PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                    </SpinEditLargeDecrement>
                </ImagesEditors>
                <ImagesFilterControl>
                    <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                    <LoadingPanel ImageSpacing="8px">
                    </LoadingPanel>
                </Styles>
                <StylesEditors>
                    <CalendarHeader Spacing="1px">
                    </CalendarHeader>
                    <ProgressBar Height="25px">
                    </ProgressBar>
                </StylesEditors>
            </dx:ASPxGridView>
             <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridThongKe">                                
                            </dx:ASPxGridViewExporter>  
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="popupChiTiet" ClientInstanceName="popupChiTiet" runat="server"
    Width="500px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
    HeaderText="Kỹ năng nhân viên" PopupHorizontalAlign="Center" PopupVerticalAlign="TopSides"
    AllowDragging="true" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxCallbackPanel ID="pnlChiTiet" ClientInstanceName="pnlChiTiet" runat="server"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" OnCallback="pnlChiTiet_Callback">
                <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
                </LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server">
                        <table border="0" cellpadding="3" cellspacing="0" width="500px" style="font-family: 'Times New Roman';
                            font-size: 11pt;">
                            <tr>
                                <td style="vertical-align: top;">
                                    <font size="2" color="#023971">Kỹ năng :</font>
                                    <br />
                                    <dx:ASPxListBox ID="lstKyNangCT" runat="server" Width="100%" ClientInstanceName="lstKyNangCT"
                                        SelectionMode="CheckColumn" ValueField="Id" TextField="KyNang" EnableSynchronization="False"
                                        ImageUrlField="dapung" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Height="160px">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Đóng" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="120px">
                                        <ClientSideEvents Click="function(s,e)
                            {
                                popupChiTiet.Hide();
                            }" />
                                        <Image Url="../../images/imgadmin/stop.png">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="popupTrinhDoKhac" ClientInstanceName="popupTrinhDoKhac"
    runat="server" Width="500px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
    CssPostfix="Glass" HeaderText="Trình độ khác của nhân viên" PopupHorizontalAlign="Center"
    PopupVerticalAlign="TopSides" AllowDragging="true" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="pnlTrinhDoKhac" runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="pnlTrinhDoKhac"
                runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                OnCallback="pnlTrinhDoKhac_Callback">
                <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
                </LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <table border="0" cellpadding="3" cellspacing="0" width="500px" style="font-family: 'Times New Roman';
                            font-size: 11pt;">
                            <tr>
                                <td style="vertical-align: top;">
                                    <font size="2" color="#023971">Kỹ năng :</font>
                                    <br />
                                    <dx:ASPxListBox ID="lstTrinhDoKhacCT" runat="server" Width="100%" ClientInstanceName="lstTrinhDoKhacCT"
                                        SelectionMode="CheckColumn" ValueField="Id" TextField="TrinhDo" EnableSynchronization="False"
                                        ImageUrlField="dapung" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Height="160px">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Đóng" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="120px">
                                        <ClientSideEvents Click="function(s,e)
                            {
                                popupTrinhDoKhac.Hide();
                            }" />
                                        <Image Url="~/images/imgadmin/stop.png">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

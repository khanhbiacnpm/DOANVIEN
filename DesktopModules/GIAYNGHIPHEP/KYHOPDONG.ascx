<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KYHOPDONG.ascx.cs" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.KYHOPDONG" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<script type="text/javascript">

    function setDate(s) {
        var date = s.GetValue();
        var ngay = date.getDate();
        var thang = date.getMonth() + 1;
        var nam = date.getYear() + 1900;
        var n = ngay + '/' + thang + '/' + nam;
        callback_DenNgay.PerformCallback(n)
    }
    function checkDate(s) {
        var date1 = calDateStart.GetValue();
        var ngay1 = date1.getDate();
        var thang1 = date1.getMonth() + 1;
        var nam1 = date1.getYear() + 1900;
        var n1 = ngay1 + '/' + thang1 + '/' + nam1;

        var date2 = calContractDateEnd.GetValue();
        var ngay2 = date2.getDate();
        var thang2 = date2.getMonth() + 1;
        var nam2 = date2.getYear() + 1900;
        var n2 = ngay2 + '/' + thang2 + '/' + nam2;
        var d1 = Date.parse(n1);
        var d2 = Date.parse(n2);
        if (d2 < d1) {
            alert("Ngày kết thúc phải lớn hơn ngày bắt đầu !");
        } else
            hfNgayThang.Set('enddate', date2);
    }
</script>
<script type="text/javascript">

    function save() {

        if (cmbDonViCTac.GetValue() == 0) {
            cmbDonViCTac.SetFocus();
            alert('Xin vui lòng chọn đơn vị !');
            return false;
        }
        else if (ddlContractType.GetValue() == 0) {

            ddlContractType.SetFocus();
            alert('Xin vui lòng chọn loại hợp đồng !');
            return false;
        }
        else if (calDateStart.GetText() == "") {

            calDateStart.SetFocus();
            alert('Xin vui chọn ngày bắt đầu !');
            return false;
        }
        else {
            hdfDataKHD.Set("shd", txtContractNum.GetText());
            hdfDataKHD.Set("dd", txtRepresent.GetText());
            hdfDataKHD.Set("dvdd", txtRepresentUnit.GetText());
            hdfDataKHD.Set("dtdd", txtRepresentPhone.GetText());
            hdfDataKHD.Set("dcdd", txtRepresentAdd.GetText());
            hdfDataKHD.Set("nbd", calDateStart.GetValue());
            hdfDataKHD.Set("lhd", ddlContractType.GetValue());
            hdfDataKHD.Set("dvct", cmbDonViCTac.GetValue());
            hdfDataKHD.Set("cdcv", cmbChucDanhCongViec.GetValue());
            hdfDataKHD.Set("qlnn", cmbQLNhaNuoc.GetValue());
            hdfDataKHD.Set("nl", cmbNhomLuong.GetValue());
            hdfDataKHD.Set("bl", cmbBacLuong.GetValue());
            hdfDataKHD.Set("blt", cmbBacLuong.GetText());
            hdfDataKHD.Set("hslm", txtHeSoLuongMoi.GetText());
            hdfDataKHD.Set("ltv", txt_luongthuviec.GetText());

        CallbackPanel_DieuChuyen.PerformCallback('save'); }

    }
    function ClearText() {
        txtContractNum.SetText("");
    }
    function selecteditem(s,e) {        
        var val = s.GetSelectedItem().value;            
        if (val == 4) {
            $("#hdthuviec").show();
            $("#hdchinhthuc1").hide();
            $("#hdchinhthuc2").hide();
            $("#hdchinhthuc3").hide();
        }
        else {
            $("#hdchinhthuc1").show();
            $("#hdchinhthuc2").show();
            $("#hdchinhthuc3").show();
            $("#hdthuviec").hide();
        }
    }
    function InsertItem(s, e) {
        s.InsertItem(0, '-- chọn --', '0');
        s.SetSelectedIndex(0);
    }
</script>
<dx:ASPxCallbackPanel ID="CallbackPanel_DieuChuyen" runat="server" ClientInstanceName="CallbackPanel_DieuChuyen"
    Width="796" OnCallback="CallbackPanel_DieuChuyen_Callback">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <dx:ASPxHiddenField ID="hdfDataKHD" runat="server" ClientInstanceName="hdfDataKHD">
            </dx:ASPxHiddenField>
        </dx:PanelContent>
    </PanelCollection>
    <ClientSideEvents EndCallback="function(s,e)
                {                    
                    if(CallbackPanel_DieuChuyen.cpResult == true)
                    {
                                            alert('Ký hợp đồng thành công !');
                        ClearText();
                        delete CallbackPanel_DieuChuyen.cpResult;
                    }                  
                }" />
</dx:ASPxCallbackPanel>
<table cellpadding="0" width="100%" border="0" style="font-size: 11pt; font-family: Times New Roman;">
    <tr>
        <td valign="top" style="width: 50%;">
            <table cellpadding="2" cellspacing="0" width="100%" style="font-size: 11pt; font-family: Times New Roman;">
                <tr>
                    <td style="width: 130px;">
                        Đơn vị công tác
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbDonViCTac" ClientInstanceName="cmbDonViCTac" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Số hợp đồng
                    </td>
                    <td colspan="3">
                        <dx:ASPxTextBox ID="txtContractNum" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%"
                            ClientInstanceName="txtContractNum">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Loại hợp đồng
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="ddlContractType" ClientInstanceName="ddlContractType" runat="server"
                            Width="100%" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents SelectedIndexChanged="selecteditem" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày bắt đầu
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="calDateStart" Width="100%" ClientInstanceName="calDateStart"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" runat="server" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table style="width: 100%; font-size: 11pt; font-family: Times New Roman;" cellpadding="0">
                <tr>
                    <td style="width: 170px;" valign="top">
                        Người đại diện
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtRepresent" runat="server" ClientInstanceName="txtRepresent"
                            EnableClientSideAPI="true" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Đ/c người đại diện
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtRepresentAdd" runat="server" ClientInstanceName="txtRepresentAdd"
                            EnableClientSideAPI="true" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Đơn vị của người đại diện
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtRepresentUnit" runat="server" ClientInstanceName="txtRepresentUnit"
                            EnableClientSideAPI="true" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        ĐT người đại diện
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtRepresentPhone" runat="server" ClientInstanceName="txtRepresentPhone"
                            EnableClientSideAPI="true" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%; font-size: 11pt; font-family: Times New Roman;">
                <tr>
                    <td style="width: 130px;">
                        Chức danh 
                    </td>
                    <td style="width: 263px;">
                        <dx:ASPxComboBox ID="cmbChucDanhCongViec" ClientInstanceName="cmbChucDanhCongViec"
                            runat="server" Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                                                    cmbQLNhaNuoc.PerformCallback(s.GetValue().toString());                                                                                   
                                                                                }" />
                        </dx:ASPxComboBox>
                    </td>
                    <td style="width: 170px;" id="hdchinhthuc1">
                        Quản lý nhà nước
                    </td>
                    <td id="hdchinhthuc3">
                        <dx:ASPxComboBox ID="cmbQLNhaNuoc" ClientInstanceName="cmbQLNhaNuoc" runat="server"
                            Width="100%" OnCallback="cmbQLNhaNuoc_callback" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents SelectedIndexChanged="function(s,e){                                                                                    
                                                                        cmbNhomLuong.PerformCallback(cmbQLNhaNuoc.GetValue().toString()+','+cmbChucDanhCongViec.GetValue().toString());
                                                                    }" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr id="hdchinhthuc2">
                    <td>
                        Nhóm lương
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbNhomLuong" runat="server" ClientInstanceName="cmbNhomLuong"
                            OnCallback="cmbNhomLuong_Callback" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            ValueType="System.Int32">
                            <ClientSideEvents SelectedIndexChanged="function(s,e){                                                              
                                                                        cmbBacLuong.PerformCallback(cmbNhomLuong.GetValue().toString());
                                                                    }" />
                        </dx:ASPxComboBox>
                    </td>
                    <td colspan="2">
                        <table width="100%" cellpadding="2" style="width: 100%; font-size: 11pt; font-family: Times New Roman;">
                            <tr>
                                <td style="width: 80px;">
                                    Bậc lương
                                </td>
                                <td style="width: 84px;">
                                    <dx:ASPxComboBox ID="cmbBacLuong" runat="server" ClientInstanceName="cmbBacLuong"
                                        OnCallback="cmbBacLuong_CallBack" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        ValueType="System.Int32">
                                        <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                                        ASPxCallbackPanelHESOLUONG.PerformCallback(cmbBacLuong.GetValue().toString());                                                                        
                                                                    }" EndCallback="InsertItem" />
                                    </dx:ASPxComboBox>
                                </td>
                                <td style="width: 80px;">
                                    Hệ số
                                </td>
                                <td>
                                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanelHESOLUONG" runat="server" ClientInstanceName="ASPxCallbackPanelHESOLUONG"
                                        OnCallback="ASPxCallbackPanelHESOLUONG_Callback" ShowLoadingPanel="false">
                                        <PanelCollection>
                                            <dx:PanelContent ID="PanelContent4" runat="server">
                                                <dx:ASPxTextBox ID="txtHeSoLuongMoi" runat="server" ClientInstanceName="txtHeSoLuongMoi"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" ReadOnly="true" CssPostfix="Glass"
                                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxCallbackPanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="hdthuviec">
                    <td style="width: 126px;">
                        Mức lương thử việc:
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txt_luongthuviec" runat="server" Width="150px" ClientInstanceName="txt_luongthuviec"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left" style="padding-top: 5px;">
                        <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Ký hợp đồng" Width="120px"
                            Image-Url="~/images/imgadmin/reload.png" AutoPostBack="false" Theme="Glass" Font-Size="12px">
                            <ClientSideEvents Click="function(s,e){save();}" />
                            <Image Url="~/images/imgadmin/reload.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

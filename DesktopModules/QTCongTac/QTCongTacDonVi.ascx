<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QTCongTacDonVi.ascx.cs"
    Inherits="DotNetNuke.Modules.QTCongTac.QTCongTacDonVi" %>
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
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<script type="text/javascript">

    var startUpload = false;
    function BoNhiem() {

        var fileA = uploadFileDinhKem.GetText();
        var hasFileA = fileA.length != 0;
        if (!hasFileA) {
            CallbackPanel_DieuChuyen.PerformCallback('Di');
        }
        else {
            startUpload = true;
            uploadFileDinhKem.Upload();
            waitUploadComplete();
        }
    }
    function save() {

        if (cmbDonViMoi.GetSelectedIndex() == -1 || cmbDonViMoi.GetValue() == 0) {

            cmbDonViMoi.SetFocus();
            alert('Xin vui lòng chọn đơn vị!');
            return false;
        }
        else if (cmbChucVuMoi.GetSelectedIndex() == -1 || cmbChucVuMoi.GetValue() == 0) {

            cmbChucVuMoi.SetFocus();
            alert('Xin vui lòng chọn chức vụ !');
            return false;
        }

        else if (cmbChucDanhB.GetSelectedIndex() == -1 || cmbChucDanhB.GetValue() == 0) {

            cmbChucDanhB.SetFocus();
            alert('Xin vui lòng chọn chức danh công việc !');
            return false;
        }
        else if (cmbChucDanh.GetSelectedIndex() == -1 || cmbChucDanh.GetValue() == 0) {

            cmbChucDanh.SetFocus();
            alert('Xin vui lòng chọn chức danh theo thang bảng lương !');
            return false;
        }
        else if (cmbQLNhaNuoc.GetSelectedIndex() == -1 || cmbQLNhaNuoc.GetValue() == 0) {

            cmbQLNhaNuoc.SetFocus();
            alert('Xin vui lòng chọn quản lý nhà nước !');
            return false;
        }
        else if (txtLyDoDieuChuyen.GetText() == "") {

            txtLyDoDieuChuyen.SetFocus();
            alert('Xin vui nhập lý do điều chuyển !');
            return false;
        }
        else if (txtQuyetDinh.GetText() == "") {

            txtQuyetDinh.SetFocus();
            alert('Xin vui lòng nhập quyết định !');
            return false;
        }
        else if (dateNgayBatDau.GetText() == "") {

            dateNgayBatDau.SetFocus();
            alert('Xin vui lòng chọn ngày hiệu lực !');
            return false;
        }
        else { BoNhiem(); }

    }
    function ClearText() {
        txtQuyetDinh.SetText("");
    }

    function waitUploadComplete() {
        if (!startUpload) {
            CallbackPanel_DieuChuyen.PerformCallback('Di');

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }
      
</script>
<dx:ASPxCallbackPanel ID="CallbackPanel_DieuChuyen" runat="server" Width="100%" ClientInstanceName="CallbackPanel_DieuChuyen"
    OnCallback="CallbackPanel_DieuChuyen_Callback">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <asp:Panel ID="panel1" runat="server">
                <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2" width="100%"
                    border="0">
                    <tr>
                        <td valign="top" style="width:200px;">
                            Đơn vị
                        </td>
                        <td valign="top" style="width:220px;">
                            <dx:ASPxComboBox ID="cmbDonViMoi" ClientInstanceName="cmbDonViMoi" runat="server"
                                Width="220px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxComboBox>
                        </td>
                        <td valign="top"  style="width:150px;">
                            Chức vụ mới
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbChucVuMoi" ClientInstanceName="cmbChucVuMoi" runat="server"
                                Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Nhóm chức danh công việc
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbNhomChucDanh" runat="server" ClientInstanceName="cmbNhomChucDanh"
                                DropDownStyle="DropDown" ValueType="System.Int32" EnableIncrementalFiltering="true"
                                IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){cmbChucDanhB.PerformCallback(cmbNhomChucDanh.GetValue());}" />
                            </dx:ASPxComboBox>
                        </td>
                        <td valign="top">
                            Chức danh công việc
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox OnCallback="cmb_chucdanhb_callback" ID="cmbChucDanhB" ClientInstanceName="cmbChucDanhB"
                                runat="server" Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){                                                            
                                                            hf_idQLNN.Set('cdcongviec',s.GetValue());                                                            
                                                       }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Chức danh theo thang bảng lương
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbChucDanh" ClientInstanceName="cmbChucDanh" runat="server"
                                Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                        cmbQLNhaNuoc.PerformCallback(cmbChucDanh.GetValue().toString());                                                        
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td valign="top">
                            Quản lý nhà nước
                        </td>
                        <td valign="top">
                            <dx:ASPxHiddenField ID="hf_idQLNN" ClientInstanceName="hf_idQLNN" runat="server">
                            </dx:ASPxHiddenField>
                            <dx:ASPxComboBox ID="cmbQLNhaNuoc" ClientInstanceName="cmbQLNhaNuoc" runat="server"
                                OnCallback="cmbQLNhaNuoc_Callback" Width="100%" IncrementalFilteringMode="Contains"
                                DropDownStyle="DropDown" ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){                                                            
                                                            hf_idQLNN.Set('idQLNNuoc',s.GetValue());                                                            
                                                       }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Lý do
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtLyDoDieuChuyen" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                ClientInstanceName="txtLyDoDieuChuyen" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            Ngày hiệu lực
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="dateNgayBatDau" ClientInstanceName="dateNgayBatDau" runat="server"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Quyết định
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtQuyetDinh" ClientInstanceName="txtQuyetDinh" runat="server"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                        <td valign="top">
                            File đính kèm
                        </td>
                        <td valign="top">
                            <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                ClientInstanceName="uploadFileDinhKem" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>                  
                    <tr>
                        <td>
                        </td>
                        <td colspan="3" align="left" style="padding: 5px;">
                            <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Điều chuyển" Width="150px"
                                Image-Url="~/images/imgadmin/reload.png" Enabled="false" AutoPostBack="false"
                                Theme="Glass" Font-Size="12px">
                                <ClientSideEvents Click="function(s,e){save();}" />
                                <Image Url="~/images/imgadmin/reload.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </dx:PanelContent>
    </PanelCollection>
    <ClientSideEvents EndCallback="function(s,e)
                {
                    if(CallbackPanel_DieuChuyen.cpResult == true)
                    {

                        alert('Điều chuyển thành công !');
                        ClearText();
                        delete CallbackPanel_DieuChuyen.cpResult;
                    }                    
                }" />
</dx:ASPxCallbackPanel>
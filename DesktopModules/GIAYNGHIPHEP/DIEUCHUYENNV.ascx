<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DIEUCHUYENNV.ascx.cs"
    Inherits="DotNetNuke.Modules.DIEUCHUYENNV.DIEUCHUYENNV" %>
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
    function save() {
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
    
    function waitUploadComplete() {
        if (!startUpload) {
            CallbackPanel_DieuChuyen.PerformCallback();
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
                        <td valign="top" style="width: 100px;">
                            Loại biến động
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_biendong" ClientInstanceName="cmb_biendong" runat="server"
                                Width="150px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                LoadingPanelImagePosition="Top" Theme="Glass"
                                ShowShadow="False">
                            </dx:ASPxComboBox>
                        </td>  
                        <td style="width:100px;">
                            Ngày hiệu lực
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="date_hieuluc" ClientInstanceName="date_hieuluc" runat="server"
                                Theme="Glass" ShowShadow="False" Width="150px">
                            </dx:ASPxDateEdit>
                        </td>                      
                    </tr> 
                    <tr>
                        <td valign="top" style="width: 150px;" >
                            <dx:ASPxLabel ID="lbl_donvi" runat="server" ClientInstanceName="lbl_donvi" Text="Đơn vị" />
                        </td>
                        <td valign="top" colspan="3">
                            <dx:ASPxComboBox ID="cmb_tochuc" ClientInstanceName="cmb_tochuc" runat="server"
                                Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                LoadingPanelImagePosition="Top" Theme="Glass"
                                ShowShadow="False">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;">
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
                                ClientInstanceName="uploadFileDinhKem" Width="100%" Theme="Glass">
                                <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>              
                    <tr>
                        <td style="width: 150px;">
                            Lý do
                        </td>
                        <td colspan="3">
                            <dx:ASPxTextBox ID="txt_lydo" runat="server" 
                                ClientInstanceName="txt_lydo" Theme="Glass"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>                        
                    </tr>                                     
                    <tr>
                        <td>
                        </td>
                        <td colspan="3" align="left" style="padding: 5px;">
                            <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Lưu" Width="150px"
                                Image-Url="~/images/imgadmin/save.png" AutoPostBack="false"
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
                alert('Lưu dữ liệu thành công !');                
                delete CallbackPanel_DieuChuyen.cpResult;
                location.reload();
            }                    
        }" />
</dx:ASPxCallbackPanel>
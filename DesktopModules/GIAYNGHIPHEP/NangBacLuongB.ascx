<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NangBacLuongB.ascx.cs"
    Inherits="DotNetNuke.Modules.GIAYNGHIPHEP.NangBacLuongB" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
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

        var startUpload = false;
        function NangBacLuong() {

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
            
            if (dateNgayKi.GetText() =="") {

                dateNgayKi.SetFocus();
                alert('Xin vui lòng chọn ngày ký !');
                return false;
            }
            else if (dateNgayThiThanh.GetValue() == "") {

                dateNgayThiThanh.SetFocus();
                alert('Xin vui lòng chọn ngày hiệu lực !');
                return false;
            }

            else if (cmbNhomLuongA.GetSelectedIndex() == -1 || cmbNhomLuongA.GetValue() == 0) {

                cmbNhomLuongA.SetFocus();
                alert('Xin vui lòng chọn nhóm lương !');
                return false;
            }
            else if (cmbBacLuongMoi.GetSelectedIndex() == -1 || cmbBacLuongMoi.GetValue() == 0) {

                cmbBacLuongMoi.SetFocus();
                alert('Xin vui lòng chọn bậc lương !');
                return false;
            }
            else if (txtQuyetDinh.GetText() == "") {

                txtQuyetDinh.SetFocus();
                alert('Xin vui lòng nhập quyết định !');
                return false;
            }
            else if (txtHeSoLuongMoi.GetText() == "") {

                txtHeSoLuongMoi.SetFocus();
                alert('Xin vui lòng nhập hệ số lương !');
                return false;
            }
            else { NangBacLuong(); }

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
<script type="text/javascript">
    
    function OnLuongAChanged(s,e) {
        cmbBacLuongMoi.PerformCallback(cmbNhomLuongA.GetValue().toString());
        txtHeSoLuongMoi.SetText('');
    }
    function OnTypeChanged(s,e) {
        ASPxCallbackPanelHESOLUONG.PerformCallback(cmbBacLuongMoi.GetValue().toString());
    }
    function checkDate() {
        var date1 = dateNgayKi.GetValue();
        var ngay1 = date1.getDate();
        var thang1 = date1.getMonth() + 1;
        var nam1 = date1.getYear() + 1900;

        var date2 = dateNgayThiThanh.GetValue();
        var ngay2 = date2.getDate();
        var thang2 = date2.getMonth() + 1;
        var nam2 = date2.getYear() + 1900;

        var d1 = Date.UTC(nam1, thang1, ngay1);
        var d2 = Date.UTC(nam2, thang2, ngay2);
        if (d2 < d1) {
            alert("Ngày có hiệu lực phải lớn hơn hoặc bằng ngày ký !");            
        }
        else {
            btDieuChuyen.SetEnabled(true);
        }
    }
</script>
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
        padding: 5px 3px;
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
        padding: 3px 5px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
</style>
<table cellpadding="2" cellspacing="0" width="100%">

    <tr>
        <td valign="top">
           
                            <dx:ASPxCallbackPanel ID="CallbackPanel_DieuChuyen" runat="server" 
                            ClientInstanceName="CallbackPanel_DieuChuyen"
                OnCallback="CallbackPanel_DieuChuyen_Callback"  width="100%">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                       
                            
                                        <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2px" border="0" width="100%">
                                            <tr>
                                                <td valign="top" style="width: 180px;">
                                                   
                                                    Họ và Tên
                                                </td>
                                                <td style="font-weight: bold;width: 220px;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_TenNV" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td style="width: 120px;" valign="top">
                                                    Mã NV:
                                                </td>
                                                <td style="font-weight: bold;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_MaNV" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Đơn vị công tác
                                                </td>
                                                <td style="font-weight: bold;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_DonViHienTai" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            
                                                <td valign="top">
                                                    Chức vụ
                                                </td>
                                                <td colspan="3" style="font-weight: bold;" valign="top">
                                                    <dx:ASPxLabel ID="lblChucVu" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Trình độ
                                                </td>
                                                <td  style="font-weight: bold;">
                                                    <dx:ASPxLabel ID="lbl_BacLuongCu" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                                 <td valign="top">
                                                   Chức danh 
                                                </td>
                                                <td  style="font-weight: bold;">
                                                    <dx:ASPxLabel ID="lblChucDanh" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Ngạch lương đang hưởng
                                                </td>
                                                <td valign="top" colspan="3" >
                                                    <dx:ASPxLabel ID="lbl_NgachDangHuong" runat="server" EncodeHtml="false">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="4" valign="top" style="background-color: #9ECED6; font-weight: bold;
                                                    color: #494949;">
                                                    Ngạch/Bậc lương mới 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >
                                                    Ngày ký
                                                </td>
                                                <td >
                                                    <dx:ASPxDateEdit ID="dateNgayKi" runat="server" ClientInstanceName="dateNgayKi" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                        Width="100%">
                                                       
                                                    </dx:ASPxDateEdit>
                                                </td>                                            
                                                <td>
                                                    Ngày hiệu lực
                                                </td>
                                                <td >
                                                    <dx:ASPxDateEdit ID="dateNgayThiThanh" runat="server" ClientInstanceName="dateNgayThiThanh"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                                       
                                                        <ClientSideEvents DateChanged="function(s,e){checkDate();}" />
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                             <td>
                                                    Lý do nâng bậc
                                                </td>
                                                <td >
                                                    <dx:ASPxTextBox ID="txtLyDoNangBac"  runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                                        
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td valign="top">
                                                    Ngạch lương mới
                                                </td>
                                                <td >
                                                    <dx:ASPxComboBox ID="cmbNhomLuongA" runat="server" ClientInstanceName="cmbNhomLuongA"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32"
                                                        Width="100%">
                                                        
                                                        <ClientSideEvents SelectedIndexChanged="OnLuongAChanged" />
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Bậc lương A
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbBacLuongMoi" runat="server" 
                                                        ClientInstanceName="cmbBacLuongMoi"
                                                        Width="100%" OnCallback="cmbBacLuongMoi_CallBack" ValueType="System.Int32"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" 
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                        
                                                        <ClientSideEvents SelectedIndexChanged="OnTypeChanged" />
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td>
                                                    Hệ số
                                                </td>
                                                <td>
                                                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanelHESOLUONG" runat="server" ClientInstanceName="ASPxCallbackPanelHESOLUONG"
                                                        OnCallback="ASPxCallbackPanelHESOLUONG_Callback">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent3" runat="server">
                                                               
                                                                <dx:ASPxTextBox ID="txtHeSoLuongMoi" runat="server" ClientInstanceName="txtHeSoLuongMoi"
                                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                                    Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxCallbackPanel>
                                                </td>
                                            </tr>
                                                                              
                                            <tr>
                                                <td>
                                                    Quyết định
                                                </td>
                                                <td >
                                                    <dx:ASPxTextBox ID="txtQuyetDinh" ClientInstanceName="txtQuyetDinh" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                                       
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
                                                
                                                <td colspan="3" align="left" style="padding-top: 5px;">
                                                 <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Nâng lương công việc" Width="180px" Image-Url="~/images/imgadmin/reload.png"
                                                                Enabled="false" AutoPostBack="false" ClientInstanceName="btDieuChuyen" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                 <ClientSideEvents Click="function(s,e){save();}" />
                                                                <Image Url="~/images/imgadmin/reload.png">
                                                                </Image>
                                                            </dx:ASPxButton>
                                                 
                                                </td>
                                            </tr>
                                        </table>
                                    
                  
                       
                    </dx:PanelContent>
                </PanelCollection>
               <ClientSideEvents EndCallback="function(s,e)
                {
                    if(CallbackPanel_DieuChuyen.cpResult == true)
                    {

                        alert('Nâng bậc lương thành công !');
                        ClearText();
                        delete CallbackPanel_DieuChuyen.cpResult;
                    }                    
                }" />
               
            </dx:ASPxCallbackPanel>
                          
        </td>       
    </tr>
</table>



<%--
 <asp:Panel ID="panel2" runat="server">
                            <dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False' ReportViewer="<%# ReportViewer1 %>"
                                Font-Names="Tahoma" Font-Size="9pt" ItemSpacing="2px" SeparatorColor="#A3C0E8"
                                SeparatorHeight="100%" SeparatorWidth="1px" Width="100%">
                                <Border BorderColor="#A3C0E8" BorderStyle="Solid" BorderWidth="1px" />
                                <Items>
                                    <dx:ReportToolbarButton Name="dong" ImageUrl="../../images/imgadmin/delete_16.png" />
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
                                <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                </Images>
                                <ClientSideEvents ItemClick="function(s, e) {
	if(e.item.name == 'dong'){
		location.reload(true);
	}
}" />
                                <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                    <LabelStyle ForeColor="#2C4D79">
                                        <Margins MarginLeft='3px' MarginRight='3px' />
                                    </LabelStyle>
                                    <ComboBoxStyle>
                                        <Margins MarginLeft="3px" MarginRight="3px" />
                                    </ComboBoxStyle>
                                    <ComboBoxButtonStyle>
                                        <DropDownButtonImage>
                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                        </DropDownButtonImage>
                                    </ComboBoxButtonStyle>
                                    <TextBoxStyle>
                                        <Margins MarginLeft="2px" MarginRight="2px" />
                                    </TextBoxStyle>
                                    <ButtonStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </ButtonStyle>
                                </Styles>
                            </dx:ReportToolbar>
                            <dx:ReportViewer ID="ReportViewer1" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelText="" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <LoadingPanelStyle ForeColor="#303030">
                                </LoadingPanelStyle>
                            </dx:ReportViewer>
                        </asp:Panel>--%>
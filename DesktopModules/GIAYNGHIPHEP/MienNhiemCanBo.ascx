<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MienNhiemCanBo.ascx.cs" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.BoNhiemCanBo" %>
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
           function MienNhiem() {
              
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
              
               if (cmbDonViMoi.GetValue() == 0) {

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
               else if (txtLyDoMienNhiem.GetText() == "") {

                   txtLyDoMienNhiem.SetFocus();
                   alert('Xin vui lòng nhập lý do miễn nhiệm !');
                   return false;
               }
               else if (txtQuyetDinh.GetText() == "") {

                   txtQuyetDinh.SetFocus();
                   alert('Xin vui lòng nhập quyết định !');
                   return false;
               }
               else if (dateHieuLuc.GetText() == "") {

                   dateHieuLuc.SetFocus();
                   alert('Xin vui lòng chọn ngày hiệu lực !');
                   return false;
               }
               else {  MienNhiem(); }

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

       <dx:ASPxCallbackPanel ID="CallbackPanel_DieuChuyen" runat="server" 
                ClientInstanceName="CallbackPanel_DieuChuyen" Width="100%"
                OnCallback="CallbackPanel_DieuChuyen_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <asp:Panel ID="panel1" runat="server">
                         
                               <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2" width="100%" border="0">
                                            
                                            <tr>
                                                <td valign="top" style="width: 150px;">
                                                    Đơn vị
                                                </td>
                                                <td valign="top" style="width:250px;">
                                                    <dx:ASPxComboBox ID="cmbDonViMoi" ClientInstanceName="cmbDonViMoi" runat="server"
                                                        Width="250px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td valign="top" style="width: 150px;">
                                                    Chức vụ mới
                                                </td>
                                                <td valign="top" >
                                                <dx:ASPxComboBox ID="cmbChucVuMoi" ClientInstanceName="cmbChucVuMoi" runat="server"
                                                        Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxComboBox>
                                                  
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                                <td valign="top" style="width: 150px;">
                                                    Nhóm chức danh công việc
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxComboBox ID="cmbNhomChucDanh" runat="server" ClientInstanceName="cmbNhomChucDanh"
                                                        DropDownStyle="DropDown" ValueType="System.Int32" EnableIncrementalFiltering="true"
                                                        IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                        Width="250px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){cmbChucDanhB.PerformCallback(cmbNhomChucDanh.GetValue());}" />
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td valign="top" style="width: 150px;">
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
                                                <td valign="top" style="width: 150px;">
                                                   Chức danh theo thang bảng lương
                                                </td>
                                                <td valign="top">
                                                  <dx:ASPxComboBox ID="cmbChucDanh" ClientInstanceName="cmbChucDanh" runat="server"
                                                        Width="250px" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                        cmbQLNhaNuoc.PerformCallback(cmbChucDanh.GetValue().toString());                                                        
                                                    }" />
                                                    </dx:ASPxComboBox>
                                                  
                                                </td>
                                                <td valign="top" style="width: 150px;">
                                                    Quản lý nhà nước
                                                </td>
                                                <td valign="top">
                                                       <dx:ASPxHiddenField ID="hf_idQLNN" ClientInstanceName="hf_idQLNN" runat="server">
                                                    </dx:ASPxHiddenField>
                                                       <dx:ASPxComboBox ID="cmbQLNhaNuoc" ClientInstanceName="cmbQLNhaNuoc" runat="server"
                                                        OnCallback="cmbQLNhaNuoc_Callback" Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                                        ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                         <ClientSideEvents SelectedIndexChanged="function(s,e){                                                            
                                                            hf_idQLNN.Set('idQLNNuoc',s.GetValue());                                                            
                                                       }" />
                                                    </dx:ASPxComboBox>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td  style="width: 150px;">
                                                    Lý do 
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtLyDoMienNhiem" ClientInstanceName="txtLyDoMienNhiem" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="250px">
                                                       
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width: 150px;">
                                                    Quyết định
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxTextBox ID="txtQuyetDinh" ClientInstanceName="txtQuyetDinh" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                                        
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" style="width: 150px;">
                                                    File quyết định
                                                </td>
                                                <td valign="top">
                                                  
                                                    <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                                        ClientInstanceName="uploadFileDinhKem" Width="250px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                        <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />        
                                                    </dx:ASPxUploadControl>
                                                </td>
                                                <td style="width: 150px;">
                                                    Ngày hiệu lực
                                                </td>
                                                <td>
                                                    <dx:ASPxDateEdit ID="dateHieuLuc" ClientInstanceName="dateHieuLuc" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                        Width="100%">
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <CalendarProperties>
                                                            <HeaderStyle Spacing="1px" />
                                                            <FooterStyle Spacing="17px" />
                                                        </CalendarProperties>
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td colspan="3" align="left" style="padding: 5px;">
                                                   <dx:ASPxButton ID="btDieuChuyen" runat="server" Text="Miễn nhiệm" Width="150px" Image-Url="~/images/imgadmin/reload.png"
                                                                    Enabled="false" AutoPostBack="false" theme="Glass" Font-Size="12px">
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

                        alert('Miễn nhiệm thành công !');
                        ClearText();
                        delete CallbackPanel_DieuChuyen.cpResult;
                    }                    
                }" />
            </dx:ASPxCallbackPanel>                  
       
<%--

       <asp:Panel ID ="panel2" runat ="server">
                            <dx:ReportToolbar ID="ReportToolbar1" runat='server' ShowDefaultButtons='False'
                                ReportViewer="<%# ReportViewer1 %>" 
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
                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" 
                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
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
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                LoadingPanelText="" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <LoadingPanelStyle ForeColor="#303030">
                                </LoadingPanelStyle>
                            </dx:ReportViewer>
                        </asp:Panel>--%>
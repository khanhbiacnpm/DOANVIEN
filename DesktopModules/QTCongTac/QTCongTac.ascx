<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QTCongTac.ascx.cs" Inherits="VNPT.Modules.QTCongTac.QTCongTac" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    
<script type="text/javascript">
    var startUploadB = false;
    function capnhatQTCT() {
        var file = uploadFileDinhKemTagQTCT.GetText();
        var hasFile = file.length != 0;
        if (!hasFile) {
            grdQuaTrinhCongTac.UpdateEdit();
        }
        else {
            startUploadB = true;
            uploadFileDinhKemTagQTCT.Upload();
            waitUploadComplete();
        }
    }
    function waitUploadComplete() {
        if (!startUploadB) {
            grdQuaTrinhCongTac.UpdateEdit();
        }
        else {
            setTimeout("waitUploadComplete()", 1000);
        }
    }
    function saveB() {
        if (cmb_donvi.GetValue() == 0 && txt_donvi.GetText() == '') {
            cmb_donvi.SetFocus();
            alert('Xin vui lòng chọn đơn vị hoặc đơn vị khác !');
            return false;
        }
//        else if (cmb_chucdanhb.GetValue() == 0) {
//            cmb_chucdanhb.SetFocus();
//            alert('Xin vui lòng chọn chức danh công việc !');
//            return false;
//        }
//        else if (cmb_chucdanh.GetValue() == 0) {
//            cmb_chucdanh.SetFocus();
//            alert('Xin vui lòng chọn chức danh theo thang bảng lương nhà nước !');
//            return false;
//        }
//        else if (cmb_quanlynhanuoc.GetSelectedIndex() == -1 || cmb_quanlynhanuoc.GetValue() == 0) {
//            cmb_quanlynhanuoc.SetFocus();
//            alert('Xin vui lòng chọn quản lý nhà nước !');
//            return false;
//        }
        else if (cmb_chucvu.GetValue() == 0) {
            cmb_chucvu.SetFocus();
            alert('Xin vui lòng chọn chức vụ !');
            return false;
        }
        else if (date_batdau.GetText() == "") {

            date_batdau.SetFocus();
            alert('Xin vui lòng chọn ngày bắt đầu !');
            return false;
        }
        else { capnhatQTCT(); }
    }    
    
</script>
    <div style="height:430px;overflow:scroll;">
<dx:aspxgridview id="grdQuaTrinhCongTac" runat="server" autogeneratecolumns="False" clientinstancename="grdQuaTrinhCongTac"
    Theme="Glass" keyfieldname="id" Font-Size="12px"    
    onrowdeleting="grdQuaTrinhCongTac_RowDeleting"
    onrowinserting="grdQuaTrinhCongTac_RowInserting" 
    onrowupdating="grdQuaTrinhCongTac_RowUpdating"
    OnHtmlEditFormCreated="grdQuaTrinhCongTac_EditFormCreated"
    width="100%" >
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin lịch sử công tác" />
    <SettingsLoadingPanel ImagePosition="Top" />  
    <ClientSideEvents RowDblClick="function(s, e) {grdQuaTrinhCongTac.StartEditRow(e.visibleIndex);}" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" Width="30">
            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
            <CellStyle HorizontalAlign="Center" />
        </dx:GridViewDataColumn>       
        <dx:GridViewDataColumn Caption="Đơn vị" FieldName="tendonvi">            
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Chức vụ" FieldName="chucvu">             
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="QLNN" FieldName="qlnn"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Chức danh" FieldName="chucdanh" />
        <dx:GridViewDataColumn Caption="Chức danh B" FieldName="chucdanhB" />
        <dx:GridViewDataTextColumn Caption="Ngày bắt đầu" FieldName="ngayquyetdinh">
            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Ngày kết thúc" FieldName="ngayketthuc">
            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataColumn Caption="Quyết định" FieldName="quyetdinh">
            <DataItemTemplate>
                <a target="_blank" href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("filequyetdinh") %>'><%# Eval("quyetdinh") %></a>                
            </DataItemTemplate>
        </dx:GridViewDataColumn>       
        <dx:GridViewDataColumn FieldName="filequyetdinh" Visible="false" />
        <dx:GridViewDataColumn FieldName="idchucdanh" Visible="false" />
        <dx:GridViewDataColumn FieldName="IdNhomChucDanhB" Visible="false" />
        <dx:GridViewDataColumn FieldName="idchucdanhb" Visible="false" />
        <dx:GridViewDataColumn FieldName="idqlnn" Visible="false" />        
        <dx:GridViewDataColumn FieldName="idchucvu" Visible="false" />
        <dx:GridViewDataColumn FieldName="iddonvi" Visible="false" />
        <dx:GridViewDataColumn FieldName="dvkhac" Visible="false" />
    </Columns>   
    <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
        </LoadingPanel>
    </Images>
    <ImagesEditors>
        <DropDownEditDropDown>
            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
        </DropDownEditDropDown>
        <SpinEditIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Glass" />
        </SpinEditIncrement>
        <SpinEditDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Glass" />
        </SpinEditDecrement>
        <SpinEditLargeIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Glass" />
        </SpinEditLargeIncrement>
        <SpinEditLargeDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Glass"
                PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Glass" />
        </SpinEditLargeDecrement>
    </ImagesEditors>
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
    <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
        <Header Font-Bold="True">
        </Header>
        <HeaderPanel Font-Bold="True">
        </HeaderPanel>
        <LoadingPanel ImageSpacing="8px">
        </LoadingPanel>
        <TitlePanel Font-Bold="True">
        </TitlePanel>
    </Styles>
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table cellpadding="1" cellspacing="1" width="500px" style="font-size: 10pt; font-family:Times New Roman;">                    
                
                    <tr>
                        <td valign="top" style="width:150px">
                            Đơn vị
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_donvi" ClientInstanceName="cmb_donvi" runat="server" Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                ShowShadow="False" Theme="Glass">
                                <ClientSideEvents Init="function(s,e){ if(grdQuaTrinhCongTac.IsNewRowEditing()){s.SetSelectedIndex(0)}}" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                          <tr>
                        <td valign="top" style="width:150px">
                            Đơn vị khác
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_donvi" ClientInstanceName="txt_donvi" runat="server" Width="100%" Text='<%# Eval("dvkhac") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                     <tr>
                        <td valign="top" style="width:150px">Nhóm chức danh công việc</td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbNhomChucDanh" runat="server" ClientInstanceName="cmbNhomChucDanh" DropDownStyle="DropDown" ValueType="System.Int32"
                                EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">                               
                                <ClientSideEvents SelectedIndexChanged="function(s,e){cmb_chucdanhb.PerformCallback(cmbNhomChucDanh.GetValue());}"
                                        Init="function(s,e){ if(grdQuaTrinhCongTac.IsNewRowEditing()){s.InsertItem(0,'-- Chọn --','0');}}" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>             
                    <tr>
                        <td valign="top" style="width:150px">Chức danh công việc</td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucdanhb" runat="server" ClientInstanceName="cmb_chucdanhb" DropDownStyle="DropDown" ValueType="System.Int32"
                             OnCallback="cmb_chucdanhb_callback"   EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">                               
                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                     <tr>
                        <td valign="top" style="width:150px">Chức danh theo ngạch bậc</td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucdanh" runat="server" ClientInstanceName="cmb_chucdanh" DropDownStyle="DropDown" ValueType="System.Int32"
                                EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">                               
                                <ClientSideEvents SelectedIndexChanged="function(s,e){cmb_quanlynhanuoc.PerformCallback(cmb_chucdanh.GetValue());}"
                                        Init="function(s,e){ if(grdQuaTrinhCongTac.IsNewRowEditing()){s.InsertItem(0,'-- Chọn --','0');}}" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width:150px">QL nhà nước</td>
                        <td valign="top">                             
                            <dx:ASPxComboBox ID="cmb_quanlynhanuoc" runat="server" ClientInstanceName="cmb_quanlynhanuoc" ValueType="System.Int32"
                                OnCallback="cmb_quanlynhanuoc_callback" EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">                               
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width:150px">
                            Chức vụ
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_chucvu" runat="server" DropDownStyle="DropDown" ValueType="System.Int32" ClientInstanceName="cmb_chucvu"
                                IncrementalFilteringMode="Contains"
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){ if(grdQuaTrinhCongTac.IsNewRowEditing()){s.InsertItem(0,'-- Chọn --','0'); s.SetSelectedIndex(0)}}" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td valign="top" style="width:150px">
                            Quyết định
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_quyetdinh" runat="server" Text='<%# Eval("quyetdinh") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                              
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width:150px">
                            File đính kèm
                        </td>
                        <td valign="top">                            
                            <dx:ASPxUploadControl ID="uploadFileDinhKemTagQTCT" runat="server" OnFileUploadComplete="uploadFileDinhKemTagQTCT_Load"
                                ClientInstanceName="uploadFileDinhKemTagQTCT" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                                <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUploadB = false;
                        }" />   
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width:150px">
                            Ngày bắt đầu
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_batdau" runat="server" Value = '<%# Eval("ngayquyetdinh") %>' DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" ClientInstanceName="date_batdau"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width:150px">
                            Ngày kết thúc
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_ketthuc" runat="server" Value = '<%# Eval("ngayketthuc") %>' DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                      saveB();
                                      }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng"  Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        grdQuaTrinhCongTac.CancelEdit();                                        
                                     }" />
                                </dx:ASPxButton>
                            </div>
                        </td>                         
                    </tr>
                </table>
            </div>
        </EditForm>
       
    </Templates>                                                     
</dx:aspxgridview>
    </div>

     <div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false"  Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdQuaTrinhCongTac.AddNewRow()                            
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                            
                            grdQuaTrinhCongTac.StartEditRow(grdQuaTrinhCongTac.GetFocusedRowIndex());                           
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                            grdQuaTrinhCongTac.DeleteRow(grdQuaTrinhCongTac.GetFocusedRowIndex());
                            }
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
                </div>
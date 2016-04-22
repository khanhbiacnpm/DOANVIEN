<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LuongA.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.LuongA" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" 
    Namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<style type="text/css">
    h1
    {
        margin: 5px 0;
    }
    .container
    {
        margin: 3px auto;
    }
    ul.tabs
    {
        margin: 0;
        padding: 0;
        float: left;
        list-style: none;
        height: 24px;
      
        width: 100%;
    }
    ul.tabs li
    {background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
    background-position: center top;
    background-repeat: repeat-x;
   
    color: #333333;
    font: 9pt Tahoma;
    padding: 3px 5px;
        
        float: left;
        margin: 0;
        padding: 0;
        height: 24px;
        line-height: 24px;
        border: 1px solid #7EACB1;
       
        border-bottom: none;
        margin-bottom: -1px;
      
        overflow: hidden;
        position: relative;
    }
    ul.tabs li a
    {
        text-decoration: none;
        color: #333333;
        display: block;
        font-size: 0.9em;
        padding: 0 10px;
        outline: none;
    }
    ul.tabs li a:hover
    {
        background: #d9eced;
    }
    html ul.tabs li.active, html ul.tabs li.active a:hover
    {
        background: #d9eced;
    }
    .tab_container
    {        
        border: none;
        clear: both;
        float: left;
        width: 100%;
        background: #edf3f4;
        -moz-border-radius-bottomright: 5px;
        -khtml-border-radius-bottomright: 5px;
        -webkit-border-bottom-right-radius: 5px;
        -moz-border-radius-bottomleft: 5px;
        -khtml-border-radius-bottomleft: 5px;
        -webkit-border-bottom-left-radius: 5px;
    }
    .tab_content
    {
       
        font-size: 1em;
        background:#edf3f4;
    }
    .tab_content h2
    {
        font-weight: normal;
        padding-bottom: 10px;
        border-bottom: 1px dashed #ddd;
        font-size: 1.8em;
    }
    .tab_content h3 a
    {
        color: #254588;
    }
</style>
<script type="text/javascript">

    var startUpload = false;
    function capnhatLuongA() {
        var fileA = uploadFileDinhKemTagA.GetText();
        var hasFileA = fileA.length != 0;
        if (!hasFileA) {
            gridLuongA.UpdateEdit();
        }
        else {
            startUpload = true;
            uploadFileDinhKemTagA.Upload();
            waitUploadComplete();

        }
    }
    function save() {


        if (date_thoidiem.GetText() == "") {
           
            date_thoidiem.SetFocus();
            alert('Xin vui lòng chọn ngày thay đổi !');
            return false;
        }
        else if (cmb_nhomluong.GetSelectedIndex() == -1 || cmb_nhomluong.GetValue() == 0) {
           
            cmb_nhomluong.SetFocus();
            alert('Xin vui lòng chọn nhóm lương !');
            return false;
        }
        else if (cmb_bacluong.GetSelectedIndex() == -1 || cmb_bacluong.GetValue() == 0) {

            cmb_bacluong.SetFocus();
            alert('Xin vui lòng chọn bậc lương !');
            return false;
        }
        else if (txt_heso.GetText() == "") {

            txt_heso.SetFocus();
            alert('Xin vui lòng nhập hệ số !');
            return false;
        }
        else { capnhatLuongA();}

    }


    function waitUploadComplete() {
        if (!startUpload) {
            gridLuongA.UpdateEdit();

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }
   
</script>

<script type="text/javascript">
    var startUploadB = false;
    function capnhatLuongB() {
        var file = uploadFileDinhKemTagB.GetText();
        var hasFile = file.length != 0;
        if (!hasFile) {
            gridLuongB.UpdateEdit();
        }
        else {
            startUploadB = true;
            uploadFileDinhKemTagB.Upload();
            waitUploadCompleteB();
        }
    }
    function saveB() {
        if (date_thoidiemB.GetText() == "") {

            date_thoidiemB.SetFocus();
            alert('Xin vui lòng chọn ngày thay đổi !');
            return false;
        }
        else if (cmb_nhomluongB.GetSelectedIndex() == -1 || cmb_nhomluongB.GetValue() == 0) {

            cmb_nhomluongB.SetFocus();
            alert('Xin vui lòng chọn nhóm lương !');
            return false;
        }
        else if (cmb_bacluongB.GetSelectedIndex() == -1 || cmb_bacluongB.GetValue() == 0) {

            cmb_bacluongB.SetFocus();
            alert('Xin vui lòng chọn bậc lương !');
            return false;
        }
        else if (txt_hesoB.GetText() == "") {

            txt_hesoB.SetFocus();
            alert('Xin vui lòng nhập hệ số !');
            return false;
        }
        else { capnhatLuongB(); }
    }

    function waitUploadCompleteB() {
        if (!startUploadB) {
            gridLuongB.UpdateEdit();

        }
        else {

            setTimeout("waitUploadCompleteB()", 1000);
        }
    }
    
</script>
<dx:ASPxHiddenField ID="hf_idQLNN" ClientInstanceName="hf_idQLNN" runat="server"></dx:ASPxHiddenField>
<dx:ASPxHiddenField ID="hdLuongB" ClientInstanceName="hdLuongB" runat="server"></dx:ASPxHiddenField>
   <dx:ASPxGridView ID="gridLuongA" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridLuongA"
    Theme="Glass" Font-Size="12px" KeyFieldName="id" Width="100%"
    OnRowInserting="gridLuongA_RowInserting"
    OnRowUpdating="gridLuongA_RowUpdating" 
    OnRowDeleting="gridLuongA_RowDeleting"
    OnHtmlEditFormCreated="gridLuongA_OnHtmlEditFormCreated">    
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />   
    <SettingsPager PageSize="20" Visible="False">
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin lương A" /> 
    <ClientSideEvents RowDblClick="function(s, e) {gridLuongA.StartEditRow(e.visibleIndex);}" />
    <Columns>        
        <dx:GridViewDataColumn Caption="STT" Width="30px">
            <DataItemTemplate><%# Container.ItemIndex + 1 %></DataItemTemplate>
            <CellStyle HorizontalAlign="Center"></CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thang lương/Bảng lương" FieldName="nhomluong" />
        <dx:GridViewDataColumn Caption="Bậc lương" FieldName="bacluong" />
        <dx:GridViewDataColumn Caption="Hệ số" FieldName="heso" />                              
        <dx:GridViewDataTextColumn Caption="Thay đổi từ ngày" FieldName="thoidiemtu">
            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Đến ngày" FieldName="denngay">
            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataColumn Caption="Số QĐ" FieldName="soqd">
            <DataItemTemplate>                
                <a href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>' target="_blank"><%# Eval("soqd") %></a>
            </DataItemTemplate>           
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Ghi chú" FieldName="ghichu" />
        <dx:GridViewDataColumn FieldName="idnhomluong" Visible="false" />
        <dx:GridViewDataColumn FieldName="idbacluong" Visible="false" />
        <dx:GridViewDataColumn FieldName="fileqd" Visible="false" />
    </Columns>       
    <SettingsLoadingPanel ImagePosition="Top" />
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
                <table cellpadding="1" cellspacing="1" width="500px" style="font-family: Verdana;
                    font-size: 10pt;">                    
                    <tr>
                        <td valign="top">
                            Thay đổi từ ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_thoidiem" ClientInstanceName="date_thoidiem" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Value = '<%# Eval("thoidiemtu") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">                                
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>  
                    <tr>
                        <td valign="top">
                            Đến ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="date_denngay" ClientInstanceName="date_denngay" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Value = '<%# Eval("denngay") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">                                
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>                 
                    <tr>
                        <td valign="top" style="width: 130px;">
                            Nhóm lương A
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_nhomluong" ClientInstanceName="cmb_nhomluong"  runat="server" IncrementalFilteringMode="Contains" ValueType="System.Int32"
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                <ClientSideEvents Init="function(s,e){
                                                        if(gridLuongA.IsNewRowEditing()){
                                                            s.InsertItem(0,'-- Chọn --','0');
                                                            s.SetSelectedIndex(0);
                                                        }
                                                    }"
                                                    SelectedIndexChanged="function(s,e){
                                                        cmb_bacluong.PerformCallback(s.GetValue());
                                                
                                                                                  
                                                    }" />                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Bậc lương A
                        </td>
                        <td valign="top">
                     
                            <dx:ASPxComboBox ID="cmb_bacluong" runat="server"  ClientInstanceName="cmb_bacluong" 
                                OnCallback="cmb_bacluong_OnCallback" DropDownStyle="DropDown"                           
                                IncrementalFilteringMode="Contains" ValueType="System.String"                                 
                                Width="100%"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" 
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                <ClientSideEvents Init="function(s,e){  hf_idQLNN.Set('bacluong',s.GetValue());    }" SelectedIndexChanged="function(s,e){
                                    cb_heso.PerformCallback(s.GetValue());
                                    hf_idQLNN.Set('bacluong',s.GetValue());                                                            
                                  
                                }" EndCallback =
                                    "function(s,e){
                                    if(gridLuongA.IsNewRowEditing()){
                                        s.InsertItem(0, '-- Chọn --', '0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Hệ số
                        </td>
                        <td valign="top">
                            <dx:ASPxCallback ID="cb_heso" runat="server" ClientInstanceName="cb_heso"
                                OnCallback="cb_heso_OnCallback">
                                <ClientSideEvents EndCallback="function(s,e){
                                    txt_heso.SetValue(cb_heso.cpHeso);                                    
                                }" />
                            </dx:ASPxCallback>
                            <dx:ASPxTextBox ID="txt_heso" runat="server" Width="100%" ClientInstanceName="txt_heso" Text='<%# Eval("heso") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td valign="top">
                            Số QĐ
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_soqd" runat="server" Text='<%# Eval("soqd") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                               
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            File đính kèm
                        </td>
                        <td valign="top">
                            
                            <dx:ASPxUploadControl ID="uploadFileDinhKemTagA" runat="server" 
                                OnFileUploadComplete="uploadFileDinhKemTagA_Load"
                                ClientInstanceName="uploadFileDinhKemTagA" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                          
                                 <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />                     
                            </dx:ASPxUploadControl>

                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Ghi chú
                        </td>
                        <td valign="top">
                            <dx:ASPxMemo ID="memo_ghichu" runat="server" Height="40" Width="100%" Text='<%# Eval("ghichu") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                               
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                   
                                            save();
                                           
                                        
                                    }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){gridLuongA.CancelEdit();}" />
                                </dx:ASPxButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </EditForm>
      
    </Templates>    
</dx:ASPxGridView>
<div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false"  Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            gridLuongA.AddNewRow()                            
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                            
                            gridLuongA.StartEditRow(gridLuongA.GetFocusedRowIndex());                           
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                            gridLuongA.DeleteRow(gridLuongA.GetFocusedRowIndex());
                            }
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
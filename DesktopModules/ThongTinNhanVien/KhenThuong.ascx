<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KhenThuong.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.KhenThuong" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
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
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
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
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
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
        background: #edf3f4;
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
    function capnhatKhenThuong() {
        var fileA = uploadFileDinhTagKemKThuong.GetText();
        var hasFileA = fileA.length != 0;
        if (!hasFileA) {
            grdReward.UpdateEdit();
        }
        else {
            startUpload = true;
            uploadFileDinhTagKemKThuong.Upload();
            waitUploadComplete();

        }
    }
    function saveKT() {


        
        
        

        if (txt_quyetdinhKT.GetText() == "") {

            txt_quyetdinhKT.SetFocus();
            alert('Xin vui lòng nhập quyết định !');
            return false;
        }
        else if (txt_capquyetdinhKT.GetText() == "") {

            txt_capquyetdinhKT.SetFocus();
            alert('Xin vui lòng nhập cấp khen thưởng !');
            return false;
        }
        else if (txt_thoidiemKT.GetText() == "") {

            txt_thoidiemKT.SetFocus();
            alert('Xin vui lòng nhập thời điểm !');
            return false;
        }
        else if (memo_noidungKT.GetText() == "") {

            memo_noidungKT.SetFocus();
            alert('Xin vui lòng nhập nội dung !');
            return false;
        }
        else { capnhatKhenThuong(); }

    }


    function waitUploadComplete() {
        if (!startUpload) {
            grdReward.UpdateEdit();

        }
        else {
            setTimeout("waitUploadComplete()", 1000);

        }
    }




    var startUpload1 = false;
    function capnhatKyLuat() {
        var file = uploadKLAttachFile.GetText();
        var hasFile = file.length != 0;
        if (!hasFile) {
            grdDiscipline.UpdateEdit();
        }
        else {
            startUpload1 = true;
            uploadKLAttachFile.Upload();
            waitUploadCompleteKL();

        }
    }
    function saveKL() {


        if (txt_quyetdinhKL.GetText() == "") {

            txt_quyetdinhKL.SetFocus();
            alert('Xin vui lòng nhập quyết định !');
            return false;
        }
        else if (txt_capquyetdinhKL.GetText() == "") {

            txt_capquyetdinhKL.SetFocus();
            alert('Xin vui lòng nhập cấp khen thưởng !');
            return false;
        }
        else if (date_thoidiemkyluatKL.GetText() == "") {

            date_thoidiemkyluatKL.SetFocus();
            alert('Xin vui lòng nhập thời điểm !');
            return false;
        }
        else if (txt_thoihankyluatKL.GetText() == "") {

            txt_thoihankyluatKL.SetFocus();
            alert('Xin vui lòng nhập thời hạn kỷ luật !');
            return false;
        }
        else if (date_ngayhopkyluat.GetText() == "") {

            date_ngayhopkyluat.SetFocus();
            alert('Xin vui lòng chọn ngày họp kỷ luật !');
            return false;
        }
        else { capnhatKyLuat(); }
        
    }

    function waitUploadCompleteKL() {
        if (!startUpload1) {
            grdDiscipline.UpdateEdit();

        }
        else {
            setTimeout("waitUploadCompleteKL()", 1000);

        }
    }
   
</script>
<script type="text/javascript">
    $(document).ready(function () {
     
        //Default Action
        $(".tab_content").hide(); //Hide all content
        $("ul.tabs li:first").addClass("active").show(); //Activate first tab
        $(".tab_content:first").show(); //Show first tab content

        //On Click Event
        $("ul.tabs li").click(function () {
            $("ul.tabs li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            var activeTab = $(this).find("a").attr("href");
            $(".tab_content").hide(); //Hide all tab content                                                                
            $(activeTab).fadeIn(); //Fade in the active content
            return false;
        });
    });
    
    
</script>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #edf3f4">
    <tr>
        <td valign="top">
            <ul class="tabs">
                <li class=""><a href="#tab1" onclick="">Khen thưởng</a></li>
                <li class=""><a href="#tab2" onclick="">
                    Kỷ luật</a></li>
            </ul>
            <div class="tab_container">
                <div id="tab1" class="tab_content">
                     <dx:ReportViewer ID="ReportViewer1" runat="server" Theme="Glass" Font-Size="12px">
            </dx:ReportViewer> 
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
                </div>
                <div id="tab2" class="tab_content" style="display:none;">
                    <div style="height: 430px; overflow: scroll;">
                        <dx:ASPxGridView ID="grdDiscipline" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdDiscipline"
                            Theme="Glass" Font-Size="12px" KeyFieldName="id"
                            OnRowDeleting="grdDiscipline_RowDeleting" OnRowInserting="grdDiscipline_RowInserting"
                            OnRowUpdating="grdDiscipline_RowUpdating" OnCustomCallback="grdDiscipline_CustomCallback"
                            OnHtmlEditFormCreated="grdDiscipline_OnHtmlEditFormCreated" Width="100%">
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                            <Settings ShowStatusBar="Visible" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                                PopupEditFormModal="True" PopupEditFormWidth="500px" />
                            <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin kỷ luật" />
                            <ClientSideEvents  RowDblClick="function(s, e) {
            grdDiscipline.StartEditRow(e.visibleIndex);
        }" />
                            <Columns>                               
                                 <dx:GridViewDataColumn FieldName="KhieuNaiTonTai" Visible="False">
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="STT">
                                    <DataItemTemplate>
                                        <%# Container.ItemIndex +1 %>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="Số QĐ" FieldName="soqd">
                                    <DataItemTemplate>
                                        <a href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>'
                                            target="_blank">
                                            <%# Eval("soqd") %></a>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="Hình thức" FieldName="hinhthuckyluat" />
                                <dx:GridViewDataDateColumn Caption="Thời điểm" FieldName="thoidiem">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataColumn Caption="Thời hạn" FieldName="thoihankyluat" />
                                <dx:GridViewDataColumn FieldName="noidung" Caption="Lý do" />
                                <dx:GridViewDataDateColumn FieldName="ngayhopkyluat" Caption="Ngày họp">
                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataColumn Caption="Cấp quyết định" FieldName="capquyetdinh">
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="fileqd" Visible="false" />
                                <dx:GridViewDataColumn FieldName="thoihankl" Visible="false" />                              
                            </Columns>
                            <Templates>
                                <EmptyDataRow>
                                    Chưa có kỷ luật
                                </EmptyDataRow>
                                <EditForm>
                                    <div style="padding: 4px 4px 3px 4px">
                                        <table cellpadding="1" cellspacing="1" width="500px" style="font-family: Verdana;
                                            font-size: 9pt;">
                                            <tr>
                                                <td valign="top" style="width: 150px;">
                                                    Quyết định
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="txt_quyetdinhKL" ClientInstanceName="txt_quyetdinhKL" runat="server" Width="100%" Text='<%# Eval("soqd") %>'
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Cấp quyết định
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="txt_capquyetdinhKL" ClientInstanceName="txt_capquyetdinhKL" runat="server" Text='<%# Eval("capquyetdinh") %>'
                                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Thời điểm kỷ luật
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="date_thoidiemkyluatKL" ClientInstanceName="date_thoidiemkyluatKL" runat="server" Text='<%# Eval("thoidiem") %>'
                                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Thời hạn kỷ luật
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxSpinEdit ID="txt_thoihankyluatKL" ClientInstanceName="txt_thoihankyluatKL" runat="server" NullText="Số tháng bị kỷ luật" Theme="Glass" Width="100px" MinValue="0" />                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Hình thức
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxComboBox ID="cmb_hinhthuckyluat" runat="server" ValueType="System.String"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                        <Items>
                                                            <dx:ListEditItem Value="Khiển trách bằng miệng" Text="khiển trách bằng miệng" Selected="true" />
                                                            <dx:ListEditItem Value="Khiển trách bằng văn bản" Text="khiển trách bằng văn bản" />
                                                            <dx:ListEditItem Value="Kéo dài thời hạn nâng bậc lương" Text="kéo dài thời hạn nâng bậc lương" />
                                                            <dx:ListEditItem Value="Chuyển làm công tác khác" Text="chuyển làm công tác khác" />
                                                            <dx:ListEditItem Value="Sa thải" Text="Sa thải" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Ngày họp kỷ luật
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxDateEdit ID="date_ngayhopkyluat" ClientInstanceName="date_ngayhopkyluat" runat="server" Value='<%# Eval("ngayhopkyluat") %>'
                                                        DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Lý do
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxMemo ID="memo_lydo" ClientInstanceName="memo_lydo" runat="server" Text='<%# Eval("noidung") %>' Width="100%"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxMemo>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                   Khiếu nại và tồn tại
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxMemo ID="memoKhieuNai" ClientInstanceName="memoKhieuNai" runat="server" Text='<%# Eval("KhieuNaiTonTai") %>' Width="100%"
                                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    </dx:ASPxMemo>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    File đính kèm
                                                </td>
                                                <td valign="top">
                                                    
                                                    <dx:ASPxUploadControl ID="uploadKLAttachFile" runat="server" OnFileUploadComplete="uploadKLAttachFile_Upload"
                                                        ClientInstanceName="uploadKLAttachFile" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                        <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload1 = false;
                        }" />           
                                                    </dx:ASPxUploadControl>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                </td>
                                                <td style="padding-top: 7px;">
                                                    <div style="width: 100px; height: 25px; float: left;">
                                                        <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                                            <Image Url="../../images/imgadmin/save_16.png">
                                                            </Image>
                                                            <ClientSideEvents Click="function(s,e){
                                       
                                            saveKL();                                          
                                       
                                       
                                     }" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div style="width: 100px; height: 25px; float: left;">
                                                        <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                                            AutoPostBack="False">
                                                            <Image Url="../../images/imgadmin/delete_16.png">
                                                            </Image>
                                                            <ClientSideEvents Click="function(s,e){grdDiscipline.CancelEdit();}" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditForm>
                            </Templates>
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
                        </dx:ASPxGridView>
                    </div>
                    <div>
                        <div style="width: 90px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                AutoPostBack="false"  Theme="Glass" Font-Size="12px" Width="81px">
                                <ClientSideEvents Click="function(s, e) {
                            grdDiscipline.AddNewRow();
                        }" />
                                <Image Url="../../images/imgadmin/add.png">
                                </Image>
                            </dx:ASPxButton>
                        </div>
                        <div style="width: 90px; height: 25px; float: left;">
                            <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {                           
                            grdDiscipline.StartEditRow(grdDiscipline.GetFocusedRowIndex());
                        }" />
                                <Image Url="../../images/imgadmin/edit.png">
                                </Image>
                            </dx:ASPxButton>
                        </div>
                        <div style="width: 90px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
                                 if (confirm('Bạn có muốn xóa ?')) {
                            grdDiscipline.DeleteRow(grdDiscipline.GetFocusedRowIndex());
                            }
                        }" />
                                <Image Url="../../images/imgadmin/delete_16.png">
                                </Image>
                            </dx:ASPxButton>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>

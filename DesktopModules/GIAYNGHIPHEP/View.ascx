<%@ Control Language="C#" AutoEventWireup="true" CodeFile="View.ascx.cs" Inherits="DotNetNuke.Modules.GIAYNGHIPHEP.View" %>
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
    <style type="text/css">
   
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
    function save() {

      if (cmbNoiNghiPhep.GetSelectedIndex() == -1 || cmbNoiNghiPhep.GetValue() == 0) {

            cmbNoiNghiPhep.SetFocus();
            alert('Xin vui lòng chọn nơi nghỉ phép !');
            return false;
        }
        else if (dateNgayBatDau.GetText() == "") {

            dateNgayBatDau.SetFocus();
            alert('Xin vui lòng chọn ngày bắt đầu !');
            return false;
        }
        else if (dateNgayKetThuc.GetText() == "") {

            dateNgayKetThuc.SetFocus();
            alert('Xin vui lòng chọn ngày kết thúc !');
            return false;
        }       
        else { grdContract.UpdateEdit(); }

    }
    function saveKhongLuong() {

        if (dateNgayBatDau_KL.GetText() == "") {

            dateNgayBatDau_KL.SetFocus();
            alert('Xin vui lòng chọn ngày bắt đầu !');
            return false;
        }
        else if (dateNgayKetThuc_KL.GetText() == "") {

            dateNgayKetThuc_KL.SetFocus();
            alert('Xin vui lòng chọn ngày kết thúc !');
            return false;
        }
        else if (txtLydo.GetText() == "") {

            txtLydo.SetFocus();
            alert('Xin vui nhập lý do  !');
            return false;
        }
        else { gridKhongLuong.UpdateEdit(); }

    }
    function saveThaiSan() {

        if (dateNgayBatDau_TS.GetText() == "") {

            dateNgayBatDau_TS.SetFocus();
            alert('Xin vui lòng chọn ngày bắt đầu !');
            return false;
        }
        else if (dateNgayKetThuc_TS.GetText() == "") {

            dateNgayKetThuc_TS.SetFocus();
            alert('Xin vui lòng chọn ngày kết thúc !');
            return false;
        }
        else { gridThaiSan.UpdateEdit(); }

    }
    function setDate(s) {
        var date = s.GetValue();
        var ngay = date.getDate();
        var thang = date.getMonth() + 1;
        var nam = date.getYear() + 1900;
        var n = ngay + '/' + thang + '/' + nam;
        callback_DenNgay.PerformCallback(n)
    }
    function checkDate(s) {
        var date1 = dateNgayBatDau.GetValue();
        var ngay1 = date1.getDate();
        var thang1 = date1.getMonth() + 1;
        var nam1 = date1.getYear() + 1900;

        var date2 = dateNgayKetThuc.GetValue();
        var ngay2 = date2.getDate();
        var thang2 = date2.getMonth() + 1;
        var nam2 = date2.getYear() + 1900;

        var d1 = Date.UTC(nam1, thang1, ngay1);
        var d2 = Date.UTC(nam2, thang2, ngay2);
        if (d2 < d1) {
            alert("Ngày kết thúc phải lớn hơn ngày bắt đầu !");
            btDieuChuyen.SetEnabled(false);
        }
        else
            btDieuChuyen.SetEnabled(true);
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
<table width="100%" cellpadding="2" cellspacing="0">
<tr>
    <td>
    <div id="thaisan" runat="server"></div>
    
<div class="tab_container">
    <div id="tab1" class="tab_content">
        <dx:ASPxGridView ID="grdContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdContract"
             Theme="Glass" Font-Size="12px" KeyFieldName="Id"
            OnRowDeleting="grdContract_RowDeleting" OnHtmlEditFormCreated="grdContract_OnHtmlEditFormCreated"
            OnRowInserting="grdContract_RowInserting" OnRowUpdating="grdContract_RowUpdating"
            Width="100%">
            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
            <ClientSideEvents RowDblClick="function(s, e) {
        grdContract.StartEditRow(e.visibleIndex);
    }" />
            <Columns>
                <dx:GridViewDataColumn Caption="STT" Width="30px">
                    <DataItemTemplate>
                        <%# Container.ItemIndex + 1 %></DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="ProvinceId" Visible="False" VisibleIndex="1">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="SoQD" Visible="False" VisibleIndex="1">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Năm" FieldName="Year" VisibleIndex="1" Width="50px">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Từ ngày" FieldName="FromDate" Visible="true" VisibleIndex="2">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Đến ngày" FieldName="ToDate" Visible="true" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nơi nghỉ phép" FieldName="Tinh" VisibleIndex="4">
                </dx:GridViewDataColumn>
            </Columns>
            <SettingsPager PageSize="50">
                <Summary AllPagesText="{0} - {1} " Visible="False" />
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                PopupEditFormModal="True" PopupEditFormWidth="500px" PopupEditFormHeight="180px" />
            <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Quản trị nghỉ phép" />
            <SettingsLoadingPanel ImagePosition="Top" />
            <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <Templates>
                <EditForm>
                    <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2px" width="100%">
                        <tr>
                            <td style="width: 150px;">
                                Nơi nghỉ phép
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmbNoiNghiPhep" ClientInstanceName="cmbNoiNghiPhep" runat="server"
                                    IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    ValueType="System.Int32" Width="200px">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số quyết định
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtSoQD" ClientInstanceName="txtSoQD" Text='<%# Eval("SoQD") %>'
                                    runat="server" Width="200px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Bắt đầu từ ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayBatDau" runat="server" Value='<%# Eval("FromDate") %>'
                                    ClientInstanceName="dateNgayBatDau" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đến hết ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayKetThuc" runat="server" Value='<%# Eval("ToDate") %>'
                                    ClientInstanceName="dateNgayKetThuc" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
                        </tr>
                        <tr>
                            <td valign="top">
                            </td>
                            <td style="padding-top: 7px;">
                                <div style="width: 100px; height: 25px; float: left;">
                                    <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false"  Theme="Glass" Font-Size="12px" Width="81px">
                                        <Image Url="../../images/imgadmin/save_16.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s,e){
                                   save();
                                   }" />
                                    </dx:ASPxButton>
                                </div>
                                <div style="width: 100px; height: 25px; float: left;">
                                    <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                        AutoPostBack="False">
                                        <Image Url="../../images/imgadmin/delete_16.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s,e){grdContract.CancelEdit();}" />
                                    </dx:ASPxButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Settings ShowStatusBar="Visible" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
        </dx:ASPxGridView>
        <div style="padding: 2px;">
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                    <ClientSideEvents Click="function(s, e) {
                            grdContract.AddNewRow()
                        }" />
                    <Image Url="../../images/imgadmin/add.png">
                    </Image>
                </dx:ASPxButton>
            </div>
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                    AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {                            
                            grdContract.StartEditRow(grdContract.GetFocusedRowIndex());
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
                         
                            grdContract.DeleteRow(grdContract.GetFocusedRowIndex());
                            }
                        }" />
                    <Image Url="../../images/imgadmin/delete_16.png">
                    </Image>
                </dx:ASPxButton>
            </div>
        </div>
    </div>
    <div id="tab2" class="tab_content">
        <dx:ASPxGridView ID="gridKhongLuong" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridKhongLuong"
             Theme="Glass" Font-Size="12px" KeyFieldName="Id"
            OnRowDeleting="gridKhongLuong_RowDeleting" OnRowInserting="gridKhongLuong_RowInserting"
            OnRowUpdating="gridKhongLuong_RowUpdating" Width="100%">
            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
            <ClientSideEvents RowDblClick="function(s, e) {
        gridKhongLuong.StartEditRow(e.visibleIndex);
    }" />
            <Columns>
                <dx:GridViewDataColumn Caption="STT" Width="30px">
                    <DataItemTemplate>
                        <%# Container.ItemIndex + 1 %></DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Từ ngày" FieldName="TuNgay" Visible="true" VisibleIndex="2">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Đến ngày" FieldName="DenNgay" Visible="true" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Lý do " FieldName="Lydo" VisibleIndex="4">
                </dx:GridViewDataColumn>
            </Columns>
            <SettingsPager PageSize="50">
                <Summary AllPagesText="{0} - {1} " Visible="False" />
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                PopupEditFormModal="True" PopupEditFormWidth="500px" PopupEditFormHeight="180px" />
            <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Quản trị nghỉ phép" />
            <SettingsLoadingPanel ImagePosition="Top" />
            <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <Templates>
                <EditForm>
                    <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2px" width="100%">
                        <tr>
                            <td>
                                Bắt đầu từ ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayBatDau" runat="server" Value='<%# Eval("TuNgay") %>'
                                    ClientInstanceName="dateNgayBatDau_KL" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đến hết ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayKetThuc" runat="server" Value='<%# Eval("DenNgay") %>'
                                    ClientInstanceName="dateNgayKetThuc_KL" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
                        </tr>
                        <tr>
                            <td>
                                Lý do
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtLydo" runat="server" Value='<%# Eval("LyDo") %>' ClientInstanceName="txtLydo"
                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                                </dx:ASPxTextBox>
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
                                   saveKhongLuong();
                                   }" />
                                    </dx:ASPxButton>
                                </div>
                                <div style="width: 100px; height: 25px; float: left;">
                                    <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                        AutoPostBack="False">
                                        <Image Url="../../images/imgadmin/delete_16.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s,e){gridKhongLuong.CancelEdit();}" />
                                    </dx:ASPxButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Settings ShowStatusBar="Visible" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
        </dx:ASPxGridView>
        <div style="padding: 2px;">
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                    AutoPostBack="false"  Theme="Glass" Font-Size="12px" Width="81px">
                    <ClientSideEvents Click="function(s, e) {
                            gridKhongLuong.AddNewRow()
                        }" />
                    <Image Url="../../images/imgadmin/add.png">
                    </Image>
                </dx:ASPxButton>
            </div>
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                    AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {                            
                            gridKhongLuong.StartEditRow(gridKhongLuong.GetFocusedRowIndex());
                        }" />
                    <Image Url="../../images/imgadmin/edit.png">
                    </Image>
                </dx:ASPxButton>
            </div>
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                    AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                         
                            gridKhongLuong.DeleteRow(gridKhongLuong.GetFocusedRowIndex());
                            }
                        }" />
                    <Image Url="../../images/imgadmin/delete_16.png">
                    </Image>
                </dx:ASPxButton>
            </div>
        </div>
    </div>
    <div id="tab3" class="tab_content">
        <dx:ASPxGridView ID="gridThaiSan" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridThaiSan"
             Theme="Glass" Font-Size="12px" KeyFieldName="Id"
            OnRowDeleting="gridThaiSan_RowDeleting" OnRowInserting="gridThaiSan_RowInserting"
            OnRowUpdating="gridThaiSan_RowUpdating" Width="100%">
            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
            <ClientSideEvents RowDblClick="function(s, e) {
        gridThaiSan.StartEditRow(e.visibleIndex);
    }" />
            <Columns>
                <dx:GridViewDataColumn Caption="STT" Width="30px">
                    <DataItemTemplate>
                        <%# Container.ItemIndex + 1 %></DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Từ ngày" FieldName="TuNgay" Visible="true" VisibleIndex="2">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Đến ngày" FieldName="DenNgay" Visible="true" VisibleIndex="3">
                </dx:GridViewDataColumn>
            </Columns>
            <SettingsPager PageSize="50">
                <Summary AllPagesText="{0} - {1} " Visible="False" />
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                PopupEditFormModal="True" PopupEditFormWidth="500px" PopupEditFormHeight="180px" />
            <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Nghỉ thai sản" />
            <SettingsLoadingPanel ImagePosition="Top" />
            <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <Templates>
                <EditForm>
                    <table style="font-size: 11pt; font-family: Times New Roman;" cellpadding="2px" width="100%">
                        <tr>
                            <td>
                                Bắt đầu từ ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayBatDau" runat="server" Value='<%# Eval("TuNgay") %>'
                                    ClientInstanceName="dateNgayBatDau_TS" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đến hết ngày
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="dateNgayKetThuc" runat="server" Value='<%# Eval("DenNgay") %>'
                                    ClientInstanceName="dateNgayKetThuc_TS" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                    Width="200px">
                                </dx:ASPxDateEdit>
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
                                   saveThaiSan();
                                   }" />
                                    </dx:ASPxButton>
                                </div>
                                <div style="width: 100px; height: 25px; float: left;">
                                    <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                        AutoPostBack="False">
                                        <Image Url="../../images/imgadmin/delete_16.png">
                                        </Image>
                                        <ClientSideEvents Click="function(s,e){gridThaiSan.CancelEdit();}" />
                                    </dx:ASPxButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Settings ShowStatusBar="Visible" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
        </dx:ASPxGridView>
        <div style="padding: 2px;">
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                    <ClientSideEvents Click="function(s, e) {
                            gridThaiSan.AddNewRow()
                        }" />
                    <Image Url="../../images/imgadmin/add.png">
                    </Image>
                </dx:ASPxButton>
            </div>
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                    AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {                            
                            gridThaiSan.StartEditRow(gridThaiSan.GetFocusedRowIndex());
                        }" />
                    <Image Url="../../images/imgadmin/edit.png">
                    </Image>
                </dx:ASPxButton>
            </div>
            <div style="width: 90px; height: 25px; float: left;">
                <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                    AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {
                         
                            gridThaiSan.DeleteRow(gridThaiSan.GetFocusedRowIndex());
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


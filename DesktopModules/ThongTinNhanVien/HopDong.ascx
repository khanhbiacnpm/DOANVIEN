<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HopDong.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.HopDong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<script type="text/javascript">
    function setDate(s) {
        var date = s.GetValue();
        var ngay = date.getDate();
        var thang = date.getMonth() + 1;
        var nam = date.getYear() + 1900;
        var n = ngay + '/' + thang + '/' + nam;
        callback_DenNgay.PerformCallback(n)
    }
</script>
<script type="text/javascript">

    function saveHopDong() {
      
        if (calDateStart.GetText() == "") {

            calDateStart.SetFocus();
            alert('Xin vui lòng chọn ngày bắt đầu !');
            return false;
        }
        else if (txtContractNum.GetText() == "") {

            txtContractNum.SetFocus();
            alert('Xin vui lòng nhập số hợp đồng !');
            return false;
        }

        else { grdContract.UpdateEdit(); }
    }

    
</script>
<div style="height:430px;overflow:scroll;">
<dx:ASPxGridView ID="grdContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdContract"
    Theme="Glass" Font-Size="12px" KeyFieldName="id"
     OnRowDeleting="grdContract_RowDeleting"
    OnRowInserting="grdContract_RowInserting" OnRowUpdating="grdContract_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdContract.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
         <dx:GridViewDataColumn Caption="STT" FieldName="stt" Width="30px">
            
        </dx:GridViewDataColumn>
      
        <dx:GridViewDataColumn FieldName="employeeid" Visible="False" VisibleIndex="1">
        </dx:GridViewDataColumn>
         <dx:GridViewDataColumn FieldName="datestart" Visible="False" VisibleIndex="1">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="dateend" Visible="False" VisibleIndex="2">
        </dx:GridViewDataColumn>
       
        <dx:GridViewDataColumn FieldName="representaddress" Visible="False" VisibleIndex="6">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="representphone" Visible="False" VisibleIndex="7">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="representunit" Visible="False" VisibleIndex="8">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="represent" Visible="False" VisibleIndex="9">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thời gian" FieldName="thoigian" VisibleIndex="10">
          
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Số hợp đồng" FieldName="contractnum" VisibleIndex="11">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Loại hợp đồng" FieldName="loaihopdong" VisibleIndex="12" />
        <dx:GridViewDataColumn FieldName="contracttype" Visible="false" />           
    </Columns>
    <SettingsPager PageSize="50">
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin hợp đồng" />
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
                    font-size: 9pt;">
                 
                    <tr>
                        <td valign="top" style="width: 160px;">
                            Loại hợp đồng
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="ddlContractType" runat="server"
                                ClientInstanceName="ddlContractType"
                                OnLoad="ddlContractType_Load"
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){
                                    hf_LoaiHopDong.Set('idLoaiHD',ddlContractType.GetValue());
                                }" 
                                SelectedIndexChanged="
                                    function(s,e){
                                        hf_LoaiHopDong.Set('idLoaiHD',ddlContractType.GetValue());
                                    }
                                " />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Ngày bắt đầu
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="calDateStart" runat="server" ClientInstanceName="calDateStart"
                                OnLoad="calDateStart_Load" Width="100%" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                 <ClientSideEvents ValueChanged="function(s,e){
                                    setDate(s); 
                                }" />
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Ngày kết thúc
                        </td>
                        <td valign="top">
                            <dx:ASPxCallbackPanel ID="callback_DenNgay" runat="server" 
                                ClientInstanceName="callback_DenNgay"
                                OnCallback="callback_DenNgay_Callback">
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent2" runat="server">
                                        <dx:ASPxHiddenField ID="hf_LoaiHopDong" runat="server" ClientInstanceName="hf_LoaiHopDong">                                            
                                        </dx:ASPxHiddenField>
                                        <asp:HiddenField ID="hiddenNgayKetThuc" runat="server" />
                                        <dx:ASPxHiddenField ID="hfNgayThang" runat="server" 
                                            ClientInstanceName="hfNgayThang">
                                        </dx:ASPxHiddenField>
                                        <dx:ASPxDateEdit ID="calContractDateEnd" runat="server" 
                                            ClientInstanceName="calContractDateEnd"
                                            OnLoad="calContractDateEnd_Load"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ClientSideEvents ValueChanged="function(s,e){
                                                hfNgayThang.Set('dateend',calContractDateEnd.GetValue());
                                            }" />
                                        </dx:ASPxDateEdit>
                                    </dx:PanelContent>
                                </PanelCollection>
                                <ClientSideEvents EndCallback = "function(s,e){
                                    hfNgayThang.Set('dateend',callback_DenNgay.cpdateend);
                                }" />
                            </dx:ASPxCallbackPanel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Số hợp đồng
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtContractNum" runat="server" ClientInstanceName="txtContractNum" EnableClientSideAPI="true"
                                OnLoad="txtContractNum_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                         
                            </dx:ASPxTextBox>
                        </td>
                    </tr>                    
                    <tr style="background: #99ccff;">
                        <td valign="top" style="background-color: #D6E7FF; color: #293852; font-weight: bold;
                            height: 22px;" colspan="2">
                            Thông tin nhà tuyển dụng
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Người đại diện
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtRepresent" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                OnLoad="txtRepresent_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đ/c người đại diện
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtRepresentAdd" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                OnLoad="txtRepresentAdd_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đơn vị của người đại diện
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtRepresentUnit" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                OnLoad="txtRepresentUnit_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            ĐT người đại diện
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtRepresentPhone" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true"
                                OnLoad="txtRepresentPhone_Load" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
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
                                   saveHopDong();
                                   }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){grdContract.CancelEdit();}" />
                                </dx:ASPxButton>
                            </div>                                                
                        </td>
                    </tr>
                </table>
            </div>
        </EditForm>
     
    </Templates>
    <Settings ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
</dx:ASPxGridView>
</div>

            <div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdContract.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                            
                            grdContract.StartEditRow(grdContract.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
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
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
      
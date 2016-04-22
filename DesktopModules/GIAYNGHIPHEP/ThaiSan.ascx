<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThaiSan.ascx.cs" Inherits="DotNetNuke.Modules.GIAYNGHIPHEP.ThaiSan" %>
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


<dx:ASPxGridView ID="grdContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdContract"
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" KeyFieldName="Id"
    OnRowDeleting="grdContract_RowDeleting"
    OnHtmlEditFormCreated="grdContract_OnHtmlEditFormCreated"
    OnRowInserting="grdContract_RowInserting" OnRowUpdating="grdContract_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <ClientSideEvents  RowDblClick="function(s, e) {
        grdContract.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
              <dx:GridViewDataColumn Caption="STT" Width="30px">
            <DataItemTemplate><%# Container.ItemIndex + 1 %></DataItemTemplate>
            <CellStyle HorizontalAlign="Center"></CellStyle>
        </dx:GridViewDataColumn>
      
        <dx:GridViewDataColumn FieldName="ProvinceId" Visible="False" VisibleIndex="1">
        </dx:GridViewDataColumn>
          <dx:GridViewDataColumn FieldName="SoQD" Visible="False" VisibleIndex="1">
        </dx:GridViewDataColumn>      
            <dx:GridViewDataColumn Caption="Năm" FieldName="Year" VisibleIndex="1" Width="50px">            
        </dx:GridViewDataColumn>
         <dx:GridViewDataColumn Caption="Từ ngày"  FieldName="FromDate" Visible="true"   VisibleIndex="2">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Đến ngày"  FieldName="ToDate" Visible="true" VisibleIndex="3">
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
                    <td>
                        Bắt đầu từ ngày
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="dateNgayBatDau" runat="server" Value = '<%# Eval("FromDate") %>' ClientInstanceName="dateNgayBatDau"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        Đến hết ngày
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="dateNgayKetThuc" runat="server" Value = '<%# Eval("ToDate") %>' ClientInstanceName="dateNgayKetThuc"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="200px">
                        </dx:ASPxDateEdit>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td style="padding-top: 7px;">
                        <div style="width: 100px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                                <Image Url="../../images/imgadmin/save_16.png">
                                </Image>
                                <ClientSideEvents Click="function(s,e){
                                   save();
                                   }" />
                            </dx:ASPxButton>
                        </div>
                        <div style="width: 100px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
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


            <div  style="padding:2px;">
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdContract.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                            
                            grdContract.StartEditRow(grdContract.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
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


         
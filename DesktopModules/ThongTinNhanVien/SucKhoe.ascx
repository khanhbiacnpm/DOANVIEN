<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SucKhoe.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.SucKhoe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    <script type="text/javascript">
        function themsuckhoe() {
            grdHealth.AddNewRow();
        }
        function suasuckhoe() {
            grdHealth.StartEditRow(grdHealth.GetFocusedRowIndex());
        }
        function xoasuckhoe() {
            grdHealth.DeleteRow(grdHealth.GetFocusedRowIndex());
        }
    </script>
   
                <dx:ASPxGridView ID="grdHealth" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdHealth"
                Theme="Glass" Font-Size="12px" KeyFieldName="Id"
                OnRowDeleting="grdHealth_RowDeleting"
                OnRowInserting="grdHealth_RowInserting" 
                OnRowUpdating="grdHealth_RowUpdating"
                OnHtmlEditFormCreated="grdHealth_OnHtmlEditFormCreated"
                Width="100%" >
                <SettingsBehavior AllowSort="false" AllowFocusedRow="true" ConfirmDelete="True" />                
                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                <Settings ShowStatusBar="Visible" />
                <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                    PopupEditFormModal="True" PopupEditFormWidth="500px" />
                <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin sức khoẻ" />
                <ClientSideEvents RowDblClick="function(s, e) {
                    grdHealth.StartEditRow(e.visibleIndex);
                }" />
                <Columns>                                
                    <dx:GridViewDataTextColumn Caption ="Thời gian" FieldName="thoidiemkham">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                    </dx:GridViewDataTextColumn>                                
                    <dx:GridViewDataColumn Caption="Chiều cao" FieldName="chieucao">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Cân nặng" FieldName="cannang">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Huyết áp" FieldName="huyetap">
                    </dx:GridViewDataColumn>    
                    <dx:GridViewDataColumn Caption="Ghi chú" FieldName="chucnangkhac">                                    
                    </dx:GridViewDataColumn>       
                    <dx:GridViewDataColumn Caption="Loại" FieldName="loaisuckhoe">                                    
                    </dx:GridViewDataColumn>                    
                    <dx:GridViewDataColumn Caption="Kết luận" FieldName="ketluan">
                    </dx:GridViewDataColumn>                                
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
                                font-size: 9pt;">                                           
                                <tr>
                                    <td valign="top" style="width: 130px;">
                                        Thời điểm khám
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxDateEdit ID="date_ngaykham" runat="server" Width="100%" Value = '<%# Eval("thoidiemkham") %>'
                                            DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxDateEdit>                                                                                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Chiều cao
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtHight" runat="server" Text='<%# Eval("chieucao") %>'
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                        
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Cân nặng
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtWeigh" runat="server" Text='<%# Eval("cannang") %>'
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                       
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Huyết áp
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtHA" runat="server" Text='<%# Eval("huyetap") %>'
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                        
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Tình trạng sức khỏe
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmb_loaisuckhoe" runat="server" 
                                            IncrementalFilteringMode="Contains" TextField="name" ValueField="id" ValueType="System.Int32"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DataSourceID="DS_suckhoe"
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                            <ClientSideEvents Init="function(s,e){ if(grdHealth.IsNewRowEditing()){s.InsertItem(0,'-- Chọn --','0'); s.SetSelectedIndex(0)}}" />                                                       
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Ghi chú
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxMemo ID="txtOtherResult" runat="server" Height="30px" Width="100%" Text='<%# Eval("chucnangkhac") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                       
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Kết luận
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxMemo ID="txtConclusion" runat="server" Height="30px" Width="100%" Text='<%# Eval("ketluan") %>'
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
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){if(ASPxClientEdit.ValidateGroup('editForm')){grdHealth.UpdateEdit();}}" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                                AutoPostBack="False">
                                                <Image Url="../../images/imgadmin/delete_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){grdHealth.CancelEdit();}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </EditForm>
                    <StatusBar>
                        <div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {
                                        grdHealth.AddNewRow()
                                    }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                          
                                        grdHealth.StartEditRow(grdHealth.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        grdHealth.DeleteRow(grdHealth.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>                                
                </Templates>
            </dx:ASPxGridView>
      
<asp:SqlDataSource ID = "DS_suckhoe" runat="server" ConnectionString="<%$ ConnectionStrings:HRM %>" 
   SelectCommand="HRM_GetHealthType" SelectCommandType="StoredProcedure">
   <SelectParameters>
    <asp:Parameter Name="id" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   </asp:SqlDataSource>
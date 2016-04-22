<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NhanThan.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.NhanThan" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    
<dx:ASPxGridView ID="grdNhanThan" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdNhanThan"
    Theme="Glass" Font-Size="12px" KeyFieldName="Id"
    OnRowDeleting="grdNhanThan_RowDeleting" 
    OnRowInserting="grdNhanThan_RowInserting"
    OnRowUpdating="grdNhanThan_RowUpdating" 
    OnHtmlEditFormCreated="grdNhanThan_OnHtmlEditFormCreated" Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="400px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin nhân thân" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <ClientSideEvents RowDblClick="function(s, e) {
            grdNhanThan.StartEditRow(e.visibleIndex);
        }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" HeaderStyle-HorizontalAlign="Center"
            CellStyle-HorizontalAlign="Center" Width="30px">
            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
        </dx:GridViewDataColumn>        
        <dx:GridViewDataColumn Caption="Họ tên" FieldName="hoten">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Quan hệ" FieldName="quanhe">         
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Năm sinh" FieldName="namsinh">            
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Đ/c thường trú" FieldName="thuongtru">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Nghề nghiệp" FieldName="nghenghiep">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Ghi chú" FieldName="ghichu">
        </dx:GridViewDataColumn>
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
                <table cellpadding="1" cellspacing="1" width="400px" style="font-size: 9pt;">                   
                    <tr>
                        <td valign="top" style="width: 100px;">
                            Họ tên
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_ten" runat="server" Text='<%# Eval("hoten") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Năm sinh
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_namsinh" runat="server" Text='<%# Eval("namsinh") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">                                
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đ/c thường trú
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_thuongtru" runat="server" Text='<%# Eval("thuongtru") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Quan hệ
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_quanhe" runat="server" Width="100%" ClientInstanceName="cmb_quanhe" 
                                ValueField="Id" TextField="Name"
                                DataSourceID="sqlDB_cmbquanhe" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){ if(grdNhanThan.IsNewRowEditing()){s.InsertItem(0,'-- Chọn --','0'); s.SetSelectedIndex(0)}}" />                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Nghề nghiệp
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_nghenghiep" runat="server" Text='<%# Eval("nghenghiep") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td valign="top">
                            Ghi chú
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_ghichu" runat="server" Text='<%# Eval("ghichu") %>'
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxTextBox>
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
                                        if(ASPxClientEdit.ValidateGroup('editForm')){
                                                grdNhanThan.UpdateEdit();
                                            }
                                        }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        grdNhanThan.CancelEdit();
                                     }" />
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
                            grdNhanThan.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            grdNhanThan.StartEditRow(grdNhanThan.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            grdNhanThan.DeleteRow(grdNhanThan.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
        </StatusBar>
    </Templates>   
</dx:ASPxGridView>
<asp:SqlDataSource ID="sqlDB_cmbquanhe" runat="server" ConnectionString ="<%$ ConnectionStrings:HRM %>" 
   SelectCommand="HRM_GetRelationship" SelectCommandType="StoredProcedure">
   <SelectParameters>
        <asp:Parameter Name="id" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>

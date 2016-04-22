<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HSKhenThuong.ascx.cs"
    Inherits="VNPT.Modules.Unit.KhenThuong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<script type="text/javascript">
    var doi = false;
    function saveData() {
        if (upFile.GetText() == "")
            grdKhenThuong.UpdateEdit();
        else {
            doi = true;
            lblTrangThaiDoi.SetText("Dang upload file");
            upFile.Upload();
            doiUpload_hoanthanh();
        }
    }

    function doiUpload_hoanthanh() {
        if (doi) {
            setTimeout("doiUpload_hoanthanh()", 1000);
        }
        else {
            lblTrangThaiDoi.SetText("");
            grdKhenThuong.UpdateEdit();
        }
    }
</script>
<dx:ASPxGridView ID="grdKhenThuong" runat="server" AutoGenerateColumns="False" 
                ClientInstanceName="grdKhenThuong"
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="Id"   
    OnRowDeleting="grdKhenThuong_RowDeleting"
    OnRowInserting="grdKhenThuong_RowInserting" 
    OnRowUpdating="grdKhenThuong_RowUpdating"
    Width="100%" oncustomcallback="grdKhenThuong_CustomCallback">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh hồ sơ khen thưởng" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdKhenThuong.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" Width="30px" HeaderStyle-HorizontalAlign="Center"
            CellStyle-HorizontalAlign="Center">                       
            <DataItemTemplate>
                <%# Container.ItemIndex + 1 %>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Số quyết định" FieldName="SoQD" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Cấp quyết định" FieldName="CapQD" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Ngày quyết định" FieldName="NgayQD" HeaderStyle-HorizontalAlign="Center">            
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Loại khen thưởng" FieldName="TieuDe" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Loại khen thưởng" FieldName="IdLoaiKhenThuong" Visible="false"></dx:GridViewDataColumn>        
        <dx:GridViewDataColumn Caption="Ghi Chú" FieldName="GhiChu" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="File quyết định" FieldName="FileQD" HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <a href='<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/fileQD/<%# Eval("FileQD") %>' target="_blank"><%# Eval("FileQD") %></a>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
    </Columns>        
    <SettingsLoadingPanel ImagePosition="Top" />
    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
        </LoadingPanel>
    </Images>
    <ImagesEditors>
        <DropDownEditDropDown>
            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
        </DropDownEditDropDown>
        <SpinEditIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
        </SpinEditIncrement>
        <SpinEditDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
        </SpinEditDecrement>
        <SpinEditLargeIncrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
        </SpinEditLargeIncrement>
        <SpinEditLargeDecrement>
            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
        </SpinEditLargeDecrement>
    </ImagesEditors>
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
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
                <table cellpadding="1" cellspacing="1" width="100%" style="font-family: Verdana;
                    font-size: 9pt;">                    
                    <tr>
                        <td valign="top" style="width: 100px;">
                           Số QĐ
                        </td>
                        <td valign="top">                            
                            <dx:ASPxTextBox ID="txtSoQD" runat="server" Width = "100%" Text='<%# Eval("SoQD") %>'
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign="top">
                           Cấp QĐ
                        </td>                        
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtCapQD" runat="server"  Width = "100%" Text='<%# Eval("CapQD") %>'
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign="top">
                            Ngày QĐ
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID = "dateNgayQD" runat="server" Width = "100%"
                                Date= '<%# Eval("NgayQD") == null ? DateTime.Now : (DateTime)Eval("NgayQD") %>'
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                             </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Loại khen thưởng
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmb_loaikhenthuong" runat="server" ClientInstanceName="cmb_loaikhenthuong"
                                IncrementalFilteringMode="Contains"
                                Width="50%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents Init="
                                    function(s,e){                                        
                                        grdKhenThuong.GetRowValues(grdKhenThuong.GetFocusedRowIndex(), 'IdLoaiKhenThuong', function(values){                                            
                                            if(values == null)
                                                cmb_loaikhenthuong.SetValue(1);
                                            else
                                                cmb_loaikhenthuong.SetValue(values);
                                        });                                                 
                                    }
                                " />                                
                                <Items>
                                    <dx:ListEditItem Value = '1' Text = "Đảng" Selected="true" />
                                    <dx:ListEditItem Value = '2' Text = "Đoàn thể" />
                                    <dx:ListEditItem Value= '3' Text = "Chuyên môn" />
                                    <dx:ListEditItem Value= '4' Text = "Khác" />
                                </Items>
                                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td valign = "top">Ghi chú</td>
                        <td>
                            <dx:ASPxMemo ID="memoGhiChu" runat="server" Height="71px" Width = "100%" Text='<%# Eval("GhiChu") %>'
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td>File quyết định</td>
                        <td>
                            <dx:ASPxUploadControl ID="upFile" runat="server" Width = "100%" OnFileUploadComplete="upFile_OnFileUploadComplete"
                                ClientInstanceName="upFile" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents FileUploadComplete="function(s,e)
                                {
                                    doi = false;
                                }" />
                                <ProgressBarSettings ShowPosition="true" />
                            </dx:ASPxUploadControl>
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="lblTrangThaiDoi"></dx:ASPxLabel>
                        </td>

                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        if(ASPxClientEdit.ValidateGroup('editForm'))
                                        {
                                            saveData();
                                        }
                                     }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        grdKhenThuong.CancelEdit();
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
                         AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdKhenThuong.AddNewRow()
                        }"/>
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" ClientInstanceName="tbSua"
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            grdKhenThuong.StartEditRow(grdKhenThuong.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" ClientInstanceName="btXoa"
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            grdKhenThuong.DeleteRow(grdKhenThuong.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
        </StatusBar>        
    </Templates>
</dx:ASPxGridView>

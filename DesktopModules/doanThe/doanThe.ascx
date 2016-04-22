<%@ Control Language="C#" Inherits="Philip.Modules.doanThe.doanThe" CodeFile="doanThe.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:HiddenField ID="hiddenIdNV" runat="server" />
<dx:ASPxGridView ID="gridDoanThe" runat="server" Width="100%" ssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" KeyFieldName="id" Caption="Quản trị Đoàn Thể" ClientInstanceName="gridDoanThe"
    OnRowUpdating="gridDoanThe_RowUpdating" 
    OnRowInserting="gridDoanThe_RowInserting"
    OnRowDeleting="gridDoanThe_RowDeleting" 
    OnHtmlDataCellPrepared="gridDoanThe_HtmlDataCellPrepared"
    AutoGenerateColumns="False">
    <Settings ShowStatusBar="Visible" VerticalScrollableHeight="380" ShowVerticalScrollBar="true" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
    <SettingsText PopupEditFormCaption="Hiệu chỉnh thông tin Đoàn thể" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
        PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="500px" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <SettingsPager Mode="ShowAllRecords">
    </SettingsPager>
    <ClientSideEvents RowDblClick="function(s, e) {
        gridDoanThe.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
        <dx:GridViewDataColumn FieldName="idNhanVien" Visible="false" VisibleIndex="1">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="idChucVuDoanThe" Caption="Chức vụ Đoàn thể" VisibleIndex="2">
            <DataItemTemplate>
                <dx:ASPxLabel ID ="lbl_ChucVuDoanThe" runat="server"></dx:ASPxLabel>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="noiDung" Caption="Nội dung" VisibleIndex="3">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="capQuyetDinh" Caption="Cấp quyết định" VisibleIndex="4">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataDateColumn FieldName="ngay" Caption="Thời điểm" VisibleIndex="5">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataColumn FieldName="soQuyetDinh" Caption="Số quyết định" VisibleIndex="6">
             <DataItemTemplate>
                <dx:ASPxHyperLink ID="lbl_fileQuyetDinh" runat="server" Target="_blank"></dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="fileQuyetDinh" Visible="false" VisibleIndex="7">            
        </dx:GridViewDataColumn>
    </Columns>
    <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <table width="500px" cellpadding="4" cellspacing="0" style="font-family: Verdana;
                    font-size: 10pt;">
                    <tr>
                        <td valign="top">
                            Chức vụ ĐT
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbChuVuDoanThe" runat="server" OnInit="cmbChuVuDoanThe_Init"
                                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                        <td valign="top" style="width: 150px;">
                            Cấp quyết định
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtCapQuyetDinh" runat="server" Text='<%# Eval("capQuyetDinh") %>'
                                ClientInstanceName="txtCapQuyetDinh" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Số quyết định
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtSoQD" runat="server" Text='<%# Eval("soQuyetDinh") %>' ClientInstanceName="txtSoQD"
                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Văn bản đính kèm
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtfilekem" runat="server" Text='<%# Eval("fileQuyetDinh") %>'
                                Visible="false">
                            </dx:ASPxTextBox>
                            <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" ClientInstanceName="uploadFileDinhKem"
                                OnFileUploadComplete="uploadFileDinhKem_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Nội dung
                        </td>
                        <td valign="top">
                            <dx:ASPxMemo ID="memoNoiDung" runat="server" Height="40px" Width="100%" Text='<%# Eval("noiDung") %>' 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ValidationSettings>
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Thời điểm
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="dateThoiDiem" runat="server" ClientInstanceName="dateThoiDiem"
                                OnInit="dateThoiDiem_init"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
                                <CalendarProperties>
                                    <HeaderStyle Spacing="1px" />
                                    <FooterStyle Spacing="17px" />
                                </CalendarProperties>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                    <Image Url="../../images/imgadmin/save_16.png">
                                    </Image>
                                    <ClientSideEvents Click="function(s,e){
                                        uploadFileDinhKem.UploadFile();
                                        gridDoanThe.UpdateEdit();
                                        }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                    <ClientSideEvents Click="function(s,e){
                                        gridDoanThe.CancelEdit();
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
                        AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            gridDoanThe.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png">
                        </Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            gridDoanThe.StartEditRow(gridDoanThe.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png">
                        </Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            gridDoanThe.DeleteRow(gridDoanThe.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png">
                        </Image>
                    </dx:ASPxButton>
                </div>
            </div>
        </StatusBar>
    </Templates>
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
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/gridDoanTheView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Aqua/gridDoanTheView/Loading.gif">
        </LoadingPanel>
    </Images>
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
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
</dx:ASPxGridView>

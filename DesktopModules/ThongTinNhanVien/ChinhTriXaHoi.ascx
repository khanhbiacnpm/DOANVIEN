<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChinhTriXaHoi.ascx.cs"
    Inherits="VNPT.Modules.ThongTinNhanVien.ChinhTriXaHoi" %>
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
<dx:ASPxGridView ID="grdSociety" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdSociety"
    Theme="Aqua" Font-Size="12px" KeyFieldName="id"
    OnHtmlDataCellPrepared="grdSociety_HtmlDataCellPrepared" 
    OnRowDeleting="grdSociety_RowDeleting"
    OnRowInserting="grdSociety_RowInserting" 
    OnRowUpdating="grdSociety_RowUpdating"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <Settings ShowStatusBar="Visible" />    
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="500px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh quá trình tham gia tổ chức chính trị xã hội" />
    <ClientSideEvents RowDblClick="function(s, e) {
        grdSociety.StartEditRow(e.visibleIndex);
    }" />
    <Columns>
        <dx:GridViewDataColumn FieldName="employeeid" Caption="STT" Width="30px" HeaderStyle-HorizontalAlign="Center"
            CellStyle-HorizontalAlign="Center" VisibleIndex="0">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_STTSociety" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="todate" Visible="False" VisibleIndex="1">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="fromdate" Visible="False" VisibleIndex="2">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Thời gian" FieldName="id" VisibleIndex="3" Width="150px"
            HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lblTime" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Left">
            </CellStyle>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="CD đoàn thể" FieldName="ChucVuDoanThe" VisibleIndex="4"
            HeaderStyle-HorizontalAlign="Center">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lbl_ChucVuDoanThe" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Nội dung" FieldName="content" VisibleIndex="5">
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
                <table cellpadding="1" cellspacing="1" width="500px" style="font-family: Verdana;
                    font-size: 9pt;">
                    <tr>
                        <td valign="top">
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtSocietyId" runat="server" Enabled="false" OnLoad="txtSocietyId_Load"
                                Visible="false" />
                            <dx:ASPxTextBox ID="txtSocietyEmpId" runat="server" OnLoad="txtSocietyEmpId_Load"
                                Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 70px;">
                            Từ ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="calSocietyInDate" runat="server" OnLoad="calSocietyInDate_Load"
                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đến ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="calSocietyOutDate" runat="server" OnLoad="calSocietyOutDate_Load"
                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Chức vụ đoàn thể
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbChucVuDoanThe" runat="server" OnLoad="cmbChucVuDoanThe_Load"
                                IncrementalFilteringMode="Contains" Width="50%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
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
                        <td valign="top">
                            Nội dung
                        </td>
                        <td valign="top">
                            <dx:ASPxMemo ID="txtContent" runat="server" Height="71px" Width="100%" OnLoad="txtContent_Load"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                        </td>
                        <td style="padding-top: 7px;">
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">                                    
                                    <Image Url="../../images/imgadmin/save_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){
                                        if(ASPxClientEdit.ValidateGroup('editForm'))
                                        {
                                            grdSociety.UpdateEdit();
                                        }
                                     }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 100px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">                                   
                                   <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                    <ClientSideEvents Click="function(s,e){grdSociety.CancelEdit();}" />
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
                            grdSociety.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                           
                            grdSociety.StartEditRow(grdSociety.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                            grdSociety.DeleteRow(grdSociety.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
        </StatusBar>        
    </Templates>
</dx:ASPxGridView>

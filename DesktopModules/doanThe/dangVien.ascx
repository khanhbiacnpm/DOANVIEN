<%@ Control Language="C#" Inherits="Philip.Modules.doanThe.dangVien" CodeFile="dangVien.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
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

    

<table cellpadding="1" cellspacing="1" width="100%">    
    <tr>
        <td valign="top">
            <dx:ASPxGridView ID="gridDangVienControl" runat="server" AutoGenerateColumns="False" 
                ClientInstanceName="gridDangVienControl"
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="Id"
              
                OnRowDeleting="gridDangVienControl_RowDeleting"
                OnRowInserting="gridDangVienControl_RowInserting" 
                OnRowUpdating="gridDangVienControl_RowUpdating" Width="100%">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords">                    
                </SettingsPager>
                <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                    PopupEditFormVerticalAlign="Above" PopupEditFormModal="True" PopupEditFormWidth="500px" />
                <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh hồ sơ kiêm nhiệm" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <Settings ShowStatusBar="Visible" />                
                <ClientSideEvents RowDblClick="function(s, e) {
                    gridDangVienControl.StartEditRow(e.visibleIndex);
                }" />
                <Columns>
                    <dx:GridViewDataColumn FieldName="IdNhanVien" Visible="False" >
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="stt"  Caption="STT" Width="30px"
                        HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">
                       
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="SoQD" Caption="Số QĐ"  HeaderStyle-HorizontalAlign="Center"
                        CellStyle-HorizontalAlign="Center" Width="120px">
                        <DataItemTemplate>
                         <a target="_blank" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/FileQD/<%# Eval("FileQD") %>">
                                                        <%# Eval("soQD")%></a>
                            
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="ThoiGianQD" Caption="Thời gian QĐ" 
                        HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="capqd" Caption="Cấp quyết định"  HeaderStyle-HorizontalAlign="Center">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="tochucdangkn" Caption="Tổ chức" >                        
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="chucvudangKN" Caption="Chức vụ" 
                        HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">                        
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>                                        
                    <dx:GridViewDataColumn FieldName="NoiDung" Caption="Nội dung" HeaderStyle-HorizontalAlign="Center">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataColumn>                                       
                    <dx:GridViewDataColumn FieldName="LoaiKiemNhiem"  Caption="Loại kiêm nhiệm" >                        
                    </dx:GridViewDataColumn>           
                    <dx:GridViewDataColumn FieldName="FileQD" Visible="False" >                        
                    </dx:GridViewDataColumn>         
                </Columns>
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
                            <table cellpadding="1" cellspacing="1" width="500px" style="font-size: 9pt; font-family: Verdana;">
                                <tr>
                                    <td valign="top">
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtPartyId" runat="server" Enabled="false" Visible="false" Text = '<%# Eval("Id") %>' />
                                        <dx:ASPxTextBox ID="txtPartyEmpId" runat="server" Visible="false" Text = '<%# Eval("IdNhanVien") %>' />
                                    </td>
                                </tr>                                
                                <tr>
                                    <td valign="top" style="width: 120px;">
                                        Số QĐ
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtDoQD" runat="server" ClientInstanceName="Name" EnableClientSideAPI="true" Text= '<%# Eval("SoQD") %>'
                                            Width="50%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Ngày QĐ
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxDateEdit ID="dateNgayQD" runat="server" Width="50%" Text = '<%# Eval("ThoiGianQD") %>'
                                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                                                                        
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Cấp QĐ
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtCapQD" runat="server" Width="100%" Text ='<%# Eval("capqd") %>'
                                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="Nhập cấp quyết định" IsRequired="True" />
                                                <ErrorFrameStyle ForeColor="Red">
                                                    <Paddings Padding="3px" PaddingLeft="4px" />
                                                    <ErrorTextPaddings PaddingRight="3px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Tổ chức
                                    </td>
                                    <td valign="top">                                        
                                        <dx:ASPxTextBox ID="txtToChucDang" runat="server" Width="100%" Text='<%# Eval("tochucdangKN") %>'
                                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="Nhập tổ chức đảng" IsRequired="True" />
                                                <ErrorFrameStyle ForeColor="Red">
                                                    <Paddings Padding="3px" PaddingLeft="4px" />
                                                    <ErrorTextPaddings PaddingRight="3px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr> 
                                  <tr>
                                                            <td valign="top">
                                                                Chức vụ
                                                            </td>
                                                            <td valign="top" colspan="2">
                                                                <dx:ASPxComboBox Text='<%# Eval("chucvudangKN") %>' ID="cboPosition" runat="server" OnLoad="cboPosition_Load" IncrementalFilteringMode="Contains"
                                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                        
                                <tr>
                                    <td valign="top">
                                        Ghi chú
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxMemo ID="memoNoiDung" runat="server" Height="40px" Width="100%" Text='<%# Eval("NoiDung") %>'
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
                                    <td>Loại kiêm nhiệm</td>
                                    <td>
                                    <dx:ASPxComboBox ID="CmbLoaiKiemNhiem" runat="server" Text='<%# Eval("loaikiemnhiem") %>' ClientInstanceName="cmbLoaiKN"
                                        IncrementalFilteringMode="Contains"
                                        Width="50%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"> 
                                                
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
                                    <td valign="top">
                                        File đính kèm
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtFileKem" runat="server" Visible="false" />                                       
                                        <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                            ClientInstanceName="uploadFileDinhKem" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        </dx:ASPxUploadControl>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    </td>
                                    <td style="padding-top: 7px;">
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){
                                                        uploadFileDinhKem.UploadFile();                                                    
                                                        gridDangVienControl.UpdateEdit();
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
                                                    gridDangVienControl.CancelEdit();
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
                                        gridDangVienControl.AddNewRow();
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
                                        gridDangVienControl.StartEditRow(gridDangVienControl.GetFocusedRowIndex());
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
                                        gridDangVienControl.DeleteRow(gridDangVienControl.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>
                </Templates>                
            </dx:ASPxGridView>
        </td>
    </tr>
</table>

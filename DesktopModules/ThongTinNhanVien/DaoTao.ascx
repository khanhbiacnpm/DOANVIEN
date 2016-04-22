<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DaoTao.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.DaoTao" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<script type="text/javascript">
    var startUpload = false;
    function save() {
        var sFile = uploadFileDinhKemTagDT.GetText();
        if (sFile != "") {
            startUpload = true;
            uploadFileDinhKemTagDT.Upload();
            waitUploadComplete();
        }
        else {
            grdTraining.UpdateEdit();
        }
    }

    var uplText = "Đang gửi file.Xin vui lòng chờ";
    function waitUploadComplete() {
        if (startUpload) {
            if (uplText.length < 40)
                uplText = uplText + ".";
            else
                uplText = "Đang gửi file. Xin vui lòng chờ";
            lblUploading.SetText(uplText);
            setTimeout("waitUploadComplete()", 1000);
        }
        else {
            grdTraining.UpdateEdit();
        }
    }   
</script>
<div style="height:430px;overflow:scroll;">
<dx:ASPxGridView ID="grdTraining" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdTraining"
    Theme="Glass" Font-Size="12px" KeyFieldName="id"    
    OnRowDeleting="grdTraining_RowDeleting"
    OnRowInserting="grdTraining_RowInserting" 
    OnRowUpdating="grdTraining_RowUpdating"
    OnHtmlEditFormCreated="grdTraining_OnHtmlEditFormCreated"
    Width="100%">
    <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
    <ClientSideEvents RowDblClick="function(s, e) {
            grdTraining.StartEditRow(e.visibleIndex);
        }" />
    <Columns>
        <dx:GridViewDataColumn Caption="STT" CellStyle-HorizontalAlign="Center" Width="30px"> 
            <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>          
        </dx:GridViewDataColumn>                              
        <dx:GridViewDataColumn Caption="Thời gian" FieldName="thoigian">         
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Cơ sở đào tạo" FieldName="schoolname">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Khóa học" FieldName="skill">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="trinhdo" Caption="Trình độ">            
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="nganhdaotao" Caption="Ngành đào tạo" />
        <dx:GridViewDataColumn Caption="Kết quả" FieldName="result">
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn Caption="Quyết định" FieldName="decision">
            <DataItemTemplate>
                <a target="_blank" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/FileQD/<%# Eval("filekem") %>"><%# Eval("decision")%></a>
            </DataItemTemplate>
        </dx:GridViewDataColumn>                  
        <dx:GridViewDataColumn Visible="false" FieldName="filekem" />
        <dx:GridViewDataColumn Visible="false" FieldName="qualificationid" />
        <dx:GridViewDataColumn FieldName="donvitochucid" Visible="False" />
        <dx:GridViewDataColumn FieldName="diadiemtochucid" Visible="False" />
        <dx:GridViewDataColumn FieldName="fee" Visible="False" />
        <dx:GridViewDataColumn FieldName="fromdate" Visible="False" />
        <dx:GridViewDataColumn FieldName="todate" Visible="False" />
        <dx:GridViewDataColumn FieldName="trainingformid" Visible="False" />
        <dx:GridViewDataColumn FieldName="idnganhdaotao" Visible="False" />
    </Columns>
    <Settings ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
        PopupEditFormModal="True" PopupEditFormWidth="600px" />
    <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin đào tạo" />
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
                <table cellpadding="1" cellspacing="1" width="600px" style="font-family: Verdana; font-size: 9pt;">                    
                    <tr>
                        <td valign="top" style="width: 125px;">
                            Đơn vị tổ chức
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txt_donvitochuc" runat="server" Text='<%# Eval("donvitochucid") %>'
                                Width="100%"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 125px;">
                            Ngành đào tạo
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_nganhdaotao" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){
                                    if(grdTraining.IsNewRowEditing()){
                                        s.InsertItem(0,'-- Chọn --','0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Trình độ
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cboQualification" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){
                                    if(grdTraining.IsNewRowEditing()){
                                        s.InsertItem(0,'-- Chọn --','0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Hình thức đào tạo
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cboTrainingForm" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents Init="function(s,e){
                                    if(grdTraining.IsNewRowEditing()){
                                        s.InsertItem(0,'-- Chọn --','0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>                                       
                       <tr>
                        <td valign="top">
                            Địa điểm đào tạo
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cmbDiaDiemDaoTao" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> 
                                <ClientSideEvents Init="function(s,e){
                                    if(grdTraining.IsNewRowEditing()){
                                        s.InsertItem(0,'-- Chọn --','0');
                                        s.SetSelectedIndex(0);
                                    }
                                }" />                                                              
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Khóa học
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtSkill" runat="server" Text='<%# Eval("skill") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField ErrorText="Nhập khóa học" IsRequired="True" />
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
                            Cơ sở đào tạo
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtScholl" runat="server" Text='<%# Eval("schoolname") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField ErrorText="Nhập nơi đào tạo" IsRequired="True" />
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
                            Kết quả
                        </td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cboResult" runat="server" Width="100%"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.String">
                                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <Items>
                                    <dx:ListEditItem Text="-- Chọn --" Value="0" Selected="true" />
                                    <dx:ListEditItem Text="Xuất sắc" Value="1" />
                                    <dx:ListEditItem Text="Giỏi" Value="2" />
                                    <dx:ListEditItem Text="Khá" Value="3" />
                                    <dx:ListEditItem Text="Trung bình khá" Value="4" />
                                    <dx:ListEditItem Text="Trung bình" Value="5" />
                                    <dx:ListEditItem Text="Yếu" Value="6" />
                                    <dx:ListEditItem Text="Kém" Value="7" />
                                    <dx:ListEditItem Text="Đạt" Value="8" />
                                    <dx:ListEditItem Text="Không đạt" Value="9" />
                                </Items>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                    </Image>
                                </DropDownButton>
                                <ValidationSettings>
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Học phí
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtFee" runat="server" Text='<%# Eval("fee") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Quyết định
                        </td>
                        <td valign="top">
                            <dx:ASPxTextBox ID="txtTrainingDecision" runat="server" Text='<%# Eval("decision") %>'
                                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                    ErrorTextPosition="Bottom">
                                    <RequiredField ErrorText="Nhập quyết định" IsRequired="True" />
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
                            File đính kèm
                        </td>
                        <td valign="top">
                            <dx:ASPxLabel ID="txt" runat="server" ClientInstanceName="lblUploading" ForeColor="Red" />
                            <dx:ASPxUploadControl ID="uploadFileDinhKemTagDT" runat="server" 
                                OnFileUploadComplete="uploadFileDinhKemTagDT_Load"
                                ClientInstanceName="uploadFileDinhKemTagDT" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <ClientSideEvents FileUploadStart='function(s,e)
                                {
                                    startUpload = true;                                           
                                }' FilesUploadComplete='function(s,e)
                                {
                                    lblUploading.SetText("Gửi file hoàn tất.");
                                    startUpload = false;
                                }' /> 
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Từ ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="calStartDateTraining" runat="server" Value='<%# Eval("fromdate") %>'
                                DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                Width="100%">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Đến ngày
                        </td>
                        <td valign="top">
                            <dx:ASPxDateEdit ID="calDateEnd" runat="server" Value='<%# Eval("todate") %>'
                                DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">                                
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td valign="top">
                            <table cellpadding="2" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                            save();
                                         }" style="text-decoration: none;">
                                            <img alt="" height="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                width="16" />
                                        </a>
                                    </td>
                                    <td valign="top">
                                        <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                                    save();                                     
                                        }" style="text-decoration: none;"><font size="2">Lưu</font></a>
                                    </td>
                                    <td style="width: 5px;">
                                    </td>
                                    <td valign="top">
                                        <a onclick="grdTraining.CancelEdit()" style="text-decoration: none;">
                                            <img alt="" height="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                width="16" />
                                        </a>
                                    </td>
                                    <td valign="top">
                                        <a onclick="grdTraining.CancelEdit()" style="text-decoration: none;"><font size="2">
                                            Đóng</font></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </EditForm>
     
    </Templates>    
</dx:ASPxGridView>
</div>
   <div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                         AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                        <ClientSideEvents Click="function(s, e) {
                            grdTraining.AddNewRow()
                        }" />
                        <Image Url="../../images/imgadmin/add.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" 
                        Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {                            
                            grdTraining.StartEditRow(grdTraining.GetFocusedRowIndex());
                        }" />
                        <Image Url="../../images/imgadmin/edit.png"></Image>
                    </dx:ASPxButton>
                </div>
                <div style="width: 90px; height: 25px; float: left;">
                    <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                        AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                          if (confirm('Bạn có muốn xóa ?')) {

                            grdTraining.DeleteRow(grdTraining.GetFocusedRowIndex());
                            }
                        }" />
                        <Image Url="../../images/imgadmin/delete_16.png"></Image>
                    </dx:ASPxButton>
                </div>
            </div>            
      
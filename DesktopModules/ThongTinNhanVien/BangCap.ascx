<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BangCap.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.BangCap" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
    <script type="text/javascript">

        function SaveBangCap() {

            if (cmbBangCap.GetValue() == 0) {

                cmbBangCap.SetFocus();
                alert('Xin vui lòng chọn bằng cấp !');
                return false;
            }
            else if (cmbLoaiBangCap.GetValue() == 0) {

                cmbLoaiBangCap.SetFocus();
                alert('Xin vui lòng chọn loại bằng cấp !');
                return false;
            }
            else if (cmbCNDaoTao.GetValue() == 0) {

                cmbCNDaoTao.SetFocus();
                alert('Xin vui lòng chọn chuyên ngành !');
                return false;
            }
            else if (cboTrainingFormBangCap.GetValue() == 0) {

                cboTrainingFormBangCap.SetFocus();
                alert('Xin vui lòng chọn hình thức đào tạo !');
                return false;
            }
            else if (txtTruongCap.GetText() == "") {

                txtTruongCap.SetFocus();
                alert('Xin vui lòng nhập trường cấp bằng !');
                return false;
            }
            else if (txtNamTotNghiep.GetText() == "") {

                txtNamTotNghiep.SetFocus();
                alert('Xin vui lòng nhập năm tốt nghiệp !');
                return false;
            }
            else if (cmbResult.GetValue() == 0) {

                cmbResult.SetFocus();
                alert('Xin vui lòng chọn kết quả !');
                return false;
            }
            else { gridBangCap.UpdateEdit(); }
        }
</script>
<div style="height:430px;overflow:scroll;">
            <dx:ASPxGridView ID="gridBangCap" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridBangCap"
                Theme="Aqua" Font-Size="12px" KeyFieldName="id"
                Width="100%" 
                OnRowDeleting="gridBangCap_RowDeleting" 
                OnRowInserting="gridBangCap_RowInserting"
                OnRowUpdating="gridBangCap_RowUpdating"
                OnHtmlEditFormCreated="gridBangCap_OnHtmlEditFormCreated">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager PageSize="100">
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
                <SettingsEditing EditFormColumnCount="3" Mode="EditForm" PopupEditFormHorizontalAlign="WindowCenter"
                    PopupEditFormModal="True" PopupEditFormWidth="500px" />
                <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh lịch sử bản thân" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <Settings ShowStatusBar="Visible" />
                <ClientSideEvents RowDblClick="function(s, e) {
                    gridBangCap.StartEditRow(e.visibleIndex);
                }" />
                <Columns>                    
                    <dx:GridViewDataColumn Caption="STT">
                        <DataItemTemplate><%# Container.ItemIndex +1 %></DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="trinhdo" Caption="Bằng cấp" />
                    <dx:GridViewDataColumn FieldName="chuyennganh" Caption="Chuyên ngành" />
                    <dx:GridViewDataColumn FieldName="hedaotao" Caption="Hình thức đào tạo" />
                    <dx:GridViewDataColumn FieldName="schools" Caption="Trường cấp" />
                    <dx:GridViewDataColumn FieldName="namtotnghiep" Caption="Năm cấp" />
                    <dx:GridViewDataColumn FieldName="danhhieu" Caption="Danh hiệu" />
                    <dx:GridViewDataColumn FieldName="result" Caption="Kết quả" />
                    <dx:GridViewDataCheckColumn FieldName="highest" Caption="Cao nhất" />
                    <dx:GridViewDataTextColumn FieldName="thoigiandaotao" Caption="Thời gian đào tạo" />
                    <dx:GridViewDataColumn FieldName="ghichu" Caption="Ghi chú" />
                    <dx:GridViewDataColumn FieldName="id" Visible="False" />                    
                    <dx:GridViewDataColumn FieldName="chuyenmon" Visible="False" />                    
                    <dx:GridViewDataColumn FieldName="trainingid" Visible="False" />
                    <dx:GridViewDataColumn FieldName="qualificationid" Visible="False" />
                    <dx:GridViewDataColumn FieldName="professionid" Visible="False" />
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
                    <Header Font-Bold="True" Wrap="True" HorizontalAlign="Center">
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
                            <table style="font-size: 10pt; font-family: Verdana;" cellpadding="1" cellspacing="1"
                                width="70%">
                                    <tr>
                                    <td valign="top">
                                        Cao nhất
                                    </td>
                                    <td valign="top" colspan="3">
                                        <dx:ASPxCheckBox ID="checkBangCapCaoNhat" runat="server" Checked='<%# Eval("highest") == null?false:Eval("highest") %>'></dx:ASPxCheckBox>
                                    </td>
                                    </tr>
                                <tr>
                                    <td valign="top" style="width: 130px;">
                                        Bằng cấp
                                    </td>
                                    <td valign="top">                                       
                                        <dx:ASPxComboBox ID="cmbBangCap" ClientInstanceName="cmbBangCap" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                           
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridBangCap.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />
                                        </dx:ASPxComboBox>
                                    </td>
                                     <td valign="top" style="width: 120px;">
                                        Loại bằng cấp
                                    </td>
                                    <td valign="top">                                       
                                        <dx:ASPxComboBox ID="cmbLoaiBangCap" ClientInstanceName="cmbLoaiBangCap" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                           
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridBangCap.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />
                                        </dx:ASPxComboBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Chuyên ngành
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmbCNDaoTao" ClientInstanceName="cmbCNDaoTao" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridBangCap.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td valign="top">
                                        HT đào tạo
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cboTrainingFormBangCap" ClientInstanceName="cboTrainingFormBangCap" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ClientSideEvents Init="function(s,e){
                                                if(gridBangCap.IsNewRowEditing()){
                                                    s.InsertItem(0,'-- Chọn --','0');
                                                    s.SetSelectedIndex(0);
                                                }
                                            }" />
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Thời gian đào tạo:
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_thoigiandaotao" ClientInstanceName="txt_thoigiandaotao" runat="server" Width="100%" Text='<%# Eval("thoigiandaotao") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td valign="top">
                                        Năm tốt nghiệp
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txtNamTotNghiep" ClientInstanceName="txtNamTotNghiep" runat="server" Width="100%" Text='<%# Eval("namtotnghiep") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Trường cấp bằng
                                    </td>
                                    <td valign="top" colspan="3">
                                        <dx:ASPxTextBox ID="txtTruongCap" ClientInstanceName="txtTruongCap" runat="server" Width="100%" Text='<%# Eval("schools") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                            
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Danh hiệu
                                    </td>
                                    <td valign="top" colspan="3">
                                        <dx:ASPxTextBox ID="txtDanhHieu" ClientInstanceName="txtDanhHieu" runat="server" Width="100%" Text='<%# Eval("danhhieu") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                           
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Kết quả
                                    </td>
                                    <td valign="top" colspan="3">
                                        <dx:ASPxComboBox ID="cmbResult" ClientInstanceName="cmbResult" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False"
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.String">                                            
                                            <Items>
                                                <dx:ListEditItem Text="-- Chọn --" Value="0" Selected="true" />
                                                <dx:ListEditItem Text="Xuất sắc" Value="1" />
                                                <dx:ListEditItem Text="Giỏi" Value="2" />
                                                <dx:ListEditItem Text="Khá" Value="3" />
                                                <dx:ListEditItem Text="Trung bình khá" Value="4" />
                                                <dx:ListEditItem Text="Trung bình" Value="5" />
                                                <dx:ListEditItem Text="Yếu" Value="6" />
                                                <dx:ListEditItem Text="Kém" Value="7" />
                                            </Items>                                            
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Ghi chú
                                    </td>
                                    <td valign="top" colspan="3">
                                        <dx:ASPxMemo ID="memoGhiChu" runat="server" Text='<%# Eval("ghichu") %>'
                                            Height="40px" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                           
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    </td>
                                    <td valign="top" colspan="3">
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px">
                                                <Image Url="../../images/imgadmin/save_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){SaveBangCap()}" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 100px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="81px"
                                                AutoPostBack="False">
                                                <Image Url="../../images/imgadmin/delete_16.png">
                                                </Image>
                                                <ClientSideEvents Click="function(s,e){ gridBangCap.CancelEdit();}" />
                                            </dx:ASPxButton>
                                        </div>
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
                                            gridBangCap.AddNewRow()
                                        }" />
                                    <Image Url="../../images/imgadmin/add.png"></Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                            
                                            gridBangCap.StartEditRow(gridBangCap.GetFocusedRowIndex());
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
                                            gridBangCap.DeleteRow(gridBangCap.GetFocusedRowIndex());
                                            }
                                        }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>

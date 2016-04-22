<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DaoTao.ascx.cs" Inherits="VNPT.Modules.Employees.DaoTao" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx1" %>

<script type="text/javascript">
    function AddSelectedItems() {
        MoveSelectedItems(lbAvailable, lbChoosen);
        UpdateButtonState();
    }
    function AddAllItems() {
        MoveAllItems(lbAvailable, lbChoosen);
        UpdateButtonState();
    }
    function RemoveSelectedItems() {
        MoveSelectedItems(lbChoosen, lbAvailable);
        UpdateButtonState();
    }
    function RemoveAllItems() {
        MoveAllItems(lbChoosen, lbAvailable);
        UpdateButtonState();
    }
    function MoveSelectedItems(srcListBox, dstListBox) {
        srcListBox.BeginUpdate();
        dstListBox.BeginUpdate();

        var items = srcListBox.GetSelectedItems();
        for (var i = items.length - 1; i >= 0; i = i - 1) {
            dstListBox.AddItem(items[i].text, items[i].value);
            srcListBox.RemoveItem(items[i].index);
        }
        srcListBox.EndUpdate();
        dstListBox.EndUpdate();
    }
    function MoveAllItems(srcListBox, dstListBox) {
        srcListBox.BeginUpdate();
        var count = srcListBox.GetItemCount();
        for (var i = 0; i < count; i++) {
            var item = srcListBox.GetItem(i);
            dstListBox.AddItem(item.text, item.value);
        }
        srcListBox.EndUpdate();
        srcListBox.ClearItems();
    }
    function UpdateButtonState() {
        btnMoveAllItemsToRight.SetEnabled(lbAvailable.GetItemCount() > 0);
        btnMoveAllItemsToLeft.SetEnabled(lbChoosen.GetItemCount() > 0);
        btnMoveSelectedItemsToRight.SetEnabled(lbAvailable.GetSelectedItems().length > 0);
        btnMoveSelectedItemsToLeft.SetEnabled(lbChoosen.GetSelectedItems().length > 0);
    }
    function OnDonViChaChanged(cmbDonVi) {
        lbAvailable.PerformCallback(cmbDonVi.GetValue().toString());
    }
    function CallPupop(key) {

        ASPxPopupControl1.Show();
        ASPxCallbackPanel1.PerformCallback(key);
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="width: 96%; margin: auto; text-align: left;">
            <table cellspacing="1" cellpadding="1" width="100%" style="font-family: Verdana;
                font-size: 10pt;">
                <tr>
                    <td valign="top">
                        <dx:ASPxButton ID="btThem" runat="server" AutoPostBack="False" Width="75px" Height="25px"
        Image-Url="~/images/imgadmin/add.png" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Thêm">
        <Image Url="~/images/imgadmin/add.png">
        </Image>
        <ClientSideEvents Click="function(s, e) {
                CallPupop(1);
            }" />
    </dx:ASPxButton>
                    </td>
                    <td valign="top">
                        <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Enabled="false"
                            Width="75px" Height="25px" Image-Url="~/images/imgadmin/edit.png" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Sửa">
                            <Image Url="~/images/imgadmin/edit.png">
                            </Image>
                            <ClientSideEvents Click="function(s, e) {
                        CallPupop(2);
                    }" />
                        </dx:ASPxButton>
                    </td>
                    <td valign="top">
                        <dx:ASPxButton ID="btXoa" runat="server" Height="25px" Width="75px" AutoPostBack="true"
                            OnClick="btXoa_Click" Image-Url="~/images/imgadmin/delete_16.png" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Xóa">
                            <Image Url="~/images/imgadmin/delete_16.png">
                            </Image>
                            <ClientSideEvents Click="function(s, e) {
	                                return confirm('Bạn có muốn xóa?');
                                }" />
                        </dx:ASPxButton>
                    </td>
                    <td valign="top">
                        Chọn Quyết định
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbQuyetDinh" runat="server" AutoPostBack="true" ClientInstanceName="cmbQuyetDinh"
                            IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" ShowLoadingPanel="true"
                            OnSelectedIndexChanged="cmbQuyetDinh_SelectedIndexChanged" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                            ValueType="System.String">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
            </table>
        </div>
        <div style="width: 98%; height: auto; margin-top: 5px;">
            <dx:ASPxGridView ID="grdTraining" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdTraining"
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="id"
                OnHtmlDataCellPrepared="grdTraining_HtmlDataCellPrepared" Width="98%">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <Columns>
                    <dx:GridViewDataColumn FieldName="fromdate" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="todate" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="trainingformid" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="qualificationid" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Học viên" FieldName="employeeid" VisibleIndex="3">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lblEmp" runat="server">
                            </dx:ASPxLabel>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Thời gian" FieldName="id" VisibleIndex="3">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lblTime" runat="server">
                            </dx:ASPxLabel>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Học phí" FieldName="fee" VisibleIndex="6">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Khóa học" FieldName="skill" VisibleIndex="7">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Quyết định" FieldName="decision" VisibleIndex="8">
                        <DataItemTemplate>
                            <dx:ASPxImage ID="imgFile" runat="server" Width="12px" Height="12px" Style="float: left;
                                margin-top: 2px;">
                            </dx:ASPxImage>
                            <dx:ASPxHyperLink ID="hyperDowload" runat="server" Target="_blank">
                            </dx:ASPxHyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataCheckColumn Caption="Cam kết" FieldName="camket" VisibleIndex="10">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataColumn Caption="Kết quả" FieldName="result" VisibleIndex="11">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="diadiemtochucId" VisibleIndex="12" Visible="false">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="donvitochucId" VisibleIndex="13" Visible="false">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="schoolname" VisibleIndex="14" Visible="false">
                    </dx:GridViewDataColumn>
                </Columns>
                <SettingsPager PageSize="300">
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
                <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                    PopupEditFormModal="True" PopupEditFormWidth="570px" PopupEditFormVerticalAlign="TopSides" />
                <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh thông tin đào tạo" />
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
            </dx:ASPxGridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="ASPxPopupControl1"
    Width="557px" HeaderText="Quản trị thông tin đào tạo" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="TopSides" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="ASPxCallbackPanel1"
                OnCallback="ASPxCallbackPanel1_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <div style="width: 530px; margin: auto;">
                            <dx:ASPxRoundPanel ID="RoundPanelDaoTao1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                Width="500" ShowHeader="false">
                                <ContentPaddings Padding="4px" />
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <table cellpadding="0" style="font-size: 10pt; width: 500px;">
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="lbl" runat="server" Text="Chọn đơn vị" Style="float: left; margin-right: 5px;"></asp:Label>
                                                    <dx:ASPxComboBox ID="cmbDonVi" runat="server" Width="200px" ClientInstanceName="cmbDonVi"
                                                        OnLoad="cmbDonVi_Load" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <ValidationSettings>
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                              OnDonViChaChanged(s); 
                                                        }" />
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <dx:ASPxLabel ID="lblAvailable" runat="server" CssClass="DemoLabel NoLeftIndent CaptionLabelIndent"
                                                        Text="Danh sách nhân viên">
                                                    </dx:ASPxLabel>
                                                    <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable"
                                                        Width="200px" Height="130px" SelectionMode="CheckColumn" OnCallback="lbAvailable_callback"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" LoadingPanelImagePosition="Top"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                                                        </ClientSideEvents>
                                                        <ValidationSettings>
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                    </dx:ASPxListBox>
                                                </td>
                                                <td>
                                                    <table cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="btnMoveSelectedItemsToRight" runat="server" ClientInstanceName="btnMoveSelectedItemsToRight"
                                                                    AutoPostBack="False" Text="&gt;" Width="50px" Height="23px" ClientEnabled="False"
                                                                    ToolTip="Add selected items" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ClientSideEvents Click="function(s, e) { AddSelectedItems(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="btnMoveAllItemsToRight" runat="server" ClientInstanceName="btnMoveAllItemsToRight"
                                                                    AutoPostBack="False" Text="&gt;&gt;" Width="50px" Height="23px" ToolTip="Add all items"
                                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ClientSideEvents Click="function(s, e) { AddAllItems(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="Spacer" style="height: 10px;">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="btnMoveSelectedItemsToLeft" runat="server" ClientInstanceName="btnMoveSelectedItemsToLeft"
                                                                    AutoPostBack="False" Text="&lt;" Width="50px" ClientEnabled="False" ToolTip="Remove selected items"
                                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ClientSideEvents Click="function(s, e) { RemoveSelectedItems(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="btnMoveAllItemsToLeft" runat="server" ClientInstanceName="btnMoveAllItemsToLeft"
                                                                    AutoPostBack="False" Text="&lt;&lt;" Width="50px" Height="23px" ClientEnabled="False"
                                                                    ToolTip="Remove all items" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ClientSideEvents Click="function(s, e) { RemoveAllItems(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td valign="top"">
                                                    <dx:ASPxLabel ID="lblChoosen" runat="server" Text="Danh sách nhân viên được chọn">
                                                    </dx:ASPxLabel>
                                                    <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Width="200px"
                                                        Height="130px" SelectionMode="CheckColumn" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                                                        </ClientSideEvents>
                                                        <ValidationSettings>
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                    </dx:ASPxListBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <dx:ASPxRoundPanel ID="RoundPanelDaoTao2" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                Width="500px" ShowHeader="false">
                                <ContentPaddings Padding="4px" />
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <table cellpadding="4" cellspacing="0" width="500px">
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Đơn vị tổ chức</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxComboBox ID="cmbDonViToChuc" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                        ValueType="System.String">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <Items>
                                                            <dx:ListEditItem Text="Viễn thông Đắk Lắk - Đắk Nông" Value="1" Selected="true" />
                                                            <dx:ListEditItem Text="Tập đoàn BCVT Việt Nam" Value="2" />
                                                        </Items>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                <td style="width: 20%">
                                                    <font size="2"><b>Hình thức đào tạo</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxComboBox ID="cboTrainingForm" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                        ValueType="System.String">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                <td style="width: 20%">
                                                    <font size="2"><b>Trình độ</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxComboBox ID="cboQualification" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                        ValueType="System.String">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                <td style="width: 20%">
                                                    <font size="2"><b>Địa điểm đào tạo</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxComboBox ID="cmbDiaDiemDaoTao" runat="server" IncrementalFilteringMode="Contains"
                                                        Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                        ValueType="System.String">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                <td style="width: 20%">
                                                    <font size="2"><b>Cơ sở đào tạo</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxTextBox ID="txtCoSoDaoTao" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RequiredField ErrorText="Nhập cở sở đào tạo" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Quyết định</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxTextBox ID="txtTrainingDecision" runat="server" ClientInstanceName="Name"
                                                        Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RequiredField ErrorText="Nhập quyết định" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Khóa học</b></font>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtSkill" runat="server" ClientInstanceName="Name" Width="95%"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RequiredField ErrorText="Nhập khóa học" IsRequired="True" />
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Học phí</b></font>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtFee" runat="server" ClientInstanceName="Name" Width="95%"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RequiredField ErrorText="Nhập học phí" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><font size="2"><b>Cam kết</b></font></td>
                                                <td>
                                                    <dx:ASPxCheckBox ID="checkCamKet" runat="server"></dx:ASPxCheckBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Từ ngày</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxDateEdit ID="calStartDateTraining" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings>
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <CalendarProperties>
                                                            <HeaderStyle Spacing="1px" />
                                                            <FooterStyle Spacing="17px" />
                                                        </CalendarProperties>
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Đến ngày</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxDateEdit ID="calDateEnd" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings>
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <CalendarProperties>
                                                            <HeaderStyle Spacing="1px" />
                                                            <FooterStyle Spacing="17px" />
                                                        </CalendarProperties>
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    <font size="2"><b>Kết quả</b></font>
                                                </td>
                                                <td style="width: 40%">
                                                    <dx:ASPxComboBox ID="cboResult" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                        ValueType="System.String">
                                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                        </LoadingPanelImage>
                                                        <Items>
                                                            <dx:ListEditItem Text="" Value="0" Selected="true" />
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
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                    <font size="2"><b>File đính kèm</b></font>
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxHiddenField ID="HiddentfileKem" runat="server" ClientInstanceName="fileKem">
                                                    </dx:ASPxHiddenField>
                                                    <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" OnFileUploadComplete="uploadFileDinhKem_Load"
                                                        ClientInstanceName="uploadFileDinhKem" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxUploadControl>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <table cellpadding="2" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Width="75px"
                                                                    Height="25px" Image-Url="~/images/imgadmin/add.png" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Lưu">
                                                                    <Image Url="~/images/imgadmin/save_16.png">
                                                                    </Image>
                                                                    <ClientSideEvents Click="function(s, e) {
                            if(ASPxClientEdit.ValidateGroup('editForm')){
                                uploadFileDinhKem.UploadFile();
                                fileKem.Set('filekem',uploadFileDinhKem.GetText().toString());
	                            ASPxCallbackPanel1.PerformCallback();	                            	                            
	                            ASPxPopupControl1.Hide();	                            
	                            }
                            }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxButton ID="btDong" runat="server" AutoPostBack="False" Width="75px" Height="25px"
                                                                    Image-Url="~/images/imgadmin/add.png" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Đóng">
                                                                    <Image Url="~/images/imgadmin/delete_16.png">
                                                                    </Image>
                                                                    <ClientSideEvents Click="function(s, e) {
	                            ASPxPopupControl1.Hide();
                            }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

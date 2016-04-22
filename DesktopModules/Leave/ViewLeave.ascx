<%@ Control language="C#" Inherits="Philip.Modules.Leave.ViewLeave" CodeFile="ViewLeave.ascx.cs" AutoEventWireup="true"%>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
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
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
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



<div style="width: 36%; float: left">
 
<dx:ASPxTreeList ID="treeList" runat="server" Width="100%" AutoGenerateColumns="False"
        KeyFieldName="Id" ClientInstanceName="treeList" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating"
            OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren">
        <Border BorderColor="#99ccff" BorderStyle="Solid" BorderWidth="1" />
        <Columns>
            <dx:TreeListTextColumn FieldName="Name">
                <PropertiesTextEdit EncodeHtml="false" Size="9" />
            </dx:TreeListTextColumn>
        </Columns>
        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            <LoadingPanel Url="~/App_Themes/Aqua/TreeList/Loading.gif">
            </LoadingPanel>
        </Images>
        <SettingsBehavior ProcessFocusedNodeChangedOnServer="false" AllowFocusedNode="True"
            ExpandCollapseAction="NodeDblClick" />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Settings ShowColumnHeaders="False" />
        <ClientSideEvents FocusedNodeChanged="function(s, e) { 
			var key = treeList.GetFocusedNodeKey();
			CallbackPanel.PerformCallback(key);
			
		}" />
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <CustomizationWindowContent VerticalAlign="Top">
            </CustomizationWindowContent>
        </Styles>
        <Templates>
        
            <DataCell>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>'
                                Width="16" Height="16" IsPng="true">
                            </dx:ASPxImage>
                        </td>
                        <td>
                        </td>
                          <td style="padding-bottom: 1px;">
                            <font size="2" face="Tahoma"><b>
                               &nbsp; <%# Container.Text %></b></font>
                            </td>
                    </tr>
                </table>
            </DataCell>
        </Templates>
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
    </dx:ASPxTreeList>

</div>    
<div  style="width:63%;float:right">
<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
                    ClientInstanceName="CallbackPanel" OnCallback="ASPxCallbackPanel1_Callback">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                        <%--<dx:ASPxPageControl ID="tabEmp" runat="server" ActiveTabIndex="0" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" EnableHierarchyRecreation="True" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                TabSpacing="6px" Width="100%">
                                <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
                                </LoadingPanelStyle>
                                <TabPages>
                                    <dx:TabPage Text="Quản trị thông tin nghỉ phép">
                                    <ContentCollection>
                                            <dxw:ContentControl ID="ContentControl1" runat="server">--%>
<dx:ASPxGridView ID="grdLeave" runat="server" AutoGenerateColumns="False" 
            ClientInstanceName="grdLeave" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
            CssPostfix="Aqua" KeyFieldName="id" 
            OnHtmlDataCellPrepared="grdLeave_HtmlDataCellPrepared" 
            OnHtmlRowCreated="grdLeave_HtmlRowCreated" 
            OnRowDeleting="grdLeave_RowDeleting" OnRowInserting="grdLeave_RowInserting" 
            OnRowUpdating="grdLeave_RowUpdating" Width="100%">
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"  />
            <ClientSideEvents RowDblClick="function(s, e) {
grdLeave.StartEditRow(e.visibleIndex);
}" />
            <Columns>
                
                <dx:GridViewDataColumn FieldName="reason" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="leavetype" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="todate" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="fromdate" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="employeeid" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="year" Visible="False" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nơi nghỉ phép" FieldName="provinceid" 
                    VisibleIndex="3">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lblProvince" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Thời gian" FieldName="id" 
                    VisibleIndex="4">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lblProvince" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:GridViewDataColumn>
             
            </Columns>
            <SettingsPager>
                <Summary AllPagesText="{0} - {1} " Visible="False" />
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" 
                PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" 
                PopupEditFormWidth="600px" />
            <SettingsText ConfirmDelete="Bạn có muốn xóa" 
                PopupEditFormCaption="Hiệu chỉnh thông tin nghỉ phép" />
            <SettingsLoadingPanel ImagePosition="Top" />
            <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <ImagesEditors>
                <DropDownEditDropDown>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                        PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
            <StatusBar>
            <a style="text-decoration:none;" onclick="grdLeave.AddNewRow()">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/add.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grdLeave.AddNewRow()">
                <font size="2">Thêm mới</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="grdLeave.StartEditRow(grdLeave.GetFocusedRowIndex());">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/edit_f2.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grid.StartEditRow(grdLeave.GetFocusedRowIndex());">
                <font size="2">Chỉnh sửa</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdLeave.DeleteRow(grdLeave.GetFocusedRowIndex());}">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/cancel_f2.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grdLeave.DeleteRow(grdLeave.GetFocusedRowIndex());}">
                <font size="2">Xóa</font>
            </a>&nbsp;
            </StatusBar>
                <EditForm>
                    <div style="padding: 4px 4px 3px 4px">
                        <table cellpadding="4" cellspacing="0" width="600px">
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Mã</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxTextBox ID="txtId" runat="server" Enabled="false" OnLoad="txtId_Load" 
                                        Width="20%" />
                                    <dx:ASPxTextBox ID="txtEmpId" runat="server" OnLoad="txtEmpId_Load" 
                                        Visible="false" Width="20%" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Loại</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxComboBox ID="ddlType" runat="server" OnLoad="ddlType_Load" 
                                        Width="95%">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Nơi nghỉ phép</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxComboBox ID="ddlProvince" runat="server" OnLoad="ddlProvince_Load" 
                                        Width="95%">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Lý do</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxTextBox ID="txtReason" runat="server" ClientInstanceName="Name" 
                                        EnableClientSideAPI="true" OnLoad="txtReason_Load" Width="90%">
                                        
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Phép Năm</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxTextBox ID="txtYear" runat="server" ClientInstanceName="Name" 
                                        EnableClientSideAPI="true" OnLoad="txtYear_Load" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm">
                                        <RegularExpression ErrorText="Chỉ được nhập số" 
                                                                                        ValidationExpression="^[+-]?[\d]*$" />
                                            <RequiredField ErrorText="Nhập năm" IsRequired="True" />
                                            
                                            <ErrorFrameStyle ForeColor="Red">
                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                <ErrorTextPaddings PaddingRight="3px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Từ ngày</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxDateEdit ID="calFromDate" runat="server" 
                                        OnLoad="calFromDate_Load">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <font size="2"><b>Đến ngày</b></font>
                                </td>
                                <td style="width: 80%">
                                    <dx:ASPxDateEdit ID="calToDate" runat="server" 
                                        OnLoad="calToDate_Load">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <table cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td>
                                                <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
     grdLeave.UpdateEdit()}" style="text-decoration: none;">
                                                <img alt="" height="20" 
                                                    src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/save_f2.png" 
                                                    width="20" /> </a>
                                            </td>
                                            <td>
                                                <a onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
     grdLeave.UpdateEdit()}" style="text-decoration: none;"><font size="2">Chỉnh sửa</font></a>
                                            </td>
                                            <td style="width: 5px;">
                                            </td>
                                            <td>
                                                <a onclick="grdLeave.CancelEdit()" style="text-decoration: none;">
                                                <img alt="" height="20" 
                                                    src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/restore_f2.png" 
                                                    width="20" /> </a>
                                            </td>
                                            <td>
                                                <a onclick="grdLeave.CancelEdit()" style="text-decoration: none;">
                                                <font size="2">Đóng</font></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </EditForm>
                
            </Templates>
            <Settings  ShowStatusBar="Visible" />
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true"  />
        </dx:ASPxGridView>
       <%-- </dxw:ContentControl>
        </ContentCollection>
        
        </dx:TabPage>
        </TabPages>
        </dx:ASPxPageControl>--%>
        </dx:PanelContent>
        </PanelCollection>
        </dx:ASPxCallbackPanel>
</div>

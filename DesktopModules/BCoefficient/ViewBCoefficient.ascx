<%@ Control Language="C#" Inherits="VNPT.Modules.SalaryType.ViewBCoefficient" CodeFile="ViewBCoefficient.ascx.cs"
    AutoEventWireup="true" %>
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

<script type="text/javascript">
    var keyValue;
    function ShowPupop(keyValue) {
        popupEmployeesEdit.Show();
        callbackPanelEmployees.PerformCallback(keyValue);
    }

    function ShowPupop1(keyValue) {
        if (keyValue.toString().indexOf('u') >= 0) {
            popupSalary.Show();
            ASPxCallbackPanel2.PerformCallback(keyValue);
        }
    }
    function LoadTree(s, e) {
        popupEmployeesEdit.Hide();
        callbackPanelEmployees.PerformCallback();
        treeList.PerformCallback();
    }

    function clickCallBack(s, e) {
        callbackPanelEmployees.PerformCallback(keyValue);
    }

    var currentNodeKey;
    function ShowMenu(nodeKey, x, y) {
        clientPopupMenu.ShowAtPos(x, y);
        currentNodeKey = nodeKey;
    }
    function ProcessNodeClick(itemName) {
        switch (itemName) {
            case "new":
                {
                    PopupControlBacLuong.Show();
                    CallbackPanelBacLuong.PerformCallback('w' + currentNodeKey);
                    break;
                }
            case "edt":
                {
                    PopupControlBacLuong.Show();
                    CallbackPanelBacLuong.PerformCallback('t' + currentNodeKey);
                    break;
                }
            case "del":
                {
                    if (confirm('Bạn có muốn thông tin này ko?')) {
                        CallbackPanelBacLuong.PerformCallback('l' + currentNodeKey);
                        break;
                    } else { break; }
                }
            case "qlBac":
                {
                  
                    CallbackPopup_ThoiDiemBacLuongCaoNhat.PerformCallback('qlBac' + currentNodeKey);
                    break;
                }
            default: return;
        }
    }   
</script>

<table cellpadding="2" cellspacing="2" width="100%">
    <tr>        
        <td valign="top">
            <table>
                <tr>
                    <td><dx:ASPxCallbackPanel runat="server" ID="callbackPanel_TopButton" OnCallback="callbackPanel_TopButton_Callback"
        ClientInstanceName="callbackPanel_TopButton" ShowLoadingPanel="false">
        <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
        </LoadingPanelImage>
        <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
        </LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent6" runat="server">
                <div style="width: 300px; text-align: left; margin-left: 1px;">
                    <table width="100%" cellpadding="2" cellspacing="0">
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btThem" runat="server" Text="Thêm" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {                
	                ShowPupop(1);
                }" />
                                    <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                        VerticalPosition="center" />
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btSua" runat="server" Text="Sửa" ClientInstanceName="btSua" AutoPostBack="false"
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                    Width="81px">
                                    <ClientSideEvents Click="function(s, e) {
	                ShowPupop(2);
                }" />
                                    <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/edit_16.png" Repeat="NoRepeat"
                                        VerticalPosition="center" />
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btXoa" runat="server" AutoPostBack="true" Text="Xóa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    OnClick="btXoa_Click">
                                    <ClientSideEvents Click="function(s, e) {
	                        return confirm('Bạn có muốn xóa?');
                        }" />
                                    <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/delete_16.png"
                                        Repeat="NoRepeat" VerticalPosition="center" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel></td>
                </tr>
            </table>
        <dx:ASPxTreeList ID="treeList" runat="server" Width="100%" AutoGenerateColumns="False"
        KeyFieldName="Id" ClientInstanceName="treeList" OnCustomCallback="treeList_CallBack"
        OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating" 
        OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
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
        <SettingsCookies Enabled="True" StoreExpandedNodes="false" StoreSelection="false" />
        <SettingsBehavior AllowSort="false" ProcessFocusedNodeChangedOnServer="false" AllowFocusedNode="True"
            ExpandCollapseAction="NodeDblClick" />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Settings ShowColumnHeaders="False" />
        <ClientSideEvents FocusedNodeChanged="function(s, e) { 
			var key = treeList.GetFocusedNodeKey();		
          
			callbackPanel_TopButton.PerformCallback(key);
			CallbackPanel.PerformCallback(key);			           			
		}" ContextMenu="function(s, e) {
	           if (e.objectType != 'Node') return;
	           s.SetFocusedNodeKey(e.objectKey);
	                  
	               var mouseX = ASPxClientUtils.GetEventX(e.htmlEvent);
	               var mouseY = ASPxClientUtils.GetEventY(e.htmlEvent);   
                   ShowMenu(e.objectKey, mouseX, mouseY);
              
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
                        </td>
                        <td style="padding-bottom: 1px;">
                            <font size="2" face="Tahoma"><b>&nbsp;
                                <%# Container.Text %></b></font>
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
    </dx:ASPxTreeList></td>
        <td valign="top">
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="CallbackPanel"
        OnCallback="ASPxCallbackPanel1_Callback">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <table>
                    <tr>
                        <td valign="top">
                        <asp:HiddenField ID="hiddenViTriBac" runat="server" />
                        <asp:HiddenField ID="hiddenIDBacLuong" runat="server" />
                        <asp:HiddenField ID="hiddenIDNhom" runat="server" />
                        <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị danh sách các thời điểm thay đổi hệ số lương"
                            OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid" OnInitNewRow="grid_InitNewRow"
                            OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting" OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                            <ClientSideEvents RowDblClick="function(s, e) {
                            grid.StartEditRow(e.visibleIndex);
                        }" />
                            <Templates>
                                <EditForm>
                                    <div style="padding: 4px 4px 3px 4px">
                                        <table width="400px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                                            font-size: 10pt;">
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtId" runat="server" Visible="false" OnLoad="txtId_Load" Width="20%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 130px;">
                                                    Hệ số
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ClientInstanceName="Name" ID="txtCoefficient" runat="server" OnLoad="txtCoefficient_Load"
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RegularExpression ErrorText="Nhập sai định dạng!" ValidationExpression="\d+(\.\d+)?" />
                                                            <RequiredField IsRequired="True" ErrorText="Nhập hệ số"></RequiredField>
                                                            <ErrorFrameStyle ForeColor="Red">
                                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                                <ErrorTextPaddings PaddingRight="3px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Thời gian áp dụng
                                                </td>
                                                <td>
                                                    <dx:ASPxDateEdit ID="txtDateEffectted" runat="server" OnLoad="txtDateEffectted_Load"
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
                                                    Ghi chú
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtTitle" runat="server" OnLoad="txtTitle_Load" Width="100%"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                       
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <table cellpadding="2" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                                            grid.UpdateEdit(); 
                                                            treeList.PerformCallback();}">
                                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                                        alt="" />
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit(); treeList.PerformCallback();}"><font size="2">Lưu</font></a>
                                                            </td>
                                                            <td style="width: 5px;">
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="grid.CancelEdit()">
                                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                                        alt="" />
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="grid.CancelEdit()"><font size="2">Đóng</font></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditForm>
                                <StatusBar>
                                    <a style="text-decoration: none;" onclick="grid.AddNewRow()">
                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                                            alt="" />
                                    </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                                        mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                            <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png"
                                                alt="" />
                                        </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                            <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                    alt="" />
                                            </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                                <font size="2">Xóa</font> </a>&nbsp;
                                </StatusBar>
                            </Templates>
                            <Columns>
                                <dx:GridViewDataColumn FieldName="id" Caption="STT" VisibleIndex="0" Visible="true"
                                    Width="40px">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lbl_STT" runat="server">
                                        </dx:ASPxLabel>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="coefficient" Caption="Hệ số" VisibleIndex="1" />
                                <dx:GridViewDataColumn FieldName="dateeffectted" Caption="Ngày áp dụng" VisibleIndex="2">
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="title" Caption="Ghi chú" VisibleIndex="3" />
                                <dx:GridViewDataColumn FieldName="level" Caption="Bậc lương" VisibleIndex="3" Visible="false" />
                                <dx:GridViewDataColumn FieldName="groupid" VisibleIndex="3" Visible="false" />
                            </Columns>
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
                            <SettingsText PopupEditFormCaption="Hiệu chỉnh hệ số lương A" ConfirmDelete="Bạn có muốn xóa" />
                            <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="Above"
                                PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="400px" />
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <Settings ShowStatusBar="Visible" ShowVerticalScrollBar="true" VerticalScrollableHeight="235"
                                VerticalScrollBarStyle="Virtual" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                            <SettingsPager PageSize="50">
                                <Summary AllPagesText="{0} - {1} " Visible="False" />
                            </SettingsPager>
                            <ImagesFilterControl>
                                <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanel>
                            </ImagesFilterControl>
                            <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                </LoadingPanelOnStatusBar>
                                <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
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
                        </dx:ASPxGridView></td>
                        <td valign="top">
                        <dx:ASPxGridView ID="gridChucDanh" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="idChucDanh" Caption="Các chức danh thuộc nhóm lương"
                            OnHtmlDataCellPrepared="gridChucDanh_HtmlDataCellPrepared">
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Settings ShowVerticalScrollBar="true" VerticalScrollableHeight="260" />
                            <Columns>
                                <dx:GridViewDataColumn FieldName="idChucDanh" Caption="STT" VisibleIndex="0" Visible="true"
                                    Width="40px">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lbl_STT" runat="server">
                                        </dx:ASPxLabel>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="name" Caption="Chức danh" VisibleIndex="1" />
                            </Columns>
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
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <SettingsPager PageSize="50">
                                <Summary AllPagesText="{0} - {1} " Visible="False" />
                            </SettingsPager>
                            <ImagesFilterControl>
                                <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanel>
                            </ImagesFilterControl>
                            <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                </LoadingPanelOnStatusBar>
                                <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
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
                        </dx:ASPxGridView></td>
                    </tr>
                </table>                  
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel></td>
    </tr>
</table>
<dx:ASPxPopupControl ID="popupEmployeesEdit" runat="server" ClientInstanceName="popupEmployeesEdit"
    Width="400px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" Modal="true"
    PopupVerticalAlign="Above" AutoUpdatePosition="True" CloseAction="CloseButton"
    HeaderText="Hiệu chỉnh nhóm lương A" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxCallbackPanel ID="callbackPanelEmployees" runat="server" Width="100%" ClientInstanceName="callbackPanelEmployees"
                OnCallback="callbackPanelEmployees_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent7" runat="server">
                        <table cellspacing="1" cellpadding="1" style="font-family: Verdana, 'Times New Roman', Times, serif;
                            font-size: 10pt;" width="400px">
                            <tr>
                                <td valign="top" style="width: 130px;">
                                    Nhóm lương
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cboParentPosition" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
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
                                    Ngạch lương
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ClientInstanceName="Name" ID="txtName" runat="server" Width="100%"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Nhập nhóm lương"></RequiredField>
                                            <ErrorFrameStyle ForeColor="Red">
                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                <ErrorTextPaddings PaddingRight="3px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <%--<tr>
                                <td valign="top">
                                    Bậc lương cao nhất
                                </td>
                                <td valign="top">
                                    <asp:HiddenField ID="hiddenIdBacLuongThuocNhom" runat="server" />
                                    <asp:HiddenField ID="hiddenIdNhomChuaBac" runat="server" />
                                    <dx:ASPxTextBox ID="txtBacLuongCaoNhat" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                            ErrorTextPosition="Bottom">
                                            <ErrorFrameStyle ForeColor="Red">
                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                <ErrorTextPaddings PaddingRight="3px" />
                                            </ErrorFrameStyle>
                                            <RegularExpression ErrorText="Nhập kiểu số" ValidationExpression="\d+" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Thời gian áp dụng
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="dateThoiDiemThayDoiBac" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                        Width="100%">
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
                            </tr>--%>
                            <tr>
                                <td valign="top">
                                    Ghi chú
                                </td>
                                <td valign="top">
                                    <dx:ASPxMemo ID="txtGhiChuCDThuocNhom" runat="server" Height="40px" Width="100%"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td style="padding-top: 7px; padding-left: 5px;">
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                            <ClientSideEvents Click="function(s, e) {if(ASPxClientEdit.ValidateGroup('Tagpage')){
                                                LoadTree();};
                                            }" />
                                            <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                                VerticalPosition="center" />
                                        </dx:ASPxButton>
                                    </div>
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Đóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                            AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
                                                popupEmployeesEdit.Hide();
                                            }" />
                                            <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/delete_16.png"
                                                Repeat="NoRepeat" VerticalPosition="center" />
                                        </dx:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="PopupControlBacLuong" runat="server" ClientInstanceName="PopupControlBacLuong"
    Width="400px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" Modal="true"
    PopupVerticalAlign="Above" AutoUpdatePosition="True" CloseAction="CloseButton"
    HeaderText="Quản trị bậc lương" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
            <dx:ASPxCallbackPanel ID="CallbackPanelBacLuong" runat="server" Width="100%" ClientInstanceName="CallbackPanelBacLuong"
                OnCallback="CallbackPanelBacLuong_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server">
                        <table cellspacing="1" cellpadding="1" style="font-family: Verdana, 'Times New Roman', Times, serif;
                            font-size: 10pt;" width="400px">
                            <tr>
                                <td valign="top">
                                    Nhóm lương
                                </td>
                                <td valign="top">
                                    <asp:HiddenField ID="hiddenIdBacLuongPopup" runat="server" />
                                    <dx:ASPxComboBox ID="cmbBacLuong" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
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
                                <td valign="top" style="width: 100px;">
                                    Bậc lương
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ClientInstanceName="Name" ID="txtBacLuong" runat="server" Width="100%"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Nhập bậc lương !"></RequiredField>
                                            <ErrorFrameStyle ForeColor="Red">
                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                <ErrorTextPaddings PaddingRight="3px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td style="padding-top: 7px; padding-left: 5px;">
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btThemBacLuong" runat="server" Text="Lưu" AutoPostBack="false"
                                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                            Width="81px">
                                            <ClientSideEvents Click="function(s, e) {
                                                if(CallbackPanelBacLuong.cpEdit == true){
                                                    CallbackPanelBacLuong.PerformCallback('s');
                                                    CallbackPanelBacLuong.cpEdit=false;
                                                }else{
                                                    CallbackPanelBacLuong.PerformCallback('e');
                                                }
                                                PopupControlBacLuong.Hide();
                                                treeList.PerformCallback();
                                            }" />
                                            <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                                VerticalPosition="center" />
                                        </dx:ASPxButton>
                                    </div>
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btDongBacLuong" runat="server" Text="Đóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                            AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
                                                PopupControlBacLuong.Hide();
                                            }" />
                                            <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/delete_16.png"
                                                Repeat="NoRepeat" VerticalPosition="center" />
                                        </dx:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s,e){
                    if(CallbackPanelBacLuong.cpNoDelete == true){
                        PopupControlBacLuong.Hide();
                        alert('Bậc lương đã có hệ số!')
                        CallbackPanelBacLuong.cpNoDelete=false;
                    }else{treeList.PerformCallback();}
                }" />
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="PopupControlQuanLyBacCaoNhat" runat="server" 
    ClientInstanceName="PopupControlQuanLyBacCaoNhat"
    Width="600px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" Modal="true"
    PopupVerticalAlign="Above" AutoUpdatePosition="True" CloseAction="CloseButton"
    HeaderText="Quản trị bậc lương cao nhất" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
            <dx:ASPxCallbackPanel ID="CallbackPopup_ThoiDiemBacLuongCaoNhat" runat="server" 
                ClientInstanceName="CallbackPopup_ThoiDiemBacLuongCaoNhat"
                OnCallback="CallbackPopup_ThoiDiemBacLuongCaoNhat_Load">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <asp:HiddenField ID ="hiddenPopup_IdNhomChuaBac" runat="server" />
                        <dx:ASPxGridView ID="GridView_BacLuongCaoNhat" runat="server" Width="100%" theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Danh sách thời điểm thay đổi bậc lương cao nhất"
                            ClientInstanceName="GridView_BacLuongCaoNhat" 
                            OnRowUpdating="GridView_BacLuongCaoNhat_RowUpdating"
                            OnRowInserting="GridView_BacLuongCaoNhat_RowInserting" 
                            OnRowDeleting="GridView_BacLuongCaoNhat_RowDeleting"
                            OnHtmlDataCellPrepared="GridView_BacLuongCaoNhat_HtmlDataCellPrepared">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                            <SettingsText PopupEditFormCaption="Hiệu chỉnh bậc lương cao nhất" ConfirmDelete="Bạn có muốn xóa" />
                            <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" 
                                PopupEditFormVerticalAlign="Above"
                                PopupEditFormModal="true" Mode="PopupEditForm" PopupEditFormWidth="200px" />
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <Settings ShowStatusBar="Visible" ShowVerticalScrollBar="true" VerticalScrollableHeight="120"
                                VerticalScrollBarStyle="Virtual" />
                            <SettingsPager PageSize="50">
                                <Summary AllPagesText="{0} - {1} " Visible="False" />
                            </SettingsPager>
                            <ClientSideEvents RowDblClick="function(s, e) {
                                GridView_BacLuongCaoNhat.StartEditRow(e.visibleIndex);
                            }" />
                            <Templates>
                                <EditForm>
                                    <div style="padding: 4px 4px 3px 4px">
                                        <table width="400px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                                            font-size: 10pt;">
                                            <tr>
                                                <td style="width: 130px;">
                                                    Bậc cao nhất
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPopup_BacLuongCaoNhat" runat="server" OnLoad="txtPopup_BacLuongCaoNhat_Load"
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic"
                                                            ErrorTextPosition="Bottom">
                                                            <RegularExpression ErrorText="Nhập sai định dạng!" ValidationExpression="\d+(\.\d+)?" />
                                                            <RequiredField IsRequired="True" ErrorText="Nhập hệ số"></RequiredField>
                                                            <ErrorFrameStyle ForeColor="Red">
                                                                <Paddings Padding="3px" PaddingLeft="4px" />
                                                                <ErrorTextPaddings PaddingRight="3px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Thời gian áp dụng
                                                </td>
                                                <td>
                                                    <dx:ASPxDateEdit ID="datePopup_DateEffectted" runat="server" OnLoad="datePopup_DateEffectted_Load"
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
                                                <td>
                                                    <table cellpadding="2" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                                                GridView_BacLuongCaoNhat.UpdateEdit(); 
                                                                }">
                                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                                        alt="" />
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                                                 GridView_BacLuongCaoNhat.UpdateEdit(); 
                                                                 }"><font size="2">Lưu</font></a>
                                                            </td>
                                                            <td style="width: 5px;"></td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="GridView_BacLuongCaoNhat.CancelEdit()">
                                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png"
                                                                        alt="" />
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="GridView_BacLuongCaoNhat.CancelEdit()"><font
                                                                    size="2">Đóng</font></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditForm>
                                <StatusBar>                                    
                                    <a style="text-decoration: none;" onclick="GridView_BacLuongCaoNhat.AddNewRow()">
                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png"
                                            alt="" />
                                    </a>
                                    <a style="text-decoration: none;" onclick="GridView_BacLuongCaoNhat.AddNewRow()">
                                        <font size="2">Thêm mới</font>
                                    </a>&nbsp; 
                                    <a style="text-decoration: none;" 
                                        onclick="GridView_BacLuongCaoNhat.StartEditRow(GridView_BacLuongCaoNhat.GetFocusedRowIndex());">
                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png" alt="" />
                                    </a>
                                    <a style="text-decoration: none;" onclick="GridView_BacLuongCaoNhat.StartEditRow(GridView_BacLuongCaoNhat.GetFocusedRowIndex());">
                                        <font size="2">Chỉnh sửa</font>
                                    </a>&nbsp;
                                    <a style="text-decoration: none;" 
                                        onclick="if ( confirm('Bạn có muốn xóa ?') ) {GridView_BacLuongCaoNhat.DeleteRow(GridView_BacLuongCaoNhat.GetFocusedRowIndex());}">
                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png" alt="" />
                                    </a>
                                    <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {GridView_BacLuongCaoNhat.DeleteRow(GridView_BacLuongCaoNhat.GetFocusedRowIndex());}">
                                                <font size="2">Xóa</font></a>&nbsp;
                                    <a style="text-decoration: none;" onclick="PopupControlQuanLyBacCaoNhat.Hide();">
                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/stop.png" alt="" />
                                    </a>
                                    <a style="text-decoration: none;" onclick="PopupControlQuanLyBacCaoNhat.Hide();">
                                                <font size="2">Đóng</font>
                                    </a>&nbsp;
                                </StatusBar>
                            </Templates>
                            <Columns>
                                <dx:GridViewDataColumn FieldName="id" Caption="STT" VisibleIndex="0" Visible="true"
                                    Width="40px">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lbl_STT" runat="server">
                                        </dx:ASPxLabel>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="bacLuongTheoNhom" Caption="Bậc cao nhất" VisibleIndex="1" />
                                <dx:GridViewDataColumn FieldName="thoiDiem" Caption="Ngày áp dụng" VisibleIndex="2">
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="idNhomLuong" Visible="false" VisibleIndex="3" />
                                <dx:GridViewDataColumn FieldName="kieuLuong" Visible="false" VisibleIndex="4" />
                            </Columns>
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
                                <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                </LoadingPanelOnStatusBar>
                                <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
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
                    </dx:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s,e){PopupControlQuanLyBacCaoNhat.Show();}" />
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dxm:ASPxPopupMenu ID="ASPxPopupMenu1" runat="server" ClientInstanceName="clientPopupMenu"
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" GutterImageSpacing="7px"
    GutterWidth="16px" LoadingPanelImagePosition="Top" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <Items>
        <dxm:MenuItem Name="new" Text="Thêm bậc lương">
        </dxm:MenuItem>
        <dxm:MenuItem Name="edt" Text="Sửa bậc lương">
        </dxm:MenuItem>
        <dxm:MenuItem Name="del" Text="Xóa bậc lương">
        </dxm:MenuItem>
        <dxm:MenuItem Name="qlBac" Text="Quản lý bậc cao nhất">
        </dxm:MenuItem>
        <dxm:MenuItem Name="hsVuotKhung" Text="Hệ số vượt khung">
        </dxm:MenuItem>
    </Items>
    <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
    </LoadingPanelImage>
    <ClientSideEvents ItemClick="function(s, e) { ProcessNodeClick(e.item.name);}" />
    <RootItemSubMenuOffset FirstItemX="2" FirstItemY="-2" LastItemX="2" LastItemY="-2"
        X="2" Y="-2" />
    <ItemSubMenuOffset FirstItemX="2" FirstItemY="-2" LastItemX="2" LastItemY="-2" X="2"
        Y="-2" />
    <SubMenuStyle GutterWidth="0px" />
</dxm:ASPxPopupMenu>

<%@ Control Language="C#" Inherits="VNPT.Modules.Position.PartyPosition" CodeFile="PartyPosition.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPager" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
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
    function ChucVu(cmbDonVi) {
        callbackPanel.PerformCallback(cmbDonVi.GetValue().toString());
    }
</script>

<table width="100%" cellpadding="3" cellspacing="0">
    <tr>
        <td>
            <dx:ASPxCallbackPanel runat="server" ID="callbackPanel" ClientInstanceName="callbackPanel"
                ShowLoadingPanel="false">
                <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
                </LoadingPanelImage>
                <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
                </LoadingPanelStyle>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent6" runat="server">
                        <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị chức vụ Đảng"
                            OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid" OnInitNewRow="grid_InitNewRow"
                            OnRowInserting="grid_RowInserting" 
                            OnRowDeleting="grid_RowDeleting" 
                            OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared"
                            OnCustomCallback="grid_callback">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                            <ClientSideEvents RowDblClick="function(s, e) {                                             
                                    var idx = grid.GetFocusedRowIndex()
                                    grid.GetRowValues(idx, 'id', function(idchucvu)
                                    {                                        
                                        pupopControl_hschucvu.SetContentUrl('~/danhmuc/htchucdanh/hschucvu/tabid/710/Default.aspx?idchucvu=' + idchucvu);
                                        pupopControl_hschucvu.Show();
                                    }
                                );
                            }" />
                            <Templates>
                                <EditForm>
                                    <div style="padding: 4px 4px 3px 4px">
                                        <table width="500px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                                            font-size: 10pt;">
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtId" runat="server" Visible="false" OnLoad="txtId_Load" Width="20%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 110px;">
                                                    Chức vụ
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ClientInstanceName="Name" ID="strNaziv" runat="server" OnLoad="strNaziv_Load"
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="editForm" ErrorTextPosition="Bottom">
                                                            <RequiredField IsRequired="True" ErrorText="Nhập chức vụ"></RequiredField>
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
                                                <td>
                                                    <table cellpadding="2" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}">
                                                                    <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                                        alt="" />
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}"><font size="2">Lưu</font></a>
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
                                <dx:GridViewDataColumn FieldName="type" VisibleIndex="3" Visible="false" />
                                <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
                                <dx:GridViewDataColumn FieldName="name" Caption="Chức vụ" VisibleIndex="2" />
                                <dx:GridViewDataColumn FieldName="id" Caption="Hệ số chức vụ" VisibleIndex="3">
                                    <CellStyle HorizontalAlign="Center"></CellStyle>
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID ="lbl_hschucvu" runat="server"></dx:ASPxLabel>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="id" Caption="Phụ cấp trách nhiệm" VisibleIndex="4">
                                    <CellStyle HorizontalAlign="Center"></CellStyle>
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lbl_hstrachnhiem" runat="server"></dx:ASPxLabel>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="id" Caption="Phụ cấp độc hại" VisibleIndex="5">
                                    <CellStyle HorizontalAlign="Center"></CellStyle>
                                    <DataItemTemplate>
                                        <dx:ASPxLabel ID="lbl_hsdochai" runat="server"></dx:ASPxLabel>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
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
                            <SettingsText PopupEditFormCaption="Hiệu chỉnh chức vụ Đảng" ConfirmDelete="Bạn có muốn xóa" />
                            <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="Above"
                                PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="500px" />
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <SettingsPager PageSize="1000">
                                <Summary AllPagesText="{0} - {1} " Visible="False" />
                            </SettingsPager>
                            <Settings ShowStatusBar="Visible" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
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
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="pupopControl_hschucvu" runat="server" 
    ClientInstanceName="pupopControl_hschucvu"  HeaderText=""
    AllowDragging="True" AllowResize="True"
    CloseAction="CloseButton"
    EnableViewState="False" PopupElementID="popupArea" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="Above" Width="500px"
    Height="400px" EnableHierarchyRecreation="True" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
        <Paddings PaddingLeft="5" PaddingRight="5" PaddingTop="0" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
        </dx:PopupControlContentControl>
    </ContentCollection>
    <ClientSideEvents CloseUp="function(s,e){
        grid.PerformCallback();
    }" />
</dx:ASPxPopupControl>
<%@ Control language="C#" Inherits="VNPT.Modules.FamilyRelationship.ViewFamilyRelationship" CodeFile="ViewFamilyRelationship.ascx.cs" AutoEventWireup="true"%>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<dx:ASPxGridView ID="grdFamily" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" OnHtmlRowCreated="grdFamily_HtmlRowCreated" KeyFieldName="id"
    OnRowUpdating="grdFamily_RowUpdating" ClientInstanceName="grdFamily" OnHtmlDataCellPrepared="grdFamily_HtmlDataCellPrepared" OnInitNewRow="grdFamily_InitNewRow" OnRowInserting="grdFamily_RowInserting" OnRowDeleting="grdFamily_RowDeleting">
     <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
        <ClientSideEvents RowDblClick="function(s, e) {
    grdFamily.StartEditRow(e.visibleIndex);
}" />
    <Templates>    
        <EditForm>  
            <div style="padding: 4px 4px 3px 4px">
            <table width="600px" cellpadding="4" cellspacing="0">
                <tr>
                    <td style="width:20%">
                        <font size="2"><b>Mã thân nhân</b></font>
                    </td>
                    <td style="width:80%">
                        <dx:ASPxTextBox ID="txtId" runat="server" Enabled="false" OnLoad="txtId_Load" Width="20%" />
                        <dx:ASPxTextBox ID="txtEmpId" runat="server" Visible="false" OnLoad="txtEmpId_Load" Width="20%" />
                    </td>
                </tr>
                <tr>
                    <td style="width:20%">
                        <font size="2"><b>Quan hệ</b></font>
                    </td>
                    <td style="width:80%">
                       <dx:ASPxComboBox ID="cboRelate" runat="server" Width="95%" OnLoad="cboRelate_Load">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                
                <tr>
                    <td style="width: 20%">
                        <font size="2"><b>Họ tên</b></font>
                    </td>
                    <td style="width: 80%">
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtName"
                            runat="server" OnLoad="txtName_Load" Width="90%">
                            <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm">
                                <RequiredField IsRequired="True" ErrorText="Nhập họ tên"></RequiredField>
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
                        <font size="2"><b>Năm sinh</b></font>
                    </td>
                    <td style="width: 80%">
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtBirdthday"
                            runat="server" OnLoad="txtBirdthday_Load" Width="90%">
                            <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm">
                                <RequiredField IsRequired="True" ErrorText="Nhập năm sinh"></RequiredField>
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
                        <font size="2"><b>Đ/c thường trú</b></font>
                    </td>
                    <td style="width: 80%">
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtAdress"
                            runat="server" OnLoad="txtAdress_Load" Width="90%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <font size="2"><b>Nghề nghiệp</b></font>
                    </td>
                    <td style="width: 80%">
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtOccupation"
                            runat="server" OnLoad="txtOccupation_Load" Width="90%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <font size="2"><b>Đặc điểm lịch sử</b></font>
                    </td>
                    <td style="width: 80%">
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtHistory"
                            runat="server" OnLoad="txtHistory_Load" Width="90%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
               
                
                <tr>
                    <td></td>
                    <td>
                    <table  cellpadding="2" cellspacing="0">
                        <tr>
                                <td>
                                 <a style="text-decoration:none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grdFamily.UpdateEdit()}">
                                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/save_f2.png" alt="" />
                                </a>
                                </td>
                                <td>
                                 <a style="text-decoration:none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grdFamily.UpdateEdit()}"><font size="2">Chỉnh sửa</font></a>
                                </td>
                                <td style="width:5px;"></td>
                                <td>
                                 <a style="text-decoration:none;" onclick="grdFamily.CancelEdit()">
                                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/restore_f2.png" alt="" />
                                </a>
                                </td>
                                <td>
                                 <a style="text-decoration:none;" onclick="grdFamily.CancelEdit()"><font size="2">Đóng</font></a>
                                </td>
                        </tr>
                    </table>
                    </td>
                </tr>
                
            </table>
                
                
            </div>
           
        </EditForm>
         <StatusBar>
            <a style="text-decoration:none;" onclick="grid.AddNewRow()">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/add.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grid.AddNewRow()">
                <font size="2">Thêm mới</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/edit_f2.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                <font size="2">Chỉnh sửa</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/cancel_f2.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                <font size="2">Xóa</font>
            </a>&nbsp;
            </StatusBar>
    </Templates>
    <Columns>
       
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
        <dx:GridViewDataColumn FieldName="employeeid" VisibleIndex="3" Visible="false" />
        <dx:GridViewDataColumn FieldName="description" VisibleIndex="3" Visible="false" />
        <%--<dx:GridViewDataColumn FieldName="relationshipid" VisibleIndex="3" Visible="false" />--%>
        <dx:GridViewDataColumn FieldName="fullname" Caption="Họ tên" VisibleIndex="2" />
        <dx:GridViewDataColumn CellStyle-HorizontalAlign="Left" FieldName="relationshipid" Caption="Mối quan hệ" VisibleIndex="1">
            <DataItemTemplate>
                <dx:ASPxLabel id="lblRelate" runat="server"></dx:ASPxLabel> 
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="birthday" Caption="Năm sinh" VisibleIndex="3" />
        <dx:GridViewDataColumn FieldName="placeofbirth" Caption="Đ/c thường trú" VisibleIndex="4" />
        <dx:GridViewDataColumn FieldName="occupation" Caption="Nghề nghiệp" VisibleIndex="5" />
        
    </Columns>
    <Settings  ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true"  />
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
    <SettingsText PopupEditFormCaption="Hiệu chỉnh thông tin nhân thân" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing  PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides" PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm"
        PopupEditFormWidth="600px" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <SettingsPager  PageSize="1000">
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
   
</dx:ASPxGridView>
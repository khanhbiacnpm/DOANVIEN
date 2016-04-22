<%@ Control language="C#" Inherits="Philip.Modules.Professional.ViewProfessional" CodeFile="ViewProfessional.ascx.cs" AutoEventWireup="true"%>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
   
<dx:ASPxGridView ID="grid" runat="server" Width="95%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị chuyên ngành đào tạo"
    OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid"   OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting"  OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared"
        >
     <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
        <ClientSideEvents RowDblClick="function(s, e) {
    grid.StartEditRow(e.visibleIndex);
}" />
 
    <Templates>    
        <EditForm>  
            <div style="padding: 4px 4px 3px 4px">
            <table width="500px" cellpadding="1" cellspacing="1" style="font-family:Verdana; font-size:10pt;">
               
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="lblError" runat="server" ForeColor="#ff0000"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>Nhóm chuyên ngành</td>
                    <td>
                    
                     <dx:ASPxComboBox ID="cmbNhomChuyenNganh" runat="server" AutoPostBack="false" ClientInstanceName="cmbNhomChuyenNganh"
                            IncrementalFilteringMode="Contains" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" ShowLoadingPanel="true"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" OnLoad="cmbNhomChuyenNganh_Load"
                            ValueType="System.String">
                           
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                 <tr>
                    <td style="width:130px;">
                        Mã chuyên ngành
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCode" runat="server" OnLoad="txtCode_Load" Width="100%" 
	CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
	SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Chuyên ngành
                    </td>
                    <td>
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name"  ID="txtName" runat="server" OnLoad="txtName_Load" Width="100%" 
	CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
	SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                  <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                        
                                         <RequiredField IsRequired="True" ErrorText="Nhập chuyên ngành"></RequiredField>
                                          
                                       
                                     </ValidationSettings>
                                     
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
                                             grid.UpdateEdit()}">
                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png" alt="" />
                                </a>
                                </td>
                                <td>
                                 <a style="text-decoration:none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit()}"><font size="2">Lưu</font></a>
                                </td>
                                <td style="width:5px;"></td>
                                <td>
                                 <a style="text-decoration:none;" onclick="grid.CancelEdit()">
                                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png" alt="" />
                                </a>
                                </td>
                                <td>
                                 <a style="text-decoration:none;" onclick="grid.CancelEdit()"><font size="2">Đóng</font></a>
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
                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grid.AddNewRow()">
                <font size="2">Thêm mới</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                <font size="2">Chỉnh sửa</font>
            </a>&nbsp;
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/delete_16.png" alt="" />
            </a>
            <a style="text-decoration:none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                <font size="2">Xóa</font>
            </a>&nbsp;
            </StatusBar>
    </Templates>
    <Columns>
        
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />        
        <dx:GridViewDataColumn FieldName="code" Caption="Mã" VisibleIndex="1" />        
        
        <dx:GridViewDataColumn FieldName="name" Caption="Chuyên ngành đào tạo" VisibleIndex="2" />
          <dx:GridViewDataColumn Caption="Nhóm chuyên ngành" FieldName="groupid" VisibleIndex="3">
            <DataItemTemplate>
                <dx:ASPxLabel ID="lblChuyenNganh" runat="server">
                </dx:ASPxLabel>
            </DataItemTemplate>
            <CellStyle HorizontalAlign="Left">
            </CellStyle>
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
    <Settings  ShowStatusBar="Visible" />
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true"  />
    <SettingsText PopupEditFormCaption="Hiệu chỉnh chuyên ngành đào tạo" ConfirmDelete="Bạn có muốn xóa" />
    <SettingsEditing  PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides" PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm"
        PopupEditFormWidth="500px" />
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
   <ClientSideEvents EndCallback="function(s,e){ 
                        if(grid.cpResult){
                             alert('Trùng mã chuyên ngành đào tạo');
                             grid.StartEditRow(grid.GetFocusedRowIndex());
                              delete grid.cpResult;
                        }  
                   } " />
</dx:ASPxGridView>

<%@ Control Language="C#" Inherits="VNPT.Modules.DanhMuc.KyNang" CodeFile="KyNang.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
    <script type="text/javascript">

      
        function save() {

 if (txtName.GetText() == "") {

                txtName.SetFocus();
                alert('Xin vui lòng nhập kinh nghiệm  !');
                return false;
            }
            else {grid.UpdateEdit(); }

        }

   
</script>

            <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="Id" Caption="Quản trị kỹ năng làm việc" OnRowUpdating="grid_RowUpdating"
                ClientInstanceName="grid" OnRowInserting="grid_RowInserting" OnRowDeleting="grid_RowDeleting"
                OnHtmlEditFormCreated="gridBangCap_OnHtmlEditFormCreated" OnCustomCallback="grid_CustomCallback">
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                <ClientSideEvents RowDblClick="function(s, e) {
    grid.StartEditRow(e.visibleIndex);
}" />
                <Templates>
                    <EditForm>
                        <div style="padding: 4px 4px 3px 4px">
                            <table width="700px" cellpadding="2" cellspacing="0" style="font-family: Times New Roman;
                                font-size: 11pt;">
                              
                                
                                <tr>
                                    <td>
                                        Kỹ năng
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox Text='<%# Eval("KyNang") %>' EnableClientSideAPI="true" ClientInstanceName="txtName"
                                            ID="txtName" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                                                    <a style="text-decoration: none;" onclick="save()">
                                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                            alt="" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a style="text-decoration: none;" onclick="save()"><font size="2">Lưu</font></a>
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
                    <dx:GridViewDataColumn FieldName="Id" VisibleIndex="3" Visible="false" />
                  
                    <dx:GridViewDataCheckColumn FieldName="BatBuoc"  Caption="Bắt buộc" VisibleIndex="0"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataColumn FieldName="KyNang" Caption="Kỹ năng" VisibleIndex="2" />
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
                <Settings ShowStatusBar="Visible" />
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                <SettingsText PopupEditFormCaption="Hiệu chỉnh nhóm máu" ConfirmDelete="Bạn có muốn xóa" />
                <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="TopSides"
                    PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="500px" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <SettingsPager PageSize="1000">
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
            </dx:ASPxGridView>
        

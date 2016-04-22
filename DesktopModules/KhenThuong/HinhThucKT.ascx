<%@ Control Language="C#" Inherits="DotNetNuke.Modules.KhenThuong.HinhThucKT" CodeFile="HinhThucKT.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<table cellpadding="1" cellspacing="1" align="center" width="100%" style="font-family:Verdana; font-size:10pt;">
    <tr>
     <td valign="top" align="right" style="padding-right:5px">
           Đối tượng
        </td>
        <td valign="top">
            <dx:ASPxComboBox ID="cmbDoiTuong" runat="server" ClientInstanceName="cmbDoiTuong" 
                Width="100px"
              
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
               <ClientSideEvents SelectedIndexChanged="function(s,e){
                    hfidthanhtich.Set('idthanhtich',cmbThanhTich.GetValue());
                    grid.PerformCallback(cmbThanhTich.GetValue()+','+cmbDoiTuong.GetValue());
                }" />
            </dx:ASPxComboBox>
               
        </td>
        <td valign="top" align="right" style="padding-right:5px">
           Thành tích khen thưởng
        </td>
        <td valign="top">
            <dx:ASPxComboBox ID="cmbThanhTich" runat="server" ClientInstanceName="cmbThanhTich" 
                Width="250px"
                TextField="ten" ValueField="id"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
                <ClientSideEvents SelectedIndexChanged="function(s,e){
                    hfidthanhtich.Set('idthanhtich',cmbThanhTich.GetValue());
                    grid.PerformCallback(cmbThanhTich.GetValue()+','+cmbDoiTuong.GetValue());
                }" />
            </dx:ASPxComboBox>
            <dx:ASPxHiddenField ID="hfidthanhtich" runat="server" ClientInstanceName="hfidthanhtich">
            </dx:ASPxHiddenField>            
        </td>
        <td style="width:300px;"></td>
    </tr>
    <tr>
        <td colspan="5">
            <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="Id" Caption="Quản trị danh hiệu thi đua"
                ClientInstanceName="grid" 
                OnRowUpdating="grid_RowUpdating" 
                OnRowInserting="grid_RowInserting"
                OnRowDeleting="grid_RowDeleting" 
                OnCustomCallback="grid_CustomerCallback"
                    OnHtmlEditFormCreated="grid_OnHtmlEditFormCreated"
                AutoGenerateColumns="False">
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" AllowSort="false" />
                <ClientSideEvents RowDblClick="function(s, e) {
        grid.StartEditRow(e.visibleIndex);
    }" />
                <Templates>
                    <EditForm>
                        <div style="padding: 4px 4px 3px 4px">
                            <table width="700px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                                font-size: 10pt;">
                                    <tr>
                                     <td valign="top" align="right" style="padding-right:5px">
           Đối tượng
        </td>
        <td valign="top">
            <dx:ASPxComboBox ID="cmbDoiTuongUpdate" runat="server" ClientInstanceName="cmbDoiTuongUpdate" 
                Width="100px"
              
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
              
            </dx:ASPxComboBox>
            
        </td>
                                    </tr>
                                    <tr>
                                     <td valign="top" align="right" style="padding-right:5px">
 Thành tích khen thưởng
        </td>
                                        <td>
                                         <dx:ASPxComboBox ID="cmbThanhTichUpdate" runat="server" ClientInstanceName="cmbThanhTichUpdate" 
                Width="250px"
                TextField="ten" ValueField="id"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ValueType="System.Int32">
               
            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                      <tr>
                                                <td valign="top" style="width: 170px;">
                                                    Cấp khen thưởng
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="txtCapKhenThuong" runat="server" Width="100%" Text='<%# Eval("CapKhenThuong") %>'
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                <tr>
                                    <td valign="top" style="width:140px;" align="right">
                                        Danh hiệu thi đua
                                    </td>
                                    <td valign="top">                                        
                                        <dx:ASPxTextBox ID="txtName" runat="server" Width="100%" Text='<%# Eval("Ten") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td valign="top" style="width:140px;" align="right">
                                       Viết tắt
                                    </td>
                                    <td valign="top">                                        
                                        <dx:ASPxTextBox ID="txtVietTat" ClientInstanceName="txtVietTat" runat="server" Width="100%" Text='<%# Eval("VietTat") %>'
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right">Ghi chú</td>
                                    <td valign="top">
                                        <dx:ASPxMemo ID="memoGhiChu" Text='<%# Eval("GhiChu") %>' runat="server" Height="40px" Width="100%" 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <table cellpadding="2" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <a style="text-decoration: none;" onclick="
                                             grid.UpdateEdit()">
                                                        <img height="16" width="16" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/save_16.png"
                                                            alt="" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a style="text-decoration: none;" onclick="
                                             grid.UpdateEdit()"><font size="2">Lưu</font></a>
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
                    <dx:GridViewDataTextColumn FieldName="Id" Visible="false" VisibleIndex="0">                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idthanhtich" Visible="false" VisibleIndex="0">                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Loai" Visible="false" VisibleIndex="0">                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ten" Caption="Danh hiệu thi đua" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VietTat" Caption="Viết tắt" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GhiChu" Caption="Ghi chú" VisibleIndex="3" Visible="false">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CapKhenThuong" Caption="Cấp khen thưởng" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Settings ShowStatusBar="Visible" />
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
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
                <SettingsText PopupEditFormCaption="Hiệu chỉnh loại bảo hiểm" ConfirmDelete="Bạn có muốn xóa" />
                <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                    PopupEditFormModal="true" EditFormColumnCount="3" Mode="EditForm" PopupEditFormWidth="400px" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <SettingsPager PageSize="1000">
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
             
            </dx:ASPxGridView>
        </td>
    </tr>
</table>

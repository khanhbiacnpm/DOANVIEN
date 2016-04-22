<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CapDuyet.ascx.cs"
    Inherits="DotNetNuke.Modules.SangKien.CapKhenThuong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<script type="text/javascript">
    function check_textbox() {
        if (txt_capduyet.GetText() == "") {
            alert('Vui lòng nhập tên cấp duyệt sáng kiến.');
            txt_capduyet.Focus();
            return false;
        }else
            return true;
    }    
    function luuthongtin(s, e) {
        if (check_textbox()) {
            grid_capduyetsangkien.UpdateEdit();
        }
    }
</script>
<table style="width: 99%; height: auto; font-family: Arial; font-size: 12px;">
    <tr>
        <td>
            <dx:ASPxGridView ID="grid_capduyetsangkien" runat="server" Width="100%" ClientInstanceName="grid_capduyetsangkien"
                KeyFieldName="id" Theme="Glass" Font-Size="12px"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnRowDeleting="grid_capduyetsangkien_RowDeleting"
                OnRowInserting="grid_capduyetsangkien_RowInserting" OnRowUpdating="grid_capduyetsangkien_RowUpdating">
                <Settings ShowStatusBar="Visible" ShowVerticalScrollBar="true" VerticalScrollableHeight="370" />
                <SettingsPager Mode="ShowAllRecords" />
                <SettingsBehavior AllowFocusedRow="true" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ten" Caption="Tên cấp duyệt sáng kiến" />                    
                </Columns>
                <Templates>
                    <EditForm>
                        <table style="width: 700px; height: auto; font-family: Arial; font-size: 12px;">
                            <tr>
                                <td style="width: 145px; height: 25px;">
                                    Tên cấp duyệt sáng kiến:
                                </td>
                                <td style="width: 250px; height: 25px;">
                                    <dx:ASPxTextBox ID="txt_capduyet" runat="server" ClientInstanceName="txt_capduyet"
                                        Width="100%" Text='<%# Eval("ten") %>' CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>                                
                                <td>
                                    <div style="width: 130px; height: 25px;">
                                        <div style="width: 65px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="bt_luu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="60px">
                                                <Image Url="../../images/imgadmin/save_16.png" Width="12px" Height="12px" />
                                                <ClientSideEvents Click="luuthongtin" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 62px; height: 25px; float: right;">
                                            <dx:ASPxButton ID="bt_dong" runat="server" Text="Đóng" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="60px">
                                                <Image Url="../../images/imgadmin/delete_16.png" Width="12px" Height="12px" />
                                                <ClientSideEvents Click="function(s,e){grid_capduyetsangkien.CancelEdit();}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </EditForm>
                    <StatusBar>
                        <div>
                            <div style="width: 83px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {
                                        grid_capduyetsangkien.AddNewRow()
                                    }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 83px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                          
                                        grid_capduyetsangkien.StartEditRow(grid_capduyetsangkien.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 83px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        grid_capduyetsangkien.DeleteRow(grid_capduyetsangkien.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>
                </Templates>
            </dx:ASPxGridView>
        </td>
    </tr>
</table>

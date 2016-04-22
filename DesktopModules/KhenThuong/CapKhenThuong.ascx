<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CapKhenThuong.ascx.cs"
    Inherits="DotNetNuke.Modules.KhenThuong.CapKhenThuong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<script type="text/javascript">
    function check_textbox() {
        if (txt_capkhenthuong.GetText() == "") {
            alert('Vui lòng nhập tên cấp khen thưởng.');
            txt_capkhenthuong.Focus();
            return false;
        } else if (txt_vitri.GetText() == "") {
            alert('Vui lòng nhập số thứ tự.');
            txt_vitri.Focus();
            return false;
        } else if (isNaN(txt_vitri.GetText())) {
            alert('Vui lòng nhập kiểu số.');
            txt_vitri.Focus();
            return false;
        } else
            return true;
    }    
    function luuthongtin(s, e) {
        if (check_textbox()) {
            grid_capkhenthuong.UpdateEdit();
        }
    }
</script>
<table style="width: 99%; height: auto; font-family: Arial; font-size: 12px;">
    <tr>
        <td>
            <dx:ASPxGridView ID="grid_capkhenthuong" runat="server" Width="100%" ClientInstanceName="grid_capkhenthuong"
                KeyFieldName="id" CssFilePath="~/App_Themes/Glass/{0}/styles.css" Theme="Glass" Font-Size="12px" OnRowDeleting="grid_capkhenthuong_RowDeleting"
                OnRowInserting="grid_capkhenthuong_RowInserting" OnRowUpdating="grid_capkhenthuong_RowUpdating">
                <Settings ShowStatusBar="Visible" ShowVerticalScrollBar="true" VerticalScrollableHeight="370" />
                <SettingsPager Mode="ShowAllRecords" />
                <SettingsBehavior AllowFocusedRow="true" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ten" Caption="Tên cấp khen thưởng" />
                    <dx:GridViewDataTextColumn FieldName="vitri" Caption="Vị trí" CellStyle-HorizontalAlign="Left" />
                </Columns>
                <Templates>
                    <EditForm>
                        <table style="width: 700px; height: auto; font-family: Arial; font-size: 12px;">
                            <tr>
                                <td style="width: 120px; height: 25px;">
                                    Tên cấp khen thưởng:
                                </td>
                                <td style="width: 250px; height: 25px;">
                                    <dx:ASPxTextBox ID="txt_capkhenthuong" runat="server" ClientInstanceName="txt_capkhenthuong"
                                        Width="100%" Text='<%# Eval("ten") %>' CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 30px; height: 25px; text-align: center;">
                                    Vị trí:
                                </td>
                                <td style="width: 100px; height: 25px;">
                                    <dx:ASPxTextBox ID="txt_vitri" runat="server" ClientInstanceName="txt_vitri" Width="80px"
                                        Text='<%# Eval("vitri") %>' CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                                <ClientSideEvents Click="function(s,e){grid_capkhenthuong.CancelEdit();}" />
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
                                        grid_capkhenthuong.AddNewRow()
                                    }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 83px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {                          
                                        grid_capkhenthuong.StartEditRow(grid_capkhenthuong.GetFocusedRowIndex());
                                    }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 83px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        grid_capkhenthuong.DeleteRow(grid_capkhenthuong.GetFocusedRowIndex());
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

<%@ Control Language="C#" Inherits="Philip.Modules.TinTuc.QTTinTuc" CodeFile="QTTinTuc.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="cc1" %>

<table width="100%">
    <tr>
        <td style="width: 10px">
        </td>
        <td>
            <div id="divPreview" runat="server">
                <table width="100%" cellspacing="6px">
                    <tr>
                        <td>
                            <asp:DropDownList ID="cb_nhomtin" runat="server" 
                                onselectedindexchanged="cb_nhomtin_SelectedIndexChanged" 
                                AutoPostBack="True">
                                <asp:ListItem Value="1">Hoạt động dòng tộc</asp:ListItem>
                                <asp:ListItem Value="2">Trang vàng công đức</asp:ListItem>
                                <asp:ListItem Value="3">Quỹ dòng họ</asp:ListItem>
                                <asp:ListItem Value="4">Thư viện tư liệu</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnThemMoi" runat="server" OnClick="btnThemMoi_Click" 
                                Text="Thêm mới Tin" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataGrid ID="gridTintuc" runat="server" Width="100%" BackColor="White" PageSize="15"
                                AutoGenerateColumns="False" CellPadding="4" BorderWidth="1px" BorderStyle="Solid"
                                AllowSorting="True" AllowPaging="True" BorderColor="#025866" OnItemCommand="dgrNhom_ItemCommand"
                                OnPageIndexChanged="gridTintuc_PageIndexChanged">
                                <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                                <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
                                <ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#84B7C1" 
                                    Font-Size="Small">
                                </HeaderStyle>
                                <Columns>
                                    <asp:TemplateColumn>
                                        <HeaderStyle Wrap="False" Width="60px" ForeColor="White"></HeaderStyle>
                                        <HeaderTemplate>
                                            Sửa/Xóa
                                            
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" AlternateText="Sua" runat="server" CommandName="Edit"
                                                ImageUrl="~/images/edit.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "IdTinTuc")%>'>
                                            </asp:ImageButton>
                                            <asp:ImageButton ID="ImageButton2" AlternateText="Xoa" runat="server" CommandName="Delete"
                                                ImageUrl="~/images/delete.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "IdTinTuc")%>'>
                                            </asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="TieuDe" HeaderText="Tiêu đề Tin" 
                                        HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
                                    </asp:BoundColumn>
                                 
                                    <asp:BoundColumn DataField="NgayDang" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
                                    </asp:BoundColumn>
                                </Columns>
                                <PagerStyle HorizontalAlign="Left" ForeColor="#330099" BackColor="#FFFFCC" Mode="NumericPages">
                                </PagerStyle>
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEdit" runat="server">
                <table width="100%">
                    <tr>
                        <td style="width: 120px; text-align: right">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblError" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align: right" nowrap class="textNomar" >
                           Chọn nhóm tin</td>
                        <td>
                            <asp:DropDownList ID="cb_nhomtin_sua" runat="server">
                                <asp:ListItem Value="1">Hoạt động dòng tộc</asp:ListItem>
                                <asp:ListItem Value="2">Trang vàng công đức</asp:ListItem>
                                <asp:ListItem Value="3">Quỹ dòng họ</asp:ListItem>
                                <asp:ListItem Value="4">Thư viện tư liệu</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align: right" nowrap class="textNomar" >
                            Tiêu đề Tin
                        </td>
                        <td>
                            <asp:TextBox ID="txtTieude" runat="server" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align: right" nowrap class="textNomar">
                            Tóm tắt Tin
                        </td>
                        <td>
                          <dnn:TextEditor ID="txtTomtat" runat="server" Height="300" Width="100%" />
                           
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align: right" nowrap class="textNomar">
                            Chi tiết Tin
                        </td>
                        <td>
                            <dnn:TextEditor ID="txtNoidung" runat="server" Height="400" Width="100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align: right" nowrap class="textNomar">
                            Ảnh đại diện
                        </td>
                        <td>
                            <asp:FileUpload ID="fileAnhUpload" runat="server" Width="311px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" nowrap class="textNomar">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="100px" Width="140px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="btn_luu" runat="server" Text="Lưu" OnClick="btn_luu_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btn_boqua" runat="server" Text="Bỏ qua" OnClick="btn_boqua_Click" />
                            <asp:Label ID="lblIdTintuc" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lblIdAnh" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td style="width: 10px">
        </td>
    </tr>
</table>

<%@ Control Language="C#" Inherits="Philip.Modules.Text.QuanTriText" CodeFile="QuanTriText.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="cc1" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="bodytopLeft">
        </td>
        <td class="bodytopRepeat">
            <asp:Label ID="lblError" runat="server" ForeColor="#CC3300"></asp:Label>
        </td>
        <td class="bodytopRight">
        </td>
    </tr>
    <tr>
        <td class="body_boder" colspan="3">
            <table width="100%">
                <tr>
                    <td style="width: 10px">
                    </td>
                    <td>
                        <div id="divPreview" runat="server">
                            <table width="100%" cellspacing="6px">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnThemMoi" runat="server" OnClick="btnThemMoi_Click" 
                                            Text="Thêm mới" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataGrid ID="gridText" runat="server" Width="100%" BackColor="White" PageSize="15"
                                            AutoGenerateColumns="False" CellPadding="4" BorderWidth="1px" 
                                            BorderStyle="Solid" BorderColor="#025866" OnItemCommand="gridText_ItemCommand">
                                            <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                                            <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
                                            <ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#84B7C1" Font-Size="Small">
                                            </HeaderStyle>
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <HeaderStyle Wrap="False" Width="60px" ForeColor="White"></HeaderStyle>
                                                    <HeaderTemplate>
                                                       Sửa
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" AlternateText="Sua" runat="server"  CommandName="Edit"
                                                            ImageUrl="~/images/edit.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_text")%>'>
                                                        </asp:ImageButton>
                                                        <asp:ImageButton ID="ImageButton2" AlternateText="Xoa" Visible="false" runat="server" CommandName="Delete"
                                                            ImageUrl="~/images/delete.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_text")%>'>
                                                        </asp:ImageButton>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ma" HeaderText="Mã" HeaderStyle-ForeColor="White">
                                                    <HeaderStyle ForeColor="White"></HeaderStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="tieu_de" HeaderText="Tiêu đề" HeaderStyle-ForeColor="White">
                                                    <HeaderStyle ForeColor="White"></HeaderStyle>
                                                </asp:BoundColumn>
                                                      <asp:BoundColumn DataField="chi_tiet" HeaderText="Nội dung" HeaderStyle-ForeColor="White">
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
                                    <td style="width: 15%; text-align: right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap class="textLabel">
                                        Mã</td>
                                    <td>
                                        <asp:TextBox ID="txtMa" runat="server" Width="80%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap class="textLabel">
                                        Tiêu đề&nbsp;                                     </td>
                                    <td>
                                        <asp:TextBox ID="txtTieude" runat="server" Width="80%"></asp:TextBox>
                                    </td>
                                </tr>
                             
                                <tr>
                                    <td nowrap class="textLabel">
                                        Nội dung
                                    </td>
                                    <td>
                                        <dnn:TextEditor ID="txtNoidung" runat="server" Height="400" Width="100%"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btn_luu" runat="server" Text="Lưu" OnClick="btn_luu_Click" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btn_boqua" runat="server" Text="Bỏ qua" OnClick="btn_boqua_Click" />
                                        <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
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
        </td>
    </tr>
</table>


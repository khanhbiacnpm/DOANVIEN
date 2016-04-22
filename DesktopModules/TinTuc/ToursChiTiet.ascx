<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToursChiTiet.ascx.cs"
    Inherits="Philip.Modules.TinTuc.ToursChiTiet" %>
<link href="../../Portals/0/Skins/SkinMotobycle/Skin.css" rel="stylesheet" type="text/css" />
<div id="divChitiet" runat="server" style="width: 100%">
    <table width="788px" border="0" cellpadding="0" cellspacing="0">
        <tr style="height: 10px">
            <td>
            </td>
        </tr>
        <tr>
            <td class="Main_top_788">
                <asp:Label ID="lblTieude" runat="server" Text="Label" CssClass="textBoldRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding: 6px; border-left:1px solid #fed41d; border-right:1px solid #fed41d" valign="top">
                <table width="100%" cellpadding="0" cellspacing="6px" border="0">
                    <tr>
                        <td>
                            <div id="divNoidung" runat="server" class="textNomar">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="textNomarRedBold">
                            Tin đã đưa
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 8px">
                            <asp:DataList ID="listDadua" runat="server" Width="100%">
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Li_Style_1">
                                                <li><a class="tintuclist_Link" href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/TinTuc.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idtintuc")%>_<%# DataBinder.Eval(Container.DataItem, "tieude")%>'>
                                                    <%# DataBinder.Eval(Container.DataItem, "tieude")%>
                                                    (
                                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NgayDang")).ToString("dd/MM/yyyy")%>
                                                    ) </a></li>
                                            </td>
                                        </tr>
                                        <tr style="height: 2px">
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr><td class="Bottom_788"></td></tr>
       
        <tr style="height: 3px">
            <td>
            </td>
        </tr>
    </table>
</div>
<div id="divList" runat="server">
    <table width="788px" border="0" cellpadding="0" cellspacing="0">
        <tr style="height: 10px">
            <td>
            </td>
        </tr>
        <tr>
            <td class="Main_top_788">
                <asp:Label ID="lblTenNhomTin" runat="server" Text="Label" CssClass="textBoldRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding: 6px; border-left:1px solid #fed41d; border-right:1px solid #fed41d" valign="top">
                <asp:DataGrid ID="dgrSanPham" runat="server" Width="100%" BackColor="White" PageSize="105"
                    AutoGenerateColumns="False" CellPadding="4" AllowPaging="false" OnPageIndexChanged="dgrSanPham_PageIndexChanged"
                    ShowHeader="False" GridLines="None">
                    <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                    <ItemStyle ForeColor="#330099"></ItemStyle>
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <table border="0" cellspacing="4px" cellpadding="0" width="100%">
                                    <tr>
                                        <td colspan="2" align="left">
                                            <a class="textFooterBold" href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/TinTuc.aspx?id=<%# DataBinder.Eval(Container, "DataItem.IdTinTuc") %>_<%# DataBinder.Eval(Container.DataItem, "tieude")%>'>
                                                <%# DataBinder.Eval(Container, "DataItem.TieuDe")%>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="width: 4%">
                                            <a href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/TinTuc.aspx?id=<%# DataBinder.Eval(Container, "DataItem.IdTinTuc") %>_<%# DataBinder.Eval(Container.DataItem, "tieude")%>'>
                                                <img border="0" src='<%= DotNetNuke.Common.Globals.ApplicationPath %>/Images/TinTuc/<%# DataBinder.Eval(Container, "DataItem.Anh") %>'
                                                    width="220px" height="160px" />
                                            </a>
                                        </td>
                                        <td class="textNomarGeneral" valign="top">
                                            <%# DataBinder.Eval(Container, "DataItem.TomTat")%>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="#330099" BackColor="#FFFFCC" Mode="NumericPages">
                    </PagerStyle>
                </asp:DataGrid>

</td> </tr>
  <tr><td class="Bottom_788"></td></tr>
<tr style="height: 3px">
    <td>
    </td>
</tr>
</table> 
</div>
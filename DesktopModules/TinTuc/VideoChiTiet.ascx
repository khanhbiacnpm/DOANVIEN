<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoChiTiet.ascx.cs" 
Inherits="Philip.Modules.TinTuc.VideoChiTiet" %>
<link href="../../Portals/0/Skins/SkinMotobycle/Skin.css" rel="stylesheet" type="text/css" />



<div id="divChitiet" runat="server" style="width:100%">
                <table width="100%" cellpadding="0" cellspacing="6px" border="0">
                    <tr>
                        <td style=" padding-bottom: 4px " align="center">
                            <asp:Label ID="lblTieude" runat="server" Text="Label" CssClass="textFooterBold" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div id="divNoidung" runat="server" >
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="textNomarRedBold" style="padding-left:190px">
                            Other
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:200px">
                            <asp:DataList ID="listDadua" runat="server" Width="100%">
                                <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                   <tr>
                       <td class="Li_Style_1">
                           <li ><a class="tindadua_Link" 
                                   href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/Clip.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idtintuc")%>'>
                                                    <%# DataBinder.Eval(Container.DataItem, "tieude")%>
                                                   (
                                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NgayDang")).ToString("dd/MM/yyyy")%>
                                                    ) </a> </li>
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
            </div>
<div id="divList" runat="server" style="padding-left: 6px; padding-right: 5px; padding-top:8px">
<asp:DataList ID="listVideo" runat="server" RepeatColumns="4" Width="100%" 
                    CellSpacing="6">
                      <ItemStyle HorizontalAlign="Center" />
        <ItemTemplate>
     <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            
                              <tr>
                                <tr >
                                    <td align="center">
                                        <a href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/Clip.aspx?id=<%# DataBinder.Eval(Container, "DataItem.IdTinTuc") %>'>
            <img border="0" src='<%= DotNetNuke.Common.Globals.ApplicationPath %>/Images/TinTuc/<%# DataBinder.Eval(Container, "DataItem.Anh") %>' width="215px" height="154px" />
            </a>
                                    </td>
                                </tr>
                            </tr>
                            <tr>
                                <tr >
                                    <td align="center">
                                   <a class="textFooter" href='<%= DotNetNuke.Common.Globals.ApplicationPath %>/Clip.aspx?id=<%# DataBinder.Eval(Container, "DataItem.IdTinTuc") %>'>
            <%# DataBinder.Eval(Container, "DataItem.TieuDe")%>
            </a>
                                    </td>
                                </tr>
                            </tr>
                        </table>
           
           
        </ItemTemplate>
    </asp:DataList>


                
                
            </div>






<%@ Control language="C#" Inherits="Philip.Modules.Leave.ListLeave" CodeFile="ListLeave.ascx.cs" AutoEventWireup="true"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">    
    .Grid
    {
        border-style:dotted;
        border-width: 0px;
        border-bottom-color:#bcbcbc;
          
    }
</style>

<table width="98%" cellpadding="0" cellspacing="0" align="center" >
<tr style="height:31px;">   
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_left.png);width:7px;"></td>
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_center.png);text-indent:5px;">
    
    <asp:Label ID="lblMonth" runat="server" Font-Size="10" Font-Bold="true" ForeColor="#ffffff"></asp:Label>
    </td>
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_right.png);width:7px;"></td>
</tr>
</table>
<table width="98%" cellpadding="10" cellspacing="0" style="border:solid 1px #e7e7e7" align="center">
<tr>
<td>
<asp:DataGrid ID="grdLeave" runat="server" Width="100%" PageSize="15" AutoGenerateColumns="False" GridLines="Horizontal"
                 CellPadding="6" AllowSorting="True" AllowPaging="False" ShowHeader="true" CssClass="Grid"  OnItemDataBound="grdLeave_ItemDatabound">
 							
	<SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
	<ItemStyle ForeColor="#0066b3" BackColor="White" Font-Size="10"></ItemStyle>
	 <HeaderStyle Font-Size="10"  Font-Bold="True" ForeColor="#cd2727" BackColor="#f4f4f4" BorderStyle="Solid" BorderWidth="1" BorderColor="#d9d9d9"></HeaderStyle>
	 
	<Columns>
	        
		            <asp:TemplateColumn HeaderText="Họ tên" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:HyperLink ID="hplName" runat="server"></asp:HyperLink>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		<asp:TemplateColumn HeaderText="Đơn vị" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblUnit" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
		            <asp:TemplateColumn HeaderText="Nơi nghỉ phép" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblPlace" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Từ ngày" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblFromDate" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Đến ngày" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                            <asp:Label ID="lblToDate" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
                   
		
	</Columns>
 
								
</asp:datagrid>
</td>
</tr>

</table>

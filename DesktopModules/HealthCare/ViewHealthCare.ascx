﻿<%@ Control language="C#" Inherits="VNPT.Modules.HealthCare.ViewHealthCare" CodeFile="ViewHealthCare.ascx.cs" AutoEventWireup="true"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">    
    .Grid
    {
        border-style:dotted;
        border-width: 0px;
        border-bottom-color:#bcbcbc;
    }
</style>
<table width="95%" cellpadding="0" cellspacing="0" align="center" >
<tr style="height:31px;">   
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_left.png);width:7px;"></td>
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_center.png);text-indent:5px;">
    
    <font size="2" color="#ffffff"><b>KHÁM SỨC KHỎE</b></font>&nbsp;
    <asp:DropDownList ID="ddlUnit" runat="server" Font-Size="10" 
                AutoPostBack="true" onselectedindexchanged="ddlUnit_SelectedIndexChanged"></asp:DropDownList>&nbsp;
     <asp:DropDownList ID="ddlEmployess" runat="server" Font-Size="10" 
            AutoPostBack="true" onselectedindexchanged="ddlEmployess_SelectedIndexChanged"></asp:DropDownList>
    </td>
    <td style="background:url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_right.png);width:7px;"></td>
</tr>
</table>



<table width="95%" cellpadding="10" cellspacing="0" style="border: Solid 1px #e7e7e7" align="center">
    <tr>
        <td>
            <asp:DataGrid ID="grdHealth" runat="server" Width="100%" PageSize="15" AutoGenerateColumns="False" GridLines="Horizontal"
                 CellPadding="6" AllowSorting="True" AllowPaging="True" ShowHeader="true" CssClass="Grid"  OnPageIndexChanged="grdHealth_PageIndexChanged" OnItemDataBound="grdHealth_ItemDatabound" onitemcommand="grdHealth_ItemCommand">
                <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
                <ItemStyle ForeColor="#0066b3" BackColor="White"></ItemStyle>
                <HeaderStyle Font-Bold="True" ForeColor="#cd2727" BackColor="#f4f4f4" BorderStyle="Solid"
                    BorderWidth="1" BorderColor="#d9d9d9" Height="30"></HeaderStyle>
                <Columns>
                    
                    <asp:TemplateColumn HeaderText="Nhân viên" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:HyperLink ID="hplName" runat="server"></asp:HyperLink>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Ngày khám" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.testdate")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Chiều cao" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.high")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Cân nặng" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.weight")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="HA" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.ha")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Chức năng khác" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.otherresult")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Kết luận" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <%# DataBinder.Eval(Container, "DataItem.conclusion")%>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
                     <asp:TemplateColumn  HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
	    	            <asp:ImageButton id="imgDelete" AlternateText="Delete" runat="server" CommandName="Delete" ImageUrl="~/images/delete.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id")%>'>
			            </asp:ImageButton>
		                </ItemTemplate>	
		            </asp:TemplateColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#f4f4f4" Mode="NumericPages" >
                </PagerStyle>
            </asp:DataGrid>
        </td>
    </tr>
</table>
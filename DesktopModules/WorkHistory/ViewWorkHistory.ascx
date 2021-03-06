﻿<%@ Control language="C#" Inherits="VNPT.Modules.WorkHistory.ViewWorkHistory" CodeFile="ViewWorkHistory.ascx.cs" AutoEventWireup="true"%>
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
    
    <font size="2" color="#ffffff"><b>QUÁ TRÌNH CÔNG TÁC</b></font>&nbsp;
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
            <asp:DataGrid ID="grdHistory" runat="server" Width="100%" PageSize="15" AutoGenerateColumns="False" GridLines="Horizontal"
                 CellPadding="6" AllowSorting="True" AllowPaging="True" ShowHeader="true" CssClass="Grid" onitemcommand="grdHistory_ItemCommand" OnPageIndexChanged="grdHistory_PageIndexChanged"  OnItemDataBound="grdHistory_ItemDatabound">
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
            		
		            <asp:TemplateColumn HeaderText="Đơn vị" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblUnit" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		            <asp:TemplateColumn HeaderText="Chức vụ" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblCurrentPosition" runat="server"></asp:Label>
			            </ItemTemplate>				
		            </asp:TemplateColumn>
            		
		           
            		
		            <asp:TemplateColumn HeaderText="Ngày bắt đầu" HeaderStyle-ForeColor="#cd2727">
			            <ItemTemplate>
                              <asp:Label ID="lblStartDate" runat="server"></asp:Label>
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
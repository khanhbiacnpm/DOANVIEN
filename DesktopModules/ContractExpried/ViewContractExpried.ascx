<%@ Control Language="C#" Inherits="Philip.Modules.ContractExpried.ViewContractExpried"
    CodeFile="ViewContractExpried.ascx.cs" AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">
    .Grid
    {
        border-style: dotted;
        border-width: 0px;
        border-bottom-color: #bcbcbc;
    }
</style>
<table width="98%" cellpadding="0" cellspacing="0" align="center">
    <tr style="height: 31px;">
        <td style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_left.png);
            width: 7px;">
        </td>
        <td style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_center.png);
            text-indent: 5px;">
            <font size="2" color="#ffffff"><b>DANH SÁCH NHÂN VIÊN SẮP HẾT HỢP ĐỒNG</b></font>&nbsp;
        </td>
        <td style="background: url(<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/hrm/head_right.png);
            width: 7px;">
        </td>
    </tr>
</table>
<table width="98%" cellpadding="10" cellspacing="0" style="border: Solid 1px #e7e7e7"
    align="center">
    <tr>
        <td>
            <asp:DataGrid ID="grdExpried" runat="server" Width="100%" PageSize="15" AutoGenerateColumns="False"
                GridLines="Horizontal" CellPadding="6" AllowSorting="True" AllowPaging="False"
                ShowHeader="true" CssClass="Grid" OnPageIndexChanged="grdExpried_PageIndexChanged"
                OnItemDataBound="grdExpried_ItemDatabound">
                <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
                <ItemStyle ForeColor="#0066b3" BackColor="White" Font-Size="10"></ItemStyle>
                <HeaderStyle Font-Bold="True" Font-Size="10" ForeColor="#cd2727" BackColor="#f4f4f4"
                    BorderStyle="Solid" BorderWidth="1" BorderColor="#d9d9d9" Height="30"></HeaderStyle>
                <Columns>
                    <asp:TemplateColumn HeaderText="Nhân viên" HeaderStyle-ForeColor="#cd2727">
                        <ItemTemplate>
                            <asp:HyperLink ID="hplName" runat="server">
			           
                            </asp:HyperLink>
                            <%--   <asp:Label ID="lblEmployessName" runat="server"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Đơn vị" HeaderStyle-ForeColor="#cd2727">
                        <ItemTemplate>
                            <asp:Label ID="lblUnit" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Hợp đồng" HeaderStyle-ForeColor="#cd2727">
                        <ItemTemplate>
                            <asp:Label ID="lblContractType" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Ngày bắt đầu" HeaderStyle-ForeColor="#cd2727">
                        <ItemTemplate>
                            <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Ngày kết thúc" HeaderStyle-ForeColor="#cd2727">
                        <ItemTemplate>
                            <asp:Label ID="lblEndDate" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
        </td>
    </tr>
</table>

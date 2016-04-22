<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SangKien_NhanVien.ascx.cs"
    Inherits="VNPT.Modules.ThongTinNhanVien.SangKien_NhanVien" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

 
<div style="height:430px;overflow:scroll;">
    <dx:ASPxGridView ID="grid_sangkiennhanvien" runat="server" AutoGenerateColumns="False"
        Theme="Glass" Font-Size="12px" KeyFieldName="id"
        Width="100%">
        <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
        <SettingsPager Mode="ShowAllRecords" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="STT" Width="30px">
                <DataItemTemplate>
                    <%# Container.ItemIndex +1 %>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ten" Caption="Tên sáng kiến" />
            <dx:GridViewDataTextColumn FieldName="soqd" Caption="Số QĐ">
                <DataItemTemplate>
                    <a target="_blank" href='<%# DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/" + Eval("fileqd") %>'>
                        <%# Eval("soqd") %></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="capqd" Caption="Cấp QĐ" />
            <dx:GridViewDataTextColumn FieldName="noidung" Caption="Nội dung sáng kiến" />
            <dx:GridViewDataTextColumn FieldName="nvchutri" Caption="Nhân viên chủ trì" />            
        </Columns>
    </dx:ASPxGridView>
</div>

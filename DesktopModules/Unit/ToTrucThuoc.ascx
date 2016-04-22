<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToTrucThuoc.ascx.cs"
    Inherits="VNPT.Modules.Unit.ToTrucThuoc" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<dx:ReportViewer ID="ReportViewer1" runat="server" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    LoadingPanelText="" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle ForeColor="#303030">
    </LoadingPanelStyle>   
</dx:ReportViewer>
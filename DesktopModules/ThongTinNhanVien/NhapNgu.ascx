<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NhapNgu.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.NhapNgu" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<dx:ASPxCallbackPanel runat="server" ID="cbp_nhapngu" ClientInstanceName="cbp_nhapngu"
    OnCallback="cbp_nhapngu_Callback">
    <ClientSideEvents EndCallback="function(s,e){
                    if(cbp_nhapngu.cpresult != 0){
                        alert('Lưu thông tin thành công!')
                        delete cbp_nhapngu.cpresult;
                    }                    
                }" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent4" runat="server">
            <table width="100%" cellpadding="3" cellspacing="0" border="0" style="background: #edf3f4;
                font-size: 11pt;">
                <tr>
                    <td class="tieude" style="width: 115px;">
                        Ngày nhập ngũ
                    </td>
                    <td valign="top" style="width:150px;">
                        <dx:ASPxDateEdit ID="date_ngaynhapngu" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                            runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="150px">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="tieude" style="width: 115px;">
                        Quân hàm cao nhất
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txt_quanhamcaonhat" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude" style="width: 100px;">
                        Ngày xuất ngũ
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="date_ngayxuatngu" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                            runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="tieude">
                        Đơn vị xuất ngũ
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txtNoiXuatNgu" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">
                        Ngày kết nạp đoàn
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="date_ngayketnapdoan" runat="server" DisplayFormatString="dd/MM/yyyy"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="tieude">
                        Nơi kết nạp
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txt_noiketnapdoan" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="tieude">
                        Ngày kết nạp Đảng
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="date_ngayketnapdang" runat="server" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="tieude">
                        Nơi kết nạp
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txt_noiketnapdang" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="tieude">
                        Ngày chính thức
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="date_ngaychinhthuc" runat="server" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td valign="top" class="tieude">
                        Số thẻ
                    </td>
                    <td valign="top" style="width:100px;">
                        <dx:ASPxTextBox ID="txt_sothedang" runat="server" Width="100px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                    <td valign="top" class="tieude" style="width:70px;">
                        Ngày cấp
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="date_ngaycapthe" runat="server" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="tieude">
                        Người giới thiệu
                    </td>
                    <td valign="top" colspan="5">
                        <dx:ASPxTextBox ID="txt_nguoigioithieu" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="tieude">
                        Chi bộ
                    </td>
                    <td valign="top" colspan="5">
                        <dx:ASPxTextBox ID="txt_chiboketnap" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="tieude">
                        Đảng bộ
                    </td>
                    <td valign="top" colspan="5">
                        <dx:ASPxTextBox ID="txt_dangboketnap" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="bt_luu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                            <Image Url="../../images/imgadmin/save_16.png">
                            </Image>
                            <ClientSideEvents Click="function(s,e){
                    cbp_nhapngu.PerformCallback();
                }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TTKhac.ascx.cs" Inherits="VNPT.Modules.ThongTinNhanVien.TTKhac" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<dx:ASPxCallbackPanel runat="server" ID="callbackTT" OnCallback="callbackTT_Callback"
    ClientInstanceName="callbackTT" ShowLoadingPanel="false">
    <ClientSideEvents EndCallback="function(s,e){
                    if(callbackTT.cpresult !=0)
                    {
                        alert('Lưu thông tin thành công!');
                        delete callbackTT.cpresult;
                    }
                }" />
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
    </LoadingPanelStyle>
    <PanelCollection>
        <dx:PanelContent ID="PanelContent4" runat="server">
            <table width="100%" cellpadding="1" cellspacing="0" style="font-family: Times New Roman; font-size: 11pt;">
                <tr>
                    <td class="tieude" style="width: 170px;">Sở trường
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txt_sotruong" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">Có thân nhân (Cha, Mẹ, Vợ, Chồng, con, anh chị em ruột) ở nước ngoài (làm gì, địa chỉ)?
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txt_dinuocngoai" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">Tham gia hoặc có quan hệ với các tổ chức chính trị, kinh tế, xã hội nào ở nước ngoài (làm gì, tổ chức nào, đặt
trụ sở ở đâu .........?):

                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txt_kinhtebanthan" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">Khai rõ: bị bắt, bị tù (từ ngày tháng năm nào đến ngày tháng năm nào, ở đâu), đã khai báo cho ai, những vấn đề
gì? Bản thân có làm việc trong chế độ cũ (cơ quan, đơn vị nào, địa điểm, chức danh, chức vụ, thời gian làm việc
....)

                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txt_giadinh" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td>Kỹ năng mềm</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px; vertical-align: top;">
                                                <dx:ASPxListBox ID="lstKyNang" runat="server" Width="100%" ClientInstanceName="lstKyNang"
                                                    SelectionMode="CheckColumn" ValueField="Id" TextField="KyNang" EnableSynchronization="False"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                    Height="160px">

                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                </dx:ASPxListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table style="width: 100%">

                                        <tr>
                                            <td>Đáp ứng yêu cầu về trình độ theo chức danh</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px; vertical-align: top;">
                                                <dx:ASPxListBox ID="listTrinhDoKhac" runat="server" Width="100%" ClientInstanceName="listTrinhDoKhac"
                                                    SelectionMode="CheckColumn" ValueField="Id" TextField="TrinhDo" EnableSynchronization="False"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                    Height="160px">

                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                </dx:ASPxListBox>
                                            </td>

                                        </tr>
                                    </table>

                                </td>
                            </tr>


                        </table>

                        </td>

                            </tr>
                           
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="bt_luu" runat="server" Text="Lưu"
                                        AutoPostBack="false" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100px">
                                        <ClientSideEvents Click="function(s, e) {
	                                    callbackTT.PerformCallback();
                                    }" />
                                        <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                            VerticalPosition="center" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

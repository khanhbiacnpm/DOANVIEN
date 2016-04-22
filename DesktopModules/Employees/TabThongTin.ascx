<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabThongTin.ascx.cs" Inherits="VNPT.Modules.Employees.TabThongTin" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPager" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Mvc.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.Mvc" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<script type="text/javascript">
    var keyValue;
    function readonly() {
        RoundPanleleftK.SetEnabled(true);
        cmbQuocTichK.SetEnabled(true);
        cmbTonGiaoK.SetEnabled(true);
        cmbGioiTinhK.SetEnabled(true);
        cmbDanTocK.SetEnabled(true);
        txtTenKhacK.SetEnabled(true);
        dateNgaySinhK.SetEnabled(true);
        txtHoTenK.SetEnabled(true);
        upLoadK.SetVisible(true);
        ASPxButton2.SetEnabled(true);
    }    
</script>

<dx:ASPxCallbackPanel ID="callThongTin" runat="server" ClientInstanceName="callThongTin"
    OnCallback="callThongTin_CallBack">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table style="font-size: 9pt; font-family: Verdana;" border="0">
                <tr>
                    <td valign="top" rowspan="5" style="width: 120px;">
                        <asp:HiddenField ID="hiddenIDEmployee" runat="server" />                                                
                        <asp:HiddenField ID="hiddenHinh2" runat="server" />
                        <div style="border: 2px solid #AECAF0; width: 120px; height: 120px; text-align: center;">
                            <dx:ASPxImage ID="imgEmp" runat="server" Width="120px" Height="120px">
                            </dx:ASPxImage>
                        </div>
                        <div style="width: 120px; text-align: center;">
                            <dx:ASPxUploadControl ID="upLoadK" Width="100%" Height="25px" runat="server" OnFileUploadComplete="upLoadK_UploadFile"
                                ClientInstanceName="upLoadK">
                                <ClientSideEvents Init="function(s,e){upLoadK.SetVisible(false);}" />
                            </dx:ASPxUploadControl>
                        </div>
                    </td>
                    <td valign="top">
                        Mã NV
                    </td>
                    <td valign="top">
                        <dx:ASPxTextBox ID="txtMaNVK" runat="server" Width="150px" Enabled="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Họ tên
                    </td>
                    <td valign="top">
                        <dx:ASPxTextBox ID="txtHoTenK" ClientInstanceName="txtHoTenK" runat="server" Width="150px"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ValidationSettings Display="Dynamic" ValidationGroup="K" ErrorTextPosition="Bottom">
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                                <RequiredField IsRequired="true" ErrorText="Họ tên trống !" />
                            </ValidationSettings>
                            <ClientSideEvents Init="function(s,e){txtHoTenK.SetEnabled(false);}" />
                        </dx:ASPxTextBox>
                    </td>
                    <td valign="top">
                        Tên khác
                    </td>
                    <td valign="top">
                        <dx:ASPxTextBox ID="txtTenKhacK" ClientInstanceName="txtTenKhacK" runat="server"
                            Width="130px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ClientSideEvents Init="function(s,e){txtTenKhacK.SetEnabled(false);}" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Ngày sinh
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="dateNgaySinhK" ClientInstanceName="dateNgaySinhK" runat="server"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="150px">
                            <CalendarProperties>
                                <HeaderStyle Spacing="1px" />
                                <FooterStyle Spacing="17px" />
                            </CalendarProperties>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                </Image>
                            </DropDownButton>
                            <ClientSideEvents Init="function(s,e){dateNgaySinhK.SetEnabled(false);}" />
                        </dx:ASPxDateEdit>
                    </td>
                    <td valign="top">
                        Giới tính
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbGioiTinhK" ClientInstanceName="cmbGioiTinhK" runat="server"
                            IncrementalFilteringMode="Contains" Width="130px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <Items>
                                <dx:ListEditItem Selected="True" Text="Nam" Value="1" />
                                <dx:ListEditItem Text="Nữ" Value="0" />
                            </Items>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                </Image>
                            </DropDownButton>
                            <ClientSideEvents Init="function(s,e){cmbGioiTinhK.SetEnabled(false);}" />
                        </dx:ASPxComboBox>
                    </td>
                    <td valign="top">
                        &nbsp;
                    </td>
                    <td valign="top">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Dân tộc
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbDanTocK" ClientInstanceName="cmbDanTocK" runat="server" IncrementalFilteringMode="Contains"
                            Width="150px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                </Image>
                            </DropDownButton>
                            <ClientSideEvents Init="function(s,e){cmbDanTocK.SetEnabled(false);}" />
                        </dx:ASPxComboBox>
                    </td>
                    <td valign="top">
                        Tôn giáo
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbTonGiaoK" ClientInstanceName="cmbTonGiaoK" runat="server"
                            IncrementalFilteringMode="Contains" Width="130px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                </Image>
                            </DropDownButton>
                            <ClientSideEvents Init="function(s,e){cmbTonGiaoK.SetEnabled(false);}" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Quốc tịch
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbQuocTichK" ClientInstanceName="cmbQuocTichK" runat="server"
                            IncrementalFilteringMode="Contains" Width="150px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                </Image>
                            </DropDownButton>
                            <ClientSideEvents Init="function(s,e){cmbQuocTichK.SetEnabled(false);}" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="5">
                        <dx:ASPxRoundPanel ID="RoundPanleleftK" runat="server" ClientInstanceName="RoundPanleleftK"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            GroupBoxCaptionOffsetY="-28px" HeaderText="" ShowHeader="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ContentPaddings Padding="2px" />
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent11" runat="server">
                                    <table cellpadding="2" cellspacing="2" style="font-size: 9pt; width: 560px;" border="0">
                                        <tr>
                                            <td valign="top">
                                                Nơi sinh
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtNoiSinhXaK" runat="server" Width="110px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtNoiSinhHuyenK" runat="server" Width="164px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbNoiSinhTinhK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Quê quán
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtNguyenQuanXaK" runat="server" Width="110px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtNguyenQuanHuyenK" runat="server" Width="164px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbNguyenQuanTinhK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Thường trú
                                            </td>
                                            <td valign="top" colspan="5">
                                                <dx:ASPxTextBox ID="txtThuongTruK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Chổ ở hiện nay
                                            </td>
                                            <td valign="top" colspan="5">
                                                <dx:ASPxTextBox ID="txtChoOHienNayK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Số CMDN
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtSoCMNDK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="K">
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                        <RequiredField IsRequired="true" ErrorText="Nhập Số CMND" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                Ngày cấp
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxDateEdit ID="dateNgayCapK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td valign="top" style="width: 50px;">
                                                Nơi cấp
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxComboBox ID="cmbNoiCapK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Điện thoại
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtDienThoaiK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                Email
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtEmailK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                        <RegularExpression ErrorText="Email không hợp lệ !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                MST
                                            </td>
                                            <td valign="top">
                                                <dx:ASPxTextBox ID="txtMSTK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-left: 0px;">
                                                TP bản thân
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbTPBTK" runat="server" IncrementalFilteringMode="Contains"
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" LoadingPanelImagePosition="Top"
                                                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String"
                                                    Width="100%">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxditors_edtDropDownHover_Aqua" PressedCssClass="dxditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                TP gia đình
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbTPGDK" runat="server" IncrementalFilteringMode="Contains"
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" LoadingPanelImagePosition="Top"
                                                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String"
                                                    Width="100%">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxditors_edtDropDownHover_Aqua" PressedCssClass="dxditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Ngày kết nạp ĐTNCSHCM
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxDateEdit ID="dateNgayKetNapDTNCSHCMK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td valign="top">
                                                Nơi kết nạp
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtNoiKetNapDTNCSHCMK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Ngày kết nạp ĐCSVN
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxDateEdit ID="dateNgayKetNapDCSVNK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td valign="top">
                                                Nơi kết nạp
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtNoiKetNapDCSVNK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr style="background: #99ccff;">
                                            <td valign="top" colspan="6" style="background-color: #D6E7FF; color: #293852; font-weight: bold;
                                                height: 22px;">
                                                Bằng cấp
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                TĐ phổ thông
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbTDPhoThongK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                QL nhà nước
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbQuanLyNhaNuocK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Ngoại ngữ
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbNgoaiNguK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                Tin học
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbTinHocK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Lý luận CT
                                            </td>
                                            <td valign="top" colspan="5">
                                                <dx:ASPxComboBox ID="cmbLyLuanCTK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr style="background: #99ccff;">
                                            <td valign="top" style="background-color: #D6E7FF; color: #293852; font-weight: bold;
                                                height: 22px;" colspan="6">
                                                Công việc
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Ngày tuyển dụng
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxDateEdit ID="dateNgayTuyenK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td valign="top">
                                                ĐV tuyển dụng
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtDVTuyenDungK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Ngày vào ngành
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxDateEdit ID="dateNgayVaoNganhK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td valign="top">
                                                ĐV Công tác
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbDonViCTacK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                                <%--<asp:DropDownList ID="cmbDonViCTacK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                                            CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                                                            Style="height: 20px; border: 1px solid #CEE7FF; padding-top: 2px;">
                                                                                        </asp:DropDownList>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Chức danh
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbChucDanhK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                MT làm việc
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbMTLamViecK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="Độc hại" Value="1" />
                                                        <dx:ListEditItem Text="Không độc hại" Value="0" />
                                                    </Items>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Chức vụ
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbChucVuK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                Đối tượng LĐ
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbDoiTuongLDK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Chức vụ ĐT
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbCVDoanTheK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                Chức vụ Đảng
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbCVDangK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr style="background: #99ccff;">
                                            <td valign="top" style="background-color: #D6E7FF; color: #293852; font-weight: bold;
                                                height: 22px;" colspan="6">
                                                Chính sách sức khỏe
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Sức khỏe
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbSuKhoeK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                Nhóm máu
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbNhomMau" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    IncrementalFilteringMode="Contains" CssPostfix="Aqua" LoadingPanelImagePosition="Top"
                                                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String"
                                                    Width="100%">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxditors_edtDropDownHover_Aqua" PressedCssClass="dxditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Chiều cao
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtChieuCaoK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                Cân nặng
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtCanNangK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                BHXH
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtBHXHK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                Ngày đóng BHXH
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxDateEdit ID="dateNgayDongBHXHK" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Nơi khám Bệnh
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtNoiKhamBenhK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td valign="top">
                                                BHYT
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxTextBox ID="txtBHYTK" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <ValidationSettings>
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                Thương binh
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbThuongBinhK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td valign="top">
                                                Đối tượng CSXH
                                            </td>
                                            <td valign="top" colspan="2">
                                                <dx:ASPxComboBox ID="cmbDoiTuongCSXHK" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents Init="function(s,e){RoundPanleleftK.SetEnabled(false);}" />
                        </dx:ASPxRoundPanel>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="6" align="center">
                        <table cellpadding="0" cellspacing="0" align="center" border="0">
                            <tr>
                                <td valign="top" style="width: 100px;">
                                    <dx:ASPxButton ID="ASPxButton1222" runat="server" Text="&nbsp;&nbsp;Chỉnh sửa" AutoPostBack="false"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                        Width="90px">
                                        <ClientSideEvents Click="function(s, e) {	                                                                                
                                readonly();
                             }" />
                                        <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/edit_16.png" Repeat="NoRepeat"
                                            VerticalPosition="center" />
                                    </dx:ASPxButton>
                                </td>
                                <td valign="top" style="width: 90px;">
                                    <dx:ASPxButton ID="ASPxButton2" runat="server" ClientInstanceName="ASPxButton2" Text="&nbsp;&nbsp;Lưu"
                                        AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                        <ClientSideEvents Click="function(s, e) {
                                upLoadK.UploadFile();
                                callThongTin.PerformCallback('Luu');	                                                                                
                            }" Init="function(s,e){ASPxButton2.SetEnabled(false);}" />
                                        <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                            VerticalPosition="center" />
                                    </dx:ASPxButton>
                                </td>                                
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
    <ClientSideEvents EndCallback="function(s,e){
        if(callThongTin.cpResult == true){
            alert('Lưu thông tin thành công');
            callThongTin.cpResult=false;
        }
    }" />
</dx:ASPxCallbackPanel>

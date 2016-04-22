<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddEmployees.ascx.cs"
    Inherits="VNPT.Modules.Employees.AddEmployees" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
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
    
    var key = false;
    var ngaysinh;
    var capmadonvi;
    function OnUpdateClick(key) {
        uploader.UploadFile();
        callbackPanelEmployees.PerformCallback(key);
    }
    function checkNull() {
        var kq;
        if (cmbDonViCTac.GetValue() == '0') {
            alert('Xin vui lòng chọn đơn vị !');
            cmbDonViCTac.SetFocus();
            return false;
        }

        else
            kq = true;
        if (txtMaNV.GetText() == '') {
            alert('Xin vui lòng nhập MANV !');
            txtMaNV.SetFocus();
            return false;
        } else
            kq = true;
        if (txtHoTen.GetText() == '') {
            alert('Xin vui lòng nhập tên !');
            txtHoTen.SetFocus();
            return false;
        } else
            kq = true;

       

    
            if (dateNgaySinh.GetDate() == null) {
                alert('Xin vui lòng nhập ngày sinh !');
                dateNgaySinh.SetFocus();
                return false;
            }
            else
                kq = true;
      
        if (txtNoiSinhXa.GetText() == '') {
            alert('Xin vui lòng nhập nơi sinh !');
            txtNoiSinhXa.SetFocus();
            return false;
        } else
            kq = true;
        if (txtNoiSinhHuyen.GetText() == '') {
            alert('Xin vui lòng nhập nơi sinh !');
            txtNoiSinhHuyen.SetFocus();
            return false;
        } else
            kq = true;

        if (cmbNoiSinhTinh.GetValue() == '0') {
            alert('Xin vui lòng chọn nơi sinh !');
            cmbNoiSinhTinh.SetFocus();
            return false;
        }

        else
            kq = true;


        if (txtNguyenQuanXa.GetText() == '') {
            alert('Xin vui lòng nhập nguyên quán !');
            txtNguyenQuanXa.SetFocus();
            return false;
        } else
            kq = true;
        if (txtNguyenQuanHuyen.GetText() == '') {
            alert('Xin vui lòng nhập nguyên quán !');
            txtNguyenQuanHuyen.SetFocus();
            return false;
        } else
            kq = true;

        if (cmbNguyenQuanTinh.GetValue() == '0') {
            alert('Xin vui lòng chọn nguyên quán !');
            cmbNguyenQuanTinh.SetFocus();
            return false;
        }

        else
            kq = true;


        if (txtThuongTru.GetText() == '') {
            alert('Xin vui lòng nhập thường trú !');
            txtThuongTru.SetFocus();
            return false;
        } else
            kq = true;

        if (txtChoOHienNay.GetText() == '') {
            alert('Xin vui lòng nhập chỗ ở hiện nay !');
            txtChoOHienNay.SetFocus();
            return false;
        } else
            kq = true;

        if (txtSoCMND.GetText() == '') {
            alert('Xin vui lòng nhập số chứng minh thư !');
            txtSoCMND.SetFocus();
            return false;
        } 
        else
            kq = true;

        if (dateNgayCap.GetDate() == null) {
            alert('Xin vui lòng nhập ngày cấp CMND !');
            dateNgayCap.SetFocus();
            return false;
        }
        else
            kq = true;

        if (cmbNoiCap.GetValue() == '0') {
            alert('Xin vui lòng chọn nơi cấp CMND !');
            cmbNoiCap.SetFocus();
            return false;
        }

        else
            kq = true;


       if (cmbLoaiHopDong.GetValue() == '0') {
                    alert('Xin vui lòng chọn loại hợp đồng !');
                    cmbLoaiHopDong.SetFocus();
                    return false;
                }
        
        else
            kq = true;
        return kq;
    }
</script>
<dx:ASPxCallbackPanel ID="callbackPanelEmployees" runat="server" ClientInstanceName="callbackPanelEmployees"
    OnCallback="callbackPanelEmployees_Callback" ShowLoadingPanel="true">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent7" runat="server">
            <dx:ASPxRoundPanel ID="RoundPanleleft" runat="server" Width="1000px" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" GroupBoxCaptionOffsetY="-25px" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                EnableDefaultAppearance="False" ShowHeader="false">
                <ContentPaddings Padding="2px" PaddingBottom="0px" PaddingTop="0px" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent11" runat="server">
                        <table cellpadding="2" cellspacing="2" style="font-size: 9pt; font-family: Verdana;
                            width: 100%" border="0">
                            <tr>
                                <td colspan="6">
                                    <table style="font-size: 9pt; font-family: Verdana; width: 100%" border="0">
                                        <tr>
                                            <td valign="top" rowspan="5" style="width: 120px;">
                                               
                                                <asp:HiddenField ID="hiddenIDDonVi" runat="server" />
                                                <asp:HiddenField ID="hiddenHinh" runat="server" />
                                                <asp:HiddenField ID="hiddenTrangThai" runat="server" />
                                                <div style="border: 2px solid #AECAF0; width: 120px; height: 120px; text-align: center;">
                                                    <dx:ASPxImage ID="imageNhanVien" runat="server" Width="120px" Height="120px">
                                                    </dx:ASPxImage>
                                                </div>
                                                <div style="width: 120px; text-align: center;">
                                                    <dx:ASPxUploadControl ID="uploadHinhAnh" Width="100%" Height="25px" runat="server"
                                                        ClientInstanceName="uploader" OnFileUploadComplete="uploadHinhAnh_FileUploadComplete">
                                                    </dx:ASPxUploadControl>
                                                </div>
                                            </td>
                                            <td  style="width: 100px;">
                                                Mã NV :
                                            </td>
                                            <td  style="width: 190px;">
                                                <dx:ASPxTextBox ID="txtMaNV" runat="server" ClientInstanceName="txtMaNV" Width="100%"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td  style="width: 100px;">
                                                Họ tên :
                                            </td>
                                            <td  style="width: 190px;">
                                                <dx:ASPxTextBox ID="txtHoTen" runat="server" Width="100%" ClientInstanceName="txtHoTen"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td  style="width: 120px;">
                                                Tên khác :
                                            </td>
                                            <td  style="width: 190px;">
                                                <dx:ASPxTextBox ID="txtTenKhac" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Đơn vị :
                                            </td>
                                            <td>
                                                <asp:HiddenField ID="DVyeucau" runat="server" />
                                                <dx:ASPxComboBox ID="cmbDonViCTac" runat="server" ClientInstanceName="cmbDonViCTac"
                                                    IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                    CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
                                                    </LoadingPanelImage>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td>
                                                Ngày sinh :
                                            </td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dateNgaySinh" runat="server" ClientInstanceName="dateNgaySinh"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                    Width="100%">
                                                    <CalendarProperties>
                                                        <HeaderStyle Spacing="1px" />
                                                        <FooterStyle Spacing="17px" />
                                                    </CalendarProperties>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td>
                                                Giới tính :
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="cmbGioiTinh" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="Nam" Value="1" />
                                                        <dx:ListEditItem Text="Nữ" Value="0" />
                                                    </Items>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Dân tộc :
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="cmbDanToc" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td>
                                                Tôn giáo :
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="cmbTonGiao" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                               <td >
                                                Quốc tịch :
                                            </td>
                                            <td >
                                                <dx:ASPxComboBox ID="cmbQuocTich" runat="server" IncrementalFilteringMode="Contains"
                                                    Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                    LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                    <DropDownButton>
                                                        <Image>
                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                                PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                        </Image>
                                                    </DropDownButton>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                              <tr>
                                <td >
                                    Nơi sinh
                                </td>
                                <td >
                                    <dx:ASPxTextBox ID="txtNoiSinhXa" NullText="Xã/phường" runat="server" ClientInstanceName="txtNoiSinhXa"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                                <td  colspan="3">
                                    <dx:ASPxTextBox ID="txtNoiSinhHuyen" ClientInstanceName="txtNoiSinhHuyen" NullText="Huyện/Thành phố" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td >
                                    <dx:ASPxComboBox ID="cmbNoiSinhTinh" runat="server" IncrementalFilteringMode="Contains" ClientInstanceName="cmbNoiSinhTinh"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                                   <tr>
                                <td >
                                    Quê quán
                                </td>
                                <td >
                                    <dx:ASPxTextBox ID="txtNguyenQuanXa" NullText="Xã/phường" runat="server" ClientInstanceName="txtNguyenQuanXa"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td  colspan="3">
                                    <dx:ASPxTextBox ID="txtNguyenQuanHuyen" runat="server" Width="100%" NullText="Xã/Phường" ClientInstanceName="txtNguyenQuanHuyen" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td >
                                    <dx:ASPxComboBox ID="cmbNguyenQuanTinh" runat="server" IncrementalFilteringMode="Contains" ClientInstanceName="cmbNguyenQuanTinh"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                                    </table>
                                </td>
                            </tr>
                             
                      
                     
                            <tr>
                                <td valign="top">
                                    Thường trú
                                </td>
                                <td valign="top" colspan="5">
                                    <dx:ASPxTextBox ID="txtThuongTru" runat="server" ClientInstanceName="txtThuongTru"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxTextBox ID="txtChoOHienNay" runat="server" ClientInstanceName="txtChoOHienNay"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxTextBox ID="txtSoCMND" runat="server" Width="100%" ClientInstanceName="txtSoCMND"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                    </dx:ASPxTextBox>
                                </td>
                                <td valign="top">
                                    Ngày cấp
                                </td>
                                <td valign="top">
                                    <dx:ASPxDateEdit ID="dateNgayCap" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" ClientInstanceName="dateNgayCap"
                                        CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Width="100%">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                            <FooterStyle Spacing="17px" />
                                        </CalendarProperties>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td valign="top" style="width: 50px;">
                                    Nơi cấp
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbNoiCap" runat="server" IncrementalFilteringMode="Contains" ClientInstanceName="cmbNoiCap"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
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
                                    <dx:ASPxTextBox ID="txtDienThoai" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxTextBox ID="txtEmail" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxTextBox ID="txtMST" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxComboBox ID="cmbTPBT" runat="server" IncrementalFilteringMode="Contains"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        ValueType="System.String" Width="100%">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxditors_edtDropDownHover_Glass" PressedCssClass="dxditors_edtDropDownPressed_Glass" />
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
                                    <dx:ASPxComboBox ID="cmbTPGD" runat="server" IncrementalFilteringMode="Contains"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        ValueType="System.String" Width="100%">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxditors_edtDropDownHover_Glass" PressedCssClass="dxditors_edtDropDownPressed_Glass" />
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
                                    <dx:ASPxDateEdit ID="dateNgayKetNapDTNCSHCM" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Width="100%">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                            <FooterStyle Spacing="17px" />
                                        </CalendarProperties>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td valign="top">
                                    Nơi kết nạp
                                </td>
                                <td valign="top" colspan="2">
                                    <dx:ASPxTextBox ID="txtNoiKetNapDTNCSHCM" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                    <dx:ASPxDateEdit ID="dateNgayKetNapDCSVN" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Width="100%">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                            <FooterStyle Spacing="17px" />
                                        </CalendarProperties>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td valign="top">
                                    Nơi kết nạp
                                </td>
                                <td valign="top" colspan="2">
                                    <dx:ASPxTextBox ID="txtNoiKetNapDCSVN" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
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
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbTDPhoThong" runat="server" IncrementalFilteringMode="Contains"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Ngoại ngữ
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbNgoaiNgu" runat="server" IncrementalFilteringMode="Contains"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                                <td valign="top">
                                    Tin học
                                </td>
                                <td valign="top" colspan="3">
                                    <dx:ASPxComboBox ID="cmbTinHoc" runat="server" IncrementalFilteringMode="Contains"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Lý luận CT
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbLyLuanCT" runat="server" IncrementalFilteringMode="Contains"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                                <td valign="top">
                                    Loại HĐ
                                </td>
                                <td valign="top" colspan="3">
                                    <dx:ASPxComboBox ID="cmbLoaiHopDong" runat="server" ClientInstanceName="cmbLoaiHopDong"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        ValueType="System.String">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass"
                                                    PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
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
                                <td valign="top" colspan="6">
                                    <dx:ASPxGridView ID="gridBangCap" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridBangCap"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="id"
                                        Width="100%" OnHtmlDataCellPrepared="gridBangCap_HtmlDataCellPrepared" OnRowDeleting="gridBangCap_RowDeleting"
                                        OnRowInserting="gridBangCap_RowInserting" OnRowUpdating="gridBangCap_RowUpdating"
                                        OnCancelRowEditing="gridBangCap_CancelRowEdit">
                                        <Settings ShowHorizontalScrollBar="true" />
                                        <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                                        <ClientSideEvents RowDblClick="function(s, e) {
                                                                                            gridBangCap.StartEditRow(e.visibleIndex);
                                                                                        }" />
                                        <Columns>
                                            <dx:GridViewDataColumn FieldName="id" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="empid" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="qualificationid" Caption="Bằng cấp" VisibleIndex="2">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="lbl_BangCap" runat="server">
                                                    </dx:ASPxLabel>
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Left">
                                                </CellStyle>
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="professionid" Caption="Chuyên ngành" VisibleIndex="3">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="lbl_CN" runat="server">
                                                    </dx:ASPxLabel>
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Left">
                                                </CellStyle>
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="trainingid" Caption="HT đào tạo" VisibleIndex="4">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="lbl_HTDT" runat="server">
                                                    </dx:ASPxLabel>
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Left">
                                                </CellStyle>
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="result" Caption="Kết quả" VisibleIndex="5">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="schools" Caption="Trường cấp" VisibleIndex="6">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="NamTotNghiep" Caption="Năm cấp" VisibleIndex="7">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataColumn FieldName="danhhieu" Caption="Danh hiệu" VisibleIndex="8">
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataCheckColumn FieldName="highest" Caption="Cao nhất" VisibleIndex="9">
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataColumn FieldName="ghichu" Caption="Ghi chú" VisibleIndex="10">
                                            </dx:GridViewDataColumn>
                                        </Columns>
                                        <SettingsPager PageSize="100">
                                            <Summary AllPagesText="{0} - {1} " Visible="False" />
                                        </SettingsPager>
                                        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" PopupEditFormHorizontalAlign="WindowCenter"
                                            PopupEditFormModal="True" PopupEditFormWidth="400px" />
                                        <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh lịch sử bản thân" />
                                        <SettingsLoadingPanel ImagePosition="Top" />
                                        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                            </LoadingPanelOnStatusBar>
                                            <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                                            </LoadingPanel>
                                        </Images>
                                        <ImagesEditors>
                                            <DropDownEditDropDown>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </DropDownEditDropDown>
                                            <SpinEditIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                                            </SpinEditIncrement>
                                            <SpinEditDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                                            </SpinEditDecrement>
                                            <SpinEditLargeIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                                            </SpinEditLargeIncrement>
                                            <SpinEditLargeDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                                            </SpinEditLargeDecrement>
                                        </ImagesEditors>
                                        <ImagesFilterControl>
                                            <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                            </LoadingPanel>
                                        </ImagesFilterControl>
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                            <Header Font-Bold="True" Wrap="True" HorizontalAlign="Center">
                                            </Header>
                                            <HeaderPanel Font-Bold="True">
                                            </HeaderPanel>
                                            <LoadingPanel ImageSpacing="8px">
                                            </LoadingPanel>
                                            <TitlePanel Font-Bold="True">
                                            </TitlePanel>
                                        </Styles>
                                        <StylesEditors>
                                            <CalendarHeader Spacing="1px">
                                            </CalendarHeader>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px">
                                                    <table style="font-size: 9pt; font-family: Verdana;" cellpadding="1" cellspacing="1"
                                                        width="100%">
                                                        <tr>
                                                            <td valign="top" style="width: 120px;">
                                                                Bằng cấp
                                                            </td>
                                                            <td valign="top">
                                                                <asp:HiddenField ID="idBangCap" runat="server" OnLoad="idBangCap_Load" />
                                                                <asp:HiddenField ID="hiddenEmpId" runat="server" OnLoad="hiddenEmpId_Load" />
                                                                <dx:ASPxComboBox ID="cmbBangCap" runat="server" IncrementalFilteringMode="Contains"
                                                                    OnLoad="cmbBangCap_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                                                                Cao nhất
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxCheckBox ID="checkBangCapCaoNhat" runat="server" OnLoad="CaoNhat_Init" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                Chuyên ngành
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxComboBox ID="cmbCNDaoTao" runat="server" IncrementalFilteringMode="Contains"
                                                                    OnLoad="cmbNNDaoTao_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                                                                HT đào tạo
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxComboBox ID="cboTrainingForm" runat="server" IncrementalFilteringMode="Contains"
                                                                    OnLoad="cboTrainingForm_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                Trường cấp bằng
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxTextBox ID="txtTruongCap" runat="server" Width="100%" OnLoad="txtTruongCap_Init"
                                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ValidationSettings>
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td valign="top">
                                                                Năm tốt nghiệp
                                                            </td>
                                                            <td valign="top">
                                                                <dx:ASPxTextBox ID="txtNamTotNghiep" runat="server" Width="100%" OnLoad="txtNamTotNghiep_Init"
                                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                                                                Danh hiệu
                                                            </td>
                                                            <td valign="top" colspan="3">
                                                                <dx:ASPxTextBox ID="txtDanhHieu" runat="server" Width="100%" OnLoad="txtDanhHieu_Init"
                                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                                                                Kết quả
                                                            </td>
                                                            <td valign="top" colspan="3">
                                                                <dx:ASPxComboBox ID="cmbResult" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    OnLoad="cmbResult_Load" CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False"
                                                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String">
                                                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                                                    </LoadingPanelImage>
                                                                    <Items>
                                                                        <dx:ListEditItem Text="" Value="0" Selected="true" />
                                                                        <dx:ListEditItem Text="Xuất sắc" Value="1" />
                                                                        <dx:ListEditItem Text="Giỏi" Value="2" />
                                                                        <dx:ListEditItem Text="Khá" Value="3" />
                                                                        <dx:ListEditItem Text="Trung bình khá" Value="4" />
                                                                        <dx:ListEditItem Text="Trung bình" Value="5" />
                                                                        <dx:ListEditItem Text="Yếu" Value="6" />
                                                                        <dx:ListEditItem Text="Kém" Value="7" />
                                                                    </Items>
                                                                    <DropDownButton>
                                                                        <Image>
                                                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                                                Ghi chú
                                                            </td>
                                                            <td valign="top" colspan="3">
                                                                <dx:ASPxMemo ID="memoGhiChu" runat="server" Height="40px" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                    <ValidationSettings>
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dx:ASPxMemo>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                            </td>
                                                            <td valign="top">
                                                                <table style="font-size: 9pt;" cellpadding="2" cellspacing="0">
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <dx:ASPxButton ID="btLuuBangCapNhat" runat="server" Text="Lưu" ClientInstanceName="btLuuBangCapNhat"
                                                                                AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="60px">
                                                                                <ClientSideEvents Click="function(s, e) {
                                                                                            if(ASPxClientEdit.ValidateGroup('editForm'))
                                                                                            {
                                                                                                 gridBangCap.UpdateEdit();                                        
                                                                                            }
                                                                                        }" />
                                                                                <%--<BackgroundImage HorizontalPosition="left" ImageUrl="~/images/imgadmin/add.png" Repeat="NoRepeat"
                                                                                                                                    VerticalPosition="center" />--%>
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                        <td valign="top" style="width: 5px;">
                                                                        </td>
                                                                        <td valign="top">
                                                                            <dx:ASPxButton ID="btDongBangCaoNhat" runat="server" Text="Đóng" ClientInstanceName="btDongBangCaoNhat"
                                                                                AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="60px">
                                                                                <ClientSideEvents Click="function(s, e) {
                                                                                            gridBangCap.CancelEdit();
                                                                                        }" />
                                                                                <%--<BackgroundImage HorizontalPosition="left" ImageUrl="~/images/imgadmin/delete_16.png"
                                                                                                                                    Repeat="NoRepeat" VerticalPosition="center" />--%>
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </EditForm>
                                            <StatusBar>
                                                <div style="width: 65px; height: 30px; float: left; margin-left: 2px; padding-top: 3px;">
                                                    <dx:ASPxButton ID="btThemgridBangCaoNhat" runat="server" Text="Thêm" ClientInstanceName="btThemgridBangCaoNhat"
                                                        AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="60px">
                                                        <ClientSideEvents Click="function(s, e) {
                                                                gridBangCap.AddNewRow();
                                                            }" />
                                                        <%--<BackgroundImage HorizontalPosition="left" ImageUrl="~/images/imgadmin/add.png" Repeat="NoRepeat"
                                                                                                            VerticalPosition="center" />--%>
                                                    </dx:ASPxButton>
                                                </div>
                                                <div style="width: 65px; height: 30px; padding-top: 3px; float: left;">
                                                    <dx:ASPxButton ID="btSuagridBangCap" runat="server" Text="Sửa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="60px"
                                                        AutoPostBack="False">
                                                        <ClientSideEvents Click="function(s, e) {
                                                                gridBangCap.StartEditRow(gridBangCap.GetFocusedRowIndex());
                                                        }" />
                                                        <%--<BackgroundImage HorizontalPosition="left" ImageUrl="~/images/imgadmin/edit.png"
                                                                                                            Repeat="NoRepeat" VerticalPosition="center" />--%>
                                                    </dx:ASPxButton>
                                                </div>
                                                <div style="width: 65px; height: 30px; padding-top: 3px; float: left;">
                                                    <dx:ASPxButton ID="btDongGrBangCap" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="60px"
                                                        AutoPostBack="False">
                                                        <ClientSideEvents Click="function(s, e) {
                                                                if ( confirm('Bạn có muốn xóa ?') ) {gridBangCap.DeleteRow(gridBangCap.GetFocusedRowIndex());}
                                                        }" />
                                                        <%--<BackgroundImage HorizontalPosition="left" ImageUrl="~/images/imgadmin/delete_16.png"
                                                                                                            Repeat="NoRepeat" VerticalPosition="center" />--%>
                                                    </dx:ASPxButton>
                                                </div>
                                            </StatusBar>
                                        </Templates>
                                        <Settings ShowStatusBar="Visible" />
                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                          
                         
                            <tr>
                                <td colspan="6">
                                    <div style="width: 560px; height: 30px; float: right;">
                                      
                                        <div style="width: 85px; height: 30px; float: left; margin-left: 2px; padding-top: 3px;">
                                            <dx:ASPxButton ID="btLuuC" runat="server" Text="Lưu" ClientInstanceName="btLuuC"
                                                AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                                <ClientSideEvents Click="function(s, e) {                                       
                                        if(checkNull())
                                        {
                                             callbackPanelEmployees.PerformCallback('Luu');                                        
                                        }
                                    }" />
                                                <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                                    VerticalPosition="center" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 85px; height: 30px; padding-top: 3px; float: left;">
                                            <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Hủy" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                                AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
                                        callbackPanelEmployees.PerformCallback('Huy');
                                }" />
                                                <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/delete_16.png"
                                                    Repeat="NoRepeat" VerticalPosition="center" />
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PanelContent>
    </PanelCollection>
    <ClientSideEvents EndCallback="function(s,e){  

        if(callbackPanelEmployees.cpResultAddSuccess == true){
            alert('Lưu thông tin thành công !');
            callbackPanelEmployees.cpResultAddSuccess=false;            
            
        }
       
        if(callbackPanelEmployees.cpLengthMa == true){
            alert('Mã nhập không quá bốn kí tự !');            
            callbackPanelEmployees.cpLengthMa=false;
           
        }
    
        if(callbackPanelEmployees.cpMaTrung == true){
            alert('Mã nhân viên này đã tồn tại !');
            callbackPanelEmployees.cpMaTrung=false;
           
        }
      
        if(callbackPanelEmployees.cpResultTrungSoCMND==true){
            alert('Số CMND đã tồn tại');
            callbackPanelEmployees.cpResultTrungSoCMND=false;
           
        }
     
   } " />
</dx:ASPxCallbackPanel>

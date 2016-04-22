<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThongTinChung.ascx.cs"
    Inherits="VNPT.Modules.ThongTinNhanVien.ThongTinChung" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<table width="100%" cellpadding="2" cellspacing="0" border="0" style="background: #edf3f4;
    font-size: 11pt;">
    <tr>
        <td valign="top" style="width: 110px;" class="tieude">
            MANV
        </td>
        <td valign="top" style="width: 120px;">
            <dx:ASPxTextBox ID="txt_manv" runat="server" ClientInstanceName="txtMaNVK" Width="100%"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            </dx:ASPxTextBox>
        </td>
        <td style="width: 60px;" class="tieude">
            Họ tên
        </td>
        <td valign="top" style="width: 225px;">
            <dx:ASPxTextBox ID="txt_hoten" ClientInstanceName="txtHoTenK" runat="server" Width="100%"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            </dx:ASPxTextBox>
        </td>
        <td style="width: 110px;" class="tieude">
            Tên khác
        </td>
        <td valign="top" style="width: 165px;">
            <dx:ASPxTextBox ID="txt_tenkhac" ClientInstanceName="txtTenKhacK" runat="server"
                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            </dx:ASPxTextBox>
        </td>
        <td style="width: 80px;" class="tieude">
            Giới tính
        </td>
        <td style="width: 120px;">
            <dx:ASPxComboBox ID="cmb_gioitinh" runat="server" DropDownStyle="DropDown"
                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="-- Tất cả --" Value="2" Selected="true" />
                    <dx:ListEditItem Text="Nam" Value="1" />
                    <dx:ListEditItem Text="Nữ" Value="0" />
                </Items>               
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            CMND
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txtSoCMNDK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ClientInstanceName="txtSoCMNDK">               
            </dx:ASPxTextBox>
        </td>
        <td valign="top" colspan="2">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <dx:ASPxDateEdit NullTextStyle-Font-Bold="true" NullText="Ngày cấp" ID="dateNgayCapK"
                            ClientInstanceName="dateNgayCapK" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                            Width="100%">                           
                        </dx:ASPxDateEdit>
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmb_noicap" runat="server" IncrementalFilteringMode="Contains"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                           
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </td>
        <td colspan="2">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 94px;" class="tieude">
                        Dân tộc
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmb_dantoc" runat="server" 
                            IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                            
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </td>
        <td class="tieude">
            Tôn giáo
        </td>
        <td>
            <dx:ASPxComboBox ID="cmb_tongiao" runat="server"
                IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" DropDownStyle="DropDown"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            Nơi sinh
        </td>
        <td valign="top" colspan="5">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" style="width: 140px;">
                        <dx:ASPxTextBox NullText="  Xã/phường" ID="txt_noisinh_Xa" NullTextStyle-Font-Bold="true"
                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                           
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 282px;">
                        <dx:ASPxTextBox ID="txt_noisinh_huyen" NullText="Huyện/Thành phố" NullTextStyle-Font-Bold="true"
                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                           
                        </dx:ASPxTextBox>
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmb_noisinh" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                            
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </td>
        <td class="tieude">
            Ngày sinh
        </td>
        <td style="width: 100px;">
            <dx:ASPxDateEdit ID="date_ngaysinh" runat="server"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">                
            </dx:ASPxDateEdit>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            Quê quán
        </td>
        <td valign="top" colspan="7">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" style="width: 140px;">
                        <dx:ASPxTextBox ID="txt_quequan_xa" NullText=" Xã/phường" NullTextStyle-Font-Bold="true"
                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                           
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 282px;">
                        <dx:ASPxTextBox ID="txt_quequan_huyen" NullText="Huyện/thành phố" NullTextStyle-Font-Bold="true"
                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                           
                        </dx:ASPxTextBox>
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmb_quequan" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                            
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            Thường trú
        </td>
        <td valign="top" colspan="7">
            <dx:ASPxTextBox ID="txt_thuongtru" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
               CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            Chổ ở hiện nay
        </td>
        <td valign="top" colspan="7">
            <dx:ASPxTextBox ID="txt_choohiennay" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="8">
       <table width="100%" cellpadding="2" cellspacing="0" style="font-size:11pt;" border="0">        
     <tr>
        <td class="tieude" style="width:90px;">
            Nhóm máu
        </td>
        <td>
            <dx:ASPxComboBox ID="cmb_nhommau" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" DropDownStyle="DropDown"
                IncrementalFilteringMode="Contains" CssPostfix="Glass"
                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                ValueType="System.String" Width="100%">                
            </dx:ASPxComboBox>
        </td>
        <td valign="top" class="tieude">
            Hạng thương binh
        </td>
        <td valign="top">
            <dx:ASPxComboBox ID="cmb_hangthuongbinh" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxComboBox>
        </td>
        <td valign="top" class="tieude" style="width:120px;">
            Đối tượng CSXH
        </td>
        <td valign="top">
            <dx:ASPxComboBox ID="cmb_chinhsachxahoi" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxComboBox>
        </td>        
    </tr>
     <tr>
        <td class="tieude" style="width:90px;">
            Chiều cao
        </td>
        <td>
            <dx:ASPxTextBox ID="txt_chieucao" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
        <td valign="top" class="tieude">
            Câng nặng
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txt_cangnang" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxTextBox>
        </td>
        <td valign="top" class="tieude" style="width:120px;">
            Huyết áp
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txt_huyetap" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxTextBox>
        </td>        
    </tr>    
    <tr>
        <td valign="top" class="tieude">
            Số BHXH
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txt_bhxh" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                 CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxTextBox>
        </td>
        <td class="tieude">
            Ngày đóng BHXH
        </td>
        <td valign="top">
            <dx:ASPxDateEdit ID="dateNgayDongBHXHK" runat="server" ClientInstanceName="dateNgayDongBHXHK"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">               
            </dx:ASPxDateEdit>
        </td>
        <td class="tieude">Loại sức khoẻ</td>
        <td>
            <dx:ASPxComboBox ID="cmb_loaisuckhoe" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxComboBox>
        </td>
    </tr>
     <tr>
        <td class="tieude">
            BHYT
        </td>
        <td>
            <dx:ASPxTextBox ID="txtBHYTK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                ClientInstanceName="txtBHYTK" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
        <td class="tieude">
            Nơi khám BHYT
        </td>
        <td colspan="4">
            <dx:ASPxTextBox ID="txtNoiKhamBHYT" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                ClientInstanceName="txtNoiKhamBHYT" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
            </dx:ASPxTextBox>
        </td>
    </tr>     
    <tr>
        <td class="tieude" >
            Passport
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txtPassport" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ClientInstanceName="txtPassport">
            </dx:ASPxTextBox>
        </td>
        <td class="tieude" >
            Ngày cấp
        </td>
        <td>
            <dx:ASPxDateEdit NullTextStyle-Font-Bold="true" ID="datePassport" ClientInstanceName="datePassport"
                runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">                
            </dx:ASPxDateEdit>
        </td>
        <td class="tieude">
            Nơi cấp
        </td>
        <td valign="top" >
            <dx:ASPxComboBox ID="cmb_noicappassport" runat="server" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td class="tieude">
            Điện thoại
        </td>
        <td>
            <dx:ASPxTextBox ID="txt_dienthoai" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
        <td class="tieude" style="width: 120px;">
            Email
        </td>
        <td >
            <dx:ASPxTextBox ID="txt_email" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                 CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
        <td class="tieude" style="width:70px">
            MS Thuế
        </td>
        <td valign="top">
            <dx:ASPxTextBox ID="txt_masothue" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                
            </dx:ASPxTextBox>
        </td>
    </tr>
   
        </table>
        
        </td>
    </tr>
    <tr>
        <td colspan="8">
            <dx:ASPxButton ID = "bt_luu" runat="server" Text="Lưu"></dx:ASPxButton>
        </td>
    </tr>    
</table>

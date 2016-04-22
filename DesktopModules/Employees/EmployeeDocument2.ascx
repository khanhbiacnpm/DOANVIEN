<%@ Control Language="C#" Inherits="VNPT.Modules.Employees.EmployeeDocument" CodeFile="EmployeeDocument2.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<style type="text/css">
    .tieude{font-family:Tahoma; font-size:10pt;}
</style>
<script type="text/javascript">
    function SetUrl(id) {
        var IdDonVi = cmbSearch.GetValue();
        switch (id) {
            case 'hskt_1': document.getElementById('nhanvien').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=750&IdDonVi=' + IdDonVi; break;            
        }
    }
    function pageLoad() {
        SetUrl('hskt_1');
    }
    pageLoad();
</script>
<table border="1" width="100%">
    <tr>        
        <td style="background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/keep.gif');
            background-repeat: no-repeat; width:170px; border-right:1px solid #fafafa" align="center">
            &nbsp;&nbsp;<b>Tìm kiếm nhân viên</b>
        </td>
        <td>
            <dx:ASPxComboBox ID="cmbSearch" runat="server" ClientInstanceName="cmbSearch" Width="100%"
                EnableIncrementalFiltering="true" IncrementalFilteringDelay="3" IncrementalFilteringMode="Contains"
                DropDownWidth="900px" DropDownStyle="DropDown" ValueField="id" TextFormatString="MANV : {0} - Họ và tên : {1} - {2} - {3} - {4}"
                AutoPostBack="false" EnableCallbackMode="true" Height="30px" CallbackPageSize="30"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Style="border-left: none;
                border-bottom: none; border-top: none; border-right: none;">
                <Columns>
                    <dx:ListBoxColumn Caption="Mã NV" FieldName="empcode" Width="100px" />
                    <dx:ListBoxColumn Caption="Họ tên" FieldName="fullname" Width="150px" />
                    <dx:ListBoxColumn Caption="Chức vụ" FieldName="chucvu" Width="150px" />
                    <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />
                    <dx:ListBoxColumn Caption="Đơn vị chủ quản" FieldName="dvcha" Width="300px" />
                </Columns>
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                </LoadingPanelImage>
                <DropDownButton>
                    <Image>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                    </Image>
                </DropDownButton>
                <ClientSideEvents SelectedIndexChanged="function(s,e){                               
                 
                    }" />
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <div style="border: 1px solid #cccccc; text-align: center;">
                <dx:ASPxImage ID="imgEmp" runat="server" Height="350px">
                </dx:ASPxImage>
            </div>
        </td>
        <td>
            <table width="100%" cellpadding="1" cellspacing="1" border="0">
                <tr>
                    <td valign="top" style="width: 85px;" class="tieude">
                        MANV
                    </td>
                    <td valign="top" style="width: 100px;">
                        <dx:ASPxTextBox ID="txtMaNVK" runat="server" ClientInstanceName="txtMaNVK" Width="100%"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 60px;" class="tieude">
                        Họ tên
                    </td>
                    <td valign="top" style="width: 210px;">
                        <dx:ASPxTextBox ID="txtHoTenK" ClientInstanceName="txtHoTenK" runat="server" Width="100%"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 90px;" class="tieude">
                        Tên khác
                    </td>
                    <td valign="top" style="width: 260px;">
                        <dx:ASPxTextBox ID="txtTenKhacK" ClientInstanceName="txtTenKhacK" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 60px;" class="tieude">
                        Giới tính
                    </td>
                    <td style="width: 90px;">
                        <dx:ASPxComboBox ID="cmbGioiTinhK" ClientInstanceName="cmbGioiTinhK" runat="server"
                            IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <Items>
                                <dx:ListEditItem Selected="True" Text="Nam" Value="1" />
                                <dx:ListEditItem Text="Nữ" Value="0" />
                            </Items>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                </Image>
                            </DropDownButton>
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
                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="K">
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                                <RequiredField IsRequired="true" ErrorText="Nhập Số CMND" />
                            </ValidationSettings>
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
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                            <FooterStyle Spacing="17px" />
                                        </CalendarProperties>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbNoiCapK" runat="server" IncrementalFilteringMode="Contains"
                                        ClientInstanceName="cmbNoiCapK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 70px;" class="tieude">
                        Ngày sinh
                    </td>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 100px;">
                                    <dx:ASPxDateEdit ID="dateNgaySinhK" ClientInstanceName="dateNgaySinhK" runat="server"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" ShowShadow="False"
                                        SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100%">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                            <FooterStyle Spacing="17px" />
                                        </CalendarProperties>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td style="width: 70px;" class="tieude">
                                    &nbsp; Dân tộc
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbDanTocK" ClientInstanceName="cmbDanTocK" runat="server" IncrementalFilteringMode="Contains"
                                        Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                        LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="tieude">
                        Tôn giáo
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbTonGiaoK" ClientInstanceName="cmbTonGiaoK" runat="server"
                            IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                </Image>
                            </DropDownButton>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">
                        Nơi sinh
                    </td>
                    <td valign="top" colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top" style="width: 140px;">
                                    <dx:ASPxTextBox NullText="  Xã/phường" ID="txtNoiSinhXaK" NullTextStyle-Font-Bold="true"
                                        ClientInstanceName="txtNoiSinhXaK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 180px;">
                                    <dx:ASPxTextBox ID="txtNoiSinhHuyenK" NullText="Huyện/Thành phố" NullTextStyle-Font-Bold="true"
                                        ClientInstanceName="txtNoiSinhHuyenK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td valign="top">
                                    <dx:ASPxComboBox ID="cmbNoiSinhTinhK" runat="server" IncrementalFilteringMode="Contains"
                                        ClientInstanceName="cmbNoiSinhTinhK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="tieude">
                        Quê quán
                    </td>
                    <td valign="top" colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top" style="width: 140px;">
                                    <dx:ASPxTextBox ID="txtNguyenQuanXaK" NullText=" Xã/phường" NullTextStyle-Font-Bold="true"
                                        ClientInstanceName="txtNguyenQuanXaK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtNguyenQuanHuyenK" NullText="Huyện/thành phố" NullTextStyle-Font-Bold="true"
                                        ClientInstanceName="txtNguyenQuanHuyenK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top">
                        <dx:ASPxComboBox ID="cmbNguyenQuanTinhK" runat="server" IncrementalFilteringMode="Contains"
                            ClientInstanceName="cmbNguyenQuanTinhK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <DropDownButton>
                                <Image>
                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                </Image>
                            </DropDownButton>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="tieude">
                        Thường trú
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txtThuongTruK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            ClientInstanceName="txtThuongTruK" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td class="tieude">
                        Chổ ở hiện nay
                    </td>
                    <td valign="top" colspan="3">
                        <dx:ASPxTextBox ID="txtChoOHienNayK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            ClientInstanceName="txtChoOHienNayK" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                    <tr>                                                     
                        <td  class="tieude">
                                        Ngoại ngữ
                                    </td>
                                    <td colspan="3">
                                        <table width="100%" cellpadding="0" border="0">
                                    <tr>
                                    <td>                                                                        
                                    <dx:ASPxComboBox ID="cmbNgoaiNguK" runat="server" IncrementalFilteringMode="Contains"
                                            ClientInstanceName="cmbNgoaiNguK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                            </LoadingPanelImage>
                                            <DropDownButton>
                                                <Image>
                                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                </Image>
                                            </DropDownButton>
                                        </dx:ASPxComboBox>
                                    </td>
                                        <td class="tieude" style="width:65px;">
                                        &nbsp; Tin học
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cmbTinHocK" runat="server" IncrementalFilteringMode="Contains"
                                            ClientInstanceName="cmbTinHocK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                            </LoadingPanelImage>
                                            <DropDownButton>
                                                <Image>
                                                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                                </Image>
                                            </DropDownButton>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="tieude" style="width:65px;">
                                    &nbsp;Trình độ 
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbTDPhoThongK" runat="server" IncrementalFilteringMode="Contains"
                                        ClientInstanceName="cmbTDPhoThongK" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                                            </Image>
                                        </DropDownButton>
                                    </dx:ASPxComboBox>
                                </td>                                                                    
                                        </tr>
                                </table>
                                </td>
                                <td  class="tieude">
                                    Nhóm máu
                                </td>
                                        <td colspan="3">
                                        <table>
                                        <tr>                                                                            
                                <td>
                                    <dx:ASPxComboBox ID="cmbNhomMau" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        ClientInstanceName="cmbNhomMau" IncrementalFilteringMode="Contains" CssPostfix="Glass"
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
                                <td class="tieude" style="width:35px;">
                                    &nbsp;  ĐT
                                </td>
                                <td>                                                                                                                                   
                                    <dx:ASPxTextBox ID="txtDienThoaiK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        ClientInstanceName="txtDienThoaiK" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings>
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                        <td class="tieude" style="width:60px;" >
                                    &nbsp;   Email
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmailK" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                        ClientInstanceName="txtEmailK" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                        </tr>
                                        </table>
                                        </td> 
                    </tr>
            </table>
        </td>
    </tr>
    <tr>
       <td valign="top">
            <dx:ASPxNavBar ID="navTab" runat="server" Width="100%" LoadingPanelImagePosition="Top"
                ShowShadow="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">               
                <Groups>
                    <dx:NavBarGroup Name="thongtin" Text="Thông tin">
                        <Items>
                            <dx:NavBarItem Name="tt_1" Text="Thông tin chung">
                                <Image Url='~/images/t1.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_2" Text="Quá trình công tác">
                                <Image Url='~/images/quanhegiadinh.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_3" Text="Biến động lương">
                                <Image Url='~/images/daotao.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_3" Text="Quá trình đào tạo" >
                                <Image Url='~/images/chinhtri.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_4" Text="Bằng cấp" >
                                <Image Url='~/images/chinhtri.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_5" Text="Kiêm nhiệm">
                                <Image Url='~/images/kiemnhiem.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_6" Text="Đề tài - sáng kiến" >
                                <Image Url='~/images/khenthuong.png' Width="24" Height="24" />
                            </dx:NavBarItem>                            
                            <dx:NavBarItem name="tt_7" Text="Bảo hiểm xã hội" >
                                <Image Url='~/images/yte.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Text="Thông tin khác" Name="tt_18">
                                <Image Url='~/images/thongtinkhac.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="tt_19" Text="Biểu mẫu 2c">
                                <Image Url='~/images/soluoclylich.png' Width="24" Height="24" />
                            </dx:NavBarItem>                           
                        </Items>
                    </dx:NavBarGroup>
                </Groups>
            </dx:ASPxNavBar>
        </td>
        <td valign="top" style="min-height:500px; border:1px solid green;">
            <iframe id="nhanvien" src='' height="500px" width="100%" frameborder="0"></iframe>
        </td>
    </tr>
</table>
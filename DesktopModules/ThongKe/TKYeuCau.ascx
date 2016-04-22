<%@ Control Language="C#" Inherits="VNPT.Modules.ThongKe.TKYeuCau" CodeFile="TKYeuCau.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<style type="text/css">
    .Grid
    {
        border-style: dotted;
        border-width: 0px;
        border-bottom-color: #bcbcbc;
        font-size: 10px;
    }
    .Grid a
    {
        color: #0066b3;
    }
</style>
<center style='min-height: 400px;'>        
                <table width="100%" cellpadding="5" cellspacing="0" style="border: Solid 1px #e7e7e7;
                    background: #dbeafe" align="center" border="0">                    
                    <tr>
                        <td style="width: 80px">
                            <font size="2" color="#023971">Đơn vị :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_donvi" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>                            
                        </td>
                        <td style="width: 80px">
                            <font size="2" color="#023971">Quê quán :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_quequan" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td style="width: 120px">
                            <font size="2" color="#023971">Hạng thương binh :</font>
                        </td> 
                        <td>
                            <dx:ASPxComboBox ID="cmb_thuongbinh" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>                                      
                    </tr>
                    <tr>
                        <td><font size="2" color="#023971">Chức vụ :</font></td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_chucvu" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <font size="2" color="#023971">Dân tộc :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_dantoc" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <font size="2" color="#023971">Chính sách Xã Hội :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_csxahoi" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="2" color="#023971">Trình độ :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_trinhdo" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <font size="2" color="#023971">Giới tính :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_gioitinh" runat="server" Width="100%" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <Items>
                                    <dx:ListEditItem Text="-- Chọn tất --" Value="2" Selected="true" />
                                    <dx:ListEditItem Text="Nam" Value="1" />
                                    <dx:ListEditItem Text="Nữ" Value="0" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <font size="2" color="#023971">Lý luận chính trị :</font>
                        </td>                        
                        <td>
                            <dx:ASPxComboBox ID="cmb_llchinhtri" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>                       
                    </tr>                   
                    <tr>
                        <td valign="top">
                            <font size="2" color="#023971">Loại HĐ :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmb_loaihopdong" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td><font size="2" color="#023971">CV Đảng:</font></td>
                        <td valign="top">
                            <dx:ASPxComboBox ID="cbbCVDang" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <font size="2" color="#023971">CV Đoàn thể :</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cbbCVDoanThe" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:140px;"><font size="2" color="#023971">Thang lương ngạch bậc:</font></td>
                        <td>
                            <dx:ASPxComboBox ID="cbbLuongNgachBac" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td style="width:140px;"><font size="2" color="#023971">Thang lương công việc:</font></td>
                        <td>
                            <dx:ASPxComboBox ID="cbbLuongCV" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                        <td style="width:140px;"><font size="2" color="#023971">Nhóm chuyên ngành:</font></td>
                        <td>
                            <dx:ASPxComboBox ID="cbbNhomCN" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td><font size="2" color="#023971">Năm:</font></td>
                        <td>
                            <dx:ASPxTextBox ID="txtNamSinh" runat="server" Width="100px"
                                CssFilePath="~/App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" Spacing="0" 
                                SpriteCssFilePath="~/App_Themes/DevEx/{0}/sprite.css">
                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="G">
                                    <RegularExpression ErrorText="Yêu cầu nhập số" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td colspan="4">
                            <table>
                                <tr>
                                    
                                    <td align="left">
                                        <dx:ASPxCheckBox runat="server" ID="chkDang" Text="Đảng viên" Width="100px"></dx:ASPxCheckBox>
                                    </td>
                                    <td align="left">
                                        <dx:ASPxCheckBox runat="server" ID="chkNhapNgu" Text="Đã nhập ngũ" Width="100px"></dx:ASPxCheckBox>                                    
                                    </td>
                                    <td align="left">
                                        <dx:ASPxCheckBox runat="server" ID="chkHoChieu" Text="Có hộ chiếu" Width="100px"></dx:ASPxCheckBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div style="float:left; width:151px;">
                                <dx:ASPxButton ID="btThongKe" ClientInstanceName="btThongKe" runat="server" Text="Thống kê" AutoPostBack="true" OnClick="btThongKe_Click"
                                    Theme="Glass" Font-Size="12px"
                                    Width="150px">
                                    <Image Url="../../images/imgadmin/thongke.png"  Height="20px"></Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="float:left; margin-left:5px; width:151px;">
                                <dx:ASPxButton ID="btExcel" runat="server" Text="Xuất Excel" 
                                    AutoPostBack="true" OnClick="btExcel_Click"
                                    Theme="Glass" Font-Size="12px"
                                    Width="150px">
                                    <Image Url="../../images/imgadmin/Excel.png"  Height="20px"></Image>                                    
                                </dx:ASPxButton>
                            </div>                            
                            <div style="float:left; margin-left:5px; width:151px;">
                                <dx:ASPxButton ID = "bt_hienthicot" runat="server" AutoPostBack="false" Text="Chọn cột hiển thị"
                                Theme="Glass" Font-Size="12px">
                                    <ClientSideEvents Click="function(s,e){
                                        pcHienThiCot.Show();
                                    }" />
                                    <Image Url="../../images/Menu/duyet.gif" Height="20px" />
                                </dx:ASPxButton>                                
                            </div>
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan="6">
                            <dx:ASPxGridView ID="gridThongKe" runat="server" AutoGenerateColumns="false" 
                                OnPageIndexChanged="gridThongKe_PageIndexChanged" 
                                Theme="Glass" Font-Size="12px">
                                <Columns>
                                    <dx:GridViewDataColumn FieldName="stt" Caption="STT" Width="25px" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                        <DataItemTemplate>
                                            <%# Container.ItemIndex + 1 %>
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" />
                                    </dx:GridViewDataColumn> 
                                    <dx:GridViewDataColumn FieldName="donvi" Caption="Đơn vị" Width="110px" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>                                   
                                    <dx:GridViewDataColumn FieldName="hoten" Caption="Họ tên" Width="110px" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">                                    
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataTextColumn FieldName="ngaysinh" Caption="Ngày sinh" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />                                                                     
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataColumn FieldName="noisinh" Caption="Nơi sinh" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="gioitinh" Caption="Giới tính" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                        <CellStyle HorizontalAlign="Center" />                                                                            
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="cmnd" Caption="Số chứng minh" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                        <CellStyle HorizontalAlign="Center" />                                                                            
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="dantoc" Caption="Dân tộc" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                        <CellStyle HorizontalAlign="Center" />                                     
                                    </dx:GridViewDataColumn>                                    
                                    <dx:GridViewDataColumn FieldName="quequan" Caption="Quê quán" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="trinhdo" Caption="Trình độ" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="chucvu" Caption="Chức vụ" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="loaihopdong" Caption="Loại HĐ" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="sobhxh" Caption="Số BHXH" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn> 
                                    <dx:GridViewDataColumn FieldName="ngaybhxh" Caption="Ngày BHXH" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn> 
                                    <dx:GridViewDataColumn FieldName="ngayketnapdang" Caption="Ngày kết nạp đảng" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="ngaychinhthuc" Caption="Ngày chính thức" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn> 
                                    <dx:GridViewDataColumn FieldName="noiketnapdang" Caption="Nơi kết nạp" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>                                                                     
                                     <dx:GridViewDataColumn FieldName="dangboketnap" Caption="Đảng bộ kết nạp" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn> 
                                    <dx:GridViewDataColumn FieldName="sothedang" Caption="Số thẻ đảng" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="ngaycapthedang" Caption="Ngày cấp thẻ đảng" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="quanhamcaonhat" Caption="Quân hàm cao nhất" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Passport" Caption="Số passport" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="ngaycappassport" Caption="Ngày cấp passport" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="hangthuongbinh" Caption="Hạng thương binh" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="csxahoi" Caption="Chính sách XH" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="lyluachinhtri" Caption="Lý luận CT" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="dang" Caption="CV Đảng" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="doanthe" Caption="CV Đoàn thể" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="nhomchuyennganh" Caption="Nhóm chuyên ngành" Visible="false" ToolTip="Click giữ chuột trái để kéo thả sắp xếp cột theo ý muốn!">
                                    </dx:GridViewDataColumn>
                                </Columns>
                                <SettingsLoadingPanel ImagePosition="Top" />
                                <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                                    </LoadingPanelOnStatusBar>
                                    <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                                    </LoadingPanel>
                                </Images>
                                <ImagesEditors>
                                    <DropDownEditDropDown>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                            PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
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
                                    <LoadingPanel ImageSpacing="8px">
                                    </LoadingPanel>
                                </Styles>
                                <StylesEditors>
                                    <CalendarHeader Spacing="1px">
                                    </CalendarHeader>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <SettingsPager PageSize="20" Mode="ShowPager"></SettingsPager>
                            </dx:ASPxGridView>
                            <%--<dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridThongKe">                                
                            </dx:ASPxGridViewExporter>--%>
                        </td>
                    </tr>
                </table>
    
    <dx:ASPxPopupControl ID="pcHienThiCot" runat="server" CloseAction="CloseButton" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" ClientInstanceName="pcHienThiCot"
        HeaderText="Chọn cột cần hiển thị" AllowDragging="True" PopupAnimationType="None" EnableViewState="False"
        ShowFooter="true"
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <ClientSideEvents CloseUp="function(s,e){
            btThongKe.DoClick();
        }"/>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
               <dx:ASPxGridView ID = "grdCotHienThi" runat="server" ClientInstanceName="grdCotHienThi"               
                AutoGenerateColumns="false" KeyFieldName="Id" Width="500px"
               CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" OnCustomJSProperties="grdCotHienThi_CustomJSProperties">                    
                    <Columns>                        
                        <dx:GridViewDataColumn FieldName="ten" Caption="#">
                           <DataItemTemplate>
                                <dx:ASPxCheckBox ID = "cbox" runat="server"></dx:ASPxCheckBox>
                           </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="tenht" Caption="Tên cột" Width="350px" />
                        <dx:GridViewDataColumn FieldName="tt1" Caption="Thứ tự" Width="90px">
                            <DataItemTemplate>
                                <dx:ASPxTextBox runat="server" ID="txtTT1" Text='<%# Eval("tt1") %>'></dx:ASPxTextBox>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ten2" Caption="#">
                           <DataItemTemplate>
                                <dx:ASPxCheckBox ID = "cbox2" runat="server"></dx:ASPxCheckBox>
                           </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="tenht2" Caption="Tên cột" Width="350px" />
                        <dx:GridViewDataColumn FieldName="tt2" Caption="Thứ tự" Width="90px">
                            <DataItemTemplate>
                                <dx:ASPxTextBox runat="server" ID="txtTT2" Text='<%# Eval("tt2") %>'></dx:ASPxTextBox>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                    <SettingsPager Mode="ShowAllRecords" />                    

<Styles CssPostfix="Aqua" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"></Styles>
               </dx:ASPxGridView>
            </dx:PopupControlContentControl>            
        </ContentCollection>
        <FooterTemplate>
            <dx:ASPxButton ID = "btdong_popup" runat="server" Text="Đóng" AutoPostBack="false" Width="100%"
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            <ClientSideEvents Click="function(s,e)
            {
                pcHienThiCot.Hide();
            }" />            
            </dx:ASPxButton>
        </FooterTemplate>
    </dx:ASPxPopupControl>    
</center>
<dx:ASPxGridViewExporter ID="gridExport" runat="server"></dx:ASPxGridViewExporter>
<script type="text/javascript">
    var initialCHT = false;
    function khoitaocothienthi() {
        if (initialCHT == false) {
            initialCHT = true;
            var elements = aspxGetControlCollection().elements;
            for (var i = 0; i < 20; i++) {
                var chkbk1 = grdCotHienThi.name + '_cell' + i + '_0_cbox';
                var chkbk2 = grdCotHienThi.name + '_cell' + i + '_3_cbox2';
                if (grdCotHienThi.cpTenT[i] == "hoten" ||
                    grdCotHienThi.cpTenT[i] == "ngaysinh" ||
                    grdCotHienThi.cpTenT[i] == "noisinh" ||
                    grdCotHienThi.cpTenT[i] == "gioitinh" ||
                    grdCotHienThi.cpTenT[i] == "cmnd" ||
                    grdCotHienThi.cpTenT[i] == "dantoc" ||
                    grdCotHienThi.cpTenT[i] == "quequan" ||
                    grdCotHienThi.cpTenT[i] == "trinhdo" ||
                    grdCotHienThi.cpTenT[i] == "chucvu" ||
                    grdCotHienThi.cpTenT[i] == "loaihopdong" ||
                    grdCotHienThi.cpTenT[i] == "sobhxh" ||
                    grdCotHienThi.cpTenT[i] == "ngaybhxh") {
                    elements[chkbk1].SetChecked(true);
                }
                if (grdCotHienThi.cpTenP[i] == "donvi") {
                    elements[chkbk2].SetChecked(true);
                }
            }
        }
    }

</script>
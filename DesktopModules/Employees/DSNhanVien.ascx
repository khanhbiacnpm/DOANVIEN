<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DSNhanVien.ascx.cs" Inherits="VNPT.Modules.Employees.DSNhanVien" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<table cellpadding="1" cellspacing="1" style="font-family:Verdana; font-size:10pt; width:100%;">    
    <tr>
        <td valign="top">
            <dx:ASPxButton ID="btnPdfExport" runat="server" Text="Export to PDF" UseSubmitBehavior="False"
                    OnClick="btnPdfExport_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dx:ASPxGridView ID="gridThanhVien" runat="server" Width="100%" 
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                CssPostfix="Aqua" AutoGenerateColumns="False" KeyFieldName="id"  
                ClientInstanceName="gridThanhVien"
                OnHtmlRowCreated ="gridThanhVien_htmlRowCreated"
                OnHtmlDataCellPrepared="gridThanhVien_HtmlDataCellPrepared" >                
                <Settings ShowFooter="true" ShowFilterBar="Visible" />                
                <SettingsText FilterBarCreateFilter="Lọc theo điều kiện" 
                    FilterBarClear="Hủy điều kiện" 
                    FilterControlPopupCaption="Lọc theo điều kiện" />
                    <SettingsDetail ExportMode="All" />
                <SettingsLoadingPanel ImagePosition="Top" />                                
                <Columns>                    
                    <dx:GridViewDataTextColumn FieldName="id" Caption ="STT" width="30px" VisibleIndex="0">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_STT" runat="server">
                            </dx:ASPxLabel>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="empcode" Caption="Mã nhân viên" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="fullname" Caption="Họ tên nhân viên" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="unitid" Caption="Đơn vị công tác" VisibleIndex="3">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_DonVi" runat="server">
                            </dx:ASPxLabel>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idLoaiHopDong" Caption="Loại hợp đồng" VisibleIndex="4">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_LoaiHopDong" runat="server">
                            </dx:ASPxLabel>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>                                
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
                    <LoadingPanel ImageSpacing="8px">
                    </LoadingPanel>
                </Styles>
                <StylesEditors>
                    <CalendarHeader Spacing="1px">
                    </CalendarHeader>
                </StylesEditors>
                <SettingsPager>
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
                <SettingsPager PageSize="20">
                </SettingsPager>                
            </dx:ASPxGridView>
           
        </td>
    </tr>
</table>

<%@ Control Language="C#" Inherits="DotNetNuke.Modules.NghiViec.DanhSachNghiViec" CodeFile="DanhSachNghiViec.ascx.cs"%>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
    <style type="text/css">
    .dxnbControl_Glass2
    {
        color: #000000;
        font: 9pt Tahoma;
    }
    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
    .dxnbGroupHeader_Glass
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 3px;
    }
    .dxnbGroupHeader_Glass12
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 2px 3px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
             .dxbButton_Glass div.dxb {
    border: 0 none;
    padding: 1px 2px 1px 2px;
}
</style>

<dx:ASPxGridViewExporter ID="expoter" runat="server">
</dx:ASPxGridViewExporter>
<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0">
    <tr>
        <td valign="top" style="width: 255px;" class="dxnbGroupHeader_Glass12">
            <dx:ASPxComboBox ID="cmbDonVi" ClientInstanceName="cmbDonVi" runat="server" Width="100%"
                IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            </dx:ASPxComboBox>
        </td>
        <td valign="top" style="width: 105px;" class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="btXemThongKe" runat="server" Width="100px" Text="Hiển thị" Height="23px"
                AutoPostBack="false" TextSpacing="2px" Theme="Glass" Font-Size="12px">
                <Image Url="~/images/imgadmin/reload.png">
                </Image>
                <ClientSideEvents Click="function(s,e){
                        gridDSNVNghiViec.PerformCallback();
                    }
                    " />
            </dx:ASPxButton>
        </td>
        <td valign="top" align="left" class="dxnbGroupHeader_Glass12">
            <dx:ASPxButton ID="btXuatExcel" runat="server" Width="110px" Height="23px" Text="Xuất Excel"
                OnClick="btXuatExcel_Click" UseSubmitBehavior="false" Theme="Glass" Font-Size="12px" TextSpacing="2px">
                <Image Url="../../images/imgadmin/Excel.png">
                </Image>
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding: 3px;">
            <dx:ASPxGridView ID="gridDSNVNghiViec" runat="server" ClientInstanceName="gridDSNVNghiViec"
                Width="99%" Theme="Glass" Font-Size="12px"
                KeyFieldName="Id" OnCustomCallback="gridDSNVNghiViec_CallBack">
                <Settings ShowVerticalScrollBar="true" VerticalScrollableHeight="400" />
                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataColumn Caption="STT" Width="30px" VisibleIndex="0">
                        <DataItemTemplate>
                            <%# Container.ItemIndex + 1 %></DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn Caption="Họ và Tên" FieldName="hoTen" VisibleIndex="1"
                        HeaderStyle-HorizontalAlign="Center" Width="150px">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Chức vụ" FieldName="chucVu" VisibleIndex="2"
                        HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="120px">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Đơn vị công tác trước lúc nghỉ" FieldName="donVi"
                        VisibleIndex="3">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Lý do nghỉ việc" FieldName="lyDoNghi" VisibleIndex="4">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="ngày nghỉ" FieldName="denngay" VisibleIndex="5"
                        Width="100px">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                </Columns>
                <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                    <LoadingPanel ImageSpacing="8px">
                    </LoadingPanel>
                    <Header Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle">
                    </Header>
                </Styles>
                <SettingsLoadingPanel ImagePosition="Top" />
                <ImagesFilterControl>
                    <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <StylesEditors>
                    <CalendarHeader Spacing="1px">
                    </CalendarHeader>
                    <ProgressBar Height="25px">
                    </ProgressBar>
                </StylesEditors>
                <ImagesEditors>
                    <DropDownEditDropDown>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                    </DropDownEditDropDown>
                    <SpinEditIncrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Glass"
                            PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Glass" />
                    </SpinEditIncrement>
                    <SpinEditDecrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Glass"
                            PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Glass" />
                    </SpinEditDecrement>
                    <SpinEditLargeIncrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Glass"
                            PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Glass" />
                    </SpinEditLargeIncrement>
                    <SpinEditLargeDecrement>
                        <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Glass"
                            PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Glass" />
                    </SpinEditLargeDecrement>
                </ImagesEditors>
            </dx:ASPxGridView>
       
        </td>
    </tr>
</table>

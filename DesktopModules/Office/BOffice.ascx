<%@ Control Language="C#" Inherits="Philip.Modules.Office.BOffice" CodeFile="BOffice.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<script type="text/javascript">
    function OnGridFocusedRowChanged() {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'id', OnGetRowValues);
    }
    function OnGetRowValues(values) {
        gridQLNN_NL.PerformCallback(values);

    }
    function save() {

        if (cmbNhomChucDanh.GetSelectedIndex() == -1 || cmbNhomChucDanh.GetValue() == 0) {

            cmbNhomChucDanh.SetFocus();
            alert('Xin vui lòng chọn nhóm chức danh !');
            return false;
        }
        else if (txtName.GetText() == "") {

            txtName.SetFocus();
            alert('Xin vui lòng nhập tên chức danh !');
            return false;
        }
        else if (cmbMoiTruongLamViec.GetSelectedIndex() == -1 || cmbMoiTruongLamViec.GetValue() == -1) {

            cmbMoiTruongLamViec.SetFocus();
            alert('Xin vui lòng chọn  môi trường làm việc !');
            return false;
        }
        else { cbpnTintuc.PerformCallback('Save' + hdData.Get("key")); }
       
    
    }
    function themmoi() {

        hdData.Set("key", -1);
        document.getElementById('dnn_ctr1238_BOffice_divList').style.display = 'none';
        document.getElementById('dnn_ctr1238_BOffice_divChiTiet').style.display = 'block';
        cbpnTintuc.PerformCallback('New');
    }
    function chinhsua(id) {
        
        hdData.Set("key", id);
        document.getElementById('dnn_ctr1238_BOffice_divList').style.display = 'none';
        document.getElementById('dnn_ctr1238_BOffice_divChiTiet').style.display = 'block';
        cbpnTintuc.PerformCallback('Edit'+id);
    }
    function xoa(id) {
        if (confirm('Bạn có muốn xóa ?')) {
            cbpnTintuc.PerformCallback('Delete' + id);
         }
      
    }
    function dong()
    {
    document.getElementById('dnn_ctr1238_BOffice_divList').style.display = 'block';
        document.getElementById('dnn_ctr1238_BOffice_divChiTiet').style.display = 'none';
    }

    $(document).ready(function () {
        document.getElementById('dnn_ctr1238_BOffice_divList').style.display = 'block';
        document.getElementById('dnn_ctr1238_BOffice_divChiTiet').style.display = 'none';
    });

</script>


<div id="divList" style="text-align: left;" runat="server">

        <dx:ASPxGridView ID="grid" runat="server" Width="100%" Theme="Glass" Font-Size="12px" KeyFieldName="id" Caption="Quản trị chức danh B" 
            ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback">
            <SettingsBehavior AllowFocusedRow="false" ConfirmDelete="true" />
            
            <Columns>
                <dx:GridViewDataTextColumn Caption="#" Width="30px" VisibleIndex="0">
                    <DataItemTemplate>
                        <a onclick="themmoi()">
                            <img style="width: 16px; height: 16px;" src="<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/add.png" /></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="#" Width="30px" VisibleIndex="1">
                    <DataItemTemplate>
                        <a onclick="chinhsua(<%# Eval("id") %>)">
                            <img style="width: 16px; height: 16px;" src="<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/edit_f2.png" /></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="#" Width="30px" VisibleIndex="2">
                    <DataItemTemplate>
                        <a onclick="xoa(<%# Eval("id") %>)">
                            <img style="width: 16px; height: 16px;" src="<%# DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/cancel_f2.png" /></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
                
                <dx:GridViewDataColumn FieldName="Code" Caption="Mã chức danh" VisibleIndex="5" />
                <dx:GridViewDataColumn FieldName="Name" Caption="Chức danh" VisibleIndex="6" />
                <dx:GridViewDataColumn FieldName="DocHai" Caption="MT làm việc" VisibleIndex="7">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lbl_DocHai" runat="server">
                        </dx:ASPxLabel>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="MaNhom" Caption="Mã nhóm" VisibleIndex="3">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="tennhom" Caption="Nhóm chức danh" VisibleIndex="4">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Note" Caption="Ghi chú" Visible="false" VisibleIndex="4" />
            </Columns>
            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                <Header Font-Bold="True">
                </Header>
                <HeaderPanel Font-Bold="True">
                </HeaderPanel>
                <LoadingPanel ImageSpacing="1px">
                </LoadingPanel>
                <TitlePanel Font-Bold="True">
                </TitlePanel>
            </Styles>
            <Settings ShowStatusBar="Visible" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
            <SettingsText PopupEditFormCaption="Hiệu chỉnh chức danh" ConfirmDelete="Bạn có muốn xóa" />
            <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="Above"
                PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="800px" PopupEditFormHeight="400" />
            <SettingsLoadingPanel ImagePosition="Top" />
            <SettingsPager PageSize="1000">
                <Summary AllPagesText="{0} - {1} " Visible="False" />
            </SettingsPager>
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
</div>


            <div id="divChiTiet" runat="server">
<dx:ASPxCallbackPanel ID="cbpnTintuc" ClientInstanceName="cbpnTintuc" runat="server"
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" OnCallback="cbpnTintuc_Callback">
    <ClientSideEvents EndCallback="function(s,e)
    {
   
    if(cbpnTintuc.cpResult==1)
    {
        dong();
        delete cbpnTintuc.cpResult;
        grid.PerformCallback();
        
        }
    }" />
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">

           
                            <table width="800px" cellpadding="2" cellspacing="0" style="font-family: Times New Roman;
                                font-size: 11pt;">
                                <tr>
                                    <td valign="top" style="width: 180px;">
                                        Nhóm chức danh 
                                        
<dx:ASPxHiddenField ID="hdData" runat="server" ClientInstanceName="hdData">
</dx:ASPxHiddenField>
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmbNhomChucDanh" runat="server" ClientInstanceName="cmbNhomChucDanh"
                                            IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        Nhóm chức danh
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtCode" ClientInstanceName="txtCode" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Chức danh
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox  ID="txtName" runat="server"  ClientInstanceName="txtName"
                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                           
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Môi trường làm việc
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxComboBox ID="cmbMoiTruongLamViec" runat="server"  ClientInstanceName="cmbMoiTruongLamViec"
                                            IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <Items>
                                                <dx:ListEditItem Value="0" Text="Bình thường" Selected="true" />
                                                <dx:ListEditItem Value="1" Text="Độc hại" />
                                                <dx:ListEditItem Value="2" Text="Đặc biệt độc hại" />
                                            </Items>
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
                                    <td valign="top">
                                        Ghi chú
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxMemo ID="memoGhiChuChucDanh" runat="server" Height="40" Width="100%" 
                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                               
                              <tr>
                        <td></td>
                        <td>
                            <table width="20%" cellpadding="2">
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnSave" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="120px">
                                            <ClientSideEvents Click="function(s,e)
                                {
                                    
                                        save();
                                }" />
                                <Image Url="~/images/imgadmin/save_16.png" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <dx:ASPxButton ID="btnDong" runat="server" Text="Đóng" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="120px">
                                            <ClientSideEvents Click="function(s,e)
                                {
                                    dong();
                                }" />
                                <Image Url="~/images/imgadmin/delete_16.png" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                            </table>
                       
           
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
 </div>

<%@ Control Language="C#" Inherits="Philip.Modules.doanThe.dangVien" CodeFile="ToChucDang.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<table cellpadding="1" cellspacing="1" width="100%">
    <tr>
        <td valign="top">
             <dx:ASPxGridView ID="gridToChucDang" runat="server" AutoGenerateColumns="False" 
                ClientInstanceName="gridToChucDang"
                Theme="Glass" Font-Size="12px" KeyFieldName="id"
                OnHtmlDataCellPrepared="gridToChucDang_HtmlDataCellPrepared"
                OnCustomCallback="gridToChucDang_Callback" Width="100%">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh tổ chức Đảng" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <Settings ShowStatusBar="Visible" />                
                <ClientSideEvents RowDblClick="function(s, e) {
                    poupControl_ToChucDang.Show();
                    var idx = gridToChucDang.GetFocusedRowIndex();
                    gridToChucDang.GetRowValues(idx, 'id', function(id){
                        callBackPanel_gridDangVienControl.PerformCallback('Them'+id);                                            
                    });
                }" />
                <Columns>                    
                    <dx:GridViewDataColumn FieldName="id" VisibleIndex="1" Caption="Tên tổ chức Đảng">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_tenToChuc" runat="server"></dx:ASPxLabel>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="left">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="id" Caption="Số QĐ" VisibleIndex="2">
                        <DataItemTemplate>                            
                            <dx:ASPxHyperLink ID="hyperDowload" runat="server" Target="_blank"></dx:ASPxHyperLink>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="id" Caption="Thời gian QĐ" VisibleIndex="3">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_ngay" runat="server"></dx:ASPxLabel>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="id" Caption="Ghi chú" VisibleIndex="4">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="lbl_ghiChu" runat="server"></dx:ASPxLabel>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Left"></CellStyle>
                    </dx:GridViewDataColumn>                    
                </Columns>
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
                    <Header Font-Bold="True">
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
                    <StatusBar>
                        <div>
                            <div style="width: 90px; height: 25px; float: left;">                                
                                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                    AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {                                        
                                        poupControl_ThemToChucDangThem.Show();
                                    }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        poupControl_ToChucDang.Show();
                                        var idx = gridToChucDang.GetFocusedRowIndex();
                                        gridToChucDang.GetRowValues(idx, 'id', function(id){
                                            callBackPanel_gridDangVienControl.PerformCallback('Them'+id);                                            
                                        });                                        
                                    }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        if (confirm('Bạn có muốn xóa mẫu tin này không?')) {
                                            var idx = gridToChucDang.GetFocusedRowIndex();
                                            gridToChucDang.GetRowValues(idx, 'id', function(id){
                                                callbackPanel_ThemToChuc.PerformCallback('Xoa'+id);                                            
                                            }); 
                                        }                                      
                                                                               
                                    }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>
                </Templates>                
            </dx:ASPxGridView>
        </td>
    </tr>    
</table>

<dx:ASPxPopupControl ID="poupControl_ToChucDang" runat="server" 
    ClientInstanceName="poupControl_ToChucDang"  HeaderText=""
    AllowDragging="True" AllowResize="True"
    CloseAction="CloseButton"
    EnableViewState="False" PopupElementID="popupArea" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="Above" Width="500px"
    Height="400px" EnableHierarchyRecreation="True" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
        <Paddings PaddingLeft="10" PaddingRight="10" PaddingTop="0" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxCallbackPanel ID ="callBackPanel_gridDangVienControl" runat="server"
            ClientInstanceName="callBackPanel_gridDangVienControl"
            OnCallback="callBackPanel_gridDangVienControl_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                         <dx:ASPxGridView ID="gridDangVienControl" runat="server" AutoGenerateColumns="False" 
                            ClientInstanceName="gridDangVienControl"
                            Theme="Glass" Font-Size="12px" KeyFieldName="id"                 
                            OnRowDeleting="gridDangVienControl_RowDeleting"
                            OnRowInserting="gridDangVienControl_RowInserting" 
                            OnRowUpdating="gridDangVienControl_RowUpdating"
                            OnHtmlDataCellPrepared="gridDangVienControl_htmDataCell" Width="100%">
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>                            
                            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                                PopupEditFormVerticalAlign="Above" PopupEditFormModal="True" PopupEditFormWidth="500px" />
                            <SettingsText ConfirmDelete="Bạn có muốn xóa" PopupEditFormCaption="Hiệu chỉnh tổ chức Đảng" />
                            <SettingsLoadingPanel ImagePosition="Top" />
                            <Settings ShowVerticalScrollBar="true" VerticalScrollableHeight="350" ShowStatusBar="Visible" />                
                            <ClientSideEvents RowDblClick="function(s, e) {
                                gridDangVienControl.StartEditRow(e.visibleIndex);
                            }" />
                            <Columns>
                                <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false">                                    
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="tentochucdang" Caption="Tên tổ chức Đảng" VisibleIndex="1">                                    
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="soqd" Caption="Số QĐ" VisibleIndex="2">
                                    <DataItemTemplate>                            
                                        <dx:ASPxHyperLink ID="hyperDowload" runat="server" Target="_blank"></dx:ASPxHyperLink>
                                    </DataItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="ngay" Caption="Thời gian QĐ" VisibleIndex="3">                                    
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="ghichu" Caption="Ghi chú" VisibleIndex="4">                                    
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <CellStyle HorizontalAlign="Left"></CellStyle>
                                </dx:GridViewDataColumn>                    
                                <dx:GridViewDataColumn FieldName="file" Visible="False" VisibleIndex="5">                                    
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="idtochucdangchuan" Visible="False" VisibleIndex="6">                                    
                                </dx:GridViewDataColumn>
                            </Columns>
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
                                <Header Font-Bold="True">
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
                                        <table cellpadding="1" cellspacing="1" width="500px" style="font-size: 9pt; font-family: Verdana;">                                
                                            <tr>
                                                <td valign="top" style="width:100px;">
                                                    Tên tổ chức
                                                </td>
                                                <td valign="top">                                                                                           
                                                    <dx:ASPxTextBox ID="txtTenToChuc" runat="server" Text='<%# Eval("tentochucdang") %>'                                       
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Số QĐ
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="txtSoQD" runat="server" Text='<%# Eval("soqd") %>'
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Ngày QĐ
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxDateEdit ID="dateNgayQD" runat="server" 
                                                        OnLoad="dateNgayQD_Load" Width="100%"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>                                
                                            <tr>
                                                <td valign="top">
                                                    Ghi chú
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxMemo ID="memoGhiChu" runat="server" Text='<%# Eval("ghichu") %>' 
                                                        Height="40px" Width="100%"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                            
                                                    </dx:ASPxMemo>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    File đính kèm
                                                </td>
                                                <td valign="top">
                                                    <dx:ASPxTextBox ID="txtFileKem" runat="server" OnLoad="txtFileKem_Load" Visible="false" />                                       
                                                    <dx:ASPxUploadControl ID="uploadFileDinhKem" runat="server" 
                                                        ClientInstanceName="uploadFileDinhKem" 
                                                        OnFileUploadComplete="uploadFileDinhKem_Load"
                                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                    </dx:ASPxUploadControl>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                </td>
                                                <td style="padding-top: 7px;">
                                                    <div style="width: 100px; height: 25px; float: left;">
                                                        <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                                            <Image Url="../../images/imgadmin/save_16.png">
                                                            </Image>
                                                            <ClientSideEvents Click="function(s,e){
                                                                uploadFileDinhKem.UploadFile();                                                    
                                                                gridDangVienControl.UpdateEdit();
                                                                }" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div style="width: 100px; height: 25px; float: left;">
                                                        <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" Theme="Glass" Font-Size="12px" Width="81px"
                                                            AutoPostBack="False">
                                                            <Image Url="../../images/imgadmin/delete_16.png">
                                                            </Image>
                                                            <ClientSideEvents Click="function(s,e){
                                                                gridDangVienControl.CancelEdit();
                                                                }" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditForm>
                                <StatusBar>
                                    <div>
                                        <div style="width: 90px; height: 25px; float: left;">                                
                                            <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                                AutoPostBack="false" Theme="Glass" Font-Size="12px" Width="81px">
                                                <ClientSideEvents Click="function(s, e) {                                        
                                                    gridDangVienControl.AddNewRow();
                                                }" />
                                                <Image Url="../../images/imgadmin/add.png">
                                                </Image>
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 90px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" Theme="Glass" Font-Size="12px" Width="81px"
                                                AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
                                                    gridDangVienControl.StartEditRow(gridDangVienControl.GetFocusedRowIndex());
                                                }" />
                                                <Image Url="../../images/imgadmin/edit.png">
                                                </Image>
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width: 90px; height: 25px; float: left;">
                                            <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" Theme="Glass" Font-Size="12px" Width="81px"
                                                AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
                                                    gridDangVienControl.DeleteRow(gridDangVienControl.GetFocusedRowIndex());
                                                }" />
                                                <Image Url="../../images/imgadmin/delete_16.png">
                                                </Image>
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                </StatusBar>
                            </Templates>                
                        </dx:ASPxGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>            
        </dx:PopupControlContentControl>
    </ContentCollection> 
    <ClientSideEvents CloseUp="function(s,e){
        gridToChucDang.PerformCallback();
    }" />
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="poupControl_ThemToChucDangThem" runat="server" 
    ClientInstanceName="poupControl_ThemToChucDangThem"  HeaderText=""
    AllowDragging="True" AllowResize="True"
    CloseAction="CloseButton"
    EnableViewState="False" PopupElementID="popupArea" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="Above" Width="500px"
    Height="200px" EnableHierarchyRecreation="True" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
        <Paddings PaddingLeft="10" PaddingRight="0" PaddingTop="0" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
            <dx:ASPxCallbackPanel ID ="callbackPanel_ThemToChuc" runat="server"
                ClientInstanceName="callbackPanel_ThemToChuc"
                OnCallback="callbackPanel_ThemToChuc_Callback">
                <ClientSideEvents EndCallback="function(s,e){                    
                    poupControl_ThemToChucDangThem.Hide();
                    gridToChucDang.PerformCallback();
                }" />
            </dx:ASPxCallbackPanel>
            <table cellpadding="1" cellspacing="1" width="480px" style="font-size: 9pt; font-family: Verdana;">                                
                <tr>
                    <td valign="top" style="width:100px;">
                        Tên tổ chức
                    </td>
                    <td valign="top">                                        
                        <dx:ASPxTextBox ID="txtTenToChuc1" runat="server"                                       
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Số QĐ
                    </td>
                    <td valign="top">
                        <dx:ASPxTextBox ID="txtSoQD1" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Ngày QĐ
                    </td>
                    <td valign="top">
                        <dx:ASPxDateEdit ID="dateNgayQD1" runat="server" Width="100%"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>                                
                <tr>
                    <td valign="top">
                        Ghi chú
                    </td>
                    <td valign="top">
                        <dx:ASPxMemo ID="memoGhiChu1" runat="server" Height="40px" Width="100%"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                            
                        </dx:ASPxMemo>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        File đính kèm
                    </td>
                    <td valign="top">                        
                        <dx:ASPxUploadControl ID="uploadFileDinhKemThem" runat="server" 
                            ClientInstanceName="uploadFileDinhKemThem" 
                            OnFileUploadComplete="uploadFileDinhKemThem_Load"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxUploadControl>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td style="padding-top: 7px;">
                        <div style="width: 100px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                <Image Url="../../images/imgadmin/save_16.png">
                                </Image>
                                <ClientSideEvents Click="function(s,e){
                                    uploadFileDinhKemThem.UploadFile();                                                    
                                    callbackPanel_ThemToChuc.PerformCallback();
                                    }" />
                            </dx:ASPxButton>
                        </div>
                        <div style="width: 100px; height: 25px; float: left;">
                            <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                AutoPostBack="False">
                                <Image Url="../../images/imgadmin/delete_16.png">
                                </Image>
                                <ClientSideEvents Click="function(s,e){
                                    poupControl_ThemToChucDangThem.Hide();
                                    }" />
                            </dx:ASPxButton>
                        </div>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>    
</dx:ASPxPopupControl>
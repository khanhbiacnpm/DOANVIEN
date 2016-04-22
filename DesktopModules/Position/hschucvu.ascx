<%@ Control Language="C#" Inherits="VNPT.Modules.Position.hschucvu" CodeFile="hschucvu.ascx.cs"
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
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<table cellpadding="1" cellspacing="1" width="100%">
    <tr>
        <td valign="top">
            <dx:ASPxGridView ID="gridhschucvu" runat="server" AutoGenerateColumns="False" 
                ClientInstanceName="gridhschucvu"
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" KeyFieldName="id"
                OnRowInserting="gridhschucvu_RowInserting"
                OnRowUpdating="gridhschucvu_RowUpdating"
                OnRowDeleting="gridhschucvu_RowDeleting"
                Width="100%">
                <SettingsBehavior AllowSort="false" AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin này không?" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <Settings ShowStatusBar="Visible" />              
                <Columns>
                    <dx:GridViewDataColumn FieldName="id" VisibleIndex="1" Visible="false">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="hschucvu" Caption="Hệ số chức vụ" VisibleIndex="2">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="hstrachnhiem" Caption="Hệ sô trách nhiệm" VisibleIndex="3">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="hsdochai" Caption="Hệ số độc hại" VisibleIndex="4">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataDateColumn FieldName="thoidiem" Caption="Thời điểm" VisibleIndex="5">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <CellStyle HorizontalAlign="Left">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                </Columns>
                <Templates>
                    <EditForm>
                        <table cellpadding="1" cellspacing="1" style="font-family:Verdana; font-size:10pt;">
                            <tr>
                                <td valign="top" style="width:130px;">
                                    Hệ số chức vụ
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ID="txthschucvu" runat="server" Width="100%" Text='<%# Eval("hschucvu") %>'
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RegularExpression ErrorText="Yêu cầu nhập theo định dạng số x or x.x !" ValidationExpression="\d+(\.\d+)?" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Hệ số trách nhiệm
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ID="txthstrachnhiem" runat="server" Width="100%" Text='<%# Eval("hstrachnhiem") %>'
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RegularExpression ErrorText="Yêu cầu nhập theo định dạng số x or x.x !" ValidationExpression="\d+(\.\d+)?" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Hệ số độc hại
                                </td>
                                <td valign="top">
                                    <dx:ASPxTextBox ID="txthsdochai" runat="server" Width="100%" Text='<%# Eval("hsdochai") %>'
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RegularExpression ErrorText="Yêu cầu nhập theo định dạng số x or x.x !" ValidationExpression="\d+(\.\d+)?" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Thời điểm
                                </td>
                                <td valign="top">
                                    <dx:ASPxDateEdit ID="datethoidiem" runat="server" OnInit="datethoidiem_init"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
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
                                <td style="padding-top: 7px;" colspan="2">
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btLuu" runat="server" Text="Lưu" AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">                                    
                                            <Image Url="../../images/imgadmin/save_16.png"></Image>
                                            <ClientSideEvents Click="function(s,e){
                                                gridhschucvu.UpdateEdit();
                                            }" />
                                        </dx:ASPxButton>
                                    </div>
                                    <div style="width: 100px; height: 25px; float: left;">
                                        <dx:ASPxButton ID="btDong" runat="server" Text="Ðóng" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                            AutoPostBack="False">                                   
                                           <Image Url="../../images/imgadmin/delete_16.png"></Image>
                                            <ClientSideEvents Click="function(s,e){
                                                gridhschucvu.CancelEdit();
                                             }" />
                                        </dx:ASPxButton>
                                    </div>
                                </td> 
                            </tr>
                        </table>
                    </EditForm>
                    <StatusBar>
                        <div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btThemMoi" runat="server" Text="Thêm" ClientInstanceName="btThemMoi"
                                    AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px">
                                    <ClientSideEvents Click="function(s, e) {                                        
                                        gridhschucvu.AddNewRow();
                                    }" />
                                    <Image Url="../../images/imgadmin/add.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="tbSua" runat="server" Text="Sửa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                        gridhschucvu.StartEditRow(gridhschucvu.GetFocusedRowIndex());                                      
                                    }" />
                                    <Image Url="../../images/imgadmin/edit.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 90px; height: 25px; float: left;">
                                <dx:ASPxButton ID="btXoa" runat="server" Text="Xóa" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="81px"
                                    AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
                                       gridhschucvu.DeleteRow(gridhschucvu.GetFocusedRowIndex());                                     
                                    }" />
                                    <Image Url="../../images/imgadmin/delete_16.png">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </StatusBar>
                </Templates>
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
            </dx:ASPxGridView>
        </td>
    </tr>
</table>
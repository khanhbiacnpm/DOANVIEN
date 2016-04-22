<%@ Control Language="C#" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.HetHopDong" CodeFile="HetHopDong.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<script type="text/javascript">
function KyHopDong(id) {
      
    
      
    window.location = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=231&IdNv=' + id;
       
        }
</script>

              <div style="padding:2px;">
                    <dx:ASPxGridView runat="server" ID="grdExpried" AutoGenerateColumns="False" Theme="Glass" Font-Size="12px" Width="100%" 
                        OnHtmlDataCellPrepared="grdExpried_HtmlDataCellPrepared"
                        OnHtmlRowCreated="grdExpried_HtmlRowCreated1" KeyFieldName="id">                        
                        <Columns>
                            <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
                            <dx:GridViewDataColumn FieldName="empid" Visible="false" VisibleIndex="0"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="hoten" Caption="Họ tên" VisibleIndex="0">
                                <DataItemTemplate>
                                   
                                    <asp:LinkButton ID="ltNhanVien" runat="server"></asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="donvi" Caption="Đơn vị" VisibleIndex="1">                                
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="hopdong" Caption="Hợp đồng" VisibleIndex="2">
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="batdau" Caption="Bắt đầu" VisibleIndex="3" />
                            <dx:GridViewDataDateColumn FieldName="ketthuc" Caption="Kết thúc" VisibleIndex="4">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsLoadingPanel ImagePosition="Top" />
                        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                            </LoadingPanelOnStatusBar>
                            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                            </LoadingPanel>
                        </Images>
                        <SettingsPager PageSize="20">
                            <Summary AllPagesText="{0} - {1} " Visible="False" />
                        </SettingsPager>
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
                        <ImagesFilterControl>
                            <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanel>
                        </ImagesFilterControl>
                        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                            <LoadingPanel ImageSpacing="8px">
                            </LoadingPanel>
                        </Styles>
                        <StylesEditors>
                            <CalendarHeader Spacing="1px">
                            </CalendarHeader>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dx:ASPxGridView>
               </div>
       
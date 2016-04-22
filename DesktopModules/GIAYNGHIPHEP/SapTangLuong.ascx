<%@ Control Language="C#" Inherits="DotNetNuke.Modules.DIEUCHUYENNV.SapTangLuong" CodeFile="SapTangLuong.ascx.cs"
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


      <div style="padding:2px;">
               
                    <dx:ASPxGridView ID="gridTangLuong" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                        
                        OnHtmlRowCreated="gridTangLuong_HtmlRowCreated">                        
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="empid" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Họ tên" FieldName="fullname" VisibleIndex="0">
                              
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="unitname" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Bậc lương" FieldName="level" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ngạch lương" FieldName="salary" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lần gần nhất" FieldName="changedate" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Hình thức" FieldName="type" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsLoadingPanel ImagePosition="Top" />
                        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                            </LoadingPanelOnStatusBar>
                            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                            </LoadingPanel>
                        </Images>
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
                        <SettingsPager PageSize="25">
                            <Summary Visible="False" />
                        </SettingsPager>
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
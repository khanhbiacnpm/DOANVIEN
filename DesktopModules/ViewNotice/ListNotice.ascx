<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListNotice.ascx.cs" Inherits="DesktopModules_ViewNotice_ListNotice" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<dx:ASPxGridView ID="grid" runat="server" Width="95%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" KeyFieldName="id" Caption="Danh sách việc phải làm"    
    ClientInstanceName="grid" 
    OnHtmlRowCreated="grid_HtmlRowCreated"
  >
    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
    <Columns>
        <dx:GridViewDataColumn FieldName="id" VisibleIndex="3" Visible="false" />
        <dx:GridViewDataColumn CellStyle-HorizontalAlign="Left" FieldName="Title" Caption="Nhắc nhở công việc"
            VisibleIndex="2">
           
        </dx:GridViewDataColumn>
    </Columns>
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
    <Settings ShowStatusBar="Visible" />
    <SettingsPager PageSize="30">
        <Summary AllPagesText="{0} - {1} " Visible="False" />
    </SettingsPager>
    <ImagesFilterControl>
        <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
        </LoadingPanel>
    </ImagesFilterControl>
    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
        </LoadingPanelOnStatusBar>
        <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
        </LoadingPanel>
    </Images>
    <StylesEditors>
        <CalendarHeader Spacing="1px">
        </CalendarHeader>
        <ProgressBar Height="25px">
        </ProgressBar>
    </StylesEditors>
   
</dx:ASPxGridView>

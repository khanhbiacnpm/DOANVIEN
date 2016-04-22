<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrintSoYeuLyLich2.ascx.cs" Inherits="VNPT.Modules.Employees.PrintSoYeuLyLich2" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPager" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Mvc.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.Mvc" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<script type="text/javascript">


    function printPartOfPage(elementId) {
        var printContent = document.getElementById(elementId);
        var windowUrl = 'about:blank';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');

        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }

</script>

<style type="text/css">
    @media print
    {
        body *
        {
            display: none;
        }
        #print_div
        {
            display: block;
        }
    }
</style>
<table width="100%" cellpadding="2">
    <tr>
        <td> <dx:ASPxLabel ID="lblTimKiem" runat="server" Text="Tìm kiếm" Font-Bold="true" Style="float: left;">
        </dx:ASPxLabel></td>
        <td>
           <dx:ASPxComboBox ID="cmbSearch" runat="server" ClientInstanceName="cmbSearch" Width="100%"
            EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains" DropDownWidth="820px"
            DropDownStyle="DropDownList" ValueField="id" TextFormatString="{0} - {1}" AutoPostBack="false"
            EnableCallbackMode="true" CallbackPageSize="30" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            <Columns>
                <dx:ListBoxColumn Caption="Mã NV" FieldName="empcode" Width="100px" />
                <dx:ListBoxColumn Caption="Họ tên" FieldName="fullname" Width="200px" />
                <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />
            </Columns>
            <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
            </LoadingPanelImage>
            <DropDownButton>
                <Image>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                </Image>
            </DropDownButton>
            <ClientSideEvents SelectedIndexChanged="function(s,e){                               
                               var key = 'e'+ cmbSearch.GetValue().toString();
                               callbackPanel.PerformCallback(key); 
                               treeList.PerformCallback(key);  
                               ddeDonVi.ShowDropDown();                                                             
                         }" />
        </dx:ASPxComboBox>
        </td>
        <td>
         <dx:ASPxDropDownEdit Width="100%" ID="ddeDonVi" ClientInstanceName="ddeDonVi" runat="server" 
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <DropDownWindowTemplate>
                            <dx:ASPxTreeList ID="treeList" runat="server" Width="100%" AutoGenerateColumns="False"
        OnCustomCallback="treeList_Callback" KeyFieldName="Id" ClientInstanceName="treeList"
        OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating" OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
        <SettingsCookies Enabled="True" StoreExpandedNodes="false" />
        <Border BorderColor="#99ccff" BorderStyle="Solid" BorderWidth="1" />
        <Columns>
            <dx:TreeListTextColumn FieldName="Name">
                <PropertiesTextEdit EncodeHtml="false" Size="9" />
            </dx:TreeListTextColumn>
        </Columns>
        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            <LoadingPanel Url="~/App_Themes/Glass/TreeList/Loading.gif">
            </LoadingPanel>
        </Images>
        <SettingsBehavior ProcessFocusedNodeChangedOnServer="false" AllowFocusedNode="True"
            ExpandCollapseAction="NodeDblClick" />
        <SettingsLoadingPanel ImagePosition="Top" />
        <Settings ShowColumnHeaders="False" />
        <ClientSideEvents FocusedNodeChanged="function(s, e) {
        cmbSearch.SetSelectedIndex(-1); 
			var key = treeList.GetFocusedNodeKey();
			callbackPanel.PerformCallback(key);					
			
		}" />
        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
            <CustomizationWindowContent VerticalAlign="Top" HorizontalAlign="Left">
            </CustomizationWindowContent>
        </Styles>
        <Templates>
            <DataCell>
                <table cellpadding="0" cellspacing="0"">
                    <tr>
                        <td valign="top">
                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>'
                                Width="16" Height="16" IsPng="true">
                            </dx:ASPxImage>
                        </td>
                        <td valign="top">
                        </td>
                        <td valign="top" style="padding-bottom: 1px; text-align: left;">
                            <font size="2" face="Tahoma"><b>&nbsp;
                                <%# Container.Text %></b></font>
                        </td>
                    </tr>
                </table>
            </DataCell>
        </Templates>
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
    </dx:ASPxTreeList>

     </DropDownWindowTemplate>

                <ButtonStyle Width="13px">
                </ButtonStyle>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxDropDownEdit>   
        </td>
    </tr>
    <tr>
        <td colspan="3">
          <dx:ASPxCallbackPanel runat="server" ID="callbackPanel" OnCallback="callbackPanel_Callback"
        ClientInstanceName="callbackPanel" ShowLoadingPanel="false">
        <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
        </LoadingPanelImage>
        <LoadingPanelStyle VerticalAlign="Top" HorizontalAlign="Center">
        </LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <asp:HiddenField ID ="hiddenIdEmp" runat ="server" />
                <iframe runat="server" frameborder="0" id="soluoclilich" width="100%" height="800px"
                    src=""></iframe>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrintSoYeuLyLich.ascx.cs"
    Inherits="VNPT.Modules.Employees.PrintSoYeuLyLich" %>
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
       
        <td>
          <dx:ASPxComboBox ID="cmbSearch" runat="server" ClientInstanceName="cmbSearch" Width="100%"
                EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains" DropDownWidth="900px"
                DropDownStyle="DropDownList" ValueField="id" TextFormatString="{0} - {1} - {2} - {3}"
                AutoPostBack="false" EnableCallbackMode="true" Height="30px" CallbackPageSize="30"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <Columns>
                    <dx:ListBoxColumn Caption="Mã NV" FieldName="empcode" Width="100px" />
                    <dx:ListBoxColumn Caption="Họ tên" FieldName="fullname" Width="150px" />
                    <dx:ListBoxColumn Caption="Chức vụ" FieldName="chucvu" Width="150px" />
                    <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />
                    <dx:ListBoxColumn Caption="Đơn vị chủ quản" FieldName="dvcha" Width="300px" />
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
                                                                                  
                         }" />
            </dx:ASPxComboBox>
          
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




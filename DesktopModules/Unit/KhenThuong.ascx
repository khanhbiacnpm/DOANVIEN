<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KhenThuong.ascx.cs"
    Inherits="VNPT.Modules.Unit.KhenThuong" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<script type="text/javascript">
    var doi = false;  
      
    function saveData() {
        if (upFile.GetText() == "")
            grdKhenThuong.UpdateEdit();
        else {
            doi = true;
            lblTrangThaiDoi.SetText("Dang upload file");
            upFile.Upload();
            doiUpload_hoanthanh();
        }
    }    
    function doiUpload_hoanthanh() {
        if (doi) {
            setTimeout("doiUpload_hoanthanh()", 1000);
        }
        else {
            lblTrangThaiDoi.SetText("");
            grdKhenThuong.UpdateEdit();
        }
    }
    function SetUrl(id) {        
        var IdDonVi = cmbSearch.GetValue();
        switch (id) {
            case 'hskt_1': document.getElementById('hskhenthuong').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=847&IdDonVi=' + IdDonVi; break;
            case 'hskt_2': document.getElementById('hskhenthuong').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=848&IdDonVi=' + IdDonVi; break;
        }
    }
    function pageLoad() {
        SetUrl('hskt_1');
    }
    pageLoad();
</script>
<table border="1" width="100%">
    <tr>
        <td width = "180px" style="background: url('<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/keep.gif');
            background-repeat: no-repeat; background-color: #ffffff" align="center">
            &nbsp;&nbsp;Tìm kiếm nhân viên
        </td>
        <td>
            <dx:ASPxComboBox ID="cmbSearch" runat="server" ClientInstanceName="cmbSearch" Width="100%"
                EnableIncrementalFiltering="true" IncrementalFilteringDelay="3" IncrementalFilteringMode="Contains"                
                DropDownWidth="900px" DropDownStyle="DropDownList" ValueField="id" SelectedIndex="0"
                AutoPostBack="false" EnableCallbackMode="true" Height="30px" CallbackPageSize="30"
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <Columns>
                    <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />                    
                </Columns>
                <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif"></LoadingPanelImage>
                <DropDownButton>
                <Image>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Glass" PressedCssClass="dxEditors_edtDropDownPressed_Glass" />
                </Image>
                </DropDownButton>
                <ClientSideEvents SelectedIndexChanged="function(s,e){                                    
                    SetUrl(navTab.GetSelectedItem().name);
                }" />
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dx:ASPxNavBar ID="navTab" runat="server" Width="100%" ClientInstanceName="navTab"                
                LoadingPanelImagePosition="Top" AllowSelectItem="true"
                ShowShadow="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                <ClientSideEvents ItemClick="function(s,e){                                   
                    SetUrl(e.item.name);
                }" />           
                <Groups>
                    <dx:NavBarGroup Name="thongtin" Text="Thông tin">
                        <Items>
                            <dx:NavBarItem Name="hskt_1" Text="Hồ sơ khen thưởng" Selected="true">
                                <Image Url='~/images/t1.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                            <dx:NavBarItem Name="hskt_2" Text="Tổ đội trực thuộc">
                                <Image Url='~/images/t1.png' Width="24" Height="24" />
                            </dx:NavBarItem>
                        </Items>
                    </dx:NavBarGroup>
                </Groups>
            </dx:ASPxNavBar>
        </td>
        <td valign="top" style="height:300px;">
            <iframe id="hskhenthuong" src='' height="450px" width="100%" frameborder="0"></iframe>
        </td>
    </tr>
</table>

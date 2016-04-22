<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThoiViec.ascx.cs"
    Inherits="DotNetNuke.Modules.NghiViec.ThoiViec" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
     <link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js"
    type="text/javascript" language="javascript"></script>
<script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript"
    language="javascript"></script>
<script type="text/javascript" language="javascript">
    function loaddata(empid) {
      
      
         CallbackPanel_ThoiViec.PerformCallback(empid);    
    }
    function LoadList()
    {        
        var ds=null;
        ds = <%=listFilter %>;
            $( "#txtCountry" ).autocomplete({
              source: ds,
                select: function (event, ui) { loaddata(ui.item.id); } 
            });

    }
    $( document ).ready(function() {
         LoadList();
              
    });
   
</script>
<table cellpadding="0" cellspacing="0" width="100%">
 <tr>
                    <td class="dxnbGroupHeader_Glass12">
                        <input id="txtCountry" style="width: 100%; font-weight: bold; font-family: Times New Roman;" />
                    </td>
                </tr>
    
   
    <tr>
       
        <td style="width: 100%; vertical-align: top; font-size: 10pt; font-family: Verdana;
            padding-left: 5px; padding-right: 5px;">
            <dx:ASPxCallbackPanel ID="CallbackPanel_ThoiViec" runat="server" ClientInstanceName="CallbackPanel_ThoiViec"
                OnCallback="CallbackPanel_ThoiViec_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                    
                                        <table style="font-size: 10pt; font-family: Verdana;" cellpadding="2px" width="550px" border="0">
                                            <tr>
                                                <td valign="top" style="width: 120px;">
                                                    <asp:HiddenField ID="hiddenIdEmp" runat="server" />
                                                    Họ và Tên
                                                </td>
                                                <td style="font-weight: bold; width:200px;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_TenNV" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td style="font-size: 10pt; width: 100px;" valign="top">
                                                    Mã NV
                                                </td>
                                                <td style="font-weight: bold;" valign="top">
                                                    <dx:ASPxLabel ID="lbl_maNV" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">Ngày sinh</td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID ="lbl_NgaySinh" runat="server"></dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">Nơi sinh</td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID ="lbl_NoiSinh" runat="server"></dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">Chức vụ</td>
                                                <td valign="top" colspan="3">
                                                    <dx:ASPxLabel ID ="lbl_ChucVu" runat="server"></dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Đơn vị công tác
                                                </td>
                                                <td colspan="3" valign="top">
                                                    <dx:ASPxLabel ID="lbl_DonViHienTai" runat="server">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>                                                                                                                                   
                                            <tr>                                                                                           
                                                <td>
                                                    Ngày theo đơn
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxDateEdit ID="dateNgayTheoDonXin" runat="server" 
                                                        ClientInstanceName="dateNgayTheoDonXin"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px">
                                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>  
                                                            <RequiredField ErrorText="Nhập ngày theo đơn xin nghỉ việc!" IsRequired="true" />                                                          
                                                        </ValidationSettings>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <CalendarProperties>
                                                            <HeaderStyle Spacing="1px" />
                                                            <FooterStyle Spacing="17px" />
                                                        </CalendarProperties>                                                        
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>                                                                                       
                                            <tr>                                                                                           
                                                <td>
                                                    Ngày hiệu lực
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxDateEdit ID="dateNgayHieuLuc" runat="server" 
                                                        ClientInstanceName="dateNgayHieuLuc"
                                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px">
                                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>
                                                            <RequiredField ErrorText="Nhập ngày hiệu lực !" IsRequired="true" />
                                                        </ValidationSettings>
                                                        <DropDownButton>
                                                            <Image>
                                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                                            </Image>
                                                        </DropDownButton>
                                                        <CalendarProperties>
                                                            <HeaderStyle Spacing="1px" />
                                                            <FooterStyle Spacing="17px" />
                                                        </CalendarProperties>                                                        
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>                                                                                       
                                            <tr>
                                                <td>
                                                    Quyết định
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxTextBox ID="txtQuyetDinh" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px">
                                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="G"
                                                            SetFocusOnError="true">
                                                            <ErrorFrameStyle ImageSpacing="4px">
                                                                <ErrorTextPaddings PaddingLeft="4px" />
                                                            </ErrorFrameStyle>                                                            
                                                            <RequiredField ErrorText="Nhập số Quyết định " IsRequired="true" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>                                            
                                            <tr>
                                                <td>
                                                </td>
                                                <td colspan="3" align="left" style="padding-top: 5px;">
                                                    <div style="width: 200px; height: 25px;">
                                                        <div style="width: 90px; height: 25px; float: left; padding-top: 2px; text-align: left;">
                                                            <dx:ASPxButton ID="btThoiViec" runat="server" Text="Lưu" ClientInstanceName="btThoiViec" Width="80px" Image-Url="~/images/imgadmin/reload.png"
                                                                AutoPostBack="false"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                <ClientSideEvents Click="function(s,e){                                                                                                          
                                                                    CallbackPanel_ThoiViec.PerformCallback('H');
                                                                    treeList.PerformCallback();
                                                                }" />
                                                                <Image Url="~/images/imgadmin/reload.png">
                                                                </Image>
                                                            </dx:ASPxButton>
                                                        </div>
                                                        <div style="width: 70px; height: 25px; float: left; text-align: left; padding-top: 2px;">
                                                            <dx:ASPxButton ID="btHuy" runat="server" Text="Hủy" Width="80px" 
                                                                Image-Url="~/images/imgadmin/delete_16.png"
                                                                AutoPostBack="false" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                                <ClientSideEvents Click="function(s,e){                                                                
		                                                            CallbackPanel_ThoiViec.PerformCallback('Huy');
                                                                }" />
                                                                <Image Url="~/images/imgadmin/delete_16.png">
                                                                </Image>
                                                            </dx:ASPxButton>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                           
                <ClientSideEvents EndCallback ="function(s,e){
                    if(CallbackPanel_ThoiViec.cpErrorNgayHT == true){
                        alert('Nhân viên này chưa tới hạn nghỉ hưu!');
                    }else{CallbackPanel_ThoiViec.cpErrorNgayHT=false;}
                }" />              
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>

<%@ Control Language="C#" Inherits="VNPT.Modules.Employees.EmployeeDocument" CodeFile="EmployeeDocument.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<style type="text/css">
    h1
    {
        margin: 5px 0;
    }
    .container
    {
        margin: 3px auto;
    }
    ul.tabs
    {
        margin: 0;
        padding: 0;
        float: left;
        list-style: none;
        height: 24px;
      
        width: 100%;
    }
    ul.tabs li
    {background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
    background-position: center top;
    background-repeat: repeat-x;
   
    color: #333333;
    font: 9pt Tahoma;
    padding: 3px 5px;
        
        float: left;
        margin: 0;
        padding: 0;
        height: 24px;
        line-height: 24px;
        border: 1px solid #7EACB1;
        border-left: none;
        border-bottom: none;
        margin-bottom: -1px;
      
        overflow: hidden;
        position: relative;
    }
    ul.tabs li a
    {
        text-decoration: none;
        color: #333333;
        display: block;
        font-size: 0.9em;
        padding: 0 10px;
        outline: none;
    }
    ul.tabs li a:hover
    {
        background: #d9eced;
    }
    html ul.tabs li.active, html ul.tabs li.active a:hover
    {
        background: #d9eced;
    }
    .tab_container
    {        
        border: none;
        clear: both;
        float: left;
        width: 100%;
        background: #edf3f4;
        -moz-border-radius-bottomright: 5px;
        -khtml-border-radius-bottomright: 5px;
        -webkit-border-bottom-right-radius: 5px;
        -moz-border-radius-bottomleft: 5px;
        -khtml-border-radius-bottomleft: 5px;
        -webkit-border-bottom-left-radius: 5px;
    }
    .tab_content
    {
        padding: 5px;
        font-size: 1em;
        background:#edf3f4;
    }
    .tab_content h2
    {
        font-weight: normal;
        padding-bottom: 10px;
        border-bottom: 1px dashed #ddd;
        font-size: 1.8em;
    }
    .tab_content h3 a
    {
        color: #254588;
    }
    .tabHrm
    {
        -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    
    background-position: top;
    background-repeat: repeat-x;
    border-color: #7EACB1 #7EACB1 -moz-use-text-color -moz-use-text-color;
    border-image: none;
    border-style: solid solid none none;
    border-width: 1px 1px medium medium;
    color: #333333;
    float: left;
    font: 9pt/24px Tahoma;
   width:100%;
    overflow: hidden;
    padding: 0;
    border-right:none;
    position: relative;
        }
        .dxnbImgCellLeft_Glass 
        {
            
           width:24px;
           padding:3px;
            }
</style>

<script type="text/javascript">
    var active_tab_name = '';
    var idNV = null;    
   
    function Tabs(idframe, tabid) {
        active_tab_name = idframe;
        document.getElementById(idframe).src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=' + tabid + '&idNV=' + hdKey.Get("key");
    }
   
    $(document).ready(function () {
        document.getElementById('tab0').style.display = 'block';
        document.getElementById('tab1').style.display = 'none';   
        document.getElementById('donvi').style.display = 'none';      
        document.getElementById('nhanvien').style.display = 'block'; 
        hdKey.Set("donvi", "0");
    });
    function SetUrl(id) {
      
        if (id == 'tt_1') {
          
            document.getElementById('tab0').style.display = 'block';
            document.getElementById('tab1').style.display = 'none';                        
        }
        else {
         
            document.getElementById('tab1').style.display = 'block';
            document.getElementById('tab0').style.display = 'none';
        }
        if(id.startsWith('tt')|| id.startsWith('bd') )
        {
            document.getElementById('donvi').style.display = 'none';      
            document.getElementById('nhanvien').style.display = 'block'; 
        }
        if(id.startsWith('bieudo'))
        {
            document.getElementById('donvi').style.display = 'block';      
            document.getElementById('nhanvien').style.display = 'none'; 
        }
        if(id=='bd_3' || id=='bd_1' ||id=='bd_2'||id.startsWith('tk'))
        {
            document.getElementById('donvi').style.display = 'none';      
            document.getElementById('nhanvien').style.display = 'none';
        }
        idNV = hdKey.Get("key");
        var ma_dv = hdKey.Get("ma_dv");
     
        if (id == 'tt_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=214&idNV=' + idNV;
        else if (id == 'tt_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=216&idNV=' + idNV;
        else if (id == 'tt_4')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=223&idNV=' + idNV;
        else if (id == 'tt_5')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=889&idNV=' + idNV;
        else if (id == 'tt_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1970&idNV=' + idNV;
        else if (id == 'tt_8')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=882&idNV=' + idNV;
        else if (id == 'tt_9')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=252&idNV=' + idNV;
        else if (id == 'tt_10')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=328&idNV=' + idNV;
        else if (id == 'tt_11')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=218&idNV=' + idNV;
        else if (id == 'tt_12')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=235&idNV=' + idNV;
        else if (id == 'bd_1')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=242&idNV=' + idNV;
        else if (id == 'bd_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=1967&idNV=' + idNV;
        else if (id == 'bd_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=925&IdNv=' + idNV;
        else if (id == 'bd_4')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=3026&IdNv=' + idNV;
        else if (id == 'bd_5')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=238&IdNv=' + idNV;
        else if (id == 'bd_6')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=239&IdNv=' + idNV;
        else if (id == 'bd_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=231&IdNv=' + idNV;
        else if (id == 'tk_0')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=276&idNV=' + idNV;
        else if (id == 'tk_1')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=245&idNV=' + idNV;
        else if (id == 'tk_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=887&idNV=' + idNV;
        else if (id == 'tk_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=888&idNV=' + idNV;
        else if (id == 'tk_4')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=890';
        else if (id == 'tk_6')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=905';
        else if (id == 'tk_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=900';
        else if (id == 'tk_8')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=896&idNV=' + idNV;
        else if (id == 'tk_9')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=895&idNV=' + idNV;
        else if (id == 'tk_10')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=898&idNV=' + idNV;
        else if (id == 'tk_11')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=899&idNV=' + idNV;

        else if (id == 'bieudo_5')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=920&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_1')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=917&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_2')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=916&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_3')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=918&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_4')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=919&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_6')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=921&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_7')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=923&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_8')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=922&iddv=' + hdKey.Get("donvi");
        else if (id == 'bieudo_9')
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=924&iddv=' + hdKey.Get("donvi");
        
       
    }
    function SetUrl1(id) {
      
        if (id == 'tt_1') {
          
            document.getElementById('tab0').style.display = 'block';
            document.getElementById('tab1').style.display = 'none';                        
        }
        else {
         
            document.getElementById('tab1').style.display = 'block';
            document.getElementById('tab0').style.display = 'none';
        }

        if(id.startsWith('tt')|| id.startsWith('bd')||id.startsWith('tk'))
        {
            document.getElementById('donvi').style.display = 'none';      
            document.getElementById('nhanvien').style.display = 'block'; 
        }
        if(id.startsWith('bieudo'))
        {
            document.getElementById('donvi').style.display = 'block';      
            document.getElementById('nhanvien').style.display = 'none'; 
        }
        iddv = hdKey.Get("donvi");
      
        if (id == 'bieudo_1')
       
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=917&iddv=' + iddv;
       
        else if (id == 'bieudo_2')
     
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=916&iddv=' + iddv;
       
        else if (id == 'bieudo_3')
      
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=918&iddv=' + iddv;
        
        else if (id == 'bieudo_4')
      
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=919&iddv=' + iddv;
       
        else if (id == 'bieudo_6')
      
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=921&iddv=' + iddv;
     
        else if (id == 'bieudo_7')
      
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=923&iddv=' + iddv;
     
        else if (id == 'bieudo_8')
       
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=922&iddv=' + iddv;
      
        else if (id == 'bieudo_9')
        
           
            document.getElementById('idframe').src = '<%= DotNetNuke.Common.Globals.ApplicationPath %>/Default.aspx?tabid=924&iddv=' + iddv;
        
     
    }
    function loaddatadonvi(donvi) {
        hdKey.Set("donvi", donvi);
        SetUrl1(navTab.GetSelectedItem().name);       
    }
    function loaddata(empid) {     
        var str = empid + "";
        var keys = str.split(".");        
        var id = keys[0];
        var ma_dv = keys[1];
        hdKey.Set('ma_dv', ma_dv);
        hdKey.Set("key", id);
        cbp_thongtinchung.PerformCallback('load;' + id + ';' + ma_dv);
      
        SetUrl(navTab.GetSelectedItem().name);
      
        //Default Action
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(".tab_content").hide(); //Hide all content
        $("ul.tabs li:first").addClass("active").show(); //Activate first tab
        $(".tab_content:first").show(); //Show first tab content        
    }    
    function reload() {
        idNV = null;
        $("#txtCountry").val('');
        cbp_thongtinchung.PerformCallback('null');
    }
    var startUpload = false;
    function save() {
        if (kiemtra_thongtin() == true)
        {
            var key = hdKey.Get('key');
            if (key == null)
                cbp_thongtinchung.PerformCallback('insert');
            else
                cbp_thongtinchung.PerformCallback('update' + key);
        }
    }
    function kiemtra_thongtin() {
        if (txt_manv.GetText() == null || txt_manv.GetText() == '') {
            alert('Vui lòng nhập mã Đoàn viên');
            txt_manv.Focus();
            return false;
        } else if (txt_hoten.GetText() == null || txt_hoten.GetText() == '') {
            alert('Vui lòng nhập tên Đoàn viên');
            txt_hoten.Focus();
            return false;
        } else if (cmb_gioitinh.GetValue() == 2) {
            alert('Vui lòng chọn giới tính Đoàn viên');
            cmb_gioitinh.Focus();
            return false;
        } else if (cmb_tochuc.GetValue() == 0 || cmb_tochuc.GetValue() == null) {
            alert('Vui lòng chọn tổ chức');
            cmb_tochuc.Focus();
            return false;
        }
        else 
        return true;
    }
    var uplText = "Đang gửi file.Xin vui lòng chờ";
    function waitUploadComplete() {
        if (startUpload) {
            if (uplText.length < 40)
                uplText = uplText + ".";
            else
                uplText = "Đang gửi file. Xin vui lòng chờ";
            lblUploading.SetText(uplText);
            setTimeout("waitUploadComplete()", 1000);
        }
        else {           
            popupHinhAnh.Hide();          
            pnlImage.PerformCallback();         
        }
    }
    function LoadImage() {
        popupHinhAnh.Show();
    }
    function UpLoadImage() {
        var sFile = uploadFileDinhKemTagDT.GetText();
        if (sFile != "") {
            startUpload = true;
            uploadFileDinhKemTagDT.Upload();
            waitUploadComplete();
        }
    }
</script>
 <link rel="stylesheet" href="<%= DotNetNuke.Common.Globals.ApplicationPath %>/css/jquery-ui.css" />
    <script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-1.8.3.js" type="text/javascript" language="javascript"></script>

    <script src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/js/jquery-ui.js" type="text/javascript" language="javascript"></script>

    <script type="text/javascript" language="javascript">
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
        document.getElementById('tab0').style.display = 'block';
        document.getElementById('tab1').style.display = 'none';
    });
    </script>
    <style type="text/css">
        .dxnbItemHover_Glass {
    padding: 2px 2x 2px 17px;
}
.dxnbItem_Glass {
    padding: 2px 2px 2px 17px;
}
    .dxnbControl_Glass2
    {
        color: #000000;
        font: 9pt Tahoma;
    }
    .dxnbControl_Glass1
    {
        height: 400px;
        background-color: #EDF3F4;
        border: 1px solid #7EACB1;
        color: #000000;
      
        font: 9pt Tahoma;
        
    }
    .dxnbGroupHeader_Glass
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 5px 3px;
    }
    .dxnbGroupHeader_Glass12
    {
        background-image: url("/hrm/DXR.axd?r=0_833-D7Z17");
        background-position: center top;
        background-repeat: repeat-x;
        border-bottom: 1px solid #D5D5D5;
        border-style: none none solid;
        color: #333333;
        font: 9pt Tahoma;
        padding: 3px 5px;
    }
     .dxnbImgCellLeft_Glass
        {
            
           width:24px;
           padding:4px;
            }
</style>
<dx:ASPxPopupControl ID="popupHinhAnh" runat="server" ClientInstanceName="popupHinhAnh"
    Width="350px" HeaderText="Hình ảnh nhân viên" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="TopSides" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
    <ContentStyle VerticalAlign="Top">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td>
                        <dx:ASPxUploadControl ID="uploadFileDinhKemTagDT" runat="server" OnFileUploadComplete="uploadFileDinhKemTagDT_Load"
                            ClientInstanceName="uploadFileDinhKemTagDT" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents FilesUploadComplete="function(s,e)
                        {   
                            startUpload = false;
                        }" />
                        </dx:ASPxUploadControl>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="txt" runat="server" ClientInstanceName="lblUploading" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Upload" AutoPostBack="false"
                            Width="105px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <ClientSideEvents Click="function(s,e){                        
    UpLoadImage();
}" />
                            <Image Url="../../images/imgadmin/reload.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxHiddenField ID="hdKey" runat="server" ClientInstanceName="hdKey"></dx:ASPxHiddenField>
            <table width="1000px" cellpadding="0" cellspacing="0" class="dxnbControl_Glass1">
        <tr>
            <td  valign="top" style="width: 160px;border-right: 1px solid #7EACB1;" rowspan = "2">
         
                <table width="100%" cellpadding="0" cellspacing="0" >
                   
                    <tr>                                       
                        <td valign="top" align="center" >                                                                                                                                               
                            <dx:ASPxCallbackPanel ID="pnlImage" runat="server" ClientInstanceName="pnlImage"
                                OnCallback="pnlImage_Callback">
                               
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent1" runat="server">
                                        <dx:ASPxImage ID="imghinhanh" runat="server" ClientInstanceName="imghinhanh" Width="100%"
                                            Height="190px" >
                                            <ClientSideEvents Click="function(s,e){LoadImage();}" />
                                        </dx:ASPxImage>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </td>            
                    </tr>
                    <tr>
                        <td valign="top">
                            <dx:ASPxNavBar ID="navTab" ClientInstanceName="navTab" runat="server" Width="170px" LoadingPanelImagePosition="Top" Font-Size="12px"
                                ShowShadow="true" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" AllowExpanding="true" ShowExpandButtons="true" 
                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" AllowSelectItem="true" BorderRight-BorderWidth="0px" BorderBottom-BorderWidth="0px" BorderLeft-BorderWidth="0px" BorderTop-BorderWidth="0px">                                
                                <ClientSideEvents ItemClick="function(s,e){SetUrl(e.item.name);}" />
                                <CollapseImage Height="0" Width="0">
                                </CollapseImage>
                                <ItemImage Width="24" ></ItemImage>
                                <Groups>
                                    <dx:NavBarGroup Name="thongtin" Text="Thông tin" Expanded="false">
                                        <Items>
                                            <dx:NavBarItem Name="tt_1" Text="Lý lịch cán bộ">
                                                <Image Url='~/images/t1.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_2" Text="Quá trình công tác">
                                                <Image Url='~/images/daotao.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_3" Text="Quá trình lương">
                                                <Image Url='~/images/luong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_11" Text="Hợp đồng">
                                                <Image Url='~/images/khenthuong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_4" Text="Khen thưởng - Kỷ luật">
                                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_5" Text="Đào tạo">
                                                <Image Url='~/images/icon_skins_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <%--<dx:NavBarItem Name="tt_6" Text="Bằng cấp/chứng chỉ">
                                                <Image Url='~/images/kiemnhiem.png' Width="18" Height="18" />
                                            </dx:NavBarItem>--%>
                                            <dx:NavBarItem Name="tt_7" Text="Đề tài - sáng kiến">
                                                <Image Url='~/images/icon_dashboard_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_8" Text="Kiêm nhiệm">
                                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_12" Text="Chính sách - chế độ">
                                                <Image Url='~/images/hopdong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_9" Text="Bảo hiểm xã hội">
                                                <Image Url='~/images/yte.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tt_10" Text="Biểu mẫu 2c">
                                                <Image Url='~/images/soluoclylich.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                        </Items>
                                    </dx:NavBarGroup>
                                    <dx:NavBarGroup Name="biendong" Text="Biến động" Expanded="false">
                                        <Items>
                                            <dx:NavBarItem Name="bd_4" Text="Bố trí/Điều động">
                                                <Image Url='~/images/daotao.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bd_5" Text="Bổ nhiệm">
                                                <Image Url='~/images/hopdong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bd_6" Text="Miễn nhiệm">
                                                <Image Url='~/images/icon_skins_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bd_1" Text="Nghỉ việc">
                                                <Image Url='~/images/t1.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                           
                                            <dx:NavBarItem Name="bd_3" Text=" DS sắp hết hạn hợp đồng">
                                                <Image Url='~/images/t1.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bd_7" Text="Ký hợp đồng">
                                                <Image Url='~/images/icon_dashboard_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                             <dx:NavBarItem Name="bd_2" Text="Tìm kiếm ứng viên">
                                                <Image Url='~/images/keep.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                        </Items>
                                    </dx:NavBarGroup>
                                    <dx:NavBarGroup Name="thongtin" Text="Biểu mẫu - Thống kê" Expanded="false">
                                        <Items>
                                            <dx:NavBarItem Name="tk_0" Text="Thống kê theo yêu cầu">
                                                <Image Url='~/images/keep.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_1" Text="Danh sách nghỉ việc">
                                                <Image Url='~/images/khenthuong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_2" Text="Lao động có mặt trong quý">
                                                <Image Url='~/images/icon_dashboard_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_3" Text="Lao động có mặt trong tháng">
                                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_4" Text="Danh sách dân tộc thiểu số">
                                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_6" Text="Số liệu nguồn nhân lực 05">
                                                <Image Url='~/images/icon_dashboard_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_7" Text="Số liệu nguồn nhân lực(5A)">
                                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_8" Text="Nam 18-45 chưa qua phục vụ quân đội">
                                                <Image Url='~/images/icon_hostusers_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_9" Text="Nữ 18-40 chưa qua phục vụ quân đội">
                                                <Image Url='~/images/icon_users_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_10" Text="Nam > 45 đã qua phục vụ quân đội">
                                                <Image Url='~/images/icon_whatsnew_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="tk_11" Text="Nữ 18 - 25 sẵn sàng nhập ngũ">
                                                <Image Url='~/images/icon_extensions_24px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                        </Items>
                                    </dx:NavBarGroup>
                                    <dx:NavBarGroup Name="thongtinbieudo" Text="Biểu đồ thống kê" Expanded="false">
                                        <Items>
                                            <dx:NavBarItem Name="bieudo_1" Text="Kết cấu trình độ đào tạo">
                                                <Image Url='~/images/daotao.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_2" Text="Kết cấu hợp đồng lao động">
                                                <Image Url='~/images/hopdong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_3" Text="Kết cấu giới tính lao động">
                                                <Image Url='~/images/icon_skins_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_4" Text="Kết cấu chuyên ngành">
                                                <Image Url='~/images/t1.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_5" Text="Kết cấu độ tuổi  lao động">
                                                <Image Url='~/images/khenthuong.png' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_6" Text="Kết cấu loại lao động">
                                                <Image Url='~/images/icon_dashboard_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_7" Text="Kết cấu sức khỏe lao động">
                                                <Image Url='~/images/icon_moduledefinitions_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_8" Text="Thống kê đảng viên">
                                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="bieudo_9" Text="Thống kê lý luận chính trị">
                                                <Image Url='~/images/icon_sitesettings_32px.gif' Width="18" Height="18" />
                                            </dx:NavBarItem>
                                        </Items>
                                    </dx:NavBarGroup>
                                </Groups>
                            </dx:ASPxNavBar>
                        </td>
                    </tr>                                         
                </table>               
            </td>
            <td valign="top" style="width:830px;">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:28px;" id="nhanvien">                        
                        <td style="width: 830px;padding:2px;">
                            <input id="txtCountry" style="width:100%;font-weight:bold;font-family:Times New Roman;" />
                        </td>                     
                    </tr>          
                    <tr id="donvi" >
                        <td style="width: 830px;padding:2px;">
                             <dx:ASPxComboBox ID="cmb_donvi" ClientInstanceName="cmb_donvi" runat="server" IncrementalFilteringMode="Contains" Width="100%" DropDownStyle="DropDown"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">                                
                                 <ClientSideEvents SelectedIndexChanged="function(s,e){                                    
                                     hdKey.Set('donvi', cmb_donvi.GetValue());                                    
                                     loaddatadonvi(cmb_donvi.GetValue());
                                    
                                     }" />
                            </dx:ASPxComboBox>      
                        </td>
                    </tr>        
                    <tr>
                        <td style="background: #edf3f4;"
                            valign="top" >
                            <div id="tab0" style="height: 500px;">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr style="height: 433px;">
                                        <td valign="top">
                                            <ul class="tabs">
                                                <li><a href="#tab8" onclick="loaddata(hdKey.Get('key');">Thông tin cá nhân</a></li>                                                                    
                                                <li><a href="#tab4" onclick="Tabs('iframeBangCap',219)">Bằng cấp</a></li>
                                                <li><a href="#tab5" onclick="Tabs('iframeCongViec',853)">Công việc</a></li>
                                                <li><a href="#tab11" onclick="Tabs('iframeMoTaCongViec',1947)">Mô tả công việc</a></li>
                                                <li><a href="#tab9" onclick="Tabs('iframeDoanThe',220)">Đoàn thể</a></li>
                                                <li><a href="#tab3" onclick="Tabs('iframeSucKhoe',227)">Sức khỏe </a></li>
                                                <li><a href="#tab6" onclick="Tabs('iframeQHGD',213)">Quan hệ gia đình</a></li>
                                                <li><a href="#tab10" onclick="Tabs('iframeLichSuBanThan',226)">Lịch sử bản thân</a></li>
                                                <li><a href="#tab7" onclick="Tabs('iframeThongTinKhac',228)">Thông tin khác</a></li>
                                            </ul>                                                               
                                            <div class="tab_container">
                                                <div id="tab8" class="tab_content">
                                                    <dx:ASPxCallbackPanel ID = "cbp_thongtinchung" runat="server" 
                                                        ClientInstanceName="cbp_thongtinchung" oncallback="cbp_thongtinchung_Callback">
                                                        <ClientSideEvents EndCallback="function(s,e){                                                         
                                                            imghinhanh.SetImageUrl('../../../images/EmpImages/'+s.cpHinhAnh);
                                                            if(cbp_thongtinchung.cpresult == 0)
                                                            {
                                                                alert('Thêm mới nhân viên thành công!');
                                                                delete cbp_thongtinchung.cpresult;
                                                            }
                                                            else if (cbp_thongtinchung.cpresult == 1)
                                                            {
                                                                alert('Cập nhật thông tin nhân viên thành công!');
                                                                delete cbp_thongtinchung.cpresult;
                                                            }
                                                            else if (cbp_thongtinchung.cpresult == 2)
                                                            {
                                                                alert('Mã nhân viên đã tồn tại yêu cầu nhập mã mới!');
                                                                delete cbp_thongtinchung.cpresult;
                                                            }
                                                            if (cbp_thongtinchung.cpidnv > 0)
                                                            {
                                                                idNV = cbp_thongtinchung.cpidnv;
                                                                delete cbp_thongtinchung.cpidnv;
                                                            }
                                                        }" />                                                                            
                                                        <PanelCollection>
                                                            <dx:PanelContent ID = "pc_thongtinchung" runat="server">
                                                                <table cellpadding="2" cellspacing="0" border="0" style="background: #edf3f4;
                                                                    font-size: 11pt;font-family:Times New Roman; width:100%;">
                                                                    <tr>
                                                                        <td valign="top" style="width:96px;">
                                                                            MANV
                                                                        </td>
                                                                        <td valign="top">
                                                                            <dx:ASPxTextBox ID="txt_manv" runat="server" ClientInstanceName="txt_manv" Width="100px"
                                                                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                        <td style="width:60px;" >
                                                                            Họ tên
                                                                        </td>
                                                                        <td valign="top">
                                                                            <dx:ASPxTextBox ID="txt_hoten" ClientInstanceName="txt_hoten" runat="server" Width="150px"
                                                                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                        <td style="width: 100px;" >
                                                                            Tên khác
                                                                        </td>
                                                                        <td valign="top">
                                                                            <dx:ASPxTextBox ID="txt_tenkhac" ClientInstanceName="txt_tenkhac" runat="server"
                                                                                Width="100px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                        <td style="width: 80px;" >
                                                                            Giới tính
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxComboBox ID="cmb_gioitinh" runat="server" ClientInstanceName="cmb_gioitinh"
                                                                                DropDownStyle="DropDown" ValueType="System.Int32" IncrementalFilteringMode="Contains"
                                                                                Width="120px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                <Items>
                                                                                    <dx:ListEditItem Text="-- Tất cả --" Value="2" Selected="true" />
                                                                                    <dx:ListEditItem Text="Nam" Value="1" />
                                                                                    <dx:ListEditItem Text="Nữ" Value="0" />
                                                                                </Items>
                                                                            </dx:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            CMND
                                                                        </td>
                                                                        <td valign="top">
                                                                            <dx:ASPxTextBox ID="txt_cmnd" runat="server" Width="100%" ClientInstanceName="txt_cmnd"
                                                                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                        <td valign="top" colspan="2">
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        <dx:ASPxDateEdit ID="date_ngaycapcmnd" ClientInstanceName="date_ngaycapcmnd" DisplayFormatString="dd/MM/yyyy"
                                                                                            EditFormatString="dd/MM/yyyy" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            NullText="Ngày cấp" CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                                                            Width="100%">
                                                                                        </dx:ASPxDateEdit>
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_noicapcmnd" runat="server" ClientInstanceName="cmb_noicapcmnd"
                                                                                            IncrementalFilteringMode="Contains" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td colspan="2">
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td style="width: 94px;" >
                                                                                        Dân tộc
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_dantoc" runat="server" ClientInstanceName="cmb_dantoc" ValueType="System.Int32"
                                                                                            IncrementalFilteringMode="Contains" DropDownStyle="DropDown" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td >
                                                                            Tôn giáo
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxComboBox ID="cmb_tongiao" runat="server" ClientInstanceName="cmb_tongiao"
                                                                                ValueType="System.Int32" IncrementalFilteringMode="Contains" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                DropDownStyle="DropDown" CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False"
                                                                                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td >
                                                                            Nơi sinh
                                                                        </td>
                                                                        <td valign="top" colspan="5">
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td valign="top" style="width: 240px;">
                                                                                        <dx:ASPxTextBox ID="txt_noisinh_Xa" NullText="Xã/phường" ClientInstanceName="txt_noisinh_xa"
                                                                                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td style="width: 182px;">
                                                                                        <dx:ASPxTextBox ID="txt_noisinh_huyen" NullText="Huyện/Thành phố" ClientInstanceName="txt_noisinh_huyen"
                                                                                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_noisinhtinh" runat="server" ClientInstanceName="cmb_noisinhtinh"
                                                                                            IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                                                                                            Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td >
                                                                            Ngày sinh
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxDateEdit ID="date_ngaysinh" runat="server" ClientInstanceName="date_ngaysinh"
                                                                                DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                                                Width="100%">
                                                                            </dx:ASPxDateEdit>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td >
                                                                            Quê quán
                                                                        </td>
                                                                        <td valign="top" colspan="7">
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td valign="top" style="width: 240px;">
                                                                                        <dx:ASPxTextBox ID="txt_quequan_xa" ClientInstanceName="txt_quequan_xa" NullText=" Xã/phường"
                                                                                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td style="width: 182px;">
                                                                                        <dx:ASPxTextBox ID="txt_quequan_huyen" ClientInstanceName="txt_quequan_huyen" NullText="Huyện/thành phố"
                                                                                            runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                                                                                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_quequantinh" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Thường trú
                                                                        </td>
                                                                        <td valign="top" colspan="7">
                                                                            <dx:ASPxTextBox ID="txt_thuongtru" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Chổ ở hiện nay
                                                                        </td>
                                                                        <td valign="top" colspan="7">
                                                                            <dx:ASPxTextBox ID="txt_choohiennay" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="8">
                                                                            <table width="100%" cellpadding="2" cellspacing="0" style="font-size: 11pt;" border="0">
                                                                                <tr>
                                                                                    <td  style="width: 91px;">
                                                                                        Tin học
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_tinhoc" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td valign="top" >
                                                                                        Hạng thương binh
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_hangthuongbinh" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td valign="top"  style="width: 120px;">
                                                                                        Đối tượng CSXH
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_chinhsachxahoi" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td >
                                                                                        Ngoại ngữ
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_ngoaingu" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Trình độ phổ thông
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_phothong" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Lý luận chính trị
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_lyluanchinhtri" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td >
                                                                                        Nhóm máu
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_nhommau" runat="server" DropDownStyle="DropDown" ValueType="System.Int32"
                                                                                            Width="100%" IncrementalFilteringMode="Contains" CssPostfix="Glass" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                     <td >
                                                                                        Nơi khám bảo hiểm
                                                                                    </td>
                                                                                    <td colspan="3">
                                                                                        <dx:ASPxTextBox ID="txt_noikhambhyt" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                   <%-- <td >
                                                                                        Chiều cao
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxTextBox ID="txt_chieucao" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td valign="top" >
                                                                                        Cân nặng
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxTextBox ID="txt_cannang" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>--%>
                                                                                </tr>
                                                                              <%--  <tr>
                                                                                    <td valign="top" >
                                                                                        Huyết áp
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxTextBox ID="txt_huyetap" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Loại sức khoẻ
                                                                                    </td>
                                                                             
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmb_loaisuckhoe" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Thời điểm khám
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxDateEdit ID ="date_thoidiemkham" runat="server" Width="100%"
                                                                                            DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"
                                                                                            CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxDateEdit>                                                                                       
                                                                                    </td>
                                                                                </tr>
                                                                               --%>
                                                                                <tr>
                                                                                    <td valign="top" >
                                                                                        Số BHXH
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxTextBox ID="txt_bhxh" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Ngày đóng BHXH
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxDateEdit ID="date_ngaydongbhxh" runat="server" DisplayFormatString="dd/MM/yyyy"
                                                                                            EditFormatString="dd/MM/yyyy" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                                                            Width="100%">
                                                                                        </dx:ASPxDateEdit>
                                                                                    </td>
                                                                                     <td >
                                                                                        BHYT
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxTextBox ID="txt_bhyt" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    
                                                                                </tr>
                                                                           
                                                                                <tr>
                                                                                    <td >
                                                                                        Passport
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxTextBox ID="txt_sopassport" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td >
                                                                                        Ngày cấp
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxDateEdit ID="date_ngaycappassport" DisplayFormatString="dd/MM/yyyy"
                                                                                            EditFormatString="dd/MM/yyyy" runat="server" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                                                            Width="100%">
                                                                                        </dx:ASPxDateEdit>
                                                                                    </td>
                                                                                    <td >
                                                                                        Nơi cấp
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxComboBox ID="cmb_noicappassport" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" ValueType="System.Int32" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td >
                                                                                        Điện thoại
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxTextBox ID="txt_dienthoai" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td  style="width: 120px;">
                                                                                        Email
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxTextBox ID="txt_email" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                    <td  style="width: 70px">
                                                                                        MS Thuế
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <dx:ASPxTextBox ID="txt_masothue" runat="server" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxTextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                     <tr>
                                                                                   
                                                                                   <td style="width:90px;">
                                                                                        TP gia đình
                                                                                    </td>
                                                                                    <td>
                                                                                        <dx:ASPxComboBox ID="cmbTPGiaDinh" runat="server" IncrementalFilteringMode="Contains"
                                                                                            DropDownStyle="DropDown" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                    <td  style="width: 120px;">
                                                                                        TP bản thân
                                                                                    </td>
                                                                                    <td>                                                                                        
                                                                                        <dx:ASPxComboBox ID="cmbTPBanThan" runat="server" IncrementalFilteringMode="Contains" IncrementalFilteringDelay="10"  
                                                                                            DropDownStyle="DropDown" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>                                                                                    
                                                                                    <td  style="width: 120px;">
                                                                                        Đơn vị
                                                                                    </td>
                                                                                    <td colspan="3">
                                                                                        <dx:ASPxComboBox ID="cmb_tochuc" runat="server" 
                                                                                            IncrementalFilteringMode="Contains" ClientInstanceName="cmb_tochuc"
                                                                                            DropDownStyle="DropDown" Width="100%" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                                                                                            CssPostfix="Glass" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">                                                                                           
                                                                                        </dx:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="8">
                                                                            <div style="float: left; width: 107px;">
                                                                                <dx:ASPxButton ID="bt_nhapmoi" runat="server" Text="Nhập mới" AutoPostBack="false"
                                                                                    Width="105px" Theme="Glass" Font-Size="12px">
                                                                                    <ClientSideEvents Click="function(s,e){                        
    reload();
}" />
                                                                                    <Image Url="../../images/imgadmin/reload.png">
                                                                                    </Image>
                                                                                </dx:ASPxButton>
                                                                            </div>
                                                                            <div style="width: 100px; float:left;">
                                                                                <dx:ASPxButton ID="bt_luu" runat="server" Text="Lưu" AutoPostBack="false" Width="100px"
                                                                                    Theme="Glass" Font-Size="12px">
                                                                                    <ClientSideEvents Click="function(s,e){
    save();  
}" />
                                                                                    <Image Url="../../images/imgadmin/save_16.png">
                                                                                    </Image>
                                                                                </dx:ASPxButton>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxCallbackPanel>                                                                        
                                                </div>                                                                  
                                                    <div id="tab9" class="tab_content">
                                                    <iframe id="iframeDoanThe" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab3" class="tab_content">
                                                    <iframe id="iframeSucKhoe" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab4" class="tab_content">
                                                    <iframe id="iframeBangCap" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab5" class="tab_content">
                                                    <iframe id="iframeCongViec" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab6" class="tab_content">
                                                    <iframe id="iframeQHGD" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab7" class="tab_content">
                                                    <iframe id="iframeThongTinKhac" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                                <div id="tab10" class="tab_content">
                                                    <iframe id="iframeLichSuBanThan" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                               <div id="tab11" class="tab_content">
                                                    <iframe id="iframeMoTaCongViec" height="450px" width="100%" frameborder="0">
                                                    </iframe>
                                                </div>
                                            </div>                                                                
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    //Default Action
                                                    $(".tab_content").hide(); //Hide all content
                                                    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
                                                    $(".tab_content:first").show(); //Show first tab content

                                                    //On Click Event
                                                    $("ul.tabs li").click(function () {
                                                        $("ul.tabs li").removeClass("active"); //Remove any "active" class
                                                        $(this).addClass("active"); //Add "active" class to selected tab
                                                        var activeTab = $(this).find("a").attr("href");
                                                        $(".tab_content").hide(); //Hide all tab content                                                                
                                                        $(activeTab).fadeIn(); //Fade in the active content
                                                        return false;
                                                    });
                                                });
                                            </script>                                                              
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="tab1" style="padding:3px;">
                                <iframe id="idframe" src='' height="500px" width="100%" frameborder="0"></iframe>
                            </div>                            
                        </td>
                    </tr>                  
                </table>
            </td>
        </tr>        
    </table>
<%@ Control Language="C#" Inherits="VNPT.Modules.MTCV.MTCV" CodeFile="MTCV.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
    
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
    
<style type="text/css">
    .dxbButton_Glass div.dxb {
        border: 0 none;
        padding: 2px 2px 1px 2px;
    }
</style>
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
        padding: 2px;
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
<table style="width:1000px;padding:2px;font-family:'Times New Roman';font-size:11pt;">
     <tr>
        <td>
            <table style="width: 100%; padding: 2px;font-family:'Times New Roman';font-size:11pt;">
                <tr>
                    <td  style="width: 180px;vertical-align:top;">Nhóm chức danh công việc
                    </td>
                    <td>
                        <dx:ASPxComboBox AutoPostBack="True" ID="cmbNhomChucDanh" ClientInstanceName="cmbNhomChucDanh" runat="server"
                            Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown" ValueType="System.Int32"
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" LoadingPanelImagePosition="Top"
                            ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnSelectedIndexChanged="cmbNhomChucDanh_SelectedIndexChanged">
                            
                        </dx:ASPxComboBox>
                    </td>
                    <td style="width: 140px;vertical-align:top;">Chức danh công việc
                    </td>
                    <td style="vertical-align:top;">
                        <dx:ASPxComboBox AutoPostBack="True" ID="cmbChucDanh" ClientInstanceName="cmbChucDanh"
                            runat="server" Width="100%" IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            ValueType="System.Int32" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnSelectedIndexChanged="cmbChucDanh_SelectedIndexChanged">
                          
                        </dx:ASPxComboBox>
                    </td>
                  
                </tr>
            </table>

        </td>

    </tr>
    <tr>
        <td>
            <ul class="tabs">
                <li><a href="#tab1">Tóm tắt công việc</a></li>
                <li><a href="#tab2">Công việc chính</a></li>
                <li><a href="#tab4">Trách nhiệm</a></li>
                <li><a href="#tab5">Điều kiện làm việc</a></li>
                <li><a href="#tab6">Tiêu chuẩn chức danh</a></li>
                <li><a href="#tab7">Mối quan hệ công việc</a></li>


            </ul>

            <div class="tab_container">
   <div id="tab1" class="tab_content">
       
        <dx:aspxhtmleditor id="txtTomTat" clientinstancename="txtTomTat" runat="server" height="350px"
             width="980px"
             cssfilepath="~/App_Themes/Glass/{0}/styles.css" csspostfix="Glass">

           <StylesStatusBar>
               <StatusBar TabSpacing="0px">
               </StatusBar>
           </StylesStatusBar>
           <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> </Images>
            
       </dx:aspxhtmleditor>
  
   </div>
     <div id="tab2" class="tab_content">
         <dx:aspxhtmleditor id="txtChiTietCongViec" clientinstancename="txtChiTietCongViec" runat="server" height="350px"
             width="980px"
             cssfilepath="~/App_Themes/Glass/{0}/styles.css" csspostfix="Glass">

           <StylesStatusBar>
               <StatusBar TabSpacing="0px">
               </StatusBar>
           </StylesStatusBar>
           <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> </Images>
             
       </dx:aspxhtmleditor>


     </div>
    
     <div id="tab4" class="tab_content">
         
          <dx:ASPxMemo ID="txtTrachNhiemCongViec"   ClientInstanceName="txtTrachNhiemCongViec" runat="server" Height="350px"
           Width="980px"
           CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">

          
       </dx:ASPxMemo>
     </div>
     <div id="tab5" class="tab_content">
          <dx:ASPxHtmlEditor ID="txtDieuKienLamViec" ClientInstanceName="txtDieuKienLamViec" runat="server" Height="350px"
           Width="980px"
           CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">

           <StylesStatusBar>
               <StatusBar TabSpacing="0px">
               </StatusBar>
           </StylesStatusBar>
           <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> </Images>
               
       </dx:ASPxHtmlEditor>

     </div>
      <div id="tab6" class="tab_content">
        <table style="width: 980px; padding: 2px;">
   
    <tr>
        <td>
    
                        <table style="width: 970px;">
                            <tr>

                                  <td  style="width: 220px; vertical-align: top;">
                                                
                                                 <dx:ASPxListBox ID="lstChuyenNganh" runat="server" Width="230px" ClientInstanceName="lstChuyenNganh"
                                                    SelectionMode="CheckColumn" ValueField="id" TextField="ten" EnableSynchronization="False"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                    Height="160px">


                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                </dx:ASPxListBox>
                                            </td>
                                 <td style="width: 220px; vertical-align: top;">
                                                <dx:ASPxListBox ID="listTrinhDo" runat="server" Width="230px" ClientInstanceName="listTrinhDo"
                                                    SelectionMode="CheckColumn" ValueField="id" TextField="ten" EnableSynchronization="False"
                                                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                                    Height="160px">


                                                    <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                                    </LoadingPanelImage>
                                                </dx:ASPxListBox>

                                            </td>
                                <td style="width: 150px; vertical-align: top;">
                                    <dx:ASPxListBox ID="listKinhNghiem" runat="server" Width="100%" ClientInstanceName="listKinhNghiem"
                                        SelectionMode="CheckColumn" ValueField="Id" TextField="KinhNghiem" EnableSynchronization="False"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Height="160px">

                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                                <td style="width: 150px; vertical-align: top;">
                                    <dx:ASPxListBox ID="lstKyNang" runat="server" Width="100%" ClientInstanceName="lstKyNang"
                                        SelectionMode="CheckColumn" ValueField="Id" TextField="KyNang" EnableSynchronization="False"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Height="160px">

                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                                <td style="width: 200px; vertical-align: top;">
                                    <dx:ASPxListBox ID="listTrinhDoKhac" runat="server" Width="100%" ClientInstanceName="listTrinhDoKhac"
                                        SelectionMode="CheckColumn" ValueField="Id" TextField="TrinhDo" EnableSynchronization="False"
                                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                        Height="160px">

                                        <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                    </dx:ASPxListBox>
                                </td>
                            </tr>
                            <tr>
                                <td >Yêu cầu về giới tính</td>
                                <td >
                                     <dx:ASPxTextBox ClientInstanceName="txtYeuCauGioiTinh" ID="txtYeuCauGioiTinh" runat="server" 
                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                      
                                    </dx:ASPxTextBox>

                                </td>
                                 <td>Đối tượng ưu tiên</td>
                                <td colspan="2" >
                                     <dx:ASPxTextBox ClientInstanceName="txtDoiTuongUuTien" ID="txtDoiTuongUuTien" runat="server"
                                        Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                      
                                    </dx:ASPxTextBox>

                                </td>
                                
                            </tr>
                             <tr>
                                <td colspan="5">Yêu cầu khác</td></tr>
                            <tr>
                                <td colspan="5">
                                     <dx:ASPxMemo ID="txtYeuCauKhac"   ClientInstanceName="txtYeuCauKhac" runat="server" Height="150px"
           Width="970px"
           CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">

          
       </dx:ASPxMemo>
                                     


                                </td>

                            </tr>
                        </table>
                  
                  
        </td>

    </tr>
</table>

    </div>
     <div id="tab7" class="tab_content">
          <dx:ASPxHtmlEditor ID="txtQuanHeCongTac" ClientInstanceName="txtQuanHeCongTac" runat="server" Height="300px"
           Width="980px"
           CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">

           <StylesStatusBar>
               <StatusBar TabSpacing="0px">
               </StatusBar>
           </StylesStatusBar>
           <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"> </Images>
              
       </dx:ASPxHtmlEditor>

     </div>
      
</div>

        </td>

    </tr>
    <tr>
        <td style="text-align:center">

   <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Lưu" Height="22px" 
                            AutoPostBack="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass"
                            SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Width="100px" OnClick="ASPxButton1_Click">
                            
                            <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/HRM/save_16.png" Repeat="NoRepeat"
                                VerticalPosition="center" />
                        </dx:ASPxButton>

        </td>

    </tr>

</table>

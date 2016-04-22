<%@ Control Language="VB" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

<link href="./Portals/3/Skins/OMS/Styles/Style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./Portals/3/Skins/OMS/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./Portals/3/Skins/OMS/js/hcjs.js"></script>

<body>
	<!--header -->
	<div id="header">
    	<div class="ct">    		
             <!--Head block -->
             <div id="head_bl">
             	<div id="menu">
                	<a href="#" class="logo"></a>
                    <!--Menu-->
                    <ul>
                    	<li class="selected"><a href="#">TRANG CHỦ</a></li>
                        <li><a href="#">GIỚI THIỆU</a></li>
                        <li><a href="#">TIN TỨC</a>
                        	<ul class="submenuf1">
                         		   <li><a href="#">Sub tin tức 1</a></li>
                                    <li><a href="#">Sub tin tức 2</a></li>
                                     <li><a href="#">Sub tin tức 3</a></li>
                                      <li><a href="#">Sub tin tức 4</a></li>
                            </ul>
                        </li>
                        <li><a href="#">TÀI LIỆU - BIỂU MẪU</a></li>
                        <li><a href="#">LIÊN HỆ</a></li>
                    </ul>                   
                    	
                    <!-- End menu -->                    
                </div>               
             </div>
             
              <!-- End Head block -->
            
        </div>
        <div class="ct">   
             <!--Head block -->
             <div style="margin:20px 0">             
                <div class="ct">
                	<div style="width:630px; min-height:415px; overflow:hidden; float:left">
                    	<img src="images/slide.png" />
                    </div>
                    
                    <div style="width:300px; float:right">
                             <!--Login -->
                                <div class="block row1 login" style="min-height:400px">
                                    <h3 style="font-weight:bold;">Đăng nhập</h3>
                                    <div class="body">
                                        <div id="ContentPane" runat="server"></div>
                                        <%--<input type="text" class="txt rdu5 account" onclick="this.value=''" value="Tài khoản"/>
                                        <input type="text" class="txt rdu5 pass" onclick="this.value=''"  value="Mật khẩu"/>                
                                        <input type="submit" class="button rdu5 btn-add" value="Đăng nhập" />--%>
                                        <ul class="check-wrap"><label > <li><input type="checkbox" class="check" /></li><li><p class="check"> Ghi nhớ mật khẩu</p></li></label></ul>
                                        
                                        <div id="topbar">                                            
                                       
                                        <!--Social -->
                                        <ul class="social">
                                            <li><a href="#" class="fb"></a></li>
                                            <li><a href="#" class="goo"></a></li>
                                            <li><a href="#" class="yout"></a></li>
                                            <li><a href="#" class="tw"></a></li>
                                        </ul> 
                                        <!--End Social -->
                                        <div class="clearfix"></div>
                                    	</div>     
                                        <div class="sub"><a href="#">Quên mật khẩu ?</a></div>
                                    </div>
                                </div>
                                 <!--End Login -->
                    </div>
                	
                </div>
             </div>
             
              <!-- End Head block -->            
        </div>
    </div>
   
     <!--Footer-->        
       <div id="footer">
       		<div class="ct">
            	<div class="left">Copyright©  2015  VNPT</div>                
                <div class="clearfix"></div>
             </div>
       </div>       
     <!--End footer-->     
</body>
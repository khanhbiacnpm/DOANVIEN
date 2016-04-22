<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MoTaCongViec.ascx.cs"
    Inherits="VNPT.Modules.ThongTinNhanVien.MoTaCongViec" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<script type="text/javascript">

    function SaveBangCap() {

        if (cmbBangCap.GetValue() == 0) {

            cmbBangCap.SetFocus();
            alert('Xin vui lòng chọn bằng cấp !');
            return false;
        }
        else if (cmbLoaiBangCap.GetValue() == 0) {

            cmbLoaiBangCap.SetFocus();
            alert('Xin vui lòng chọn loại bằng cấp !');
            return false;
        }
        else if (cmbCNDaoTao.GetValue() == 0) {

            cmbCNDaoTao.SetFocus();
            alert('Xin vui lòng chọn chuyên ngành !');
            return false;
        }
        else if (cboTrainingFormBangCap.GetValue() == 0) {

            cboTrainingFormBangCap.SetFocus();
            alert('Xin vui lòng chọn hình thức đào tạo !');
            return false;
        }
        else if (txtTruongCap.GetText() == "") {

            txtTruongCap.SetFocus();
            alert('Xin vui lòng nhập trường cấp bằng !');
            return false;
        }
        else if (txtNamTotNghiep.GetText() == "") {

            txtNamTotNghiep.SetFocus();
            alert('Xin vui lòng nhập năm tốt nghiệp !');
            return false;
        }
        else if (cmbResult.GetValue() == 0) {

            cmbResult.SetFocus();
            alert('Xin vui lòng chọn kết quả !');
            return false;
        }
        else { gridBangCap.UpdateEdit(); }
    }
</script>

    <table style="font-size: 11pt; font-family: Times New Roman;" >
        <tr>
            <td valign="top" style="width: 180px;">
                <b>Nhóm chức danh công việc</b>
            </td>
            <td valign="top">
                <asp:Label ID="lblNhomChucDanh" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <b>Chức danh công việc</b>
            </td>
            <td valign="top">
                <asp:Label ID="lblChucDanh" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Literal   ID="lblTomTat" runat="server"></asp:Literal>
            </td>
        </tr>
         <tr>
            <td valign="top" colspan="2" style="text-indent: 5px;">
              

                     <asp:Label ID="lblChiTiet" runat="server"></asp:Label>
                  
                
            </td>
        </tr>
     
        <tr>
            <td valign="top" colspan="2" >
                <table style="margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border-width: 1px; border-style: solid;border-color:#000000;" cellpadding="5">
                    <tr><td colspan='2' style="font-size:13pt" ><strong>III. TRÁCH NHIỆM </strong></td></tr>
                    <tr>
                        <td>

                            <asp:Label ID="lblTrachNhiem" runat="server"></asp:Label>
                        </td>
                    </tr>
                   
                    </table>
                
            </td>
        </tr>
        
                    <tr>
                        <td colspan="2">

                             <dx:ASPxLabel EncodeHtml="false"  ID="lblDieuKienLamViec" runat="server"></dx:ASPxLabel>
                        </td>
                    </tr>
        <tr>
            <td valign="top" colspan="2" style="text-indent: 5px;">
                <table style="margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border-width: 1px; border-style: solid;border-color:#000000;">
                    <tr><td colspan='2' style="font-size:13pt" ><strong>V.TIÊU CHUẨN CHỨC DANH </strong></td></tr>
                      <tr>
                         <td style="width: 50%;vertical-align:top">
                             <table style="width: 320px;">
                                 <tr ><td>1.	Yêu cầu trình độ tối thiểu : </td></tr>
                                 <tr>

                                     <td style="width: 99%; vertical-align: top;height:auto">
                                         <dx:ASPxListBox  Border-BorderWidth="0px" ID="listTrinhDo" runat="server" Width="100%" ClientInstanceName="listTrinhDo"
                                             SelectionMode="CheckColumn" ImageUrlField="trinhdoyeucau"  EnableSynchronization="False"
                                             CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                      Height="160px">
                                             
                                         </dx:ASPxListBox>

                                     </td>
                                 </tr>
                                 <tr><td style="vertical-align:top">Chuyên ngành đào tạo : </td></tr>
                                 <tr>
                                     <td style="width: 99%; vertical-align: top;">

                                         <dx:ASPxListBox Border-BorderWidth="0px" ID="lstChuyenNganh" runat="server" Width="100%" ClientInstanceName="lstChuyenNganh"
                                         ValueField="id"  TextField="ten" EnableSynchronization="False"    ImageUrlField="dapung"
                                             CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                             
                                           >


                                             <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                             </LoadingPanelImage>
                                         </dx:ASPxListBox>
                                     </td>


                                 </tr>
                                  <tr><td style="vertical-align:top">2.Yêu cầu trình độ khác : </td></tr>
                                 <tr>

                                     <td style="width: 99%; vertical-align: top;">
                                         <dx:ASPxListBox ID="listTrinhDoKhac" Border-BorderWidth="0px" runat="server" Width="100%" ClientInstanceName="listTrinhDoKhac"
                                             SelectionMode="CheckColumn"  ValueField="Id" TextField="TrinhDo" EnableSynchronization="False"
                                             CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                           >

                                             <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                             </LoadingPanelImage>
                                         </dx:ASPxListBox>
                                     </td>
                                 </tr>
                             </table>

                         </td>
                         <td style="width: 50%;vertical-align:top;">
                             <table style="width: 320px;">
                                    <tr><td>3.Kỹ năng : </td></tr>
                                 <tr>

                                     <td style="width: 99%; vertical-align: top;">
                                         <dx:ASPxListBox ID="lstKyNang" runat="server" Width="100%" ClientInstanceName="lstKyNang"
                                             ImageUrlField="dapung" Border-BorderWidth="0px" ValueField="Id" TextField="KyNang" EnableSynchronization="False"
                                             CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                       >

                                             <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                             </LoadingPanelImage>
                                         </dx:ASPxListBox>
                                     </td>

                                 </tr>
                                  <tr><td>4.Kinh nghiệm làm việc : </td></tr>
                                  <tr>

                                     <td style="width: 99%; vertical-align: top;">
                                         <dx:ASPxListBox ID="listKinhNghiem" runat="server" Width="100%" ClientInstanceName="listKinhNghiem" 
                                             SelectionMode="CheckColumn" ImageUrlField="KinhNghiemYeuCau" Border-BorderWidth="0px" ValueField="Id" TextField="KinhNghiem" EnableSynchronization="False"
                                             CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css"
                                          >

                                             <LoadingPanelImage Url="~/App_Themes/Glass/Editors/Loading.gif">
                                             </LoadingPanelImage>
                                         </dx:ASPxListBox>
                                     </td>
                                 </tr>
                                
                               
                             </table>
                         </td>
                     </tr>
                    
        
                 <tr>
                      <td>
                          <dx:ASPxLabel EncodeHtml="false" ID="lblYeuCauChucDanh_GioiTinh" runat="server"></dx:ASPxLabel>

                      </td>
                      <td>
                          <dx:ASPxLabel EncodeHtml="false" ID="lblYeuCauChucDanh_DoiTuong" runat="server"></dx:ASPxLabel>

                      </td>
                  </tr>
                 <tr><td colspan="2"><b>Yêu cầu khác : </b> <br />
                       <dx:ASPxLabel Font-Size="15px" Font-Names=" Times New Roman" EncodeHtml="true"  ID="lblYeuCauKhac" runat="server"></dx:ASPxLabel>
                       </td></tr>
                   
                    </table>
                
            </td>
        </tr>
       
        
         <tr>
            <td valign="top" colspan="2">
                <asp:Label ID="lblMoiQuanHeTrongCongViec" runat="server"></asp:Label>
            </td>
        </tr>
    </table>






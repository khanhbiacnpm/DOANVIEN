/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using DevExpress.Web.ASPxHiddenField;
namespace VNPT.Modules.MTCV
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewBloodGroup class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class MTCV : PortalModuleBase, IActionable
    {             
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {

            DotNetNuke.Framework.jQuery.RequestRegistration();
                try
                {
                    if (!this.IsPostBack)
                    {
                        LoadData();
                        LoadDefault();
                    }

                    
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
           

        }

        private void LoadDefault()
        {


            string stomtat = "<table style=\"margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border-width: 1px; border-style: solid;border-color:#000000;padding:5px;\">";
            stomtat += "<tbody><tr><td style=\"font-size:13pt\"><strong>I. TÓM TẮT CÔNG VIỆC</strong></td></tr>";            
            stomtat +="<tr><td>- </td></tr>";
       
            stomtat +="</tbody></table>";
            this.txtTomTat.Html = stomtat;
            string mota = "<table style=\"margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border-width: 1px; border-style: solid;border-color:#000000;padding:5px;\">";
            mota +="<tbody><tr><td style=\"font-size:13pt\" ><strong>II. MÔ TẢ CHI TIẾT CÔNG VIỆC</strong></td></tr>";
            mota += "<tr><td style=\"font-size:13pt\"><strong>1.Công việc chính </strong></td></tr>";
            mota += "<tr><td>- </td></tr>";

           
          
          
            mota += "<tr><td style=\"font-size:13pt\"><strong>2.Công việc khác </strong>(Do lãnh đạo đơn vị hoặc cấp quản lý trực tiếp giao)</td></tr>";
            mota += "<tr><td>- </td></tr>";
           
            mota += "  </tbody></table>";
            mota += "</td></tr></tbody></table>";
            this.txtChiTietCongViec.Html = mota;
            //dieu kien lam viec
            string dieukien = "<table style=\"margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border-width: 1px; border-style: solid;border-color:#000000;padding:5px;\">";
            dieukien += "<tr><td style=\"font-size:13pt\" ><strong>IV. ĐIỀU KIỆN LÀM VIỆC</strong></td></tr>";
            dieukien += "<tr> <td><b>- Thời giờ làm việc :</b></td></tr>";
            dieukien += "<tr><td>- </td></tr>";
            dieukien += "<tr> <td><b>- Máy móc/ công cụ/ trang thiết bị :</b></td></tr>";
            dieukien += "<tr><td>- </td></tr>";
            dieukien += "<tr> <td><b>- Bảo hộ lao động :</b></td></tr>";
            dieukien += "<tr><td>- </td></tr>";
            dieukien += "<tr> <td><b>-  Môi trường làm việc :</b></td></tr>";
            dieukien += "<tr><td>- </td></tr>";
            dieukien += "</table>";

            this.txtDieuKienLamViec.Html = dieukien;
            string quanhe = "<table style=\"margin-left:10px; width: 750px; font-size: 11pt; font-family: Times New Roman; border-collapse: collapse; border:solid  1px #000000;\">";
            //quanhe += "<tr><td colspan='2' style=\"font-size:13pt\" ><strong>VI. MỐI QUAN HỆ TRONG CÔNG VIỆC</strong></td></tr>";
            //quanhe += "<tr><td style='width:50%;'><table style='width:100%;'>";
            //quanhe += "<tr><td style='width:100%;'><b>Bên trong </b> </td></tr>";
            //quanhe += "<tr><td>- </td></tr>";
            //quanhe += "</table></td>";
            //    quanhe += "<td style='width:50%;'><table style='width:100%;'>";
            //    quanhe += "<tr><td style='width:100%;'><b>Bên ngoài </b> </td></tr>";

            //    quanhe += "<tr><td>- </td></tr>";

            //    quanhe += "</table></td></tr>";
            //    quanhe += "<tr><td colspan='2'><strong>Ghi chú</strong></td></tr>";

                quanhe += "<tr><td colspan='2'>- </td></tr>";
           
            quanhe += "</table>";
            this.txtQuanHeCongTac.Html = quanhe;
        }
        private void LoadData()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_Combo]", 0);

            cmbNhomChucDanh.DataSource = ds.Tables[0];
            cmbNhomChucDanh.TextField = "ten";
            cmbNhomChucDanh.ValueField = "id";
            cmbNhomChucDanh.DataBind();




            lstChuyenNganh.DataSource = ds.Tables[3];
            lstChuyenNganh.DataBind();

            listTrinhDo.DataSource = ds.Tables[4];
            listTrinhDo.DataBind();

            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetKinhNghiemLamViec]", 0).Tables[0];

            listKinhNghiem.DataSource = tb;
            listKinhNghiem.DataBind();

            DataTable tb1 = SqlHelper.ExecuteDataset(strconn, "[HRM_GetKyNangLamViec1]", 0).Tables[0];

            lstKyNang.DataSource = tb1;
            lstKyNang.DataBind();

            DataTable tb2 = SqlHelper.ExecuteDataset(strconn, "[HRM_GETTRINHDOKHAC]", 0).Tables[0];

            listTrinhDoKhac.DataSource = tb2;
            listTrinhDoKhac.DataBind();
        }
        private void BindChucDanhView(int offId)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_Combo]", offId).Tables[1];
            cmbChucDanh.DataSource = tb;
            cmbChucDanh.ValueField = "id";
            cmbChucDanh.TextField = "ten";
            cmbChucDanh.DataBind();

           
        }
        

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Registers the module actions required for interfacing with the portal framework
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }

        #endregion

        private void BindTieuChuan(DataTable tb, ASPxListBox lst, string column)
        {
            if (tb.Rows.Count > 0)
            {
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    foreach (ListEditItem item in lst.Items)
                    {
                        if (tb.Rows[i][column].ToString().Trim() == item.Value.ToString().Trim())
                        {
                            item.Selected = true;
                        }
                    }
                }
            }
        }
        private void SaveTieuChuan(ASPxListBox lst,int idchucdanh,string proc)
        {

                int l = SqlHelper.ExecuteNonQuery(strconn, proc, 0, idchucdanh, 0,2);
                foreach (ListEditItem sItem in lst.SelectedItems)
                {

                    int id = Convert.ToInt32(sItem.Value.ToString());
                    int n = SqlHelper.ExecuteNonQuery(strconn,proc, 0, idchucdanh, id, 0);
                }
           
          
        }
        protected void cmbChucDanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            int chucdanh = Int32.Parse(cmbChucDanh.Value.ToString());
          
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_LoadMTCV]", chucdanh);
            DataTable tbKyNang = ds.Tables[0];
            DataTable tbKinhNghiem = ds.Tables[1];
            DataTable tbTrinhDo = ds.Tables[3];
            DataTable tbTrinhDoKhac= ds.Tables[2];
            DataTable tbChuyenNganh = ds.Tables[4];
            DataTable tbNoiDung = ds.Tables[5];
            BindTieuChuan(tbKyNang, lstKyNang, "KyNang");
            BindTieuChuan(tbKinhNghiem, listKinhNghiem, "IdKinhNghiem");
            BindTieuChuan(tbTrinhDoKhac, listTrinhDoKhac, "IdTrinhDo");
            BindTieuChuan(tbTrinhDo, listTrinhDo, "IdTrinhDoDaoTao");
            BindTieuChuan(tbChuyenNganh, lstChuyenNganh, "IdChuyenNganh");
            if (tbNoiDung.Rows.Count > 0)
            {
                txtTomTat.Html = tbNoiDung.Rows[0]["TomTatCongViec"].ToString();
                txtChiTietCongViec.Html = tbNoiDung.Rows[0]["ChiTietCongViec"].ToString();
                txtDieuKienLamViec.Html = tbNoiDung.Rows[0]["DieuKienLamViec"].ToString();
                
                txtYeuCauKhac.Text = tbNoiDung.Rows[0]["YeuCauKhac"].ToString();
                txtTrachNhiemCongViec.Text = tbNoiDung.Rows[0]["TrachNhiem"].ToString();
                txtQuanHeCongTac.Html = tbNoiDung.Rows[0]["QuanHeCongTac"].ToString();

            }
        }
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int chucdanh= Int32.Parse(cmbChucDanh.Value.ToString());

            int n1 = SqlHelper.ExecuteNonQuery(strconn, "[HRM_MTCV_MoTaCongViec]", 0, chucdanh, 0, txtTomTat.Html, txtChiTietCongViec.Html,"", txtYeuCauGioiTinh.Text, txtDoiTuongUuTien.Text, txtYeuCauKhac.Text, txtDieuKienLamViec.Html, txtQuanHeCongTac.Html, "", txtTrachNhiemCongViec.Text, 0);
            SaveTieuChuan(lstKyNang, chucdanh, "[HRM_MTCV_KyNangCongViec]");
            SaveTieuChuan(listKinhNghiem, chucdanh, "[HRM_MTCV_KinhNghiemCongViec]");
            SaveTieuChuan(listTrinhDo, chucdanh, "[HRM_MTCV_TrinhDoCongViec]");
            SaveTieuChuan(listTrinhDoKhac, chucdanh, "[HRM_MTCV_TrinhDoCongViecKhac]");
            SaveTieuChuan(lstChuyenNganh, chucdanh, "[HRM_MTCV_ChuyenNganhDaoTao]");

        }
        protected void cmbNhomChucDanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindChucDanhView(Int32.Parse(cmbNhomChucDanh.SelectedItem.Value.ToString()));
        }
}
}


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
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using System.IO;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class MoTaCongViec : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
            {
              
                Load(idNV);
               
            }
        }
        private void LoadData(int idchucdanh,int empid)
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_ChucDanh_Combo]", idchucdanh, empid);


            
            lstChuyenNganh.DataSource = ds.Tables[8];
            lstChuyenNganh.DataBind();

            listTrinhDo.TextField = "ten";
            listTrinhDo.ValueField = "id";           
            listTrinhDo.DataSource = ds.Tables[1];
            listTrinhDo.DataBind();

            listKinhNghiem.DataSource = ds.Tables[6];
            listKinhNghiem.DataBind();


            lstKyNang.DataSource = ds.Tables[9];
            lstKyNang.DataBind();

            

            listTrinhDoKhac.DataSource = ds.Tables[4];
            listTrinhDoKhac.DataBind();
        }
        private void Load(int id)
        {
           
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "[HRM_GetMoTaCongViec]", id).Tables[0];
            
            if (tbl.Rows.Count > 0)
            {
                //lblMoTaCongViec.Text = tbl.Rows[0]["MoTaCongViec"].ToString();
                lblNhomChucDanh.Text = tbl.Rows[0]["NhomChucDanh"].ToString();
                lblChucDanh.Text = tbl.Rows[0]["Name"].ToString();

                lblTomTat.Text =Server.HtmlDecode(tbl.Rows[0]["TomTatCongViec"].ToString());
                lblChiTiet.Text = tbl.Rows[0]["ChiTietCongViec"].ToString();

                       
                lblTrachNhiem.Text = tbl.Rows[0]["TrachNhiem"].ToString();
                lblMoiQuanHeTrongCongViec.Text = tbl.Rows[0]["QuanHeCongTac"].ToString();

                lblDieuKienLamViec.Text = tbl.Rows[0]["DieuKienLamViec"].ToString();
                lblYeuCauChucDanh_GioiTinh.Text = "<b>5.Yêu cầu về giới tính : </b>" + tbl.Rows[0]["YeuCauGioiTinh"].ToString() ;
                lblYeuCauChucDanh_DoiTuong.Text = "<b>6.Đối tượng ưu tiên : </b>" + tbl.Rows[0]["DoiTuongUuTien"].ToString();
                lblYeuCauKhac.Text = tbl.Rows[0]["YeuCauKhac"].ToString();

                int chucdanh = Int32.Parse(tbl.Rows[0]["idChucDanh"].ToString());
                LoadData(chucdanh,id);
                
                DataTable tblTrinhDoKhac = SqlHelper.ExecuteDataset(strconn, "[HRM_GetMoTaCongViec]", id).Tables[4];    
                BindTieuChuan(tblTrinhDoKhac, listTrinhDoKhac, "IdTrinhDo");
                DataTable tbTrinhDo = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_ChucDanh_Combo1]",chucdanh,id).Tables[5];
                int trinhdo =0;
                if (tbTrinhDo.Rows.Count > 0)
                {
                    trinhdo = Int32.Parse(tbTrinhDo.Rows[0]["id"].ToString());

                    foreach (ListEditItem item in listTrinhDo.Items)
                    {

                        if (trinhdo.ToString() == item.Value.ToString().Trim())
                        {

                            item.Selected = true;
                        }
                    }
                }
                DataTable tbKinhNghiem = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_ChucDanh_Combo1]",chucdanh, id).Tables[7];
                int kinhnghiem = 0;
                if (tbKinhNghiem.Rows.Count > 0)
                {
                    kinhnghiem = Int32.Parse(tbKinhNghiem.Rows[0]["IdKinhNghiem"].ToString());
                    foreach (ListEditItem item in listKinhNghiem.Items)
                    {
                        if (kinhnghiem.ToString() == item.Value.ToString().Trim())
                        {
                            item.Selected = true;
                        }
                    }
                }
                
              
            }
          
        }
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
        #region Optional Interfaces
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
    }
}

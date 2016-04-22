using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxUploadControl;
using VNPT.Modules.Unit;
using System.Threading;
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Text;
using DevExpress.Web.ASPxGridView;

namespace DotNetNuke.Modules.QLDVIEN_NGHIEPVU
{
    public partial class QLDV_CongTacDoanVien : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                LoadComBobox();               
            }
        }

        private void LoadComBobox()
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy]", ma_unit).Tables[0];
            cmb_tochuc.DataSource = tb;
            cmb_tochuc.TextField = "TEN_TOCHUC";
            cmb_tochuc.ValueField = "MA_DV";
            cmb_tochuc.DataBind();
            cmb_tochuc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tochuc.SelectedIndex = 0;

            DataTable tb_biendong = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_LOAIVIENDONG_GET", 0, "", 0).Tables[0];
            cmb_biendong.DataSource = tb_biendong;
            cmb_biendong.ValueField = "MA_BIENDONG";
            cmb_biendong.TextField = "TEN_BIENDONG";
            cmb_biendong.DataBind();
            cmb_biendong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_biendong.SelectedIndex = 0;

            cmb_tochuc1.DataSource = tb;
            cmb_tochuc1.TextField = "TEN_TOCHUC";
            cmb_tochuc1.ValueField = "MA_DV";
            cmb_tochuc1.DataBind();
            cmb_tochuc1.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tochuc1.SelectedIndex = 0;

            date_hieuluc.Date = DateTime.Now;            
        }
        protected void btexcel_OnClick(object sender, EventArgs e)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_THANHVIEN_LIST_TOCHUC", cmb_tochuc.Value).Tables[0];
            gridDoanVien.DataSource = tb;
            gridDoanVien.DataBind();
            GridExporter.GridViewID = gridDoanVien.UniqueID;
            GridExporter.WriteXlsToResponse();
        }
        protected void gridDoanVien_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string[] keys = e.Parameters.Split(';');
            decimal ma_dv = Convert.ToDecimal(keys[0]);
            int option = Convert.ToInt32(keys[1]);
            DataTable tb = null;
            if (option == 0)
                tb = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_THANHVIEN_LIST_TOCHUC", ma_dv).Tables[0];
            else
                tb = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_THANHVIEN_LIST_KHONG_TOCHUC", ma_dv).Tables[0];

            gridDoanVien.DataSource = tb;
            gridDoanVien.DataBind();
        }
        protected void gridDVChiTiet_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string[] keys = e.Parameters.Split(';');
            string dieukien = keys[0];
            decimal ma_thanhvien = Convert.ToDecimal(keys[1]);
            if (dieukien == "hienthi")
            {
                hienthi_lichsu(ma_thanhvien);
                gridDVChiTiet.JSProperties["cpHT"] = 0;
                gridDVChiTiet.JSProperties["cpMADV"] = keys[2];
            }
            else if (dieukien == "luu")
            {
                decimal ma_dv_di = Convert.ToDecimal(keys[2]);
                decimal ma_dv_den = Convert.ToDecimal(keys[3]);

                string fileqd = "";
                if (Session["fileDieuDong"] != null)
                {
                    fileqd = Session["fileDieuDong"].ToString();
                    Session.Remove("fileDieuDong");
                }
                SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_LICHSU_BIENDONG_UI",
                    0, ma_thanhvien, ma_dv_di, ma_dv_den, cmb_biendong.Value, txt_lydo.Text, txtQuyetDinh.Text,
                    fileqd, date_hieuluc.Value, 0);

                hienthi_lichsu(ma_thanhvien);
                gridDVChiTiet.JSProperties["cpHT"] = 1;
            }else if(dieukien =="xoa"){
                decimal ma_lichsu = Convert.ToDecimal(keys[2]);
                SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_LICHSU_BIENDONG_UI",
                    ma_lichsu, 0, 0, 0, 0, "", "",
                    "", date_hieuluc.Value, 1);
                hienthi_lichsu(ma_thanhvien);
                gridDVChiTiet.JSProperties["cpHT"] = 2;
            }
        }
        private void hienthi_lichsu(decimal ma_thanhvien)
        {
            DataTable tb_chitiet = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_LICHSU_CONGTAC_THANHVIEN", ma_thanhvien).Tables[0];
            gridDVChiTiet.DataSource = tb_chitiet;
            gridDVChiTiet.DataBind();
        }
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileDieuDong"] = filename;
            }
        }
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }
    }
}

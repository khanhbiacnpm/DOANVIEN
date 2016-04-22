using System;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
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

namespace VNPT.Modules.DaoTao
{
    partial class ToChucBoiDuong : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                load_data_combo();
                load_data_grid(cmb_nam.Value);
            }
        }
        protected void cmb_khoadaotao_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_combokhoadaotao(e.Parameter);
        }
        private void load_combokhoadaotao(string str)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO_KEHOACH_IDCN]", str, 0).Tables[0];
            cmb_khoadaotao.DataSource = tb;
            cmb_khoadaotao.TextField = "tendaotao";
            cmb_khoadaotao.ValueField = "id";
            cmb_khoadaotao.DataBind();            
            if (tb.Rows.Count == 0)
                cmb_khoadaotao.JSProperties["cpOpcb"] = 0;
            else 
                cmb_khoadaotao.JSProperties["cpOpcb"] = 1;
        }
        protected void cmb_nam_OnCallback(object sender, EventArgs e)
        {
            load_comb_nam();
        }
        protected void gridToChucBoiDuong_OnCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            load_data_grid(e.Parameters);
        }
        private void load_data_grid(object nam)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GET_KHOADAOTAO", nam, 0, 0).Tables[0];
            gridToChucBoiDuong.DataSource = tb;
            gridToChucBoiDuong.DataBind();
        }
        private void load_comb_nam()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", 0, 0, 0);
            DataTable tb6 = ds.Tables[6];
            cmb_nam.Items.Clear();
            foreach (DataRow row in tb6.Rows)
            {
                cmb_nam.Items.Add("Năm " + row[0], row[0]);
            }
            cmb_nam.JSProperties["cpNam"] = date_tungay.Date.Year;
        }
        private void load_data_combo()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", 0, 0, 0);
            //cmb_trinhdo.DataSource = ds.Tables[1];
            //cmb_trinhdo.ValueField = "id";
            //cmb_trinhdo.TextField = "ten";
            //cmb_trinhdo.DataBind();
            //cmb_trinhdo.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            //cmb_trinhdo.SelectedIndex = 0;

            //cmb_hinhthucdaotao.DataSource = ds.Tables[2];
            //cmb_hinhthucdaotao.ValueField = "id";
            //cmb_hinhthucdaotao.TextField = "ten";
            //cmb_hinhthucdaotao.DataBind();
            //cmb_hinhthucdaotao.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            //cmb_hinhthucdaotao.SelectedIndex = 0;

            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmb_donvi.ValueField = "id";
            cmb_donvi.TextField = "ten";
            cmb_donvi.DataBind();
            cmb_donvi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_donvi.SelectedIndex = 0;

            cmb_diadiemtochuc.DataSource = ds.Tables[4];
            cmb_diadiemtochuc.ValueField = "id";
            cmb_diadiemtochuc.TextField = "ten";
            cmb_diadiemtochuc.DataBind();
            cmb_diadiemtochuc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_diadiemtochuc.SelectedIndex = 0;

            cmb_chuyennganh.DataSource = ds.Tables[5];
            cmb_chuyennganh.ValueField = "id";
            cmb_chuyennganh.TextField = "ten";
            cmb_chuyennganh.DataBind();
            cmb_chuyennganh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_chuyennganh.SelectedIndex = 0;

            DataTable tb6 = ds.Tables[6];
            foreach (DataRow row in tb6.Rows)
            {
                cmb_nam.Items.Add("Năm " + row[0], row[0]);
            }
            var item = cmb_nam.Items.FindByValue(DateTime.Now.Year);
            if (item != null)
                item.Selected = true;

                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO_NHANVIEN]", gridToChucBoiDuong.GetRowValues(gridToChucBoiDuong.EditingRowVisibleIndex,"id"), 0).Tables[0];
                lbChoosen.DataSource = tb;
                lbChoosen.TextField = "hoten";
                lbChoosen.ValueField = "idnhanvien";
                lbChoosen.DataBind();            
        }
        protected void lbAvailable_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxListBox lstBox = sender as ASPxListBox;
            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", e.Parameter,0, 1);
            lstBox.DataSource = ds.Tables[0];
            lstBox.TextField = "hoten";
            lstBox.ValueField = "id";
            lstBox.DataBind();
        }
        protected void uploadFile_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["file"] = filename;
            }
        }
        protected void grid_nhanvien_Callback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters.Contains("load"))
            {
                load_nhanvien(0, e.Parameters.Replace("load", ""), 1);
            }
            else if (e.Parameters.Contains("save"))
            {
                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxComboBox cmb_ketqua = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["ketqua"] as GridViewDataColumn, "cmb_ketqua") as ASPxComboBox;
                    ASPxDateEdit date_thoidiem = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["thoidiem"] as GridViewDataColumn, "date_thoidiem") as ASPxDateEdit;
                    if (cmb_ketqua != null)
                    {
                        SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAONHANVIEN_UI]", grid_nhanvien.GetRowValues(i, "idkhoahocnv"), 
                            grid_nhanvien.GetRowValues(i,"idkhoadaotao"), grid_nhanvien.GetRowValues(i,"idnhanvien") , 
                            cmb_ketqua.SelectedItem.Value, date_thoidiem.Value);
                    }
                }
                grid_nhanvien.JSProperties["cpoki"] = 1;
            }
        }
        private void load_nhanvien(object idkhoahoc,object idnv, int option)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO_NHANVIEN1]", idkhoahoc, idnv, option).Tables[0];            
            grid_nhanvien.DataSource = tb;
            grid_nhanvien.DataBind();            
        }
        protected void cb_luukhoadaotao_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            object idketqua = 0;
            if (e.Parameter.Contains("save"))
            {
                string filename = string.Empty;
                if (Session["file"] != null)
                {
                    filename = Session["file"].ToString();
                    Session.Remove("file");
                }
                int nguoi_kh = 0;
                int nguoi_th = 0;
                int tien_kh = 0;
                int tien_th = txt_thuchien_kinhphi.Text == "" ? 0 : Convert.ToInt32(txt_thuchien_kinhphi.Text);
                string tenkhoadaotao = cmb_khoadaotao.Value == null ? txt_khoadaotao.Text : cmb_khoadaotao.Text;
                object idkhoadaotaokehoach = cmb_khoadaotao.Value == null ? 0 : cmb_khoadaotao.Value;
                if (check_capnhat.Checked)
                {
                    tenkhoadaotao = txt_khoadaotao.Text;
                    int idkdt = cmb_khoadaotao.Value == null ? 0 : Convert.ToInt32(cmb_khoadaotao.Value);
                    SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAOKEHOACH_UI]", idkdt, 0, tenkhoadaotao, "", 0, 0, null, null, "", 0, 2);
                }

                object idkhoadaotao = SqlHelper.ExecuteScalar(strconn, "[HRM_KHOADAOTAO_UI]", 0, txt_madaotao.Text, idkhoadaotaokehoach, tenkhoadaotao, "",
                    nguoi_kh, nguoi_th, tien_kh, tien_th, txt_nguonkinhphi.Text, txt_cosodaotao.Text,
                    0, cmb_chuyennganh.Value, 0,
                    date_tungay.Value, date_denngay.Value, filename, memo_ghichu.Text, cmb_diadiemtochuc.Value, txt_donvitochuc.Text, check_camket.Checked, 0);

                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxComboBox cmb_ketqua = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["ketqua"] as GridViewDataColumn, "cmb_ketqua") as ASPxComboBox;
                    if (cmb_ketqua != null)
                    {
                        idketqua = cmb_ketqua.Value;
                    }
                    SqlHelper.ExecuteNonQuery(strconn, "HRM_KHOADAOTAONHANVIEN_UI", 0, idkhoadaotao, grid_nhanvien.GetRowValues(i, "idnhanvien"), idketqua, date_denngay.Value);
                }
                cb_luukhoadaotao.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.Contains("update"))
            {
                string filename = string.Empty;
                if (Session["file"] != null)
                {
                    filename = Session["file"].ToString();
                    Session.Remove("file");
                }
                string tenkhoadaotao = cmb_khoadaotao.Value == null ? txt_khoadaotao.Text : cmb_khoadaotao.Text;
                object idkhoadaotaokehoach = cmb_khoadaotao.Value == null ? 0 : cmb_khoadaotao.Value;
                if (check_capnhat.Checked)
                {
                    tenkhoadaotao = txt_khoadaotao.Text;
                    SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAOKEHOACH_UI]", cmb_khoadaotao.Value, 0, tenkhoadaotao, "", 0, 0, null, null, "",idkhoadaotaokehoach, 2); ;
                }
                object idkhoadaotao = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAO_UI]", e.Parameter.Replace("update", ""), txt_madaotao.Text, idkhoadaotaokehoach, tenkhoadaotao, "",
                0, 0,
                0, Convert.ToInt32(txt_thuchien_kinhphi.Text), txt_nguonkinhphi.Text, txt_cosodaotao.Text,
                0, cmb_chuyennganh.Value == null ? 0 : cmb_chuyennganh.Value,
                0,
                date_tungay.Value, date_denngay.Value, filename, memo_ghichu.Text, cmb_diadiemtochuc.Value == null ? 0 : cmb_diadiemtochuc.Value, txt_donvitochuc.Text,
                check_camket.Checked, 0);
                for (int i = 0; i <= grid_nhanvien.VisibleRowCount; i++)
                {                    
                    ASPxComboBox cmb_ketqua = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["ketqua"] as GridViewDataColumn, "cmb_ketqua") as ASPxComboBox;
                    if (cmb_ketqua != null)
                    {
                        idketqua = cmb_ketqua.Value;
                    }
                    SqlHelper.ExecuteNonQuery(strconn, "HRM_KHOADAOTAONHANVIEN_UI", 0, e.Parameter.Replace("update", ""), grid_nhanvien.GetRowValues(i, "idnhanvien"), idketqua, date_denngay.Value);
                }
                cb_luukhoadaotao.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.Contains("delete"))
            {
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_GET_KHOADAOTAO]", e.Parameter.Replace("delete",""),0, 10);
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridToChucBoiDuong.GetRowValues(gridToChucBoiDuong.FocusedRowIndex, "quyetdinh"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
                cb_luukhoadaotao.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.Contains("loadedit"))
            {
                DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO_NHANVIEN1]", e.Parameter.Replace("loadedit", ""), "", 0);
                DataTable tb1 = ds.Tables[0];
                if (tb1.Rows.Count > 0)
                {
                    txt_madaotao.Text = tb1.Rows[0]["madaotao"].ToString();
                    txt_donvitochuc.Text = tb1.Rows[0]["donvitochuc"].ToString();
                    txt_khoadaotao.Text = tb1.Rows[0]["khoadaotao"].ToString();
                    txt_nguonkinhphi.Text = tb1.Rows[0]["nguonkinhphi"].ToString();
                    txt_cosodaotao.Text = tb1.Rows[0]["cosodaotao"].ToString();
                    //txt_kehoachsoluonghocvien.Text = tb1.Rows[0]["kehoach_soluonghocvien"].ToString();
                    //txt_thuchien_soluonghocvien.Text = tb1.Rows[0]["thuchien_soluonghocvien"].ToString();
                    //txt_kehoachkinhphi.Text = tb1.Rows[0]["kehoach_kinhphi"].ToString();
                    txt_thuchien_kinhphi.Text = tb1.Rows[0]["thuchien_kinhphi"].ToString();
                    memo_ghichu.Text = tb1.Rows[0]["ghichu"].ToString();
                    //var itemhinhthuc = cmb_hinhthucdaotao.Items.FindByValue(tb1.Rows[0]["idhinhthucdaotao"]);
                    //if (itemhinhthuc != null)
                    //    itemhinhthuc.Selected = true;
                    //var itemtrinhdo = cmb_trinhdo.Items.FindByValue(tb1.Rows[0]["idtrinhdo"]);
                    //if (itemtrinhdo != null)
                    //    itemtrinhdo.Selected = true;
                    var itemdiadiem = cmb_diadiemtochuc.Items.FindByValue(tb1.Rows[0]["iddiadiemtochuc"]);
                    if (itemdiadiem != null)
                        itemdiadiem.Selected = true;
                    var itemnganhdaotao = cmb_chuyennganh.Items.FindByValue(tb1.Rows[0]["idchuyennganh"]);
                    if (itemnganhdaotao != null)
                        itemnganhdaotao.Selected = true;
                    date_tungay.Value = tb1.Rows[0]["tungay"];
                    date_denngay.Value = tb1.Rows[0]["denngay"];
                    load_combokhoadaotao(Convert.ToDateTime(tb1.Rows[0]["tungay"]).Year + "," + cmb_chuyennganh.Value);                    
                    var itemkhoadaotao = cmb_khoadaotao.Items.FindByValue(tb1.Rows[0]["idkhoadaotaokehoach"]);
                    if (itemkhoadaotao != null)
                        itemkhoadaotao.Selected = true;
                    else
                        cb_luukhoadaotao.JSProperties["cpShow"] = 0;  
                }
                grid_nhanvien.DataSource = ds.Tables[1];
                grid_nhanvien.DataBind();
                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxComboBox cmb_ketqua = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["ketqua"] as GridViewDataColumn, "cmb_ketqua") as ASPxComboBox;
                    if (cmb_ketqua != null)
                    {
                        var item = cmb_ketqua.Items.FindByValue(grid_nhanvien.GetRowValues(i, "ketqua"));
                        if (item != null)
                            item.Selected = true;
                    }
                }
                var list = (from x in ds.Tables[1].AsEnumerable()
                            select new
                            {
                                id = x.Field<Int32>("idnhanvien"),
                                hoten = x.Field<string>("hoten")
                            }).ToJson();
                cb_luukhoadaotao.JSProperties["cpListNV"] = list;
                cb_luukhoadaotao.JSProperties["cpOP"] = 1;
            }
            else if (e.Parameter.Contains("loadnull"))
            {
                txt_madaotao.Text = "";
                txt_donvitochuc.Text = "";
                txt_khoadaotao.Text = "";
                txt_nguonkinhphi.Text = "";
                txt_cosodaotao.Text = "";
                //txt_kehoachsoluonghocvien.Text = "";
                //txt_thuchien_soluonghocvien.Text = "";
                //txt_kehoachkinhphi.Text = "";
                txt_thuchien_kinhphi.Text = "";
                memo_ghichu.Text = "";
                //cmb_hinhthucdaotao.SelectedIndex = 0;
                //cmb_trinhdo.SelectedIndex = 0;
                cmb_diadiemtochuc.SelectedIndex = 0;
                cmb_chuyennganh.SelectedIndex = 0;
                date_tungay.Value = null;
                date_denngay.Value = null;
                grid_nhanvien.DataSource = null;
                grid_nhanvien.DataBind();
                cb_luukhoadaotao.JSProperties["cpOP"] = 2;
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

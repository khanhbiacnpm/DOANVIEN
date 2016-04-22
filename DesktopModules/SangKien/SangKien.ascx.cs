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

namespace VNPT.Modules.SangKien
{
    partial class SangKien : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                load_data_combo();
                load_grid(cmb_nam.Value == null ? 0 : cmb_nam.Value);
            }
        }        
        protected void cmb_nam_OnCallback(object sender, EventArgs e)
        {
            load_comb_nam();
        }
        protected void cmb_loai_OnCallback(object sender, EventArgs e)
        {
            load_combo_loai();
        }
        private void load_combo_loai()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_SANGKIEN_GET]", 0, 0, 1);

            cmb_loai.DataSource = ds.Tables[0];
            cmb_loai.TextField = "ten";
            cmb_loai.ValueField = "id";
            cmb_loai.DataBind();           
        }
        protected void cmb_capquyetdinh_OnCallback(object sender, EventArgs e)
        {
            load_combo_capduyet();
        }
        private void load_combo_capduyet()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_SANGKIEN_GET]", 0, 0, 1);

            cmb_capquyetdinh.DataSource = ds.Tables[1];
            cmb_capquyetdinh.TextField = "ten";
            cmb_capquyetdinh.ValueField = "id";
            cmb_capquyetdinh.DataBind();      
        }
        protected void grid_sangkien_OnCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            load_grid(e.Parameters);
        }
        private void load_grid(object nam)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_SANGKIEN_GET", 0, nam, 0).Tables[0];
            grid_sangkien.DataSource = tb;
            grid_sangkien.DataBind();
        }
        
        private void load_comb_nam()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_SANGKIEN_GET]", 0, 0, 1);
            DataTable tb = ds.Tables[3];
            cmb_nam.Items.Clear();
            foreach (DataRow row in tb.Rows)
            {
                cmb_nam.Items.Add("Năm " + row[0], row[0]);
            }
            cmb_nam.JSProperties["cpNam"] = date_ngayqd.Date.Year;
        }
        private void load_data_combo()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_SANGKIEN_GET]", 0,0, 1);

            cmb_loai.DataSource = ds.Tables[0];
            cmb_loai.TextField = "ten";
            cmb_loai.ValueField = "id";
            cmb_loai.DataBind();
            cmb_loai.Items.Insert(0, new ListEditItem("-- Chọn --", 0));
            cmb_loai.SelectedIndex = 0;

            cmb_capquyetdinh.DataSource = ds.Tables[1];
            cmb_capquyetdinh.TextField = "ten";
            cmb_capquyetdinh.ValueField = "id";
            cmb_capquyetdinh.DataBind();
            cmb_capquyetdinh.Items.Insert(0, new ListEditItem("-- Chọn --", 0));
            cmb_capquyetdinh.SelectedIndex = 0;

            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmb_donvi.ValueField = "id";
            cmb_donvi.TextField = "ten";
            cmb_donvi.DataBind();
            cmb_donvi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_donvi.SelectedIndex = 0;

            cmb_nam.Items.Clear();
            foreach (DataRow row in ds.Tables[3].Rows)
            {
                cmb_nam.Items.Add("Năm " + row[0], row[0]);
            }
            var item_nam = cmb_nam.Items.FindByValue(DateTime.Now.Year);
            if (item_nam != null)
                item_nam.Selected = true;
        }
        protected void lbAvailable_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxListBox lstBox = sender as ASPxListBox;
            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", e.Parameter,1, 1);
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
        }
        private void load_nhanvien(object idkhoahoc,object idnv, int option)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO_NHANVIEN1]", idkhoahoc, idnv, option).Tables[0];            
            grid_nhanvien.DataSource = tb;
            grid_nhanvien.DataBind();            
        }
        protected void cb_luusangkien_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Boolean chutri = false;
            if (e.Parameter.Contains("save"))
            {
                string filename = string.Empty;
                if (Session["file"] != null)
                {
                    filename = Session["file"].ToString();
                    Session.Remove("file");
                }
                object idsangkien = SqlHelper.ExecuteScalar(strconn, "[HRM_SANGKIEN_UI]", 0, 0, cmb_capquyetdinh.Value, cmb_loai.Value, txt_soqd.Text,
                        date_ngayqd.Value, filename, txt_ten.Text, memo_noidung.Text, 0);

                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxCheckBox checkbox_chutri = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["nvchutri"] as GridViewDataColumn, "chbox_chutri") as ASPxCheckBox;
                    if (checkbox_chutri != null)
                    {
                        chutri = checkbox_chutri.Checked;
                    }
                    SqlHelper.ExecuteNonQuery(strconn, "HRM_SANGKIEN_NHANVIEN_UI", idsangkien, grid_nhanvien.GetRowValues(i, "idnhanvien"), chutri, 0);
                }
                cb_luusangkien.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.Contains("loadedit"))
            {
                DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_SANGKIEN_GET]", e.Parameter.Replace("loadedit", ""), 0, 2);
                DataTable tb = ds.Tables[0];
                if (tb.Rows.Count > 0)
                {
                    txt_soqd.Text = tb.Rows[0]["soqd"].ToString();
                    txt_ten.Text = tb.Rows[0]["ten"].ToString();
                    memo_noidung.Text = tb.Rows[0]["noidung"].ToString();
                    date_ngayqd.Date = Convert.ToDateTime(tb.Rows[0]["ngayqd"]);

                    var item_loai = cmb_loai.Items.FindByValue(tb.Rows[0]["loai"]);
                    if (item_loai != null)
                        item_loai.Selected = true;
                    var item_cap = cmb_capquyetdinh.Items.FindByValue(tb.Rows[0]["capqd"]);
                    if (item_cap != null)
                        item_cap.Selected = true;
                }

                grid_nhanvien.DataSource = ds.Tables[1];
                grid_nhanvien.DataBind();
                
                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxCheckBox chbox_chutri = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["chutri"] as GridViewDataColumn, "chbox_chutri") as ASPxCheckBox;
                    if (chbox_chutri != null)
                    {
                        chbox_chutri.Checked = Convert.ToBoolean(grid_nhanvien.GetRowValues(i, "chutri"));
                    }
                }
                var list = (from x in ds.Tables[1].AsEnumerable()
                            select new
                            {
                                id = x.Field<Int32>("idnhanvien"),
                                hoten = x.Field<string>("hoten")
                            }).ToJson();
                cb_luusangkien.JSProperties["cpListNV"] = list;
                cb_luusangkien.JSProperties["cpOP"] = 1;
            }
            else if (e.Parameter.Contains("update"))
            {
                string filename = string.Empty;
                if (Session["file"] != null)
                {
                    filename = Session["file"].ToString();
                    Session.Remove("file");
                }

                SqlHelper.ExecuteNonQuery(strconn, "[HRM_SANGKIEN_UI]", e.Parameter.Replace("update", ""), 0, cmb_capquyetdinh.Value, cmb_loai.Value, txt_soqd.Text,
                        date_ngayqd.Value, filename, txt_ten.Text, memo_noidung.Text, 1);

                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxCheckBox checkbox_chutri = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["nvchutri"] as GridViewDataColumn, "chbox_chutri") as ASPxCheckBox;
                    if (checkbox_chutri != null)
                    {
                        chutri = checkbox_chutri.Checked;
                    }
                    SqlHelper.ExecuteNonQuery(strconn, "HRM_SANGKIEN_NHANVIEN_UI", e.Parameter.Replace("update", ""), grid_nhanvien.GetRowValues(i, "idnhanvien"), chutri, 0);
                }
                cb_luusangkien.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.Contains("delete"))
            {
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_SANGKIEN_GET]", e.Parameter.Replace("delete", ""), 0, 10);
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grid_sangkien.GetRowValues(grid_sangkien.FocusedRowIndex, "fileqd"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
                cb_luusangkien.JSProperties["cpOP"] = 2;
            }
            else if (e.Parameter.Contains("loadnull"))
            {
                txt_soqd.Text = string.Empty;
                txt_ten.Text = string.Empty;
                memo_noidung.Text = string.Empty;
                date_ngayqd.Value = null;

                cmb_loai.SelectedIndex = 0;
                cmb_capquyetdinh.SelectedIndex = 0;

                cb_luusangkien.JSProperties["cpOP"] = 2;

            }
        }        
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }       
    }
}

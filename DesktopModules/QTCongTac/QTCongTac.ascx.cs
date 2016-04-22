using System;
using System.Web;
using System.Linq;
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
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;
using System.Data;

namespace VNPT.Modules.QTCongTac
{
    partial class QTCongTac : PortalModuleBase, IActionable    
    {                
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!IsPostBack)
            {
                load_dataGrid();
            }
        }
        protected void uploadFileDinhKemTagQTCT_Load(object sender, FileUploadCompleteEventArgs e)
        {           
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss}_{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["file"] = filename;
            }
        }
        private void load_combo()
        {
            var cmb_donvi = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            var cmb_chucdanhb = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanhb") as ASPxComboBox;
            var cmb_chucdanh = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            var cmb_chucvu = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            var cmbNhomChucDanh = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmbNhomChucDanh") as ASPxComboBox;
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_QuaTrinhCongTac_Combo]");

            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmb_donvi.TextField = "ten";
            cmb_donvi.ValueField = "id";
            cmb_donvi.DataBind();
            if (!grdQuaTrinhCongTac.IsNewRowEditing)
            {
                var itemdonvi = cmb_donvi.Items.FindByValue(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "iddonvi"));
                if (itemdonvi != null)
                    itemdonvi.Selected = true;
            }
            // nhom chuc danh
            cmbNhomChucDanh.DataSource = ds.Tables[4];
            cmbNhomChucDanh.TextField = "ten";
            cmbNhomChucDanh.ValueField = "id";
            cmbNhomChucDanh.DataBind();
        
            cmb_chucdanh.DataSource = ds.Tables[2];
            cmb_chucdanh.TextField = "ten";
            cmb_chucdanh.ValueField = "id";
            cmb_chucdanh.DataBind();
            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                
            idNV = Convert.ToInt32(Request.Params["idNV"]);
            DataSet ds1 = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_QuaTrinhCongTac_IdNV]", idNV, 2);
            DataTable dt = ds1.Tables[0];
            
            var cmb_qlnn = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_quanlynhanuoc") as ASPxComboBox;
            int idchucdanh = 0,idqlnn=0,idchucdanhb=0,idnhomchucdanh=0;
            if (!grdQuaTrinhCongTac.IsNewRowEditing)
            {
                idnhomchucdanh = Int32.Parse(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "IdNhomChucDanhB").ToString());
                idchucdanhb = Int32.Parse(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "idchucdanhb").ToString());
                idchucdanh = Int32.Parse(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "idchucdanh").ToString());
                idqlnn = Int32.Parse(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "idqlnn").ToString());
            }
            else {
                idnhomchucdanh = Int32.Parse(dt.Rows[0]["IdNhomChucDanhB"].ToString());
                idchucdanhb = Int32.Parse(dt.Rows[0]["idCDanh_B"].ToString());
                idchucdanh = Int32.Parse(dt.Rows[0]["idCDanh"].ToString());
                idqlnn = Int32.Parse(dt.Rows[0]["idQLNhaNuoc"].ToString());
            }
            //chudanh,quanly nha nuoc
            var itemchucdanh = cmb_chucdanh.Items.FindByValue(idchucdanh);
            if (itemchucdanh != null)
            {
                itemchucdanh.Selected = true;

              
                    load_quanlynhanuoc(idchucdanh, cmb_qlnn);
                    var itemqlnn = cmb_qlnn.Items.FindByValue(idqlnn);
                    if (itemqlnn != null)
                        itemqlnn.Selected = true;
              
            }
            //chucdanh b,nhom chuc danh b
            var itemNhomChucDanh = cmbNhomChucDanh.Items.FindByValue(idnhomchucdanh);
            if (itemNhomChucDanh != null)
            {
                itemNhomChucDanh.Selected = true;
                load_chucdanh(idnhomchucdanh, cmb_chucdanhb);
                var itemcdanhb = cmb_chucdanhb.Items.FindByValue(idchucdanhb);
                if (itemcdanhb != null)
                    itemcdanhb.Selected = true;
            }
          

            cmb_chucvu.DataSource = ds.Tables[3];
            cmb_chucvu.TextField = "ten";
            cmb_chucvu.ValueField = "id";
            cmb_chucvu.DataBind();
            if (!grdQuaTrinhCongTac.IsNewRowEditing)
            {
                var itemchucvu = cmb_chucvu.Items.FindByValue(grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.EditingRowVisibleIndex, "idchucvu"));
                if (itemchucvu != null)
                    itemchucvu.Selected = true;
            }
           
           
            
        }
        #region WorkHistory
        protected void grdQuaTrinhCongTac_EditFormCreated(object sender, EventArgs e)
        {            
            load_combo();            
        }
        protected void grdQuaTrinhCongTac_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmb_donvi = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxComboBox cmb_chucdanhb = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanhb") as ASPxComboBox;
            ASPxComboBox cmb_chucdanh = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            ASPxComboBox cmb_quanlynhanuoc = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_quanlynhanuoc") as ASPxComboBox;
            ASPxComboBox cmb_chucvu = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            ASPxTextBox txt_donvikhac = grdQuaTrinhCongTac.FindEditFormTemplateControl("txt_donvi") as ASPxTextBox;
            ASPxTextBox txt_quyetdinh = grdQuaTrinhCongTac.FindEditFormTemplateControl("txt_quyetdinh") as ASPxTextBox;
            ASPxDateEdit date_batdau = grdQuaTrinhCongTac.FindEditFormTemplateControl("date_batdau") as ASPxDateEdit;
            ASPxDateEdit date_ketthuc = grdQuaTrinhCongTac.FindEditFormTemplateControl("date_ketthuc") as ASPxDateEdit;

            string filename = "";
            if (Session["file"] != null)
            {
                filename = Session["file"].ToString();
                Session.Remove("file");
            }
            int qlnn = cmb_quanlynhanuoc.Value == null ? 0 : Convert.ToInt32(cmb_quanlynhanuoc.Value);
            int chucdanhb = cmb_chucdanhb.Value == null  ? 0 : Convert.ToInt32(cmb_chucdanhb.Value);
            int chucdanh = cmb_chucdanh.Value ==null ? 0 : Convert.ToInt32(cmb_chucdanh.Value);

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_QuaTrinhCongTac_UI]", 0, idNV, cmb_donvi.Value, txt_donvikhac.Text, chucdanhb,
                   chucdanh, qlnn, cmb_chucvu.Value, date_batdau.Value, date_batdau.Value, filename, date_ketthuc.Value, txt_quyetdinh.Text, 0);

            grdQuaTrinhCongTac.CancelEdit();
            e.Cancel = true;
            load_dataGrid();
        }
        protected void grdQuaTrinhCongTac_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cmb_donvi = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxComboBox cmb_chucdanhb = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanhb") as ASPxComboBox;
            ASPxComboBox cmb_chucdanh = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            ASPxComboBox cmb_quanlynhanuoc = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_quanlynhanuoc") as ASPxComboBox;
            ASPxComboBox cmb_chucvu = grdQuaTrinhCongTac.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            ASPxTextBox txt_donvikhac = grdQuaTrinhCongTac.FindEditFormTemplateControl("txt_donvi") as ASPxTextBox;
            ASPxTextBox txt_quyetdinh = grdQuaTrinhCongTac.FindEditFormTemplateControl("txt_quyetdinh") as ASPxTextBox;
            ASPxDateEdit date_batdau = grdQuaTrinhCongTac.FindEditFormTemplateControl("date_batdau") as ASPxDateEdit;
            ASPxDateEdit date_ketthuc = grdQuaTrinhCongTac.FindEditFormTemplateControl("date_ketthuc") as ASPxDateEdit;

            string filename = "";
            if (Session["file"] != null)
            {
                filename = Session["file"].ToString();
                Session.Remove("file");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.FocusedRowIndex, "filequyetdinh"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            int qlnn = cmb_quanlynhanuoc.Value == null ? 0 : Convert.ToInt32(cmb_quanlynhanuoc.Value);
            int chucdanhb = cmb_chucdanhb.Value == null ? 0 : Convert.ToInt32(cmb_chucdanhb.Value);
            int chucdanh = cmb_chucdanh.Value == null ? 0 : Convert.ToInt32(cmb_chucdanh.Value);

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_QuaTrinhCongTac_UI]", e.Keys["id"], idNV, cmb_donvi.Value, txt_donvikhac.Text, chucdanhb,
                   chucdanh, qlnn, cmb_chucvu.Value, date_batdau.Value, date_batdau.Value, filename, date_ketthuc.Value, txt_quyetdinh.Text,1);

            grdQuaTrinhCongTac.JSProperties["cpresult"] = n;  

            grdQuaTrinhCongTac.CancelEdit();
            e.Cancel = true;
            load_dataGrid();
        }
        protected void grdQuaTrinhCongTac_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdQuaTrinhCongTac.GetRowValues(grdQuaTrinhCongTac.FocusedRowIndex, "filequyetdinh"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Get_QuaTrinhCongTac_IdNV", e.Keys["id"], 1);
            grdQuaTrinhCongTac.CancelEdit();
            e.Cancel = true;
            load_dataGrid();
        }              
        protected void cmb_quanlynhanuoc_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox cmb_qlnn = sender as ASPxComboBox;
            if (e.Parameter.ToString().Trim() != "")
            {
                load_quanlynhanuoc(e.Parameter, cmb_qlnn);
            }
        }
        protected void cmb_chucdanhb_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox cmb_chucdanhb = sender as ASPxComboBox;
            if (e.Parameter.ToString().Trim() != "")
            {
                load_chucdanh(Int32.Parse(e.Parameter.ToString()), cmb_chucdanhb);
            }
        }
        private void load_quanlynhanuoc(object idchucdanh, ASPxComboBox cmb_qlnn)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_Get_Luong_heso", idchucdanh,0, 3).Tables[0];
            cmb_qlnn.DataSource = tb;
            cmb_qlnn.ValueField = "id";
            cmb_qlnn.TextField = "ten";
            cmb_qlnn.DataBind();
            cmb_qlnn.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_qlnn.SelectedIndex = 0;
        }
        private void load_chucdanh(int idnhom, ASPxComboBox cmb)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetChucDanhTheoNhom]", idnhom).Tables[0];
            cmb.DataSource = tb;
            cmb.ValueField = "id";
            cmb.TextField = "ten";
            cmb.DataBind();
          
        }
        private void load_dataGrid()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_Get_QuaTrinhCongTac_IdNV", idNV, 0).Tables[0];
                if (tb.Rows.Count > 0)
                   
                grdQuaTrinhCongTac.DataSource = tb;
                grdQuaTrinhCongTac.DataBind();
            }        
        }       
        #endregion
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

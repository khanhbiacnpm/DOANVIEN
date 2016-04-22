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
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using DevExpress.Web.ASPxUploadControl;
using System.IO;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class KiemNhiem : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {                
                DotNetNuke.Framework.jQuery.RequestRegistration();
                load_data();
            }
        }
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
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
        private void load_data()
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KIEMNHIEM]", idNV, 0).Tables[0];              
                gridKiemNhiem.DataSource = tb;
                gridKiemNhiem.DataBind();
            }
        }
        private void load_combo()
        {
            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KIEMNHIEM]", 0, 1);

            ASPxComboBox cmb_loaikiemnhiem = gridKiemNhiem.FindEditFormTemplateControl("cmb_loaikiemnhiem") as ASPxComboBox;
            ASPxComboBox cmb_donvi = gridKiemNhiem.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxComboBox cmb_chucvu = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            ASPxComboBox cmb_chucdanh = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            ASPxComboBox cmb_chucvudang = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvudang") as ASPxComboBox;
            ASPxDateEdit date_ngayqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayqd") as ASPxDateEdit;
            ASPxDateEdit date_ngayhetqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayhetqd") as ASPxDateEdit;

            cmb_loaikiemnhiem.DataSource = ds.Tables[0];
            cmb_loaikiemnhiem.TextField = "ten";
            cmb_loaikiemnhiem.ValueField = "id";
            cmb_loaikiemnhiem.DataBind();

            cmb_chucdanh.DataSource = ds.Tables[1];
            cmb_chucdanh.TextField = "ten";
            cmb_chucdanh.ValueField = "id";
            cmb_chucdanh.DataBind();

            cmb_chucvu.DataSource = ds.Tables[2];
            cmb_chucvu.TextField = "ten";
            cmb_chucvu.ValueField = "id";
            cmb_chucvu.DataBind();

            cmb_chucvudang.DataSource = ds.Tables[3];
            cmb_chucvudang.TextField = "ten";
            cmb_chucvudang.ValueField = "id";
            cmb_chucvudang.DataBind();

            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmb_donvi.TextField = "ten";
            cmb_donvi.ValueField = "id";
            cmb_donvi.DataBind();
        }
        protected void gridKiemNhiem_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_combo();
            if (!gridKiemNhiem.IsNewRowEditing)
            {
                ASPxComboBox cmb_loaikiemnhiem = gridKiemNhiem.FindEditFormTemplateControl("cmb_loaikiemnhiem") as ASPxComboBox;
                ASPxComboBox cmb_donvi = gridKiemNhiem.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
                ASPxComboBox cmb_chucvu = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
                ASPxComboBox cmb_chucdanh = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
                ASPxComboBox cmb_chucvudang = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvudang") as ASPxComboBox;

                var itemlkn = cmb_loaikiemnhiem.Items.FindByValue(gridKiemNhiem.GetRowValues(gridKiemNhiem.EditingRowVisibleIndex, "idloaikiemnhiem"));
                if (itemlkn != null)
                    itemlkn.Selected = true;

                var itemdv = cmb_donvi.Items.FindByValue(gridKiemNhiem.GetRowValues(gridKiemNhiem.EditingRowVisibleIndex, "iddonvi"));
                if (itemdv != null)
                    itemdv.Selected = true;
                
                var itemcv = cmb_chucvu.Items.FindByValue(gridKiemNhiem.GetRowValues(gridKiemNhiem.EditingRowVisibleIndex, "idchucvu"));
                if (itemcv != null)
                    itemcv.Selected = true;

                var itemcvd = cmb_chucvudang.Items.FindByValue(gridKiemNhiem.GetRowValues(gridKiemNhiem.EditingRowVisibleIndex, "idchucvudang"));
                if (itemcvd != null)
                    itemcvd.Selected = true;
                
                var itemcd = cmb_chucdanh.Items.FindByValue(gridKiemNhiem.GetRowValues(gridKiemNhiem.EditingRowVisibleIndex, "idchucdanh"));
                if (itemcd != null)
                    itemcd.Selected = true;                
            }
        }
        protected void gridKiemNhiem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);

            ASPxComboBox cmb_loaikiemnhiem = gridKiemNhiem.FindEditFormTemplateControl("cmb_loaikiemnhiem") as ASPxComboBox;
            ASPxComboBox cmb_donvi = gridKiemNhiem.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxComboBox cmb_chucvu = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            ASPxComboBox cmb_chucvudang = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvudang") as ASPxComboBox;
            ASPxComboBox cmb_chucdanh = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            ASPxTextBox txt_soqd = gridKiemNhiem.FindEditFormTemplateControl("txt_soqd") as ASPxTextBox;
            ASPxDateEdit date_ngayqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayqd") as ASPxDateEdit;
            ASPxDateEdit date_ngayhetqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayhetqd") as ASPxDateEdit;
            ASPxTextBox txt_capqd = gridKiemNhiem.FindEditFormTemplateControl("txt_capqd") as ASPxTextBox;
            ASPxTextBox txt_tochuc = gridKiemNhiem.FindEditFormTemplateControl("txt_tochuc") as ASPxTextBox;
            ASPxMemo txt_ghichu = gridKiemNhiem.FindEditFormTemplateControl("txt_ghichu") as ASPxMemo;
            string filename = "";
            if(Session["file"] !=null){
                filename = Session["file"].ToString();
                Session.Remove("file");
            }
            if (idNV > 0)
            {                
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KIEMNHIEM_UI]", 0, idNV, cmb_loaikiemnhiem.Value, txt_soqd.Text,
                    date_ngayqd.Value, date_ngayhetqd.Value, txt_capqd.Text, cmb_donvi.Value, txt_tochuc.Text, cmb_chucvu.Value, 
                    cmb_chucvudang.Value,cmb_chucdanh.Value,filename, txt_ghichu.Text, 0);
            }
            gridKiemNhiem.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void gridKiemNhiem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);

            ASPxComboBox cmb_loaikiemnhiem = gridKiemNhiem.FindEditFormTemplateControl("cmb_loaikiemnhiem") as ASPxComboBox;
            ASPxComboBox cmb_donvi = gridKiemNhiem.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxComboBox cmb_chucvu = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvu") as ASPxComboBox;
            ASPxComboBox cmb_chucvudang = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucvudang") as ASPxComboBox;
            ASPxComboBox cmb_chucdanh = gridKiemNhiem.FindEditFormTemplateControl("cmb_chucdanh") as ASPxComboBox;
            ASPxTextBox txt_soqd = gridKiemNhiem.FindEditFormTemplateControl("txt_soqd") as ASPxTextBox;
            ASPxDateEdit date_ngayqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayqd") as ASPxDateEdit;
            ASPxDateEdit date_ngayhetqd = gridKiemNhiem.FindEditFormTemplateControl("date_ngayhetqd") as ASPxDateEdit;
            ASPxTextBox txt_capqd = gridKiemNhiem.FindEditFormTemplateControl("txt_capqd") as ASPxTextBox;
            ASPxTextBox txt_tochuc = gridKiemNhiem.FindEditFormTemplateControl("txt_tochuc") as ASPxTextBox;
            ASPxMemo txt_ghichu = gridKiemNhiem.FindEditFormTemplateControl("txt_ghichu") as ASPxMemo;
            string filename = "";
            if (Session["file"] != null)
            {
                filename = Session["file"].ToString();
                Session.Remove("file");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridKiemNhiem.GetRowValues(gridKiemNhiem.FocusedRowIndex, "file"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            if (idNV > 0)
            {                
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KIEMNHIEM_UI]", e.Keys["id"], idNV, cmb_loaikiemnhiem.Value, txt_soqd.Text,
                    date_ngayqd.Value, date_ngayhetqd.Value, txt_capqd.Text, cmb_donvi.Value == null ? 0 : cmb_donvi.Value, txt_tochuc.Text,
                    cmb_chucvu.Value, cmb_chucvudang.Value, cmb_chucdanh.Value == null ? 0 : cmb_chucdanh.Value, filename, txt_ghichu.Text, 1);
            }
            gridKiemNhiem.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void gridKiemNhiem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_GET_KIEMNHIEM]", e.Keys["id"], 2);
            gridKiemNhiem.CancelEdit();
            e.Cancel = true;
            load_data();
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

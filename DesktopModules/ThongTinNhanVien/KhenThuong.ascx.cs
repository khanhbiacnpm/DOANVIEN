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
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using DevExpress.XtraReports.Web;
using DevExpress.XtraReports.UI;
using HRM_REPORT;
namespace VNPT.Modules.ThongTinNhanVien
{
    partial class KhenThuong : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();

            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[sp_baocao_khenthuong_nhanvien]", idNV);
            if (ds.Tables[1].Rows.Count > 0)
            {
                rptThanhTichNhanVien rpt = new rptThanhTichNhanVien();
                rpt.InitData(ds.Tables[0], string.Format("{1} - {0}", ds.Tables[1].Rows[0][0], ds.Tables[1].Rows[0][1]));
                ReportViewer1.Report = rpt;
                Session["rptTDKTNV"] = rpt;
                load_data_gridkyluat();
            }
        }        
        #region KyLuat
        protected void uploadKLAttachFile_Upload(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["filekl"] = filename;
            }            
        }
        protected void grdDiscipline_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txt_quyetdinh = grdDiscipline.FindEditFormTemplateControl("txt_quyetdinhKL") as ASPxTextBox;
            ASPxTextBox txt_capquyetdinh = grdDiscipline.FindEditFormTemplateControl("txt_capquyetdinhKL") as ASPxTextBox;
            ASPxTextBox date_thoidiemkyluat = grdDiscipline.FindEditFormTemplateControl("date_thoidiemkyluatKL") as ASPxTextBox;
            ASPxSpinEdit txt_thoihankyluat = grdDiscipline.FindEditFormTemplateControl("txt_thoihankyluatKL") as ASPxSpinEdit;
            ASPxComboBox cmb_hinhthuckyluat = grdDiscipline.FindEditFormTemplateControl("cmb_hinhthuckyluat") as ASPxComboBox;
            ASPxDateEdit date_ngayhopkyluat = grdDiscipline.FindEditFormTemplateControl("date_ngayhopkyluat") as ASPxDateEdit;
            ASPxMemo memo_lydo = grdDiscipline.FindEditFormTemplateControl("memo_lydo") as ASPxMemo;
            ASPxMemo memoKhieuNai = grdDiscipline.FindEditFormTemplateControl("memoKhieuNai") as ASPxMemo;
           
            string fileqd="";
            if (Session["filekl"] != null)
            {
                fileqd = Session["filekl"].ToString();
                Session.Remove("filekl");
            }
            if (idNV != 0)
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_KyLuat_UI]", 0, idNV, memo_lydo.Text, txt_quyetdinh.Text, date_thoidiemkyluat.Text,
                    txt_capquyetdinh.Text, fileqd, cmb_hinhthuckyluat.Value, txt_thoihankyluat.Value, date_ngayhopkyluat.Value, memoKhieuNai.Text, 0, 0, 0);

            grdDiscipline.CancelEdit();
            e.Cancel = true;
            load_data_gridkyluat();
        }
        protected void grdDiscipline_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txt_quyetdinh = grdDiscipline.FindEditFormTemplateControl("txt_quyetdinhKL") as ASPxTextBox;
            ASPxTextBox txt_capquyetdinh = grdDiscipline.FindEditFormTemplateControl("txt_capquyetdinhKL") as ASPxTextBox;
            ASPxTextBox date_thoidiemkyluat = grdDiscipline.FindEditFormTemplateControl("date_thoidiemkyluatKL") as ASPxTextBox;
            ASPxSpinEdit txt_thoihankyluat = grdDiscipline.FindEditFormTemplateControl("txt_thoihankyluatKL") as ASPxSpinEdit;
            ASPxComboBox cmb_hinhthuckyluat = grdDiscipline.FindEditFormTemplateControl("cmb_hinhthuckyluat") as ASPxComboBox;
            ASPxDateEdit date_ngayhopkyluat = grdDiscipline.FindEditFormTemplateControl("date_ngayhopkyluat") as ASPxDateEdit;
            ASPxMemo memo_lydo = grdDiscipline.FindEditFormTemplateControl("memo_lydo") as ASPxMemo;
            ASPxMemo memoKhieuNai = grdDiscipline.FindEditFormTemplateControl("memoKhieuNai") as ASPxMemo;

          
            string fileqd = "";
            if (Session["filekl"] != null)
            {
                fileqd = Session["filekl"].ToString();
                Session.Remove("filekl");
               
            }

            if (idNV != 0)
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_KyLuat_UI]", e.Keys["id"], idNV, memo_lydo.Text, txt_quyetdinh.Text, date_thoidiemkyluat.Text,
                    txt_capquyetdinh.Text, fileqd, cmb_hinhthuckyluat.SelectedItem.Value, txt_thoihankyluat.Value, date_ngayhopkyluat.Value, memoKhieuNai.Text,0,0, 1);
            grdDiscipline.CancelEdit();
          
            e.Cancel = true;
            load_data_gridkyluat();
           
        }
        protected void grdDiscipline_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdDiscipline.GetRowValues(grdDiscipline.FocusedRowIndex, "fileqd"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            if (idNV != 0)
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_Get_KhenThuong_KyLuat_IdNV]", e.Keys["id"], 1);
            grdDiscipline.CancelEdit();
            e.Cancel = true;
            load_data_gridkyluat();
        }
        protected void grdDiscipline_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            load_data_gridkyluat();
        }
        protected void grdDiscipline_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            if (!grdDiscipline.IsNewRowEditing)
            {
                ASPxComboBox cmb_hinhthuckyluat = grdDiscipline.FindEditFormTemplateControl("cmb_hinhthuckyluat") as ASPxComboBox;
                ASPxSpinEdit txt_thoihankyluat = grdDiscipline.FindEditFormTemplateControl("txt_thoihankyluatKL") as ASPxSpinEdit;
                if (cmb_hinhthuckyluat != null)
                {
                    string valuehtkl = grdDiscipline.GetRowValues(grdDiscipline.EditingRowVisibleIndex, "hinhthuckyluat").ToString();
                    var item = cmb_hinhthuckyluat.Items.FindByText(valuehtkl.Trim());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
                object thkl = grdDiscipline.GetRowValues(grdDiscipline.EditingRowVisibleIndex, "thoihankl");
                txt_thoihankyluat.Value = thkl;
            }
        }
        private void load_data_gridkyluat()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_KhenThuong_KyLuat_IdNV]", idNV, 2).Tables[0];                    
                grdDiscipline.DataSource = tb;
                grdDiscipline.DataBind();
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

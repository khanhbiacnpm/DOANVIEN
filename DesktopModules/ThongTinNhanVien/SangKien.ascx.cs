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
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using System.IO;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class SangKien : PortalModuleBase, IActionable    
    {       
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            BindSangKien();
        }

        protected void upFile_OnFileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            string filename = string.Format("{0:ddMMyyyyHHmmss}_{1}", DateTime.Now, e.UploadedFile.FileName);
            e.UploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/FileQD"), filename));
            Session["fileQD"] = filename;
        }

        string strConn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;        
        protected void grdSangKien_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtSoQD = grdSangKien.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = grdSangKien.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = grdSangKien.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxTextBox txtTenSangKien = grdSangKien.FindEditFormTemplateControl("txtTenSangKien") as ASPxTextBox;
            ASPxTextBox txtGiaiThuong = grdSangKien.FindEditFormTemplateControl("txtGiaiThuong") as ASPxTextBox;
            ASPxMemo memoGhiChu = grdSangKien.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            string fileQD = string.Empty;
            if (Session["fileQD"] != null)
            {
                fileQD = Session["fileQD"].ToString();
                Session.Remove("fileQD");
            }
            if (idNV > 0)
            {
                SqlHelper.ExecuteNonQuery(strConn, "HRM_AUSangKien", 0, idNV, txtSoQD.Text, txtCapQD.Text, dateNgayQD.Value, fileQD,
                    txtTenSangKien.Text, txtGiaiThuong.Text, memoGhiChu.Text);
            }
            grdSangKien.CancelEdit();
            e.Cancel = true;
            BindSangKien();
        }
        protected void grdSangKien_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtSoQD = grdSangKien.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = grdSangKien.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = grdSangKien.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxTextBox txtTenSangKien = grdSangKien.FindEditFormTemplateControl("txtTenSangKien") as ASPxTextBox;
            ASPxTextBox txtGiaiThuong = grdSangKien.FindEditFormTemplateControl("txtGiaiThuong") as ASPxTextBox;
            ASPxMemo memoGhiChu = grdSangKien.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;

            string fileQD = string.Empty;
            if (Session["fileQD"] != null)
            {
                fileQD = Session["fileQD"].ToString();
                Session.Remove("fileQD");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdSangKien.GetRowValues(grdSangKien.FocusedRowIndex, "FileQD"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            if (idNV > 0)
            {
                SqlHelper.ExecuteNonQuery(strConn, "HRM_AUSangKien", e.Keys[0], idNV, txtSoQD.Text, txtCapQD.Text, dateNgayQD.Value, fileQD,
                    txtTenSangKien.Text, txtGiaiThuong.Text, memoGhiChu.Text);
            }
            grdSangKien.CancelEdit();
            e.Cancel = true;
            BindSangKien();
        }
        protected void grdSangKien_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdSangKien.GetRowValues(grdSangKien.FocusedRowIndex, "FileQD"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            SqlHelper.ExecuteNonQuery(strConn, "HRM_GetSangKiens", e.Keys["Id"], 1);
            grdSangKien.CancelEdit();
            e.Cancel = true;
            BindSangKien();
        }
        private void BindSangKien()
        {            
            DataTable tbl = SqlHelper.ExecuteDataset(strConn, "HRM_GetSangKiens", idNV, 0).Tables[0];
            grdSangKien.DataSource = tbl;
            grdSangKien.DataBind();
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

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
using DevExpress.Web.ASPxHiddenField;
using System.IO;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using Unit;

namespace VNPT.Modules.Unit
{
    partial class KhenThuong : PortalModuleBase, IActionable    
    {        
        DonVi dv = new DonVi();
        private string strConn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        private string IdDonVi = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            IdDonVi = string.IsNullOrEmpty(Request.Params["IdDonVi"].ToString()) ? "" : Request.Params["IdDonVi"].ToString();
            BindKhenThuong(IdDonVi);
        }
        
        protected void upFile_OnFileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            string filename = string.Format("{0:ddMMyyyyHHmmss}_{1}", DateTime.Now, e.UploadedFile.FileName);
            e.UploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/FileQD"), filename));
            Session["fileQD"] = filename;
        }
        protected void grdKhenThuong_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtSoQD = grdKhenThuong.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = grdKhenThuong.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = grdKhenThuong.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxComboBox cmbLoaiKhenThuong = grdKhenThuong.FindEditFormTemplateControl("cmb_loaikhenthuong") as ASPxComboBox;
            ASPxMemo memoGhiChu = grdKhenThuong.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            
            string fileQD = string.Empty;
            if (Session["fileQD"] != null)
            {
                fileQD = Session["fileQD"].ToString();
                Session.Remove("fileQD");
            }
            
            SqlHelper.ExecuteNonQuery(strConn, "HRM_AUKhenThuong", 0, IdDonVi, cmbLoaiKhenThuong.Value, txtSoQD.Text, txtCapQD.Text, dateNgayQD.Value, fileQD, memoGhiChu.Text);
            grdKhenThuong.CancelEdit();
            e.Cancel = true;
            BindKhenThuong(IdDonVi);
        }
        protected void grdKhenThuong_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtSoQD = grdKhenThuong.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = grdKhenThuong.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = grdKhenThuong.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxComboBox cmbLoaiKhenThuong = grdKhenThuong.FindEditFormTemplateControl("cmb_loaikhenthuong") as ASPxComboBox;
            ASPxMemo memoGhiChu = grdKhenThuong.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;

            string fileQD = string.Empty;
            if (Session["fileQD"] != null)
            {
                fileQD = Session["fileQD"].ToString();
                Session.Remove("fileQD");
                string filename = grdKhenThuong.GetRowValues(grdKhenThuong.EditingRowVisibleIndex, "FileQD").ToString();
                if (File.Exists(System.IO.Path.Combine(Server.MapPath("~/images/fileQD"), filename)))
                    File.Delete(System.IO.Path.Combine(Server.MapPath("~/images/fileQD"), filename));
            }
            
            SqlHelper.ExecuteNonQuery(strConn, "HRM_AUKhenThuong", e.Keys["Id"], IdDonVi, cmbLoaiKhenThuong.Value, txtSoQD.Text, txtCapQD.Text, dateNgayQD.Value, fileQD, memoGhiChu.Text);
            grdKhenThuong.CancelEdit();
            e.Cancel = true;
            BindKhenThuong(IdDonVi);
        }
        protected void grdKhenThuong_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string filename = e.Values["FileQD"].ToString();
            if (File.Exists(System.IO.Path.Combine(Server.MapPath("~/images/fileQD"), filename)))
                File.Delete(System.IO.Path.Combine(Server.MapPath("~/images/fileQD"), filename));
            SqlHelper.ExecuteNonQuery(strConn, "HRM_GetKhenThuongs", e.Keys["Id"], 1);
            grdKhenThuong.CancelEdit();
            e.Cancel = true;
            BindKhenThuong(IdDonVi);
        }
        private void BindKhenThuong(string IdDonVi)
        {            
            DataTable tbl = SqlHelper.ExecuteDataset(strConn, "HRM_GetKhenThuongs", IdDonVi, 0).Tables[0];
            grdKhenThuong.DataSource = tbl;
            grdKhenThuong.DataBind();
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
        protected void grdKhenThuong_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            BindKhenThuong(e.Parameters);
        }
    }
}

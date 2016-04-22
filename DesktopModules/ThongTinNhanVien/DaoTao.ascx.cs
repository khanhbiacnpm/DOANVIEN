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
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class DaoTao : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
               idNV = Convert.ToInt32(Request.Params["idNV"]);
            Load_data_grid();
        }        
        protected void uploadFileDinhKemTagDT_Load(object sender, FileUploadCompleteEventArgs e)
        {           
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileqd"] = filename;
            }            
        }
        #region Training daotao
        protected void grdTraining_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {           
            ASPxComboBox cboQualification = grdTraining.FindEditFormTemplateControl("cboQualification") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = grdTraining.FindEditFormTemplateControl("cboTrainingForm") as ASPxComboBox;
            ASPxTextBox txtSkill = grdTraining.FindEditFormTemplateControl("txtSkill") as ASPxTextBox;
            ASPxTextBox txtDecision = grdTraining.FindEditFormTemplateControl("txtTrainingDecision") as ASPxTextBox;
            ASPxTextBox txtScholl = grdTraining.FindEditFormTemplateControl("txtScholl") as ASPxTextBox;
            ASPxTextBox txtTrainingDecision = grdTraining.FindEditFormTemplateControl("txtTrainingDecision") as ASPxTextBox;
            ASPxDateEdit calDateEnd = grdTraining.FindEditFormTemplateControl("calDateEnd") as ASPxDateEdit;
            ASPxDateEdit calStartDateTraining = grdTraining.FindEditFormTemplateControl("calStartDateTraining") as ASPxDateEdit;
            ASPxTextBox txtFee = grdTraining.FindEditFormTemplateControl("txtFee") as ASPxTextBox;
            ASPxTextBox txt_donvitochuc = grdTraining.FindEditFormTemplateControl("txt_donvitochuc") as ASPxTextBox;
            ASPxComboBox cmbDiaDiemDaoTao = grdTraining.FindEditFormTemplateControl("cmbDiaDiemDaoTao") as ASPxComboBox;
            ASPxComboBox cmb_nganhdaotao = grdTraining.FindEditFormTemplateControl("cmb_nganhdaotao") as ASPxComboBox;
            ASPxComboBox cboResult = grdTraining.FindEditFormTemplateControl("cboResult") as ASPxComboBox;

            string fileqd = "";
            if (Session["fileqd"] != null)
            {
                fileqd = Session["fileqd"].ToString();
                Session.Remove("fileqd");
            }
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Training", 0, txtScholl.Text, txtSkill.Text, calStartDateTraining.Value, calDateEnd.Value,
                        cboTrainingForm.SelectedItem.Value, cboQualification.SelectedItem.Value, txtDecision.Text, idNV, txtFee.Text, this.UserId, DateTime.Now,
                        HttpContext.Current.Request.UserHostAddress, cmbDiaDiemDaoTao.SelectedItem.Value, txt_donvitochuc.Text,
                        cboResult.SelectedItem.Text, fileqd, 0,cmb_nganhdaotao.Value, 0);
            }
            grdTraining.CancelEdit();
            e.Cancel = true;
            Load_data_grid();
        }                 
        protected void grdTraining_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cboQualification = grdTraining.FindEditFormTemplateControl("cboQualification") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = grdTraining.FindEditFormTemplateControl("cboTrainingForm") as ASPxComboBox;
            ASPxTextBox txtSkill = grdTraining.FindEditFormTemplateControl("txtSkill") as ASPxTextBox;
            ASPxTextBox txtDecision = grdTraining.FindEditFormTemplateControl("txtTrainingDecision") as ASPxTextBox;
            ASPxTextBox txtScholl = grdTraining.FindEditFormTemplateControl("txtScholl") as ASPxTextBox;
            ASPxTextBox txtTrainingDecision = grdTraining.FindEditFormTemplateControl("txtTrainingDecision") as ASPxTextBox;
            ASPxDateEdit calDateEnd = grdTraining.FindEditFormTemplateControl("calDateEnd") as ASPxDateEdit;
            ASPxDateEdit calStartDateTraining = grdTraining.FindEditFormTemplateControl("calStartDateTraining") as ASPxDateEdit;
            ASPxTextBox txtFee = grdTraining.FindEditFormTemplateControl("txtFee") as ASPxTextBox;
            ASPxComboBox cmbDiaDiemDaoTao = grdTraining.FindEditFormTemplateControl("cmbDiaDiemDaoTao") as ASPxComboBox;
            ASPxTextBox txt_donvitochuc = grdTraining.FindEditFormTemplateControl("txt_donvitochuc") as ASPxTextBox;
            ASPxComboBox cboResult = grdTraining.FindEditFormTemplateControl("cboResult") as ASPxComboBox;
            ASPxTextBox txtFileKemTagDT = grdTraining.FindEditFormTemplateControl("txtFileKemTagDT") as ASPxTextBox;
            ASPxComboBox cmb_nganhdaotao = grdTraining.FindEditFormTemplateControl("cmb_nganhdaotao") as ASPxComboBox;
            

            string fileqd = "";
            if (Session["fileqd"] != null)
            {
                fileqd = Session["fileqd"].ToString();
                Session.Remove("fileqd");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdTraining.GetRowValues(grdTraining.FocusedRowIndex, "filekem"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Training", e.Keys["id"], txtScholl.Text, txtSkill.Text, calStartDateTraining.Value, calDateEnd.Value,
                        cboTrainingForm.SelectedItem.Value, cboQualification.SelectedItem.Value, txtDecision.Text, idNV, txtFee.Text, this.UserId, DateTime.Now,
                        HttpContext.Current.Request.UserHostAddress, cmbDiaDiemDaoTao.SelectedItem.Value, txt_donvitochuc.Text,
                        cboResult.SelectedItem.Text, fileqd, 0,cmb_nganhdaotao.Value, 1);
            }
            grdTraining.CancelEdit();
            e.Cancel = true;
            Load_data_grid();
        }        
        protected void grdTraining_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, grdTraining.GetRowValues(grdTraining.FocusedRowIndex, "filekem"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            SqlHelper.ExecuteNonQuery(strconn, "HRM_Get_DaoTao_IDNV", e.Keys["id"], 1);
            grdTraining.CancelEdit();
            e.Cancel = true;
            Load_data_grid();
        }
        protected void grdTraining_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_data_combo();
        }
        private void Load_data_grid()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DaoTao_IDNV]", idNV, 0).Tables[0];
            if (tb.Rows.Count > 0)
                grdTraining.Caption = "Thông tin đào tạo nhân viên " + tb.Rows[0]["hoten"];
            grdTraining.DataSource = tb;
            grdTraining.DataBind();
        }
        private void load_data_combo()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "HRM_Get_DaoTao_cmb");
            ASPxComboBox cboTrainingForm = grdTraining.FindEditFormTemplateControl("cboTrainingForm") as ASPxComboBox;
            cboTrainingForm.DataSource = ds.Tables[0];
            cboTrainingForm.ValueField = "id";
            cboTrainingForm.TextField = "ten";
            cboTrainingForm.DataBind();
            
            ASPxComboBox cmbDiaDiemDaoTao = grdTraining.FindEditFormTemplateControl("cmbDiaDiemDaoTao") as ASPxComboBox;
            cmbDiaDiemDaoTao.DataSource = ds.Tables[1];
            cmbDiaDiemDaoTao.ValueField = "id";
            cmbDiaDiemDaoTao.TextField = "ten";
            cmbDiaDiemDaoTao.DataBind();

            ASPxComboBox cboQualification = grdTraining.FindEditFormTemplateControl("cboQualification") as ASPxComboBox;
            cboQualification.DataSource = ds.Tables[2];
            cboQualification.ValueField = "id";
            cboQualification.TextField = "ten";
            cboQualification.DataBind();

            ASPxComboBox cmb_nganhdaotao = grdTraining.FindEditFormTemplateControl("cmb_nganhdaotao") as ASPxComboBox;
            cmb_nganhdaotao.DataSource = ds.Tables[4];
            cmb_nganhdaotao.ValueField = "id";
            cmb_nganhdaotao.TextField = "ten";
            cmb_nganhdaotao.DataBind();

            if (!grdTraining.IsNewRowEditing)
            {
                var itemhtdd = cboTrainingForm.Items.FindByValue(grdTraining.GetRowValues(grdTraining.EditingRowVisibleIndex, "trainingformid"));
                if (itemhtdd != null)
                    itemhtdd.Selected = true;
                var itemdddt = cmbDiaDiemDaoTao.Items.FindByValue(grdTraining.GetRowValues(grdTraining.EditingRowVisibleIndex, "diadiemtochucid"));
                if (itemdddt != null)
                    itemdddt.Selected = true;
                var itemtd = cboQualification.Items.FindByValue(grdTraining.GetRowValues(grdTraining.EditingRowVisibleIndex, "qualificationid"));
                if (itemtd != null)
                    itemtd.Selected = true;
                ASPxComboBox cboResult = grdTraining.FindEditFormTemplateControl("cboResult") as ASPxComboBox;
                var itemkq = cboResult.Items.FindByText(grdTraining.GetRowValues(grdTraining.EditingRowVisibleIndex, "result").ToString());
                if (itemkq != null)
                    itemkq.Selected = true;
                var itemndt = cmb_nganhdaotao.Items.FindByValue(grdTraining.GetRowValues(grdTraining.EditingRowVisibleIndex, "idnganhdaotao"));
                if (itemndt != null)
                    itemndt.Selected = true;
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

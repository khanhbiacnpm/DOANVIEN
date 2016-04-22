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
    partial class BangCap : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
                load_data_grid();                           
        }        
        #region gridBangCap                         
        protected void gridBangCap_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmbBangCap = gridBangCap.FindEditFormTemplateControl("cmbBangCap") as ASPxComboBox;
            ASPxComboBox cmbCNDaoTao = gridBangCap.FindEditFormTemplateControl("cmbCNDaoTao") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = gridBangCap.FindEditFormTemplateControl("cboTrainingFormBangCap") as ASPxComboBox;
            ASPxComboBox cmbResult = gridBangCap.FindEditFormTemplateControl("cmbResult") as ASPxComboBox;
            ASPxCheckBox checkCaoNhat = gridBangCap.FindEditFormTemplateControl("checkBangCapCaoNhat") as ASPxCheckBox;
            ASPxTextBox txtTruongCap = gridBangCap.FindEditFormTemplateControl("txtTruongCap") as ASPxTextBox;
            ASPxTextBox txtDanhHieu = gridBangCap.FindEditFormTemplateControl("txtDanhHieu") as ASPxTextBox;
            ASPxTextBox txtNamTotNghiep = gridBangCap.FindEditFormTemplateControl("txtNamTotNghiep") as ASPxTextBox;
            ASPxTextBox txt_thoigiandaotao = gridBangCap.FindEditFormTemplateControl("txt_thoigiandaotao") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridBangCap.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxComboBox cmbLoaiBangCap = gridBangCap.FindEditFormTemplateControl("cmbLoaiBangCap") as ASPxComboBox;
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_BangCap_UI]", 0, cmbBangCap.SelectedItem.Value, cmbCNDaoTao.SelectedItem.Value,
                        idNV, cboTrainingForm.SelectedItem.Value, cmbResult.SelectedItem.Text, checkCaoNhat.Checked, txtTruongCap.Text, txtDanhHieu.Text, txtNamTotNghiep.Text,
                        memoGhiChu.Text,cmbLoaiBangCap.Value,txt_thoigiandaotao.Text, 0);
            }
            gridBangCap.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }
        protected void gridBangCap_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cmbBangCap = gridBangCap.FindEditFormTemplateControl("cmbBangCap") as ASPxComboBox;
            ASPxComboBox cmbCNDaoTao = gridBangCap.FindEditFormTemplateControl("cmbCNDaoTao") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = gridBangCap.FindEditFormTemplateControl("cboTrainingFormBangCap") as ASPxComboBox;
            ASPxComboBox cmbResult = gridBangCap.FindEditFormTemplateControl("cmbResult") as ASPxComboBox;
            ASPxCheckBox checkCaoNhat = gridBangCap.FindEditFormTemplateControl("checkBangCapCaoNhat") as ASPxCheckBox;
            ASPxTextBox txtTruongCap = gridBangCap.FindEditFormTemplateControl("txtTruongCap") as ASPxTextBox;
            ASPxTextBox txtDanhHieu = gridBangCap.FindEditFormTemplateControl("txtDanhHieu") as ASPxTextBox;
            ASPxTextBox txtNamTotNghiep = gridBangCap.FindEditFormTemplateControl("txtNamTotNghiep") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridBangCap.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxComboBox cmbLoaiBangCap = gridBangCap.FindEditFormTemplateControl("cmbLoaiBangCap") as ASPxComboBox;
            ASPxTextBox txt_thoigiandaotao = gridBangCap.FindEditFormTemplateControl("txt_thoigiandaotao") as ASPxTextBox;
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_BangCap_UI]", e.Keys["id"], cmbBangCap.SelectedItem.Value, cmbCNDaoTao.SelectedItem.Value,
                        idNV, cboTrainingForm.SelectedItem.Value, cmbResult.SelectedItem.Text, checkCaoNhat.Checked, txtTruongCap.Text, txtDanhHieu.Text, txtNamTotNghiep.Text,
                        memoGhiChu.Text,cmbLoaiBangCap.Value,txt_thoigiandaotao.Text, 1);
            }
            gridBangCap.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }
        protected void gridBangCap_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "HRM_GetEmpQualification", e.Keys["id"], 3);
            gridBangCap.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }       
        protected void gridBangCap_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_data_combo();
        }
        private void load_data_grid()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GetEmpQualification", idNV, 0).Tables[0];
           
                
            gridBangCap.DataSource = tb;
            gridBangCap.DataBind();
        }
        private void load_data_combo()
        {
            ASPxComboBox cboTrainingFormBangCap = gridBangCap.FindEditFormTemplateControl("cboTrainingFormBangCap") as ASPxComboBox;
            ASPxComboBox cmbBangCap = gridBangCap.FindEditFormTemplateControl("cmbBangCap") as ASPxComboBox;
            ASPxComboBox cmbCNDaoTao = gridBangCap.FindEditFormTemplateControl("cmbCNDaoTao") as ASPxComboBox;
            ASPxComboBox cmbLoaiBangCap = gridBangCap.FindEditFormTemplateControl("cmbLoaiBangCap") as ASPxComboBox;
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DaoTao_cmb]");
            cboTrainingFormBangCap.DataSource = ds.Tables[0];
            cboTrainingFormBangCap.ValueField = "id";
            cboTrainingFormBangCap.TextField = "ten";
            cboTrainingFormBangCap.DataBind();

            cmbBangCap.DataSource = ds.Tables[2];
            cmbBangCap.ValueField = "id";
            cmbBangCap.TextField = "ten";
            cmbBangCap.DataBind();

            cmbCNDaoTao.DataSource = ds.Tables[3];
            cmbCNDaoTao.ValueField = "id";
            cmbCNDaoTao.TextField = "ten";
            cmbCNDaoTao.DataBind();

            cmbLoaiBangCap.Items.Add(new ListEditItem("Chuyên môn",1));
            cmbLoaiBangCap.Items.Add(new ListEditItem("Khác", 2));


            if (!gridBangCap.IsNewRowEditing)
            {
                var itemhtdd = cboTrainingFormBangCap.Items.FindByValue(gridBangCap.GetRowValues(gridBangCap.EditingRowVisibleIndex, "trainingid"));
                if (itemhtdd !=null)
                    itemhtdd.Selected=true;
                var itembc = cmbBangCap.Items.FindByValue(gridBangCap.GetRowValues(gridBangCap.EditingRowVisibleIndex, "qualificationid"));
                if (itembc != null)
                    itembc.Selected = true;
                var itemcndt = cmbCNDaoTao.Items.FindByValue(gridBangCap.GetRowValues(gridBangCap.EditingRowVisibleIndex, "professionid"));
                if (itemcndt != null)
                    itemcndt.Selected = true;
                ASPxComboBox cmbResult = gridBangCap.FindEditFormTemplateControl("cmbResult") as ASPxComboBox;
                var itemrs = cmbResult.Items.FindByText(gridBangCap.GetRowValues(gridBangCap.EditingRowVisibleIndex, "result").ToString());
                if (itemrs != null)
                    itemrs.Selected = true;


                var itemLoai = cmbLoaiBangCap.Items.FindByValue(Convert.ToInt32(gridBangCap.GetRowValues(gridBangCap.EditingRowVisibleIndex, "chuyenmon").ToString()));
                if (itemLoai != null)
                    itemLoai.Selected = true;
               
              
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

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
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.TrainingForm
{    
    partial class ViewTrainingForm : PortalModuleBase, IActionable
    {       
        TrainingFormController objTraining = new TrainingFormController();
        TrainingFormInfo training = new TrainingFormInfo();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
                load_data();
        }
        private void load_data()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTrainingForm]", 0, 1);
            grid.DataSource = ds.Tables[0];
            grid.DataBind();
        }
        private void load_combo()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTrainingForm]", 0, 2);
            ASPxComboBox cmb_thoigian = grid.FindEditFormTemplateControl("cmb_thoigian") as ASPxComboBox;
            cmb_thoigian.DataSource = ds.Tables[0];
            cmb_thoigian.ValueField = "id";
            cmb_thoigian.TextField = "ten";
            cmb_thoigian.DataBind();
        }
        protected void grid_OnHtmlEditFormCreated(object sener, EventArgs e)
        {
            load_combo();
            if (!grid.IsNewRowEditing)
            {
                ASPxComboBox cmb_thoigian = grid.FindEditFormTemplateControl("cmb_thoigian") as ASPxComboBox;
                var itemtg = cmb_thoigian.Items.FindByValue(grid.GetRowValues(grid.EditingRowVisibleIndex, "idthoigian"));
                if (itemtg != null)
                    itemtg.Selected = true;
            }
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;            
            ASPxComboBox cmb_thoigian = grid.FindEditFormTemplateControl("cmb_thoigian") as ASPxComboBox;

            int id = SqlHelper.ExecuteNonQuery(strconn, "[HRM_TrainingForm]", e.Keys["id"], txtCode.Text, txtName.Text, cmb_thoigian.Value, 1);           
            grid.CancelEdit();
            e.Cancel = true;
            load_data();          
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxComboBox cmb_thoigian = grid.FindEditFormTemplateControl("cmb_thoigian") as ASPxComboBox;

            object id = SqlHelper.ExecuteScalar(strconn, "[HRM_TrainingForm]", 0, txtCode.Text, txtName.Text, cmb_thoigian.Value, 0);
            grid.JSProperties["cpresult"] = id;
            grid.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            object id = SqlHelper.ExecuteNonQuery(strconn, "[HRM_TrainingForm]",e.Keys["id"], 0, 0, 0, 2);

            grid.CancelEdit();
            e.Cancel = true;
            load_data();
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


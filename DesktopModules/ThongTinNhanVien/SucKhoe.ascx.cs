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
using System.IO;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;


namespace VNPT.Modules.ThongTinNhanVien
{
    partial class SucKhoe : PortalModuleBase, IActionable    
    {                        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
            {
                LoadGridView();
            }
        }      
        #region Health
        protected void grdHealth_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            if (!grdHealth.IsNewRowEditing)
            {
                var cmb_loaisuckhoe = grdHealth.FindEditFormTemplateControl("cmb_loaisuckhoe") as ASPxComboBox;
                cmb_loaisuckhoe.DataBind();
                var lsk = grdHealth.GetRowValues(grdHealth.EditingRowVisibleIndex, "loaisuckhoe").ToString();
                var item = cmb_loaisuckhoe.Items.FindByText(lsk);
                item.Selected = true;
            }
        }

        protected void grdHealth_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxDateEdit date_ngaykham = grdHealth.FindEditFormTemplateControl("date_ngaykham") as ASPxDateEdit;
            ASPxTextBox txtHight = grdHealth.FindEditFormTemplateControl("txtHight") as ASPxTextBox;
            ASPxTextBox txtWeigh = grdHealth.FindEditFormTemplateControl("txtWeigh") as ASPxTextBox;
            ASPxTextBox txtHA = grdHealth.FindEditFormTemplateControl("txtHA") as ASPxTextBox;
            ASPxMemo txtOtherResult = grdHealth.FindEditFormTemplateControl("txtOtherResult") as ASPxMemo;
            ASPxMemo txtConclusion = grdHealth.FindEditFormTemplateControl("txtConclusion") as ASPxMemo;
            ASPxComboBox cmb_loaisuckhoe = grdHealth.FindEditFormTemplateControl("cmb_loaisuckhoe") as ASPxComboBox;
            if (idNV > 0)
            {
                SqlHelper.ExecuteNonQuery(strconn, "HRM_HealthCare1", e.Keys["Id"], idNV, txtHight.Text, txtWeigh.Text, txtHA.Text, txtOtherResult.Text,
                    txtConclusion.Text, date_ngaykham.Value, cmb_loaisuckhoe.Value, 1);
            }
            grdHealth.CancelEdit();
            e.Cancel = true;
            LoadGridView();
        }
        protected void grdHealth_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit date_ngaykham = grdHealth.FindEditFormTemplateControl("date_ngaykham") as ASPxDateEdit;
            ASPxTextBox txtHight = grdHealth.FindEditFormTemplateControl("txtHight") as ASPxTextBox;
            ASPxTextBox txtWeigh = grdHealth.FindEditFormTemplateControl("txtWeigh") as ASPxTextBox;
            ASPxTextBox txtHA = grdHealth.FindEditFormTemplateControl("txtHA") as ASPxTextBox;
            ASPxMemo txtOtherResult = grdHealth.FindEditFormTemplateControl("txtOtherResult") as ASPxMemo;
            ASPxMemo txtConclusion = grdHealth.FindEditFormTemplateControl("txtConclusion") as ASPxMemo;
            ASPxComboBox cmb_loaisuckhoe = grdHealth.FindEditFormTemplateControl("cmb_loaisuckhoe") as ASPxComboBox;
            if (idNV > 0)
            {
                SqlHelper.ExecuteNonQuery(strconn, "HRM_HealthCare1", 0, idNV, txtHight.Text, txtWeigh.Text, txtHA.Text, txtOtherResult.Text,
                    txtConclusion.Text, date_ngaykham.Value, cmb_loaisuckhoe.Value, 0);
            }
            grdHealth.CancelEdit();
            e.Cancel = true;
            LoadGridView();
        }
        protected void grdHealth_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "HRM_DeleteHealthCare", e.Keys["Id"]);
            grdHealth.CancelEdit();
            e.Cancel = true;           
            LoadGridView();
        }
        
        private void LoadGridView()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinCaNhan]", idNV, 1).Tables[0];
            
            grdHealth.DataSource = tb;
            grdHealth.DataBind();
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

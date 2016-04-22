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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;
using DotNetNuke.UI.Utilities;
using VNPT.Modules.Employees;
using VNPT.Modules;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

namespace VNPT.Modules.Notices
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewNotices class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewNotices : PortalModuleBase, IActionable
    {

        #region Private Members

        private string strTemplate;

        #endregion

        #region Public Methods

        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }

        #endregion

        #region Event Handlers

        
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
       
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridNotice();
            }

        }
        protected void grdNotice_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtTitle = grdNotice.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;


            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Notices]", e.Keys["Id"], txtTitle.Text, "", this.UserId,1);

            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();


        }
        protected void grdNotice_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtTitle = grdNotice.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;
            
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Notices]", -1, txtTitle.Text, "", this.UserId,0);
     
            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();

        }       
        protected void grdNotice_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Notices]", e.Keys["Id"],"", "", this.UserId, 2);
            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();

        }
        private void BindGridNotice()
        {

            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetNotices]", this.UserId).Tables[0];
            if (tb.Rows.Count > 0)
                grdNotice.DataSource = tb;
            grdNotice.DataBind();


        }

        protected void txtTitle_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetNoticeText("Title") != null && GetNoticeText("Title").Trim() != "")
            {
                txt.Text = GetNoticeText("Title");
            }
        }

        private string GetNoticeText(string fieldName)
        {
            int index = grdNotice.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grdNotice.GetRowValues(index, fieldName).ToString();

            }
            return values;

        }
       

        #endregion

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Registers the module actions required for interfacing with the portal framework
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
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


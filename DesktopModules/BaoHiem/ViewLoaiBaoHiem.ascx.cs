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

namespace Philip.Modules.BaoHiem
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewCountry class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewLoaiBaoHiem : PortalModuleBase, IActionable
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

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        LoaiBaoHiemInfo loaibh = new LoaiBaoHiemInfo();
        BaoHiem.BaoHiemController objBaoHiem = new Philip.Modules.BaoHiem.BaoHiemController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                this.grid.DataSource = objBaoHiem.GetLoaiBaoHiems();
                this.grid.DataBind();
            }
        }

        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtLoaiBH = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;            
            this.loaibh = objBaoHiem.GetLoaiBaoHiemId(Convert.ToInt32(e.Keys[grid.KeyFieldName].ToString()));

            if (this.loaibh != null)
            {
                loaibh.loaibh = txtLoaiBH.Text.Trim();
                objBaoHiem.UpdateLoaiBaoHiem(loaibh);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLoaiBaoHiems();
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtLoaiBH = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;            

            this.loaibh.id = -1;
            loaibh.loaibh = txtLoaiBH.Text.Trim();
            this.objBaoHiem.AddLoaiBaoHiem(loaibh);
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLoaiBaoHiems();
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.loaibh = objBaoHiem.GetLoaiBaoHiemId(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.loaibh != null)
            {
                this.objBaoHiem.DeleteLoaiBaoHiem(loaibh);
            }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLoaiBaoHiems();
            this.grid.DataBind();
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("loaibh") != null && GetText("loaibh").Trim() != "")
            {
                txt.Text = GetText("loaibh");
            }
        }     
        private string GetText(string fieldName)
        {
            int index = grid.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grid.GetRowValues(index, fieldName).ToString();

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


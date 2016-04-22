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

namespace Philip.Modules.IT
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewIT class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewIT : PortalModuleBase, IActionable
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
        IT.ITController objIT = new ITController();
        IT.ITInfo it = new ITInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (objIT.GetITs().Count > 0)
                {
                    this.grid.DataSource = objIT.GetITs();
                    this.grid.DataBind();
                }
            }
            catch (Exception ex)
            {
                Exceptions.ProcessModuleLoadException(this, ex);
            }

        }
        protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            if (textId != null)
            {
                textId.Enabled = false;
            }
        }


        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;

            this.it = objIT.GetIT(Int32.Parse(textId.Text));

            if (this.it != null)
            {
                it.name = text.Text;
                it.isactive = true;
                this.objIT.UpdateIT(it);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objIT.GetITs();
            this.grid.DataBind();



        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;



            this.it.id = -1;
            it.name = text.Text;
            it.isactive = true;
            this.objIT.AddIT(it);

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objIT.GetITs();
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.it = objIT.GetIT(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.it != null)
            {

                this.objIT.DeleteIT(it);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objIT.GetITs();
            this.grid.DataBind();
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("name") != null && GetText("name").Trim() != "")
            {
                txt.Text = GetText("name");
            }
        }
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                txt.Text = GetText("id");
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


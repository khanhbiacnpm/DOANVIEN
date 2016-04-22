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


namespace VNPT.Modules.LaborContractType
{
   
    partial class ViewLaborContractType : PortalModuleBase, IActionable
    {
        #region Event Handlers

        LaborContractTypeController objContract = new LaborContractTypeController();
        LaborContractTypeInfo contract = new LaborContractTypeInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            
                try
                {
                    if (objContract.GetLaborContractTypes().Count > 0)
                    {
                        this.grdNotice.DataSource = objContract.GetLaborContractTypes();
                        this.grdNotice.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }


        }
        protected void grdNotice_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtName = grdNotice.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtId = grdNotice.FindEditFormTemplateControl("txtId") as ASPxTextBox;

            this.contract = this.objContract.GetLaborContractType(Int32.Parse(txtId.Text));
            if (this.contract != null)
            {
                contract.name = txtName.Text;
                contract.editor = this.UserId;
                contract.modifieddate = DateTime.Now;
                contract.ip = HttpContext.Current.Request.UserHostAddress;
                contract.description = "";
                objContract.UpdateLaborContractType(contract);
            }

            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();


        }
        protected void grdNotice_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtName = grdNotice.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtId = grdNotice.FindEditFormTemplateControl("txtId") as ASPxTextBox;

            this.contract.id = -1;

            contract.name = txtName.Text;
            contract.editor = this.UserId;
            contract.modifieddate = DateTime.Now;
            contract.ip = HttpContext.Current.Request.UserHostAddress;
            contract.description = "";
            objContract.AddLaborContractType(contract);

            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();

        }
        protected void grdNotice_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.contract = objContract.GetLaborContractType(Int32.Parse(e.Keys[grdNotice.KeyFieldName].ToString()));
            if (this.contract != null)
            {

                this.objContract.DeleteLaborContractType(contract);
            }

            grdNotice.CancelEdit();
            e.Cancel = true;
            BindGridNotice();

        }
        private void BindGridNotice()
        {
            this.grdNotice.DataSource = objContract.GetLaborContractTypes();
            this.grdNotice.DataBind();
        }

        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetNoticeText("id") != null && GetNoticeText("id").Trim() != "")
            {
                txt.Text = GetNoticeText("id");
            }
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetNoticeText("name") != null && GetNoticeText("name").Trim() != "")
            {
                txt.Text = GetNoticeText("name");
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


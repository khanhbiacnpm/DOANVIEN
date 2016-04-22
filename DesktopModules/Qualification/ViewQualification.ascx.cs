/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

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

namespace VNPT.Modules.Qualification
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewQualification class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewQualification : PortalModuleBase, IActionable
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

        QualificationController objQualification = new QualificationController();
        QualificationsInfo qualification = new QualificationsInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
           
                try
                {
                    if (objQualification.GetQualifications().Count > 0)
                    {
                        this.grid.DataSource = objQualification.GetQualifications();
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
            ASPxTextBox txtSequense = grid.FindEditFormTemplateControl("txtSequense") as ASPxTextBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            this.qualification = objQualification.GetQualification(Int32.Parse(textId.Text));
            if (this.qualification != null)
            {
                if (txtCode.Text.Trim() == qualification.code)
                {
                    qualification.name = text.Text;
                    qualification.code = txtCode.Text;
                    qualification.level = Int32.Parse(txtSequense.Text);

                    this.objQualification.UpdateQualifications(qualification);
                }
                else {
                    if (objQualification.GetQualificationByCode(txtCode.Text.Trim()) == null)
                    {
                        qualification.name = text.Text;
                        qualification.code = txtCode.Text;
                        qualification.level = Int32.Parse(txtSequense.Text);
                        this.objQualification.UpdateQualifications(qualification);
                    }
                    else
                    {
                        this.grid.JSProperties["cpResult"] = true;
                    }
                }
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objQualification.GetQualifications();
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtSequense = grid.FindEditFormTemplateControl("txtSequense") as ASPxTextBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            
           
                    qualification.id = -1;
                    qualification.name = text.Text;
                    qualification.code = txtCode.Text;
                    qualification.level = Int32.Parse(txtSequense.Text);
                    this.objQualification.AddQualifications(qualification);
           

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objQualification.GetQualifications();
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.qualification = objQualification.GetQualification(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.qualification != null)
            {

                this.objQualification.DeleteQualifications(qualification);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objQualification.GetQualifications();
            this.grid.DataBind();

        }
        
        protected void txtSequense_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("level") != null && GetText("level").Trim() != "")
            {
                txt.Text = GetText("level");
            }
        }
        protected void txtCode_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("code") != null && GetText("code").Trim() != "")
            {
                txt.Text = GetText("code");
            }
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


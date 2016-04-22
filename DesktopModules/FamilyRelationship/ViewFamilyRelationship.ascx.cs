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
using DevExpress.Web.ASPxTreeList;

namespace VNPT.Modules.FamilyRelationship
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewFamilyRelationship class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewFamilyRelationship : PortalModuleBase, IActionable
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

        FamilyRelationshipController obiFamily = new FamilyRelationshipController();
        FamilyRelationshipInfo family = new FamilyRelationshipInfo();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Relationship.RelationshipController objRelation = new VNPT.Modules.Relationship.RelationshipController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
           
                try
                {
                    BindGrid();
                    //this.grdFamily.Caption = "Thông tin nhân thân đồng chí " + this.employees.fullname;
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
           

        }
        private void BindGrid()
        {
            List<FamilyRelationship.FamilyRelationshipInfo> lstTmp = new List<VNPT.Modules.FamilyRelationship.FamilyRelationshipInfo>();
            foreach (FamilyRelationship.FamilyRelationshipInfo f in obiFamily.GetFamilyByEmployess(478, 1))
            {
                lstTmp.Add(f);
            }
            foreach (FamilyRelationship.FamilyRelationshipInfo f in obiFamily.GetFamilyByEmployess(478, 2))
            {
                lstTmp.Add(f);
            }
            foreach (FamilyRelationship.FamilyRelationshipInfo f in obiFamily.GetFamilyByEmployess(478, 3))
            {
                lstTmp.Add(f);
            }
            this.grdFamily.DataSource = lstTmp;
            this.grdFamily.DataBind();
        }
        protected void grdFamily_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {


        }


        protected void grdFamily_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text = grdFamily.FindEditFormTemplateControl("txtName") as ASPxTextBox;

            ASPxTextBox textId = grdFamily.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxComboBox cboRelate = grdFamily.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            ASPxTextBox txtBirdthday = grdFamily.FindEditFormTemplateControl("txtBirdthday") as ASPxTextBox;
            ASPxTextBox txtAdress = grdFamily.FindEditFormTemplateControl("txtAdress") as ASPxTextBox;
            ASPxTextBox txtOccupation = grdFamily.FindEditFormTemplateControl("txtOccupation") as ASPxTextBox;
            ASPxTextBox txtHistory = grdFamily.FindEditFormTemplateControl("txtHistory") as ASPxTextBox;
            ASPxTextBox txtEmpId = grdFamily.FindEditFormTemplateControl("txtEmpId") as ASPxTextBox;

            this.family = obiFamily.GetFamilyRelationship(Int32.Parse(textId.Text));

            if (this.family != null)
            {

                this.family.birthday = txtBirdthday.Text;
                this.family.fullname = text.Text;
                this.family.occupation = txtOccupation.Text;
                this.family.description = txtHistory.Text;
                this.family.placeofbirth = txtAdress.Text;
                this.family.editor = this.UserId;
                this.family.modifieddate = DateTime.Now;
                this.family.ip = HttpContext.Current.Request.UserHostAddress;
                this.family.employeeid = Int32.Parse(txtEmpId.Text.Trim());
                this.family.relationshipid = Int32.Parse(cboRelate.SelectedItem.Value.ToString());
                this.obiFamily.UpdateFamilyRelationship(family);
            }

            grdFamily.CancelEdit();
            e.Cancel = true;
            BindGrid();

        }
        protected void grdFamily_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grdFamily.FindEditFormTemplateControl("txtName") as ASPxTextBox;

            ASPxTextBox textId = grdFamily.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxComboBox cboRelate = grdFamily.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            ASPxTextBox txtBirdthday = grdFamily.FindEditFormTemplateControl("txtBirdthday") as ASPxTextBox;
            ASPxTextBox txtAdress = grdFamily.FindEditFormTemplateControl("txtAdress") as ASPxTextBox;
            ASPxTextBox txtOccupation = grdFamily.FindEditFormTemplateControl("txtOccupation") as ASPxTextBox;
            ASPxTextBox txtHistory = grdFamily.FindEditFormTemplateControl("txtHistory") as ASPxTextBox;
            ASPxTextBox txtEmpId = grdFamily.FindEditFormTemplateControl("txtEmpId") as ASPxTextBox;
            

            this.family.id = -1;
            this.family.birthday = txtBirdthday.Text;
            this.family.fullname = text.Text;
            this.family.occupation = txtOccupation.Text;
            this.family.description = txtHistory.Text;
            this.family.placeofbirth = txtAdress.Text;
            this.family.editor = this.UserId;
            this.family.modifieddate = DateTime.Now;
            this.family.ip = HttpContext.Current.Request.UserHostAddress;
            this.family.employeeid = Int32.Parse(txtEmpId.Text.Trim());
            this.family.relationshipid = Int32.Parse(cboRelate.SelectedItem.Value.ToString());
            this.obiFamily.AddFamilyRelationship(family);

            grdFamily.CancelEdit();
            e.Cancel = true;
            BindGrid();
        }
        protected void grdFamily_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Height = 30;
        }

        protected void grdFamily_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "relationshipid")
            {
                ASPxLabel lblRelate = grdFamily.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblRelate") as ASPxLabel;
                lblRelate.Text = objRelation.GetRelationship(Int32.Parse(e.CellValue.ToString())).name;

            }
        }
        protected void grdFamily_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.family = obiFamily.GetFamilyRelationship(Int32.Parse(e.Keys[grdFamily.KeyFieldName].ToString()));
            if (this.family != null)
            {

                this.obiFamily.DeleteFamilyRelationship(family);
            }

            grdFamily.CancelEdit();
            e.Cancel = true;
            BindGrid();

        }
        protected void cboRelate_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboRelate = grdFamily.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            if (cboRelate != null)
            {
                Relationship.RelationshipController obj = new VNPT.Modules.Relationship.RelationshipController();
                foreach (Relationship.RelationshipInfo p in obj.GetRelationships())
                {
                    cboRelate.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.name, p.id.ToString()));
                    cboRelate.SelectedIndex = 0;
                }
            }
            if (GetText("relationshipid") != null && GetText("relationshipid").Trim() != "")
            {
                ListEditItem item = cboRelate.Items.FindByValue((object)GetText("relationshipid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void txtEmpId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("employeeid") != null && GetText("employeeid").Trim() != "")
            {
                txt.Text = GetText("employeeid");
            }
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("fullname") != null && GetText("fullname").Trim() != "")
            {
                txt.Text = GetText("fullname");
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
        protected void txtBirdthday_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("birthday") != null && GetText("birthday").Trim() != "")
            {
                txt.Text = GetText("birthday");
            }
        }
        protected void txtAdress_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("placeofbirth") != null && GetText("placeofbirth").Trim() != "")
            {
                txt.Text = GetText("placeofbirth");
            }
        }
        protected void txtOccupation_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("occupation") != null && GetText("occupation").Trim() != "")
            {
                txt.Text = GetText("occupation");
            }
        }
        protected void txtHistory_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("description") != null && GetText("description").Trim() != "")
            {
                txt.Text = GetText("description");
            }
        }
        private string GetText(string fieldName)
        {
            int index = grdFamily.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grdFamily.GetRowValues(index, fieldName).ToString();

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


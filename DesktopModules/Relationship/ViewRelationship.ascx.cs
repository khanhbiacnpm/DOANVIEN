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

namespace VNPT.Modules.Relationship
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewRelationship class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewRelationship : PortalModuleBase, IActionable
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
        Relationship.RelationshipController objRelation = new RelationshipController();
        RelationshipInfo relation = new RelationshipInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            
                try
                {
                    if (objRelation.GetRelationships().Count > 0)
                    {
                        this.grid.DataSource = objRelation.GetRelationships();
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
            ASPxComboBox cboRelate = grid.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            ASPxTextBox txtSequense = grid.FindEditFormTemplateControl("txtSequense") as ASPxTextBox;
            this.relation = objRelation.GetRelationship(Int32.Parse(textId.Text));

            if (this.relation != null)
            {
                this.relation.name = text.Text;
                if (cboRelate != null)
                {
                    this.relation.rank = Int32.Parse(cboRelate.SelectedItem.Value.ToString());
                    this.relation.level = Int32.Parse(txtSequense.Text);
                }
                this.objRelation.UpdateRelationship(relation);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objRelation.GetRelationships();
            this.grid.DataBind();

        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxComboBox cboRelate = grid.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            ASPxTextBox txtSequense = grid.FindEditFormTemplateControl("txtSequense") as ASPxTextBox;
            
            this.relation.id = -1;
            this.relation.name = text.Text;
            if (cboRelate != null)
            {
                this.relation.rank = Int32.Parse(cboRelate.SelectedItem.Value.ToString());
                this.relation.level = Int32.Parse(txtSequense.Text);
            }
            this.objRelation.AddRelationship(relation);

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objRelation.GetRelationships();
            this.grid.DataBind();


        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.relation = objRelation.GetRelationship(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.relation != null)
            {

                this.objRelation.DeleteRelationship(relation);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objRelation.GetRelationships();
            this.grid.DataBind();


        }
        protected void cboRelate_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboRelate = grid.FindEditFormTemplateControl("cboRelate") as ASPxComboBox;
            if (cboRelate != null)
            {
                cboRelate.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("Về bản thân vợ( hoặc chồng) và các con", "1"));
                cboRelate.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("Ông, bà(nội,ngoại), cha, mẹ, anh chị em ruột", "2"));
                cboRelate.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("Ông, bà(nội,ngoại), cha, mẹ, anh chị em ruột của bên vợ hoặc chồng", "3"));
            }
            if (GetText("rank") != null && GetText("rank").Trim() != "")
            {
                ListEditItem item = cboRelate.Items.FindByValue((object)GetText("rank"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void txtSequense_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("level") != null && GetText("level").Trim() != "")
            {
                txt.Text = GetText("level");
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

        protected void grid_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Height=30;
        }

        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "rank")
            {
                ASPxLabel lblRelate = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblRelate") as ASPxLabel;
                //lblRelate.Text = Convert.ToString(e.CellValue);
                if (Int32.Parse(e.CellValue.ToString()) == 1)
                {
                    lblRelate.Text = "Về bản thân vợ( hoặc chồng) và các con";
                }
                if (Int32.Parse(e.CellValue.ToString()) == 2)
                {
                    lblRelate.Text = "Ông, bà(nội,ngoại), cha, mẹ, anh chị em ruột";
                }
                if (Int32.Parse(e.CellValue.ToString()) == 3)
                {
                    lblRelate.Text = "Ông, bà(nội,ngoại), cha, mẹ, anh chị em ruột của bên vợ hoặc chồng";
                }
                
            }
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


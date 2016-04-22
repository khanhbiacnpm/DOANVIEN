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
using DevExpress.Web.ASPxClasses;

namespace Philip.Modules.Professional
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewProfessional class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewProfessional : PortalModuleBase, IActionable
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

        Professional.ProfessionalController objProfessional = new ProfessionalController();
        Professional.ProfessionalInfo professional = new ProfessionalInfo();
        VNPT.Modules.DanhMuc.DanhMucController obj = new VNPT.Modules.DanhMuc.DanhMucController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (objProfessional.GetProfessionals().Count > 0)
                {
                    this.grid.DataSource = objProfessional.GetProfessionals();
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
            ASPxComboBox cmbNhomChuyenNganh = grid.FindEditFormTemplateControl("cmbNhomChuyenNganh") as ASPxComboBox;
            
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            this.professional = objProfessional.GetProfessional(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            bool result = false;
            if (this.professional != null)
            {
                if (txtCode.Text.Trim() == professional.code )
                {
                    professional.name = text.Text;
                    professional.code = txtCode.Text;
                    professional.isactive = true;
                    professional.groupid = Int32.Parse(cmbNhomChuyenNganh.SelectedItem.Value.ToString());
                    this.objProfessional.UpdateProfessional(professional);                   
                }
                else
                {
                    if (objProfessional.GetProfessionalByCode(txtCode.Text) == null)
                    {
                        professional.name = text.Text;
                        professional.code = txtCode.Text;
                        professional.groupid = Int32.Parse(cmbNhomChuyenNganh.SelectedItem.Value.ToString());
                        professional.isactive = true;
                        this.objProfessional.UpdateProfessional(professional);
                        //this.grid.JSProperties["cpResult1"] = Int32.Parse(textId.Text);
                    
                    }
                    else
                    {
                        this.grid.JSProperties["cpResult"] = Int32.Parse(e.Keys[grid.KeyFieldName].ToString());
                       
                    }
                }
            }
            e.Cancel = true;
            grid.CancelEdit();
            this.grid.DataSource = objProfessional.GetProfessionals();
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxComboBox cmbNhomChuyenNganh = grid.FindEditFormTemplateControl("cmbNhomChuyenNganh") as ASPxComboBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;

            if (objProfessional.GetProfessionalByCode(txtCode.Text) == null)
            {
                professional.id = -1;
                professional.groupid = Int32.Parse(cmbNhomChuyenNganh.SelectedItem.Value.ToString());
                professional.code = txtCode.Text;
                professional.name = text.Text;
                professional.isactive = true;
                this.objProfessional.AddProfessional(professional);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objProfessional.GetProfessionals();
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.professional = objProfessional.GetProfessional(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.professional != null)
            {

                this.objProfessional.DeleteProfessional(professional);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objProfessional.GetProfessionals();
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
        protected void cmbNhomChuyenNganh_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox txt = sender as ASPxComboBox;
            
            foreach (var v in obj.GetNhomChuyenNganhs())
            {
                txt.Items.Add(new ListEditItem(v.NhomChuyenNganh,v.Id.ToString()));
            }
            if (GetText("groupid") != null && GetText("groupid").Trim() != "")
            {
                ListEditItem item = txt.Items.FindByValue(GetText("groupid").Trim());
                if (item != null)
                {
                    item.Selected = true;
                }
                else {
                    txt.SelectedIndex = 0;
                }
            }
            else
            {
                txt.SelectedIndex = 0;
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
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "groupid")
                {
                    ASPxLabel lblChuyenNganh = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblChuyenNganh") as ASPxLabel;
                    lblChuyenNganh.Text = obj.GetNhomChuyenNganh(Int32.Parse(e.CellValue.ToString().Trim())).NhomChuyenNganh;
                    
                }
               
            }
            catch { }
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


﻿/*
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

namespace VNPT.Modules.Province
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewProvince class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewProvince : PortalModuleBase, IActionable
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

        ProvinceController objProvince = new ProvinceController();
        ProvinceInfo province = new ProvinceInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
               
                    //cmdDelete.Attributes.Add("onClick", "javascript:return confirm('" + Localization.GetString("DeleteItem") + "');");

                   
                    //bind the content to the repeater
                    grid.DataSource = objProvince.GetProvinces();
                    grid.DataBind();
                
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
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
            ASPxTextBox txtNgayDiDuong = grid.FindEditFormTemplateControl("txtNgayDiDuong") as ASPxTextBox;
            this.province = objProvince.GetProvince(Int32.Parse(textId.Text));

            if (this.province != null)
            {

                province.Name = text.Text.Trim();
                province.AddedDay = Int32.Parse(txtNgayDiDuong.Text);
                province.CreatedByUser = this.UserId;
                province.Ip = HttpContext.Current.Request.UserHostAddress;
                this.objProvince.UpdateProvince(province);
            }

            grid.CancelEdit();
            e.Cancel = true;
            grid.DataSource = objProvince.GetProvinces();
            grid.DataBind();



        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtNgayDiDuong = grid.FindEditFormTemplateControl("txtNgayDiDuong") as ASPxTextBox;
            

            province.Id = -1;
            province.Name = text.Text.Trim();
            province.AddedDay =Int32.Parse(txtNgayDiDuong.Text);
            province.CreatedByUser = this.UserId;
            province.Ip = HttpContext.Current.Request.UserHostAddress;
            this.objProvince.AddProvince(province);


            grid.CancelEdit();
            e.Cancel = true;
            grid.DataSource = objProvince.GetProvinces();
            grid.DataBind();


        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.province = objProvince.GetProvince(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.objProvince != null)
            {

                this.objProvince.DeleteProvince(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), this.UserId, HttpContext.Current.Request.UserHostAddress);
            }

            grid.CancelEdit();
            e.Cancel = true;
            grid.DataSource = objProvince.GetProvinces();
            grid.DataBind();



        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("Name") != null && GetText("Name").Trim() != "")
            {
                txt.Text = GetText("Name");
            }
        }
        protected void txtNgayDiDuong_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("AddedDay") != null && GetText("AddedDay").Trim() != "")
            {
                txt.Text = GetText("AddedDay");
            }
        }
        
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("Id") != null && GetText("Id").Trim() != "")
            {
                txt.Text = GetText("Id");
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


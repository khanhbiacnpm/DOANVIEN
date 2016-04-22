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
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using DevExpress.Web.ASPxHiddenField;
namespace VNPT.Modules.DanhMuc
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewBloodGroup class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class KinhNghiem : PortalModuleBase, IActionable
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

        VNPT.Modules.DanhMuc.DanhMucController obj = new VNPT.Modules.DanhMuc.DanhMucController();
        VNPT.Modules.DanhMuc.NhomChucDanhInfo nhomchucdanh = new VNPT.Modules.DanhMuc.NhomChucDanhInfo();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            
                try
                {
                    if (!this.IsPostBack)
                    {
                      
                        LoadKinhNghiem();
                    }

                    
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
           

        }
       
        protected void gridBangCap_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_data_combo();
        }
        protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            
            LoadKinhNghiem();
        }
        private void load_data_combo()
        {
           
           
        }
       
        private void LoadKinhNghiem()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetKinhNghiemLamViec]", 0).Tables[0];

            grid.DataSource = tb;
            grid.DataBind();
        }
       

        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            
            ASPxTextBox txtSoNam = grid.FindEditFormTemplateControl("txtThuTu") as ASPxTextBox;
            
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KinhNghiemLamViec]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), txtName.Text, Int32.Parse(txtSoNam.Text),  1);
            
           

            grid.CancelEdit();
            e.Cancel = true;
            LoadKinhNghiem();


        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;

            
            ASPxTextBox txtSoNam = grid.FindEditFormTemplateControl("txtThuTu") as ASPxTextBox;
            
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KinhNghiemLamViec]", 0, txtName.Text, Int32.Parse(txtSoNam.Text),  0);



            grid.CancelEdit();
            e.Cancel = true;
            LoadKinhNghiem();

        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {


            

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KinhNghiemLamViec]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()),"",0, 2);



            grid.CancelEdit();
            e.Cancel = true;
            LoadKinhNghiem();

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


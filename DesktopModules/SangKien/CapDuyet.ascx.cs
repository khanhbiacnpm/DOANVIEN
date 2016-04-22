﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DotNetNuke.Entities.Modules;
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Text;
using System.Collections;
using System.Configuration;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DevExpress.Web.ASPxEditors;

namespace DotNetNuke.Modules.SangKien
{
    // tabid = 1968
    public partial class CapKhenThuong : PortalModuleBase, IActionable
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                load_grid();
        }
        private void load_grid()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_SANGKIEN_CAPDUYET_GET", 0, 0).Tables[0];
            grid_capduyetsangkien.DataSource = tb;
            grid_capduyetsangkien.DataBind();
        }        
        protected void grid_capduyetsangkien_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txt_capduyet = grid_capduyetsangkien.FindEditFormTemplateControl("txt_capduyet") as ASPxTextBox;
            SqlHelper.ExecuteNonQuery(strconn, "HRM_SANGKIEN_CAPDUYET_UI", 0, txt_capduyet.Text, 0);

            grid_capduyetsangkien.CancelEdit();
            e.Cancel = true;
            load_grid();
        }
        protected void grid_capduyetsangkien_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txt_capduyet = grid_capduyetsangkien.FindEditFormTemplateControl("txt_capduyet") as ASPxTextBox;
            SqlHelper.ExecuteNonQuery(strconn, "HRM_SANGKIEN_CAPDUYET_UI", e.Keys["id"], txt_capduyet.Text, 1);

            grid_capduyetsangkien.CancelEdit();
            e.Cancel = true;
            load_grid();
        }
        protected void grid_capduyetsangkien_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "HRM_SANGKIEN_CAPDUYET_GET", e.Keys["id"], 10);
            grid_capduyetsangkien.CancelEdit();
            e.Cancel = true;
            load_grid();
        }        
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }
    }
}



using System;
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

namespace DotNetNuke.Modules.KhenThuong
{
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
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GET_CAPKHENTHUONG", 0, 0).Tables[0];
            grid_capkhenthuong.DataSource = tb;
            grid_capkhenthuong.DataBind();
        }        
        protected void grid_capkhenthuong_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txt_capkhenthuong = grid_capkhenthuong.FindEditFormTemplateControl("txt_capkhenthuong") as ASPxTextBox;
            ASPxTextBox txt_vitri = grid_capkhenthuong.FindEditFormTemplateControl("txt_vitri") as ASPxTextBox;

            SqlHelper.ExecuteNonQuery(strconn, "HRM_CAPKHENTHUONG_UI", 0, txt_capkhenthuong.Text, txt_vitri.Text, 0);

            grid_capkhenthuong.CancelEdit();
            e.Cancel = true;
            load_grid();
        }
        protected void grid_capkhenthuong_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txt_capkhenthuong = grid_capkhenthuong.FindEditFormTemplateControl("txt_capkhenthuong") as ASPxTextBox;
            ASPxTextBox txt_vitri = grid_capkhenthuong.FindEditFormTemplateControl("txt_vitri") as ASPxTextBox;

            SqlHelper.ExecuteNonQuery(strconn, "HRM_CAPKHENTHUONG_UI", e.Keys["id"], txt_capkhenthuong.Text, txt_vitri.Text, 1);

            grid_capkhenthuong.CancelEdit();
            e.Cancel = true;
            load_grid();
        }
        protected void grid_capkhenthuong_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "HRM_GET_CAPKHENTHUONG", e.Keys["id"], 10);
            grid_capkhenthuong.CancelEdit();
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



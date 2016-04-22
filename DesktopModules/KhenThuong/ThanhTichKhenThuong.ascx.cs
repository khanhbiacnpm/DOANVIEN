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
using System.Data.SqlClient;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;


namespace DotNetNuke.Modules.KhenThuong
{    
    partial class ThanhTichKhenThuong : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HinhThucThanhTich();
            }
           
        }
        private void HinhThucThanhTich()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_HinhThucThanhTich]", 0, 1).Tables[0];

            grid.DataSource = tb;
            grid.DataBind();
        }
      
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_HinhThucThanhTich_UI]", 0, txtName.Text, memoGhiChu.Text, 0);

            grid.CancelEdit();
            e.Cancel = true;
            HinhThucThanhTich();
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_HinhThucThanhTich_UI]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), txtName.Text, memoGhiChu.Text, 1);

            grid.CancelEdit();
            e.Cancel = true;
            HinhThucThanhTich();
        }        
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_HinhThucThanhTich_UI]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()),"", "", 2);
            grid.CancelEdit();
            e.Cancel = true;
            HinhThucThanhTich();
        }
        public ModuleActionCollection ModuleActions
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


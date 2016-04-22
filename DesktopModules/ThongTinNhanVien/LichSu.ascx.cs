using System;
using System.Web;
using System.Linq;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;
using System.Data;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class LichSu : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!IsPostBack)
                load_data();
        }                
        #region EmpHistory

        protected void grdLichSu_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txt_tuthangnam = grdLichSu.FindEditFormTemplateControl("txt_tuthangnam") as ASPxTextBox;
            ASPxTextBox txt_denthangnam = grdLichSu.FindEditFormTemplateControl("txt_denthangnam") as ASPxTextBox;
            ASPxMemo memo_noidung = grdLichSu.FindEditFormTemplateControl("memo_noidung") as ASPxMemo;
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_LichSu_UI", e.Keys["id"], txt_tuthangnam.Text, txt_denthangnam.Text, memo_noidung.Text, idNV, 1);            
            grdLichSu.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void grdLichSu_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txt_tuthangnam = grdLichSu.FindEditFormTemplateControl("txt_tuthangnam") as ASPxTextBox;
            ASPxTextBox txt_denthangnam = grdLichSu.FindEditFormTemplateControl("txt_denthangnam") as ASPxTextBox;
            ASPxMemo memo_noidung = grdLichSu.FindEditFormTemplateControl("memo_noidung") as ASPxMemo;
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_LichSu_UI", 0, txt_tuthangnam.Text, txt_denthangnam.Text, memo_noidung.Text, idNV, 0);
            grdLichSu.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        
        protected void grdLichSu_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Get_LichSu_IdNV", e.Keys["id"], 1);
            grdLichSu.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        private void load_data()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_Get_LichSu_IdNV", idNV, 0).Tables[0];
                
                grdLichSu.DataSource = tb;
                grdLichSu.DataBind();
            }
        }
        #endregion
        #region Optional Interfaces
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

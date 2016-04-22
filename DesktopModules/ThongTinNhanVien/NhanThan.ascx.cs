using System;
using System.Web;
using System.Linq;
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

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class NhanThan : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if(!IsPostBack)
                load_data();
        }
        private void load_data()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Quanhegiadinh]", idNV, 0).Tables[0];
                
                this.grdNhanThan.DataSource = tb;
                this.grdNhanThan.DataBind();
            }
        }
        #region FamilyRelation 
        protected void grdNhanThan_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            if (!grdNhanThan.IsNewRowEditing)
            {
                var cmb_quanhe = grdNhanThan.FindEditFormTemplateControl("cmb_quanhe") as ASPxComboBox;
                cmb_quanhe.DataBind();
                var quanhe = grdNhanThan.GetRowValues(grdNhanThan.EditingRowVisibleIndex, "quanhe").ToString();
                var itemquan = cmb_quanhe.Items.FindByText(quanhe);
                if (itemquan != null)
                    itemquan.Selected = true;                
            }
        }
        protected void grdNhanThan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {           
            ASPxComboBox cmb_quanhe = grdNhanThan.FindEditFormTemplateControl("cmb_quanhe") as ASPxComboBox;
            ASPxTextBox txt_ten = grdNhanThan.FindEditFormTemplateControl("txt_ten") as ASPxTextBox;
            ASPxTextBox txt_namsinh = grdNhanThan.FindEditFormTemplateControl("txt_namsinh") as ASPxTextBox;
            ASPxTextBox txt_thuongtru = grdNhanThan.FindEditFormTemplateControl("txt_thuongtru") as ASPxTextBox;
            ASPxTextBox txt_nghenghiep = grdNhanThan.FindEditFormTemplateControl("txt_nghenghiep") as ASPxTextBox;
            ASPxTextBox txt_ghichu = grdNhanThan.FindEditFormTemplateControl("txt_ghichu") as ASPxTextBox;
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_ThanNhan_UI]", e.Keys["Id"], txt_ten.Text, txt_namsinh.Text,
                    txt_thuongtru.Text, txt_nghenghiep.Text, Convert.ToInt32(cmb_quanhe.Value), idNV, txt_ghichu.Text, 1);
            }
            grdNhanThan.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void grdNhanThan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmb_quanhe = grdNhanThan.FindEditFormTemplateControl("cmb_quanhe") as ASPxComboBox;
            ASPxTextBox txt_ten = grdNhanThan.FindEditFormTemplateControl("txt_ten") as ASPxTextBox;
            ASPxTextBox txt_namsinh = grdNhanThan.FindEditFormTemplateControl("txt_namsinh") as ASPxTextBox;
            ASPxTextBox txt_thuongtru = grdNhanThan.FindEditFormTemplateControl("txt_thuongtru") as ASPxTextBox;
            ASPxTextBox txt_nghenghiep = grdNhanThan.FindEditFormTemplateControl("txt_nghenghiep") as ASPxTextBox;
            ASPxTextBox txt_ghichu = grdNhanThan.FindEditFormTemplateControl("txt_ghichu") as ASPxTextBox;
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_ThanNhan_UI]", 0, txt_ten.Text, txt_namsinh.Text,
                    txt_thuongtru.Text, txt_nghenghiep.Text, Convert.ToInt32(cmb_quanhe.Value), idNV, txt_ghichu.Text, 0);
            }
            grdNhanThan.CancelEdit();
            e.Cancel = true;
            load_data();
        }
        protected void grdNhanThan_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Get_Quanhegiadinh", e.Keys["Id"], 1);
            grdNhanThan.CancelEdit();
            e.Cancel = true;
            load_data();
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

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
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewCountry class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class HinhThucKT : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindComBobox();

                LoadDanhHieuThiDua(2, 0);
            }
           
        }
        protected void grid_CustomerCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string s = e.Parameters.ToString();
            string[] st = s.Split(',');
            int doituong = int.Parse(st[1]);
            int loaithanhtich = int.Parse(st[0]);

            LoadDanhHieuThiDua(doituong, loaithanhtich);
        }
        private void LoadDanhHieuThiDua(int doituong, int loaithanhtich)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DanhHieuThiDua]",0, doituong, loaithanhtich, 1).Tables[0];
           
            grid.DataSource = tb;
            grid.DataBind();
        }
        
        private void BindComBobox()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_ThiDua_Combo]");
            cmbThanhTich.DataSource = ds.Tables[0];
            cmbThanhTich.TextField = "ten";
            cmbThanhTich.ValueField = "id";
            cmbThanhTich.DataBind();
            cmbThanhTich.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbThanhTich.SelectedIndex = 0;

            cmbDoiTuong.Items.Add(new ListEditItem("-- Tất cả --",2 ));
            cmbDoiTuong.Items.Add(new ListEditItem("Tập thể",0));
            cmbDoiTuong.Items.Add(new ListEditItem("Cá nhân",1));
            cmbDoiTuong.SelectedIndex = 0;


            
        }       
       
        private void load_dataCombox()
        {

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_ThiDua_Combo]");
            ASPxComboBox cmbThanhTichUpdate = grid.FindEditFormTemplateControl("cmbThanhTichUpdate") as ASPxComboBox;
            cmbThanhTichUpdate.DataSource = ds.Tables[0];
            cmbThanhTichUpdate.ValueField = "id";
            cmbThanhTichUpdate.TextField = "ten";
            cmbThanhTichUpdate.DataBind();

            ASPxComboBox cmbDoiTuongUpdate = grid.FindEditFormTemplateControl("cmbDoiTuongUpdate") as ASPxComboBox;

            cmbDoiTuongUpdate.Items.Add(new ListEditItem("-- Tất cả --", 2));
            cmbDoiTuongUpdate.Items.Add(new ListEditItem("Tập thể",0));
            cmbDoiTuongUpdate.Items.Add(new ListEditItem("Cá nhân", 1));
            cmbDoiTuongUpdate.SelectedIndex = 0;


            if (!grid.IsNewRowEditing)
            {
                var itemThanhTich = cmbThanhTichUpdate.Items.FindByValue(grid.GetRowValues(grid.EditingRowVisibleIndex, "idthanhtich"));
                if (itemThanhTich != null)
                {
                    itemThanhTich.Selected = true;
                    
                }
                var itemDoiTuong = cmbDoiTuongUpdate.Items.FindByValue(grid.GetRowValues(grid.EditingRowVisibleIndex, "Loai"));
                if (itemDoiTuong != null)
                {
                    itemDoiTuong.Selected = true;

                }
            }
        }
        private static string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtVietTat = grid.FindEditFormTemplateControl("txtVietTat") as ASPxTextBox;
            ASPxTextBox txtCapKhenThuong = grid.FindEditFormTemplateControl("txtCapKhenThuong") as ASPxTextBox;
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxComboBox cmbDoiTuongUpdate = grid.FindEditFormTemplateControl("cmbDoiTuongUpdate") as ASPxComboBox;
            ASPxComboBox cmbThanhTichUpdate = grid.FindEditFormTemplateControl("cmbThanhTichUpdate") as ASPxComboBox;

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_DanhHieuThiDua_UI]", 0, cmbThanhTichUpdate.Value, txtName.Text, txtVietTat.Text, memoGhiChu.Text,
                       cmbDoiTuongUpdate.Value,txtCapKhenThuong.Text, 0);

            grid.CancelEdit();
            e.Cancel = true;
            grid.DataBind();
            LoadDanhHieuThiDua(Int32.Parse(cmbDoiTuong.Value.ToString()), Int32.Parse(cmbThanhTich.Value.ToString()));
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {   

            ASPxTextBox txtName = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtVietTat = grid.FindEditFormTemplateControl("txtVietTat") as ASPxTextBox;
            ASPxTextBox txtCapKhenThuong = grid.FindEditFormTemplateControl("txtCapKhenThuong") as ASPxTextBox;
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxComboBox cmbDoiTuongUpdate = grid.FindEditFormTemplateControl("cmbDoiTuongUpdate") as ASPxComboBox;
            ASPxComboBox cmbThanhTichUpdate = grid.FindEditFormTemplateControl("cmbThanhTichUpdate") as ASPxComboBox;

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_DanhHieuThiDua_UI]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), cmbThanhTichUpdate.Value, txtName.Text, txtVietTat.Text, memoGhiChu.Text,
                       cmbDoiTuongUpdate.Value, txtCapKhenThuong.Text, 1);

            grid.CancelEdit();
            e.Cancel = true;
            grid.DataBind();
            LoadDanhHieuThiDua(Int32.Parse(cmbDoiTuong.Value.ToString()), Int32.Parse(cmbThanhTich.Value.ToString()));
        }        
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_DanhHieuThiDua_UI]", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), 0, "", "","",0,"", 2);
            grid.CancelEdit();
            e.Cancel = true;
            grid.DataBind();
            LoadDanhHieuThiDua(Int32.Parse(cmbDoiTuong.Value.ToString()), Int32.Parse(cmbThanhTich.Value.ToString()));
        }
        protected void grid_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_dataCombox();
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


using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

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
using DevExpress.Web.ASPxHtmlEditor;
using System.ComponentModel;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace Philip.Modules.Office
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewOffice class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class BOffice : PortalModuleBase, IActionable
    {      
        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        Philip.Modules.Salary_Group.Salary_GroupController objGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
        VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
        Philip.Modules.Salary_Group.Salary_GroupController objSalaryGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
        Philip.Modules.SalaryOffice.SalaryOfficeInfo salaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeInfo();
        Philip.Modules.SalaryOffice.SalaryOfficeController objSalaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeController();
        Office.OfficeController objOffice = new OfficeController();
        Office.OfficeInfo office = new OfficeInfo();
        VNPT.Modules.DanhMuc.DanhMucController obj = new VNPT.Modules.DanhMuc.DanhMucController();
        VNPT.Modules.DanhMuc.NhomChucDanhBInfo nhomchucdanh = new VNPT.Modules.DanhMuc.NhomChucDanhBInfo();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    DotNetNuke.Framework.jQuery.RequestRegistration();
                    LoadNhomChucDanh();
                }
                LoadGridChucDanh();
            }
            catch (Exception ex)
            {
                Exceptions.ProcessModuleLoadException(this, ex);
            }
        }
        protected void cbpnTintuc_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.StartsWith("Edit"))
            {
                LoadChucDanh(Int32.Parse(e.Parameter.ToString().Substring(4)));
            }
            else if (e.Parameter.StartsWith("Save"))
            {
                try
                {
                    int id = Int32.Parse(e.Parameter.ToString().Substring(4));
                    int n = 0;
                    if (id > 0)
                    {
                        n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Office]", id, txtCode.Text, txtName.Text, memoGhiChuChucDanh.Text, 1, Convert.ToInt32(cmbMoiTruongLamViec.SelectedItem.Value), 1, 0, Int32.Parse(cmbNhomChucDanh.Value.ToString()),1);
                    }
                    else
                    {
                        n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Office]", id, txtCode.Text, txtName.Text, memoGhiChuChucDanh.Text, 1, Convert.ToInt32(cmbMoiTruongLamViec.SelectedItem.Value), 1, 0, Int32.Parse(cmbNhomChucDanh.Value.ToString()), 0);
                    }
                    this.cbpnTintuc.JSProperties["cpResult"] = 1;
                }
                catch (Exception ex)
                {
                    this.cbpnTintuc.JSProperties["cpResult"] = 0;
                }
            }
            else if (e.Parameter.StartsWith("Delete"))
            {
                int id = Int32.Parse(e.Parameter.ToString().Substring(6));
                int n = 0;
                if (id > 0)
                {
                    n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Office]", id, "", "", "", 1, 0, 1, 0, 0,  2);
                    this.cbpnTintuc.JSProperties["cpResult"] = 1;
                }
            }
            else {
                this.cmbMoiTruongLamViec.SelectedIndex = 0;
                this.cmbNhomChucDanh.SelectedIndex = 0;
                this.txtCode.Text = "";
                this.txtName.Text = "";
                this.memoGhiChuChucDanh.Text = "";
            }
        }
        private void LoadChucDanh(int id)
        {
            this.office = objOffice.GetOffice(id);
            if (this.office != null)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetOffice]", id,1).Tables[0];
                
                txtName.Text = tb.Rows[0]["Name"].ToString();
                txtCode.Text = tb.Rows[0]["Code"].ToString();
                memoGhiChuChucDanh.Text = tb.Rows[0]["Note"].ToString();
                ListEditItem item = cmbMoiTruongLamViec.Items.FindByValue(GetText("DocHai").ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
                else {
                    cmbMoiTruongLamViec.SelectedIndex = 0;
                }
               
                ListEditItem item1 = cmbNhomChucDanh.Items.FindByValue(tb.Rows[0]["IdNhomChucDanhB"].ToString().Trim());
                if (item1 != null)
                {
                    item1.Selected = true;
                }
                else
                {
                    cmbNhomChucDanh.SelectedIndex = 0;
                }
              
            }
        
        }
        private void LoadGridChucDanh()
        {
           
           

                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetChucDanhB]", 0).Tables[0];
                if (tb.Rows.Count > 0)

                    grid.DataSource = tb;
                grid.DataBind();
            
        }
        
        protected void LoadNhomChucDanh()
        {
           
            cmbNhomChucDanh.Items.Clear();
            cmbNhomChucDanh.Items.Add(new ListEditItem("-- Chọn nhóm chức danh --", "0"));
            
            foreach (var u in obj.GetNhomChucDanhBs())
            {
                cmbNhomChucDanh.Items.Add(new ListEditItem(u.NhomChucDanh, u.Id.ToString()));
            }

            
        }
        protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            LoadGridChucDanh();
        }
       
     
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
          
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;            
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChuChucDanh") as ASPxMemo;
            ASPxComboBox cmbMoiTruongLamViec = grid.FindEditFormTemplateControl("cmbMoiTruongLamViec") as ASPxComboBox;
            ASPxComboBox cmbNguonNhanLuc = grid.FindEditFormTemplateControl("cmbNguonNhanLuc") as ASPxComboBox;
            ASPxComboBox cmbNhomChucDanh = grid.FindEditFormTemplateControl("cmbNhomChucDanh") as ASPxComboBox;
            
             cmbNhomChucDanh = grid.FindEditFormTemplateControl("cmbNhomChucDanh") as ASPxComboBox;


             
            if (Session["IdChucDanh"] != null) { Session.Remove("IdChucDanh"); }
            grid.CancelEdit();
            e.Cancel = true;
            LoadGridChucDanh();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChuChucDanh") as ASPxMemo;
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            ASPxComboBox cmbMoiTruongLamViec = grid.FindEditFormTemplateControl("cmbMoiTruongLamViec") as ASPxComboBox;
            ASPxComboBox cmbNguonNhanLuc = grid.FindEditFormTemplateControl("cmbNguonNhanLuc") as ASPxComboBox;
            ASPxComboBox cmbNhomChucDanh = grid.FindEditFormTemplateControl("cmbNhomChucDanh") as ASPxComboBox;
            office.id = -1;
            office.name = text.Text;
            office.IdNhomChucDanhB = Int32.Parse(cmbNhomChucDanh.Value.ToString());
            office.IdNhomNguonNhanLuc =0;
            office.note = memoGhiChu.Text;
            office.code = txtCode.Text;
            office.isactive = true;
            office.DocHai = Convert.ToInt32(cmbMoiTruongLamViec.SelectedItem.Value);
            office.type = 1;
            this.objOffice.AddOffice(office);
            //if (Session["HDBanThan"] != null)
            //{                
            //    DataTable table = (DataTable)Session["HDBanThan"];
            //    foreach (DataRow row in table.Rows)
            //    {
            //        salaryOffice.id = -1;
            //        salaryOffice.IdChucDanh = objOffice.GetOfficeMaxId().ToList()[0].id;
            //        salaryOffice.IdQLNNuoc = Convert.ToInt32(row["IdQLNNuoc"].ToString());
            //        salaryOffice.IdNhomLuong = Convert.ToInt32(row["IdNhomLuong"].ToString());                    
            //        objSalaryOffice.AddSalaryOffice(salaryOffice);
            //    }
            //    Session.Remove("HDBanThan");
            //}
            //if (Session["IdChucDanh"] != null) { Session.Remove("IdChucDanh"); }
            grid.CancelEdit();
            e.Cancel = true;
            LoadGridChucDanh();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.office = objOffice.GetOffice(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.office != null)
            {
                this.objOffice.DeleteOffice(office);
            }
            grid.CancelEdit();
            e.Cancel = true;
            LoadGridChucDanh();
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
        
       
        protected void grid_OnHtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            
            if (e.DataColumn.FieldName == "IdNhomNguonNhanLuc")
            {
                
                    ASPxLabel lblNhomNguonNhanLuc = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblNhomNguonNhanLuc") as ASPxLabel;
                    var nnl=obj.GetNhomChucDanh(Int32.Parse(e.CellValue.ToString()));
                    if(nnl != null)
                    {
                        lblNhomNguonNhanLuc.Text = nnl.NhomChucDanh;
                    }
                
            }
            if (e.DataColumn.FieldName == "IdNhomChucDanhB")
            {
               
                    ASPxLabel lblNhomChucDanh = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblNhomChucDanh") as ASPxLabel;
                    var nhom=obj.GetNhomChucDanhB(Int32.Parse(e.CellValue.ToString()));
                    if (nhom != null)
                    {
                        lblNhomChucDanh.Text = nhom.NhomChucDanh;
                    }
               
            }
            if (e.DataColumn.FieldName == "DocHai")
            {
                ASPxLabel lbl_DocHai = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_DocHai") as ASPxLabel; ;
                int n = Convert.ToInt32(e.CellValue);
                switch (n)
                {
                    case -1:
                        {
                            lbl_DocHai.Text = "Bình thường";
                            break;
                        }
                    case 0:
                        {
                            lbl_DocHai.Text = "Bình thường";
                            break;
                        }
                    case 1:
                        {
                            lbl_DocHai.Text = "Độc hại";
                            break;
                        }
                    case 2:
                        {
                            lbl_DocHai.Text = "Đặc biệt độc hại";
                            break;
                        }
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


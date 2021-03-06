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
using System.ComponentModel;
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;

namespace Philip.Modules.Office
{   
    partial class ViewOffice : PortalModuleBase, IActionable
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
        VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
        Philip.Modules.Salary_Group.Salary_GroupController objSalaryGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
        Philip.Modules.SalaryOffice.SalaryOfficeInfo salaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeInfo();
        Philip.Modules.SalaryOffice.SalaryOfficeController objSalaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeController();
        Office.OfficeController objOffice = new OfficeController();
        Office.OfficeInfo office = new OfficeInfo();
        private string str_conn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                LoadGridChucDanh();                
            }
            catch (Exception ex)
            {
                Exceptions.ProcessModuleLoadException(this, ex);
            }
        }
        private void LoadGridChucDanh()
        {
            //ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            if (objOffice.GetOffices(0).Count > 0)
            {                
                this.grid.DataSource = objOffice.GetOffices(0);
                this.grid.DataBind();                
            }
        }
        protected void cmbQLNNuoc_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbQLNN = sender as ASPxComboBox;
            cmbQLNN.Items.Clear();
            cmbQLNN.Items.Add(new ListEditItem("-- Chọn QL nhà nước --", "0"));
            List<VNPT.Modules.StateManagement.StateManagementInfo> list = objSate.GetStateManagements();
            foreach (VNPT.Modules.StateManagement.StateManagementInfo u in list)
            {
                cmbQLNN.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbQLNN.SelectedIndex = 0;
            if (Session["idSalaryOffice"] != null)
            {
                if (objSalaryOffice.GetSalaryOffice(Convert.ToInt32(Session["idSalaryOffice"])) != null)
                {
                    int idQLNN = objSalaryOffice.GetSalaryOffice(Convert.ToInt32(Session["idSalaryOffice"].ToString())).IdQLNNuoc;
                    ListEditItem item = cmbQLNN.Items.FindByValue(idQLNN.ToString());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
                else if (Session["HDBanThan"] != null)
                {
                    DataTable table = (DataTable)Session["HDBanThan"];
                    foreach (DataRow row in table.Rows)
                    {
                        if (row["id"].ToString().Equals(Session["idSalaryOffice"].ToString()))
                        {
                            ListEditItem item = cmbQLNN.Items.FindByValue(row["IdQLNNuoc"]);
                            if (item != null)
                            {
                                item.Selected = true;
                            }
                            break;
                        }
                    }
                }
            }                        
        }
        protected void cmbNhomLuong_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbNL = sender as ASPxComboBox;
            cmbNL.Items.Clear();
            cmbNL.Items.Add(new ListEditItem("-- Chọn nhóm lương --", "0"));
            List<Philip.Modules.Salary_Group.Salary_GroupInfo> list = objSalaryGroup.GetSalaryTypeRoot();
            foreach (Philip.Modules.Salary_Group.Salary_GroupInfo u in list)
            {
                cmbNL.Items.Add(new ListEditItem(u.groupname, u.id.ToString()));
                foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p in objSalaryGroup.GetSalaryGroupByParent(u.id))
                {
                    cmbNL.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;") + p.groupname, p.id.ToString()));
                    foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p1 in objSalaryGroup.GetSalaryGroupByParent(p.id))
                    {
                        cmbNL.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;") + p1.groupname, p1.id.ToString()));
                        foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p12 in objSalaryGroup.GetSalaryGroupByParent(p1.id))
                        {
                            cmbNL.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + p12.groupname, p12.id.ToString()));
                        }
                    }
                }
            }
            cmbNL.SelectedIndex = 0;
            if (Session["idSalaryOffice"] != null)
            {
                if(objSalaryOffice.GetSalaryOffice(Convert.ToInt32(Session["idSalaryOffice"])) !=null)
                {
                    int idNL = objSalaryOffice.GetSalaryOffice(Convert.ToInt32(Session["idSalaryOffice"].ToString())).IdNhomLuong;
                    ListEditItem item = cmbNL.Items.FindByValue(idNL.ToString());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
                else if (Session["HDBanThan"] != null)
                {
                    DataTable table = (DataTable)Session["HDBanThan"];
                    foreach (DataRow row in table.Rows)
                    {
                        if (row["id"].ToString().Equals(Session["idSalaryOffice"].ToString()))
                        {
                            ListEditItem item = cmbNL.Items.FindByValue(row["IdNhomLuong"]);
                            if (item != null)
                            {
                                item.Selected = true;
                            }
                            break;
                        }
                    }
                }
            }
        }
        protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            if (textId != null)
            {
                textId.Enabled = false;
            }
            if (Session["HDBanThan"] != null)
            {
                Session.Remove("HDBanThan");
            }
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;            
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChuChucDanh") as ASPxMemo;
            ASPxComboBox cmbMoiTruongLamViec = grid.FindEditFormTemplateControl("cmbMoiTruongLamViec") as ASPxComboBox;
            this.office = objOffice.GetOffice(Int32.Parse(textId.Text));
            if (this.office != null)
            {
                office.note = memoGhiChu.Text;
                office.name = text.Text;
                office.code = txtCode.Text;
                office.isactive = true;
                office.type = 0;
                office.DocHai = Convert.ToInt32(cmbMoiTruongLamViec.SelectedItem.Value);
                this.objOffice.UpdateOffice(office);               
            }
            if (Session["IdChucDanh"] != null) { Session.Remove("IdChucDanh"); }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objOffice.GetOffices(0);
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxMemo memoGhiChu = grid.FindEditFormTemplateControl("memoGhiChuChucDanh") as ASPxMemo;
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            ASPxComboBox cmbMoiTruongLamViec = grid.FindEditFormTemplateControl("cmbMoiTruongLamViec") as ASPxComboBox;

            office.id = -1;
            office.name = text.Text;
            office.note = memoGhiChu.Text;
            office.code = txtCode.Text;
            office.isactive = true;
            office.type = 0;
            office.DocHai = Convert.ToInt32(cmbMoiTruongLamViec.SelectedItem.Value);
            this.objOffice.AddOffice(office);           
            if (Session["HDBanThan"] != null)
            {                
                DataTable table = (DataTable)Session["HDBanThan"];
                foreach (DataRow row in table.Rows)
                {
                    salaryOffice.id = -1;
                    salaryOffice.IdChucDanh = objOffice.GetOfficeMaxId().ToList()[0].id;
                    salaryOffice.IdQLNNuoc = Convert.ToInt32(row["IdQLNNuoc"].ToString());
                    salaryOffice.IdNhomLuong = Convert.ToInt32(row["IdNhomLuong"].ToString());                    
                    objSalaryOffice.AddSalaryOffice(salaryOffice);
                }
                Session.Remove("HDBanThan");
            }
            if (Session["IdChucDanh"] != null) { Session.Remove("IdChucDanh"); }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objOffice.GetOffices(0);
            this.grid.DataBind();
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
            this.grid.DataSource = objOffice.GetOffices(0);
            this.grid.DataBind();
        }
        protected void gridQLNNuoc_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            HiddenField hiddenIdChucDanh = gridQLNNuoc.FindEditFormTemplateControl("hiddenIdChucDanh") as HiddenField;
            ASPxComboBox cmbQLNNuoc = gridQLNNuoc.FindEditFormTemplateControl("cmbQLNNuoc") as ASPxComboBox;
            ASPxComboBox cmbNhomLuong = gridQLNNuoc.FindEditFormTemplateControl("cmbNhomLuong") as ASPxComboBox;
            DataTable table = new DataTable();            
            if (Session["IdChucDanh"] != null)
            {
                if (!CheckTableQLNN_NL(Convert.ToInt32(Session["IdChucDanh"].ToString()),cmbQLNNuoc.SelectedItem.Value.ToString(), cmbNhomLuong.SelectedItem.Value.ToString()))
                {
                    //sua chuc danh,luu truc tiep vao database voi id chuc danh la session idchucdanh
                    salaryOffice.id = Convert.ToInt32(e.Keys[0].ToString());
                    salaryOffice.IdChucDanh = Convert.ToInt32(Session["IdChucDanh"].ToString());
                    salaryOffice.IdQLNNuoc = Convert.ToInt32(cmbQLNNuoc.SelectedItem.Value.ToString());
                    salaryOffice.IdNhomLuong = Convert.ToInt32(cmbNhomLuong.SelectedItem.Value.ToString());
                    objSalaryOffice.UpdateSalaryOffice(salaryOffice);
                }
                else
                {
                   gridQLNNuoc.JSProperties["cpResult"] = true;                    
                }
            }
            else
            {
                if (hiddenIdChucDanh.Value.Trim() != "")
                {
                    string str = hiddenIdChucDanh.Value.Trim().ToString();
                    if (Session["HDBanThan"] != null)
                    {
                        table = (DataTable)Session["HDBanThan"];
                        if (!CheckTableQLNN_NL(table, gridQLNNuoc, cmbQLNNuoc.SelectedItem.Value.ToString(), cmbNhomLuong.SelectedItem.Value.ToString()))
                        {
                            foreach (DataRow row in table.Rows)
                            {
                                if (row["id"].ToString().Equals(e.Keys[0].ToString()))
                                {
                                    //row["IdChucDanh"] = hiddenIdChucDanh.Value.ToString();
                                    row["IdQLNNuoc"] = cmbQLNNuoc.SelectedItem.Value.ToString();
                                    row["IdNhomLuong"] = cmbNhomLuong.SelectedItem.Value.ToString();
                                    table.AcceptChanges();
                                    break;
                                }
                            }
                            Session["HDBanThan"] = table;
                        }
                    }
                }
            }
            gridQLNNuoc.CancelEdit();
            e.Cancel = true;
            if (Session["IdChucDanh"] != null)
            {
                gridQLNNuoc.DataSource = objSalaryOffice.GetSalaryOfficeByChucDanh(Int32.Parse(Session["IdChucDanh"].ToString()));
                gridQLNNuoc.DataBind();                
            }
            else
            {
                gridQLNNuoc.DataSource = table;
                gridQLNNuoc.DataBind();
            }
        }
        private bool CheckTableQLNN_NL(DataTable table, ASPxGridView grid, string idQLNNuoc, string idNhomLuong)
        {
            bool kq = false;
            foreach (DataRow row in table.Rows)
            {
                if (idQLNNuoc.Trim().Equals(row["idQLNNuoc"].ToString().Trim()) && idNhomLuong.Trim().Equals(row["idNhomLuong"].ToString().Trim()))
                {
                    kq = true;
                    grid.JSProperties["cpResult"] = true;
                    break;
                }
                else { grid.JSProperties["cpResult"] = false; }
            }
            return kq;
        }
        private bool CheckTableQLNN_NL(int idchucdanh,string idQLNNuoc, string idNhomLuong)
        {
            bool kq = false;
            foreach (SalaryOffice.SalaryOfficeInfo row in objSalaryOffice.GetSalaryOfficeByOffice(idchucdanh,0,0))
            {
                if (idQLNNuoc.Trim().Equals(row.IdQLNNuoc.ToString().Trim()) && idNhomLuong.Trim().Equals(row.IdNhomLuong.ToString().Trim()))
                {
                    kq = true;
                    grid.JSProperties["cpResult"] = true;
                    break;
                }
                else { grid.JSProperties["cpResult"] = false; }
            }
            return kq;
        }
        protected void grid_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            if (Session["HDBanThan"] != null)
            {
                Session.Remove("HDBanThan");
            }
            if (Session["IdChucDanh"] != null)
            {
                Session.Remove("IdChucDanh");
            }
            if (Session["idSalaryOffice"] != null)
            {
                Session.Remove("idSalaryOffice");
            }
        }
        protected void gridQLNNuoc_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {            
            if (Session["idSalaryOffice"] != null)
            {
                Session.Remove("idSalaryOffice");
            }
        }
        protected void gridQLNNuoc_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;            
            ASPxComboBox cmbQLNNuoc = gridQLNNuoc.FindEditFormTemplateControl("cmbQLNNuoc") as ASPxComboBox;
            ASPxComboBox cmbNhomLuong = gridQLNNuoc.FindEditFormTemplateControl("cmbNhomLuong") as ASPxComboBox;
            HiddenField hiddenIdChucDanh = gridQLNNuoc.FindEditFormTemplateControl("hiddenIdChucDanh") as HiddenField;
            DataTable table = new DataTable();
            if (Session["IdChucDanh"] != null)
            {
                if (!CheckTableQLNN_NL(table, gridQLNNuoc, cmbQLNNuoc.SelectedItem.Value.ToString(), cmbNhomLuong.SelectedItem.Value.ToString()))
                {
                    //sua chuc danh,luu truc tiep vao database voi id chuc danh la session idchucdanh
                    salaryOffice.id = -1;
                    salaryOffice.IdChucDanh = Convert.ToInt32(Session["IdChucDanh"].ToString());
                    salaryOffice.IdQLNNuoc = Convert.ToInt32(cmbQLNNuoc.SelectedItem.Value.ToString());
                    salaryOffice.IdNhomLuong = Convert.ToInt32(cmbNhomLuong.SelectedItem.Value.ToString());
                    objSalaryOffice.AddSalaryOffice(salaryOffice);
                }
                else
                {
                    gridQLNNuoc.JSProperties["cpResult"] = true;
                }                
            }
            else {             
                //them moi chuc danh,luu tam vao datatble
                int maxId = objOffice.GetOfficeMaxId().ToList()[0].id;               
                if (Session["HDBanThan"] != null)
                {
                    table = (DataTable)Session["HDBanThan"];                    
                    for (int i = 0; i < table.Rows.Count; i++)
                    {
                        maxId = Convert.ToInt32(table.Rows[i]["id"].ToString());
                        for (int j = 1; j < table.Rows.Count; j++)
                        {
                            if (maxId < Convert.ToInt32(table.Rows[j]["id"].ToString()))
                            {
                                maxId = Convert.ToInt32(table.Rows[j]["id"].ToString());
                            }
                        }
                    }                    
                }
                else
                {
                    CreateTable(table);
                }
                string idCD = "";
                if (hiddenIdChucDanh.Value.Trim() != "")
                {
                    idCD = hiddenIdChucDanh.Value.Trim();                    
                }
                else
                {
                    idCD = (objOffice.GetOfficeMaxId().ToList()[0].id + 1).ToString();
                }
                if (!CheckTableQLNN_NL(table, gridQLNNuoc, cmbQLNNuoc.SelectedItem.Value.ToString(), cmbNhomLuong.SelectedItem.Value.ToString()))
                {
                    DataRow row = table.NewRow();
                    row["id"] = maxId + 1;
                    row["IdQLNNuoc"] = cmbQLNNuoc.SelectedItem.Value.ToString();
                    row["IdNhomLuong"] = cmbNhomLuong.SelectedItem.Value.ToString();
                    table.Rows.Add(row);
                    Session["HDBanThan"] = table;
                }
            }
            gridQLNNuoc.CancelEdit();
            e.Cancel = true;
            if (Session["IdChucDanh"] != null)
            {
                gridQLNNuoc.DataSource = objSalaryOffice.GetSalaryOfficeByChucDanh(Int32.Parse(Session["IdChucDanh"].ToString()));
                gridQLNNuoc.DataBind();                
            }
            else
            {
                gridQLNNuoc.DataSource = table;
                gridQLNNuoc.DataBind();
            }
        }
        private void CreateTable(DataTable table)
        {            
            DataColumn myDataColumn;
            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "id";
            table.Columns.Add(myDataColumn);
           
            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "IdQLNNuoc";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "IdNhomLuong";
            table.Columns.Add(myDataColumn);
        }
        protected void gridQLNNuoc_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView gridChucDanh = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            HiddenField hiddenIdChucDanh = gridChucDanh.FindEditFormTemplateControl("hiddenIdChucDanh") as HiddenField;
            DataTable table = new DataTable();
            if (Session["HDBanThan"] != null)
            {
                table = (DataTable)Session["HDBanThan"];
                foreach (DataRow row in table.Rows)
                {
                    if (row["id"].ToString().Equals(e.Keys[0].ToString()))
                    {
                        table.Rows.Remove(row);
                        break;
                    }
                }
                Session["HDBanThan"] = table;
            }            
            else
            {
                salaryOffice.id = Convert.ToInt32(e.Keys[0].ToString());
                objSalaryOffice.DeleteSalaryOffice(salaryOffice);
            }            
            if (Session["IdChucDanh"] != null)
            {
                string str = Session["IdChucDanh"].ToString();
                gridChucDanh.DataSource = objSalaryOffice.GetSalaryOfficeByChucDanh(Int32.Parse(Session["IdChucDanh"].ToString()));
                gridChucDanh.DataBind();
            }
            else
            {
                gridChucDanh.DataSource = table;
                gridChucDanh.DataBind();
            }
            gridChucDanh.CancelEdit();
            e.Cancel = true;            
        }
        protected void gridQLNNuoc_OnHtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {            
            ASPxGridView gridQLNNuoc = sender as ASPxGridView;
            ASPxLabel lbl_QLNNuoc = gridQLNNuoc.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_QLNNuoc") as ASPxLabel; ;
            ASPxLabel lbl_NhomLuong = gridQLNNuoc.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_NhomLuong") as ASPxLabel;
            if (e.DataColumn.FieldName == "IdQLNNuoc")
            {
                lbl_QLNNuoc.Text = objSate.GetStateManagement(Convert.ToInt32(e.CellValue.ToString())).name.ToString();
            }
            if (e.DataColumn.FieldName == "IdNhomLuong")
            {
                int id = Convert.ToInt32(e.CellValue.ToString());
                lbl_NhomLuong.Text = objSalaryGroup.GetSalary_Group(id).groupname.ToString();
            }
        }       
        protected void gridQLNNuoc_Load(object sender, EventArgs e)
        {
            ASPxGridView gridChucDanh = sender as ASPxGridView;            
            DataTable table = new DataTable();
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                gridChucDanh.DataSource = objSalaryOffice.GetSalaryOfficeByChucDanh(Convert.ToInt32(GetText("id")));
                gridChucDanh.DataBind();
            }
            else
            {
                if (Session["HDBanThan"] != null)
                {
                    DataTable tb = (DataTable)Session["HDBanThan"];
                    gridChucDanh.DataSource = tb;
                    gridChucDanh.DataBind();
                }
            }
        }
        protected void cmbMoiTruongLamViec_Load(object sender, EventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            if (GetText("DocHai") != null && GetText("DocHai").Trim() != "")
            {
                ListEditItem item = combo.Items.FindByValue(GetText("DocHai").ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("name") != null && GetText("name").Trim() != "")
            {
                txt.Text = GetText("name");
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
        protected void memoGhiChuChucDanh_Load(object sender, System.EventArgs e)
        {
            ASPxMemo txt = sender as ASPxMemo;
            if (GetText("note") != null && GetText("note").Trim() != "")
            {
                txt.Text = GetText("note");
            }
        }
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                txt.Text = GetText("id");
                Session["IdChucDanh"] = txt.Text;
            }
            else { Session.Remove("IdChucDanh"); }
        }
        protected void hiddenIdChucDanh_Load(object sender, EventArgs e)
        {
            HiddenField hiddenIdChucDanh = sender as HiddenField;
            if (GetTextChucDanh("IdChucDanh") != null && GetTextChucDanh("IdChucDanh").Trim() != "")
            {
                hiddenIdChucDanh.Value = GetTextChucDanh("IdChucDanh");
            }
        }
        protected void hiddenId_Load(object sender, EventArgs e)
        {
            ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            ASPxComboBox cmbQLNNuoc = gridQLNNuoc.FindEditFormTemplateControl("cmbQLNNuoc") as ASPxComboBox;
            ASPxComboBox cmbNhomLuong = gridQLNNuoc.FindEditFormTemplateControl("cmbNhomLuong") as ASPxComboBox;
            HiddenField hiddenId = sender as HiddenField;
            if (GetTextChucDanh("id") != null && GetTextChucDanh("id").Trim() != "")
            {
                hiddenId.Value = GetTextChucDanh("id");
                Session["idSalaryOffice"] = GetTextChucDanh("id");
            }
        }
        private string GetTextChucDanh(string fieldName)
        {
            ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            int index = gridQLNNuoc.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridQLNNuoc.GetRowValues(index, fieldName).ToString();
            }
            return values;
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
        private string GetTextQLNN(string fieldName)
        {
            ASPxGridView gridQLNNuoc = grid.FindEditFormTemplateControl("gridQLNNuoc") as ASPxGridView;
            int index = gridQLNNuoc.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridQLNNuoc.GetRowValues(index, fieldName).ToString();
            }
            return values;
        }               
        protected void gridQLNN_NL_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string str = e.Parameters.ToString();
            gridQLNN_NL.DataSource = objSalaryOffice.GetSalaryOfficeByChucDanh(Convert.ToInt32(str));
            gridQLNN_NL.DataBind();
        }
        protected void gridQLNN_NL_OnHtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            ASPxGridView gridQLNN_NL = sender as ASPxGridView;
            ASPxLabel lbl_QLNNuoc1 = gridQLNN_NL.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_QLNNuoc1") as ASPxLabel; ;
            ASPxLabel lbl_NhomLuong1 = gridQLNN_NL.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_NhomLuong1") as ASPxLabel;
            if (e.DataColumn.FieldName == "IdQLNNuoc")
            {
                lbl_QLNNuoc1.Text = objSate.GetStateManagement(Convert.ToInt32(e.CellValue.ToString())).name.ToString();
            }
            if (e.DataColumn.FieldName == "IdNhomLuong")
            {
                int id = Convert.ToInt32(e.CellValue.ToString());
                lbl_NhomLuong1.Text = objSalaryGroup.GetSalary_Group(id).groupname.ToString();
            }
        }
        protected void grid_OnHtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            ASPxLabel lbl_DocHai = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_DocHai") as ASPxLabel; ;
                        
            if (e.DataColumn.FieldName == "DocHai")
            {
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


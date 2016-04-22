using System;
using System.Data;
using System.Data.SqlClient;
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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;
using DotNetNuke.UI.Utilities;
using DevExpress.Web.ASPxUploadControl;
using DotNetNuke.Common;
using System.Text.RegularExpressions;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace VNPT.Modules.SalaryType
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSalaryType class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewSalaryType : PortalModuleBase, IActionable
    {       
        #region Event Handlers
        BacLuongTheoNhomInfo bacluongInfo = new BacLuongTheoNhomInfo();
        SalaryTypeController objSalary = new SalaryTypeController();        
        SalaryTypeInfo salary = new SalaryTypeInfo();
        Philip.Modules.Salary_Group.Salary_GroupInfo group = new Philip.Modules.Salary_Group.Salary_GroupInfo();
        Philip.Modules.Salary_Group.Salary_GroupController objGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
        Philip.Modules.SalaryOffice.SalaryOfficeController objsalaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeController();
        private string str_conn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {                          
            if (!this.IsPostBack)
            {                
                foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p in objGroup.GetParentSalaryGroup(0))
                {
                    cboParentPosition.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.groupname, p.id.ToString()));                    
                    foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p1 in objGroup.GetSalaryGroupByParent(p.id))
                    {
                        cboParentPosition.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;") + p1.groupname, p1.id.ToString()));
                        foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p12 in objGroup.GetSalaryGroupByParent(p1.id))
                        {
                            cboParentPosition.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;") + p12.groupname, p12.id.ToString()));
                            foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p123 in objGroup.GetSalaryGroupByParent(p12.id))
                            {
                                cboParentPosition.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + p123.groupname, p123.id.ToString()));
                            }
                        }
                    }
                }
                foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p in objGroup.GetParentSalaryGroup(0))
                {
                    cmbBacLuong.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.groupname, p.id.ToString()));                    
                    foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p1 in objGroup.GetSalaryGroupByParent(p.id))
                    {
                        cmbBacLuong.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;") + p1.groupname, p1.id.ToString()));
                        foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p12 in objGroup.GetSalaryGroupByParent(p1.id))
                        {
                            cmbBacLuong.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;") + p12.groupname, p12.id.ToString()));
                            foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p123 in objGroup.GetSalaryGroupByParent(p12.id))
                            {
                                cmbBacLuong.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + p123.groupname, p123.id.ToString()));
                            }
                        }
                    }
                }
                cmbBacLuong.SelectedIndex = 0;                
                cboParentPosition.SelectedIndex = -1;
                this.btSua.Enabled = false;
                this.btXoa.Enabled = false;
                Session["edit"] = null;
            }
        }

        protected void treeList_CallBack(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomCallbackEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            tree.RefreshVirtualTree();                                     
        }
        protected void CallbackPanelBacLuong_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string str = e.Parameter.ToString();
            if (e.Parameter.Contains("u"))
            {
                ListEditItem item = cmbBacLuong.Items.FindByValue(e.Parameter.ToString().Substring(2));
                if (item != null)
                {
                    item.Selected = true;
                }
                else
                {
                    int groupid = objSalary.GetSalaryType(Convert.ToInt32(e.Parameter.ToString().Substring(2))).groupid;
                    ListEditItem item1 = cmbBacLuong.Items.FindByValue(groupid.ToString());
                    if (item1 != null)
                    {
                        item1.Selected = true;
                    }
                    else { cmbBacLuong.SelectedIndex = 0; }
                }
            }
            if (e.Parameter.Contains("w"))
            {
                txtBacLuong.Text = "";
            }
            else if(e.Parameter.Contains("t"))
            {
                hiddenIdBacLuongPopup.Value = e.Parameter.ToString().Substring(2);
                txtBacLuong.Text = objSalary.GetSalaryType(Convert.ToInt32(e.Parameter.ToString().Substring(2))).level.Trim();
                CallbackPanelBacLuong.JSProperties["cpEdit"] = true;
            }
            else if (e.Parameter.Contains("l"))
            {
                if (checkBacLuong(Convert.ToInt32(e.Parameter.ToString().Substring(2))) != true)
                {
                    this.salary = objSalary.GetSalaryType(Convert.ToInt32(e.Parameter.ToString().Substring(2)));
                    objSalary.DeleteSalaryType(salary);
                }
                else
                {
                    CallbackPanelBacLuong.JSProperties["cpNoDelete"] = true;
                }
            }
            else if (e.Parameter.ToString() == "e")
            {
                this.salary.id = -1;
                this.salary.level = txtBacLuong.Text.Trim();
                this.salary.groupid = Convert.ToInt32(cmbBacLuong.SelectedItem.Value);
                objSalary.AddSalaryType(salary);
            }
            else if (e.Parameter.ToString() == "s")
            {
                this.salary.id = hiddenIdBacLuongPopup.Value.Trim() !="" ? Convert.ToInt32(hiddenIdBacLuongPopup.Value) : 0;
                this.salary.level = txtBacLuong.Text.Trim();
                this.salary.groupid = Convert.ToInt32(cmbBacLuong.SelectedItem.Value);
                objSalary.UpdateSalaryType(salary);
                hiddenIdBacLuongPopup.Value = "";
            }
        }
        protected bool checkBacLuong(int idBacLuong)
        {
            return objSalary.GetACoefficientByParentId(idBacLuong,Convert.ToDateTime("01/01/1900"),0).Count > 0 ? true : false;
        }
        protected void callbackPanelEmployees_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {          
            if (e.Parameter.Equals(""))
            {                
                if (Session["edit"] !=null)
                {                    
                    this.group = objGroup.GetSalary_Group(Int32.Parse(Session["Id"].ToString()));
                    this.group.groupname = txtName.Text.ToString();
                    this.group.type = false;
                    this.group.ghichu = txtGhiChuCDThuocNhom.Text.Trim();
                    if (cboParentPosition.SelectedIndex >= 0)
                    {
                        group.parentId = Int32.Parse(cboParentPosition.SelectedItem.Value.ToString());
                    }
                    objGroup.UpdateSalary_Group(this.group);                    
                    // them bac luong cao nhat                        
                    //this.bacluongInfo.id = -1;
                    //this.bacluongInfo.idNhomLuong = hiddenIdNhomChuaBac.Value.Trim() != "" ? Int32.Parse(hiddenIdNhomChuaBac.Value) : 0;
                    //this.bacluongInfo.kieuLuong = false;
                    //if (dateThoiDiemThayDoiBac.Value != null)
                    //{
                    //    this.bacluongInfo.thoiDiem = dateThoiDiemThayDoiBac.Date;
                    //}
                    //else { this.bacluongInfo.thoiDiem = Convert.ToDateTime("01/01/1900"); }
                    //this.bacluongInfo.bacLuongTheoNhom = txtBacLuongCaoNhat.Text.Trim();
                    //objSalary.AddBacLuongCaoNhat(bacluongInfo);
                    
                    //this.txtBacLuongCaoNhat.Text = "";
                    //dateThoiDiemThayDoiBac.Value = null;
                    this.txtName.Text = "";
                    txtGhiChuCDThuocNhom.Text = "";
                    Session.Remove("edit");
                }
                else {
                    group.id = -1;
                    if (cboParentPosition.SelectedIndex >= 0)
                    {
                        group.parentId = Int32.Parse(cboParentPosition.SelectedItem.Value.ToString());
                    }
                    this.group.ghichu = txtGhiChuCDThuocNhom.Text.Trim();
                    group.groupname = txtName.Text;
                    group.type = false;
                    objGroup.AddSalary_Group(group);

                    // them bac luong cao nhat
                    //int idNhomMax = objSalary.GetSalaryGroupIdMax(false).id;
                    //this.bacluongInfo.id = -1;
                    //this.bacluongInfo.idNhomLuong = idNhomMax;
                    //this.bacluongInfo.kieuLuong = false;
                    //if (dateThoiDiemThayDoiBac.Value != null)
                    //{
                    //    this.bacluongInfo.thoiDiem = dateThoiDiemThayDoiBac.Date;
                    //}
                    //else { this.bacluongInfo.thoiDiem = Convert.ToDateTime("01/01/1900"); }
                    //this.bacluongInfo.bacLuongTheoNhom = txtBacLuongCaoNhat.Text.Trim();
                    
                    //objSalary.AddBacLuongCaoNhat(bacluongInfo);

                    //txtBacLuongCaoNhat.Text = "";
                    //dateThoiDiemThayDoiBac.Value = null;
                    txtGhiChuCDThuocNhom.Text = "";
                    this.txtName.Text = "";
                }
            }
            else if (e.Parameter.Equals("1"))
            {
                this.txtName.Text = "";
                txtGhiChuCDThuocNhom.Text = "";
                Session.Remove("edit");
                string str = hiddenViTriBac.Value.ToString();
                if (hiddenIDNhom.Value != null)
                {
                    ListEditItem item = cboParentPosition.Items.FindByValue(hiddenIDNhom.Value.ToString());
                    if (item != null) { item.Selected = true; }
                }
            }
            else if (e.Parameter.Equals("2"))
            {                
                //hiddenIdNhomChuaBac.Value = Session["Id"].ToString();                
                this.group = objGroup.GetSalary_Group(Int32.Parse(Session["Id"].ToString()));
                if (this.group != null)
                {                    
                    txtName.Text = group.groupname;
                    txtGhiChuCDThuocNhom.Text = group.ghichu.Trim();
                    Session["edit"] = "edit";
                    ListEditItem item = this.cboParentPosition.Items.FindByValue(group.parentId.ToString());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                    else
                    {
                        cboParentPosition.SelectedIndex = -1;
                    }
                }
                //this.bacluongInfo = objSalary.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(Int32.Parse(Session["Id"].ToString()),false,DateTime.Now);
                //if (this.bacluongInfo != null)
                //{
                //    hiddenIdBacLuongThuocNhom.Value = bacluongInfo.id.ToString();
                //    txtBacLuongCaoNhat.Text = bacluongInfo.bacLuongTheoNhom;
                //    if (bacluongInfo.thoiDiem != Convert.ToDateTime("01/01/1900"))
                //    {
                //        dateThoiDiemThayDoiBac.Date = bacluongInfo.thoiDiem;
                //    }
                //    else { dateThoiDiemThayDoiBac.Value = null; }
                //}
                //else
                //{
                //    txtBacLuongCaoNhat.Text = "";
                //    dateThoiDiemThayDoiBac.Value = null;
                //}
            }
        }

        protected void btXoa_Click(object sender, EventArgs e)
        {
            if (Session["Id"] != null)
            {                
                group = objGroup.GetSalary_Group(Int32.Parse(Session["Id"].ToString()));
                objGroup.DeleteSalary_Group(group);
                Response.Redirect(DotNetNuke.Common.Globals.ApplicationPath + "/danhmuc/hesoluong/tabid/81/Default.aspx");
                Session.Remove("Id");
            }
        }
        protected void ASPxCallbackPanel2_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
             string id = e.Parameter.ToString();
             if (id.Contains("u") == true)
             {
                 int groupId = Int32.Parse(id.Substring(1));
                 this.salary = objSalary.GetSalaryType(groupId);
                 IList list = new ArrayList();
                 list.Add(this.salary);
                 this.grid.DataSource = list;
                 this.grid.DataBind();                                  
             }
        }
        protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string id = e.Parameter.ToString();

            if (id.Contains("a") == false)
            {
                if (id.Contains("u") == false)
                {
                    Session["Id"] = id;
                    hiddenIDNhom.Value = id;
                    grid.DataSource = null;
                    grid.DataBind();
                    gridChucDanh.DataSource = objsalaryOffice.GetSalaryOfficeByCD_NhomLuong(Convert.ToInt32(id)).Count > 0 ? objsalaryOffice.GetSalaryOfficeByCD_NhomLuong(Convert.ToInt32(id)) : null; ;
                    gridChucDanh.DataBind();
                }
                else {                    
                    int groupId = Int32.Parse(id.Substring(1));
                    hiddenIDBacLuong.Value = groupId.ToString();                    
                    this.grid.DataSource = objSalary.GetACoefficientByParentId(Convert.ToInt32(hiddenIDBacLuong.Value), Convert.ToDateTime("01/01/1900"), 0);
                    this.grid.DataBind();                    
                }
            }
        }
        
        protected void callbackPanel_TopButton_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string id = e.Parameter.ToString();
            if (id.Contains("u") == false)
            {
                if (id != null && id.Trim() != "")
                {
                    DataView dv1 = new DataView(GetChild(), "groupid=" + id + "", "name", DataViewRowState.CurrentRows);
                    if (dv1.Count <= 0)
                    {                       
                        this.btXoa.Enabled = true;
                    }
                    else
                    {
                        this.btXoa.Enabled = false;                    
                    }
                    this.btSua.Enabled = true;
                }
                else
                {
                    this.btSua.Enabled = false;
                    this.btXoa.Enabled = false;
                }
            }
            else
            {
                this.btSua.Enabled = false;
                this.btXoa.Enabled = false;
            }
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        public DataTable GetRoot()
        {
            DataTable customers = new DataTable("Unit");
            customers = SqlHelper.ExecuteDataset(str_conn, "qldv_salary_group_getname", 0).Tables[0];
            return customers;
        }
        
        public DataTable GetParent()
        {
            DataTable customers = new DataTable("Unit");
            customers = SqlHelper.ExecuteDataset(str_conn, "qldv_salary_group_getname", 1).Tables[0];
            
            return customers;
        }
        public DataTable GetTable()
        {
            DataTable customers = new DataTable("Unit");

            customers = SqlHelper.ExecuteDataset(str_conn, "qldv_salary_group_getname", 2).Tables[0];

            return customers;
        }
        private DataTable CreateTreeList(string unitid)
        {
            SqlConnection sqlcnn = new SqlConnection(str_conn);
            DataTable table = new DataTable();
                     
            DataColumn colum;
            DataRow row;

            colum = new DataColumn("Id");
            table.Columns.Add(colum);
            colum = new DataColumn("Name");
            table.Columns.Add(colum);
            string sql = "SELECT id, level as name, groupid FROM ACoefficient where groupid=" + unitid + " and isactive=1 ORDER BY convert(int,[level]) desc";           
            //  sqlcnn.Close();

            SqlCommand sqlCmd1 = new SqlCommand(sql, sqlcnn);
            SqlDataReader dr1;
            sqlcnn.Open();
            dr1 = sqlCmd1.ExecuteReader();
            while (dr1.Read())
            {
                row = table.NewRow();
                row[0] = "u" + dr1["id"].ToString();
                row[1] = "Bậc " + dr1["name"].ToString();
                table.Rows.Add(row);
            }
            return table;
        }

        public DataTable GetChild()
        {
            DataTable customers = new DataTable("Unit");

            using (SqlConnection connection =
                          new SqlConnection(str_conn))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
                    "SELECT id,level as name,groupid FROM ACoefficient where isactive=1 ORDER BY  name desc";
                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }
            return customers;
        }

        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {            
            DataRowView rowView = e.NodeObject as DataRowView;
            if (rowView == null) return;
            e.NodeKeyValue = rowView["Id"];
            e.SetNodeValue("Name", rowView["Name"]);
            
            if (rowView["id"].ToString().Contains("u") == false)
            {                
                int id = Int32.Parse(rowView["id"].ToString());
                DataView dv = new DataView(GetParent(), "parentid=" + id + "", "name", DataViewRowState.CurrentRows);
                if (dv.Count > 0)
                {
                    e.IsLeaf = false;
                }
                else
                {
                    DataView dv1 = new DataView(GetChild(), "groupid=" + id + "", "name", DataViewRowState.CurrentRows);
                    if (dv1.Count > 0)
                    {
                        e.IsLeaf = false;
                    }
                    else
                    {
                        e.NodeKeyValue = "u" + rowView["Id"];
                        e.IsLeaf = true;
                    }
                }
            }
            else {                
                e.IsLeaf = true;
            }
        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {                        
            DataView dv = new DataView(GetRoot());            
            DataView children = null;
            DataRowView parent = e.NodeObject as DataRowView;
            if (parent == null)
            {
                children = dv;
                e.Children = children;
            }
            else
            {
                string id = parent["id"].ToString();                
                DataView dv1 = new DataView(GetParent(), "parentid=" + id + "", "name", DataViewRowState.CurrentRows);
                if (dv1.Count <= 0)
                {
                    DataView dv2 = new DataView(CreateTreeList(id));
                    if (dv2.Count > 0)
                    {                        
                        children = dv2;
                        e.Children = children;
                    }
                }
                else {
                    children = dv1;
                    e.Children = children;                
                }
            }
        }
       
        protected void cboPositionGroup_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboPositionGroup = grid.FindEditFormTemplateControl("cboPositionGroup") as ASPxComboBox;
            if (cboPositionGroup != null)
            {
                foreach (Philip.Modules.Salary_Group.Salary_GroupInfo p in objGroup.GetSalaryGroupByType(0))
                {
                    cboPositionGroup.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.groupname, p.id.ToString()));
                    cboPositionGroup.SelectedIndex = 0;
                }
            }
            if (Session["id"] != null)
            {
                ListEditItem item = cboPositionGroup.Items.FindByValue(Session["id"].ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
            }
            if (GetText("groupid") != null && GetText("groupid").Trim() != "")
            {
                ListEditItem item = cboPositionGroup.Items.FindByValue((object)GetText("groupid"));
                if (item != null)
                {
                    item.Selected = true;
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
        }

        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //ASPxTextBox txtCode = grid.FindEditFormTemplateControl("txtCode") as ASPxTextBox;
            ASPxTextBox txtTitle = grid.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;            
            ASPxTextBox txtCoefficient = grid.FindEditFormTemplateControl("txtCoefficient") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxDateEdit txtDateEffectted = grid.FindEditFormTemplateControl("txtDateEffectted") as ASPxDateEdit;
            ASPxComboBox cboPositionGroup = grid.FindEditFormTemplateControl("cboPositionGroup") as ASPxComboBox;
            this.salary = objSalary.GetSalaryType(Int32.Parse(textId.Text));

            if (this.salary != null)
            {                
                if (hiddenIDBacLuong.Value != null)
                {
                    if (objSalary.GetACoefficientByParentId(Convert.ToInt32(hiddenIDBacLuong.Value), Convert.ToDateTime("01/01/1900"), 0).Count == 0)
                    {
                        this.salary.id = -1;
                        this.salary.title = txtTitle.Text;                        
                        this.salary.parentid = Convert.ToInt32(hiddenIDBacLuong.Value);                       
                        this.salary.coefficient = txtCoefficient.Text;
                        this.salary.code = "";
                        this.salary.level = objSalary.GetSalaryType(Convert.ToInt32(hiddenIDBacLuong.Value)).level.Trim();
                        this.salary.dateeffectted = txtDateEffectted.Date;
                        this.objSalary.AddSalaryType(salary);
                    }
                    else
                    {
                        //this.salary.id = ItemId;
                        this.salary.title = txtTitle.Text;                        
                        this.salary.coefficient = txtCoefficient.Text;
                        this.salary.parentid = Convert.ToInt32(hiddenIDBacLuong.Value);
                        this.salary.level = objSalary.GetSalaryType(Convert.ToInt32(hiddenIDBacLuong.Value)).level.Trim();
                        this.salary.code = "";
                        this.salary.dateeffectted = txtDateEffectted.Date;
                        this.objSalary.UpdateSalaryType(salary);
                    }
                }
            }

            grid.CancelEdit();
            e.Cancel = true;
            if (hiddenIDBacLuong.Value != null)
            {
                this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(hiddenIDBacLuong.Value), Convert.ToDateTime("01/01/1900"), 0);
                this.grid.DataBind();
            }
            else
            {
                if (Session["id"] != null)
                {
                    this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(Session["id"].ToString()), Convert.ToDateTime("01/01/1900"), 0);
                    this.grid.DataBind();
                }
            }
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtTitle = grid.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;
            ASPxTextBox txtCoefficient = grid.FindEditFormTemplateControl("txtCoefficient") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxDateEdit txtDateEffectted = grid.FindEditFormTemplateControl("txtDateEffectted") as ASPxDateEdit;
            ASPxComboBox cboPositionGroup = grid.FindEditFormTemplateControl("cboPositionGroup") as ASPxComboBox;

            this.salary.id = -1;
            this.salary.title = txtTitle.Text;            
            if (hiddenIDBacLuong.Value != null)
            {
                this.salary.parentid = Convert.ToInt32(hiddenIDBacLuong.Value);
                this.salary.level = objSalary.GetSalaryType(Convert.ToInt32(hiddenIDBacLuong.Value)).level.Trim();
            }
            this.salary.coefficient = txtCoefficient.Text;
            this.salary.code = "";
            this.salary.dateeffectted = txtDateEffectted.Date;
            this.objSalary.AddSalaryType(salary);
            grid.CancelEdit();
            e.Cancel = true;
            if (hiddenIDBacLuong.Value != null)
            {
                this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(hiddenIDBacLuong.Value), Convert.ToDateTime("01/01/1900"), 0);
                this.grid.DataBind();
            }
            else
            {
                if (Session["id"] != null)
                {
                    this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(Session["id"].ToString()), Convert.ToDateTime("01/01/1900"), 0);
                    this.grid.DataBind();
                }
            }
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.salary = objSalary.GetSalaryType(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.salary != null)
            {
                this.objSalary.DeleteSalaryType(salary);
            }
            grid.CancelEdit();
            e.Cancel = true;
            if (hiddenIDBacLuong.Value != null)
            {
                this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(hiddenIDBacLuong.Value), Convert.ToDateTime("01/01/1900"), 0);
                this.grid.DataBind();
            }
            else
            {
                if (Session["id"] != null)
                {
                    this.grid.DataSource = objSalary.GetACoefficientByParentId(Int32.Parse(Session["id"].ToString()), Convert.ToDateTime("01/01/1900"), 0);
                    this.grid.DataBind();
                }
            }
        }
        int nSTT = 1;
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lbl_STT = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STT") as ASPxLabel;
                lbl_STT.Text = nSTT++ + ""; ;
            }
        }
        int nSTTCD = 1;
        protected void gridChucDanh_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "idChucDanh")
            {
                ASPxLabel lbl_STT = gridChucDanh.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STT") as ASPxLabel;
                lbl_STT.Text = nSTTCD++ + ""; ;
            }
        }
        
        protected void txtDateEffectted_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txtDateEffectted = grid.FindEditFormTemplateControl("txtDateEffectted") as ASPxDateEdit;
            if (GetText("dateeffectted") != null && GetText("dateeffectted").Trim() != "")
            {
                txtDateEffectted.Date = Convert.ToDateTime(GetText("dateeffectted"));
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
        protected void txtTitle_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("title") != null && GetText("title").Trim() != "")
            {
                txt.Text = GetText("title");
            }
        }        
        protected void txtCoefficient_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("coefficient") != null && GetText("coefficient").Trim() != "")
            {
                txt.Text = GetText("coefficient").Trim();
            }
        }
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                txt.Text = GetText("id");
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
        
        // khu vuc code popup bac luong cao nhat
        protected void CallbackPopup_ThoiDiemBacLuongCaoNhat_Load(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {                       
            int idNhomChuaBac = objSalary.GetSalaryType(Convert.ToInt32(e.Parameter.ToString().Substring(6))).groupid;
            hiddenPopup_IdNhomChuaBac.Value = idNhomChuaBac.ToString();
            GridView_BacLuongCaoNhat.DataSource = objSalary.GetBacLuongCaoNhat_IdNhomLuong(idNhomChuaBac);
            GridView_BacLuongCaoNhat.DataBind();            
        }
        protected void GridView_BacLuongCaoNhat_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lbl_STT = GridView_BacLuongCaoNhat.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STT") as ASPxLabel;
                lbl_STT.Text = nSTT++ + ""; ;
            }
        }
        protected void GridView_BacLuongCaoNhat_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtPopup_BacLuongCaoNhat = GridView_BacLuongCaoNhat.FindEditFormTemplateControl("txtPopup_BacLuongCaoNhat") as ASPxTextBox;
            ASPxDateEdit datePopup_DateEffectted = GridView_BacLuongCaoNhat.FindEditFormTemplateControl("datePopup_DateEffectted") as ASPxDateEdit;

            this.bacluongInfo.id = -1;
            this.bacluongInfo.bacLuongTheoNhom = txtPopup_BacLuongCaoNhat.Text.Trim();
            this.bacluongInfo.thoiDiem = datePopup_DateEffectted.Value != null ? datePopup_DateEffectted.Date : Convert.ToDateTime("01/01/1900");
            this.bacluongInfo.kieuLuong = false;
            this.bacluongInfo.idNhomLuong = hiddenPopup_IdNhomChuaBac.Value.Trim() != "" ? Convert.ToInt32(hiddenPopup_IdNhomChuaBac.Value) : 0;
            objSalary.AddBacLuongCaoNhat(bacluongInfo);
            int idNhomChuaBac = 0;
            if (hiddenPopup_IdNhomChuaBac.Value.Trim() != "")
            {
                idNhomChuaBac = Convert.ToInt32(hiddenPopup_IdNhomChuaBac.Value);
            }
            GridView_BacLuongCaoNhat.DataSource = objSalary.GetBacLuongCaoNhat_IdNhomLuong(idNhomChuaBac);
            GridView_BacLuongCaoNhat.DataBind();
            GridView_BacLuongCaoNhat.CancelEdit();
            e.Cancel = true;
        }
        protected void GridView_BacLuongCaoNhat_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtPopup_BacLuongCaoNhat = GridView_BacLuongCaoNhat.FindEditFormTemplateControl("txtPopup_BacLuongCaoNhat") as ASPxTextBox;
            ASPxDateEdit datePopup_DateEffectted = GridView_BacLuongCaoNhat.FindEditFormTemplateControl("datePopup_DateEffectted") as ASPxDateEdit;
            
            this.bacluongInfo = objSalary.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(Convert.ToInt32(e.Keys[0].ToString()));
            this.bacluongInfo.bacLuongTheoNhom = txtPopup_BacLuongCaoNhat.Text.Trim();
            this.bacluongInfo.thoiDiem = datePopup_DateEffectted.Value != null ? datePopup_DateEffectted.Date : Convert.ToDateTime("01/01/1900");
            objSalary.UpdateBacLuongCaoNhat(bacluongInfo);
            int idNhomChuaBac = 0;
            if (hiddenPopup_IdNhomChuaBac.Value.Trim() != "")
            {
                idNhomChuaBac = Convert.ToInt32(hiddenPopup_IdNhomChuaBac.Value);
            }
            GridView_BacLuongCaoNhat.DataSource = objSalary.GetBacLuongCaoNhat_IdNhomLuong(idNhomChuaBac);
            GridView_BacLuongCaoNhat.DataBind();
            GridView_BacLuongCaoNhat.CancelEdit();
            e.Cancel = true;
        }        
        protected void GridView_BacLuongCaoNhat_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.bacluongInfo = objSalary.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(Convert.ToInt32(e.Keys[0].ToString()));
            this.objSalary.DeleteBacLuongCaoNhat(bacluongInfo);
            int idNhomChuaBac = 0;
            if (hiddenPopup_IdNhomChuaBac.Value.Trim() != "")
            {
                idNhomChuaBac = Convert.ToInt32(hiddenPopup_IdNhomChuaBac.Value);
            }
            GridView_BacLuongCaoNhat.DataSource = objSalary.GetBacLuongCaoNhat_IdNhomLuong(idNhomChuaBac);
            GridView_BacLuongCaoNhat.DataBind();
            GridView_BacLuongCaoNhat.CancelEdit();
            e.Cancel = true;
        }
        protected void datePopup_DateEffectted_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit thoiDiem = sender as ASPxDateEdit;
            if (GetTextPopup_BacLuong("thoiDiem") != null && GetTextPopup_BacLuong("thoiDiem").Trim() != "")
            {
                thoiDiem.Date = Convert.ToDateTime(GetTextPopup_BacLuong("thoiDiem"));
            }
        }
        protected void txtPopup_BacLuongCaoNhat_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetTextPopup_BacLuong("bacLuongTheoNhom") != null && GetTextPopup_BacLuong("bacLuongTheoNhom").Trim() != "")
            {
                txt.Text = GetTextPopup_BacLuong("bacLuongTheoNhom");
            }
        }
        private string GetTextPopup_BacLuong(string fieldName)
        {
            int index = GridView_BacLuongCaoNhat.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = GridView_BacLuongCaoNhat.GetRowValues(index, fieldName).ToString();

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


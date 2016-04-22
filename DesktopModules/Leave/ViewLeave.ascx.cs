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
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

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
using VNPT.Modules.Employees;
using VNPT.Modules;
namespace Philip.Modules.Leave
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewLeave class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewLeave : PortalModuleBase, IActionable
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

        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Employees.EmployeesInfo employees = new VNPT.Modules.Employees.EmployeesInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (Session["Visible"] != null)
            {
                grdLeave.Visible = (bool)Session["Visible"];
            }
            else
            {
                grdLeave.Visible =false;
            }
        }

        protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string id = e.Parameter.ToString();
            if (id.Contains("e"))
            {
                int ItemId = Int32.Parse(id.Substring(1));
                Session["Id"] = ItemId;
                try
                {
                    this.employees = objEmployees.GetEmployees(ItemId);
                    if (this.employees != null)
                    {
                        this.grdLeave.Visible = true;
                        BindGridLeave(ItemId);
                        this.grdLeave.Caption = "Thông tin nghỉ phép đồng chí " + this.employees.fullname;
                        Session["Visible"] = true;
                    }
                }
                catch (Exception ex) { }
            }
            else { this.grdLeave.Visible = false; Session["Visible"] = false; }
        }
        private static string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        }
        public DataTable GetTable()
        {
            string connectionString = getConnectionString();
            DataTable customers = new DataTable("Unit");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
               "SELECT * FROM hrm.dbo.Unit WHERE  parentid=14 and status = 1  ORDER BY level, sequence DESC ";
                //"select * FROM hrm.dbo.Unit where id=120 ORDER BY level, sequence DESC ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }
        public DataTable GetTable_DonViCon()
        {
            string connectionString = getConnectionString();
            DataTable customers = new DataTable("Unit");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
               "SELECT * FROM hrm.dbo.Unit WHERE   status = 1  ORDER BY level, sequence DESC ";
                //"select * FROM hrm.dbo.Unit where id=120 ORDER BY level, sequence DESC ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }
        public DataTable GetChild()
        {
            string connectionString = getConnectionString();
            DataTable customers = new DataTable("Unit");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
                "SELECT * FROM hrm.dbo.Unit WHERE status = 1 ORDER BY  Name ASC";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }
        public DataTable GetEmployee()
        {
            string connectionString = getConnectionString();
            DataTable customers = new DataTable("Employees");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
                "SELECT e.unitid ,e.id,e.fullname as name FROM hrm.dbo.Employees e ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }

        private DataTable CreateTreeList(string unitid)
        {
            string connectionString = getConnectionString();
            SqlConnection sqlcnn = new SqlConnection(connectionString);


            DataTable table = new DataTable();
            DataColumn colum;
            DataRow row;
            SqlDataReader dr;
            string id = "";
            if (unitid.ToString().Contains("e") || unitid.ToString().Contains("u"))
            {
                id = unitid.ToString().Substring(1);
            }
            else
            {
                id = unitid.ToString();
            }
            colum = new DataColumn("Id");
            table.Columns.Add(colum);
            colum = new DataColumn("Name");
            table.Columns.Add(colum);
            colum = new DataColumn("ParentId");
            table.Columns.Add(colum);
            if (unitid.Contains("e") == false)
            {
                if (objUnit.GetChildUnits(Int32.Parse(id)).Count > 0)
                {
                    string sql = "SELECT * FROM hrm.dbo.Unit WHERE status = 1 and parentid=" + id + "  and YEAR(FunctionDate) =1900 ORDER BY  Name ASC";
                    //  sqlcnn.Close();
                    SqlConnection sqlcnn1 = new SqlConnection(connectionString);
                    SqlCommand sqlCmd1 = new SqlCommand(sql, sqlcnn1);
                    if (sqlcnn1.State == ConnectionState.Closed)
                    {
                        sqlcnn1.Open();
                    }
                    SqlDataReader dr1;
                    sqlCmd1.CommandText = sql;
                    dr1 = sqlCmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        row = table.NewRow();
                        row[0] = "u" + dr1["id"].ToString();
                        row[1] = dr1["name"].ToString();
                        row[2] = dr1["parentid"].ToString();
                        table.Rows.Add(row);

                    }
                }
                if (unitid.Contains("e") == false)
                {
                    string sql1 = "SELECT e.unitid ,e.id,e.fullname FROM hrm.dbo.Employees e where unitid=" + id + " ";
                    //                    sqlcnn1.Close();
                    SqlConnection sqlcnn2 = new SqlConnection(connectionString);
                    if (sqlcnn2.State == ConnectionState.Closed)
                    {
                        sqlcnn2.Open();
                    }
                    SqlCommand sqlCmd2 = new SqlCommand(sql1, sqlcnn2);
                    sqlCmd2.CommandText = sql1;
                    //sqlcnn2.Open();                    
                    SqlDataReader dr2;
                    dr2 = sqlCmd2.ExecuteReader();
                    while (dr2.Read())
                    {
                        row = table.NewRow();
                        row[0] = "e" + dr2["id"].ToString();
                        row[1] = dr2["fullname"].ToString();
                        row[2] = dr2["unitid"].ToString();

                        table.Rows.Add(row);

                    }
                }

            }



            //            sqlcnn.Close();
            return table;

        }


        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {

            DataRowView rowView = e.NodeObject as DataRowView;
            if (rowView == null) return;
            e.NodeKeyValue = rowView["Id"];
            string id = "";
            if (rowView["Id"].ToString().Contains("u"))
            {
                id = rowView["Id"].ToString().Substring(1);
                DataView dv1 = new DataView(GetChild(), "parentid=" + id + "", "Name", DataViewRowState.CurrentRows);
                if (dv1.Count > 0)
                {
                    e.IsLeaf = false;
                }
                else
                {


                    DataView dv2 = new DataView(GetEmployee(), "unitid=" + id + "", "name", DataViewRowState.CurrentRows);
                    if (dv2.Count > 0)
                    {
                        e.IsLeaf = false;
                    }
                    else { e.IsLeaf = true; }
                }
                e.SetNodeValue("IconName", "frontpage");
            }
            if (rowView["Id"].ToString().Contains("e"))
            {
                e.IsLeaf = true;
                e.SetNodeValue("IconName", "support");
            }
            if (rowView["Id"].ToString().Contains("u") == false && rowView["Id"].ToString().Contains("e") == false)
            {
                e.SetNodeValue("IconName", "frontpage");

            }

            e.SetNodeValue("Name", rowView["Name"]);


            //e.SetNodeValue("IconName", rowView["IconName"]);

        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (emp != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    DataView dv = new DataView(GetTable());
                    //DataView dv = new DataView(GetChild(), "id=4", "sequence", DataViewRowState.CurrentRows);
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

                        DataView dv1 = new DataView(CreateTreeList(id));
                        if (dv1.Count > 0)
                        {
                            children = dv1;
                            e.Children = children;

                        }


                    }

                }
                else
                {


                    DataView children = null;
                    DataRowView parent = e.NodeObject as DataRowView;
                    DataView dv = new DataView(GetTable_DonViCon(), "parentid=" + objUnit.GetUnit(emp.unitid).parentid + "", "Name", DataViewRowState.CurrentRows);

                    if (parent == null)
                    {

                        children = dv;

                        e.Children = children;
                    }
                    else
                    {

                        string id = parent["id"].ToString();

                        DataView dv1 = new DataView(CreateTreeList(id));
                        if (dv1.Count > 0)
                        {
                            children = dv1;
                            e.Children = children;

                        }


                    }

                }
            }
           




        }
        TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode, string url)
        {

            TreeListNode node = treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Url"] = url;

            return node;
        }
        TreeListNode CreateNodeRoot(object key, string iconName, string text)
        {

            TreeListNode node = treeList.AppendNode(key);
            node["IconName"] = iconName;
            node["Name"] = text;

            return node;
        }
        protected string GetIconUrl(TreeListDataCellTemplateContainer container)
        {
            return string.Format("~/Images/Menu/{0}.png", container.GetValue("IconName"));
        }
        protected void grdLeave_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtEmpId = grdLeave.FindEditFormTemplateControl("txtEmpId") as ASPxTextBox;
            ASPxTextBox txtId = grdLeave.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtReason = grdLeave.FindEditFormTemplateControl("txtReason") as ASPxTextBox;
            ASPxTextBox txtYear = grdLeave.FindEditFormTemplateControl("txtYear") as ASPxTextBox;
            ASPxComboBox ddlType = grdLeave.FindEditFormTemplateControl("ddlType") as ASPxComboBox;
            ASPxComboBox ddlProvince = grdLeave.FindEditFormTemplateControl("ddlProvince") as ASPxComboBox;
            ASPxDateEdit calToDate = grdLeave.FindEditFormTemplateControl("calToDate") as ASPxDateEdit;
            ASPxDateEdit calFromDate = grdLeave.FindEditFormTemplateControl("calFromDate") as ASPxDateEdit;

            this.leave = this.objLeave.GetLeave(Int32.Parse(txtId.Text));
            if (this.leave != null)
            {

                this.leave.reason = txtReason.Text;
                this.leave.year = Int32.Parse(txtYear.Text);
                this.leave.fromdate = Convert.ToDateTime(calFromDate.Value.ToString());
                this.leave.todate = Convert.ToDateTime(calToDate.Value.ToString());
                this.leave.unitid = objEmployees.GetEmployees(Int32.Parse(Session["Id"].ToString())).unitid;
                this.leave.employeeid = Int32.Parse(Session["Id"].ToString());
                this.leave.provinceid = Int32.Parse(ddlProvince.SelectedItem.Value.ToString());
                this.leave.editor = this.UserId;
                this.leave.modifieddate = DateTime.Now;
                this.leave.ip = HttpContext.Current.Request.UserHostAddress;

                if (ddlType.SelectedIndex == 0)
                {
                    this.leave.leavetype = false;
                }
                else { this.leave.leavetype = true; }

                
                objLeave.UpdateLeave(leave);
                

            }

            grdLeave.CancelEdit();
            e.Cancel = true;
            BindGridLeave(Int32.Parse(Session["Id"].ToString()));


        }
        protected void grdLeave_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtEmpId = grdLeave.FindEditFormTemplateControl("txtEmpId") as ASPxTextBox;
            ASPxTextBox txtId = grdLeave.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxTextBox txtReason = grdLeave.FindEditFormTemplateControl("txtReason") as ASPxTextBox;
            ASPxTextBox txtYear = grdLeave.FindEditFormTemplateControl("txtYear") as ASPxTextBox;
            ASPxComboBox ddlType = grdLeave.FindEditFormTemplateControl("ddlType") as ASPxComboBox;
            ASPxComboBox ddlProvince = grdLeave.FindEditFormTemplateControl("ddlProvince") as ASPxComboBox;
            ASPxDateEdit calToDate = grdLeave.FindEditFormTemplateControl("calToDate") as ASPxDateEdit;
            ASPxDateEdit calFromDate = grdLeave.FindEditFormTemplateControl("calFromDate") as ASPxDateEdit;

             this.leave.id = -1;
                this.leave.reason = txtReason.Text;
                this.leave.year = Int32.Parse(txtYear.Text);
                this.leave.fromdate = Convert.ToDateTime(calFromDate.Value.ToString());
                this.leave.todate = Convert.ToDateTime(calToDate.Value.ToString());
                this.leave.unitid = objEmployees.GetEmployees(Int32.Parse(Session["Id"].ToString())).unitid;
                this.leave.employeeid = Int32.Parse(Session["Id"].ToString());
                this.leave.provinceid = Int32.Parse(ddlProvince.SelectedItem.Value.ToString());
                this.leave.editor = this.UserId;
                this.leave.modifieddate = DateTime.Now;
                this.leave.ip = HttpContext.Current.Request.UserHostAddress;

                if (ddlType.SelectedIndex == 0)
                {
                    this.leave.leavetype = false;
                }
                else { this.leave.leavetype = true; }


                objLeave.AddLeave(leave);


         

            grdLeave.CancelEdit();
            e.Cancel = true;
            BindGridLeave(Int32.Parse(Session["Id"].ToString()));

        }
        protected void grdLeave_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='pink';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
            //grid.f
        }

        protected void grdLeave_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lblProvince = grdLeave.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblProvince") as ASPxLabel;

                lblProvince.Text = objLeave.GetLeave(Int32.Parse(e.CellValue.ToString())).fromdate.ToShortDateString() + " - " + objLeave.GetLeave(Int32.Parse(e.CellValue.ToString())).todate.ToShortDateString();

            }
            if (e.DataColumn.FieldName == "provinceid")
            {
                ASPxLabel lblProvince = grdLeave.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblProvince") as ASPxLabel;

                lblProvince.Text = objProvince.GetProvince(Int32.Parse(e.CellValue.ToString())).Name;

            }
        }
        protected void grdLeave_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.leave = objLeave.GetLeave(Int32.Parse(e.Keys[grdLeave.KeyFieldName].ToString()));
            if (this.leave != null)
            {

                this.objLeave.DeleteLeave(leave);
            }

            grdLeave.CancelEdit();
            e.Cancel = true;
            BindGridLeave(Int32.Parse(Session["Id"].ToString()));

        }
        private void BindGridLeave(int ItemId)
        {

            this.grdLeave.DataSource = objLeave.GetLeaveByEmp(ItemId);
            this.grdLeave.DataBind();

        }

        protected void txtEmpId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetLeaveText("employeeid") != null && GetLeaveText("employeeid").Trim() != "")
            {
                txt.Text = GetLeaveText("employeeid");
            }
        }

        
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetLeaveText("id") != null && GetLeaveText("id").Trim() != "")
            {
                txt.Text = GetLeaveText("id");
            }
        }
        protected void ddlType_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox ddlType = grdLeave.FindEditFormTemplateControl("ddlType") as ASPxComboBox;
            ddlType.Items.Clear();

            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployees(Int32.Parse(Session["Id"].ToString()));
            if (emp != null)
            {
                if (emp.sex == true)
                {
                    ddlType.Items.Add(new ListEditItem("Nghỉ phép", "0"));
                }
                else
                {
                    ddlType.Items.Add(new ListEditItem("Nghỉ phép", "0"));
                    ddlType.Items.Add(new ListEditItem("Nghỉ sinh", "1"));
                }
            }

            if (GetLeaveText("leavetype") != null && GetLeaveText("leavetype").Trim() != "")
            {
                if (emp.sex == false)
                {
                    if (Convert.ToBoolean(GetLeaveText("leavetype")) == false)
                    {
                        ddlType.SelectedIndex = 0;
                    }
                    else { ddlType.SelectedIndex = 1; }
                }
                else { ddlType.SelectedIndex = 0; }

            }
            else { ddlType.SelectedIndex = 0; }
        }
        protected void ddlProvince_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox ddlProvince = grdLeave.FindEditFormTemplateControl("ddlProvince") as ASPxComboBox;
            ddlProvince.Items.Clear();

            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo pro in list)
            {
                ddlProvince.Items.Add(new ListEditItem(pro.Name, pro.Id.ToString()));
            }
            if (GetLeaveText("provinceid") != null && GetLeaveText("provinceid").Trim() != "")
            {
                ListEditItem item = ddlProvince.Items.FindByValue(GetLeaveText("provinceid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
            else { ddlProvince.SelectedIndex = 0; }
        }
        protected void txtReason_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetLeaveText("reason") != null && GetLeaveText("reason").Trim() != "")
            {
                txt.Text = GetLeaveText("reason");
            }
        }

        protected void txtYear_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetLeaveText("year") != null && GetLeaveText("year").Trim() != "")
            {
                txt.Text = GetLeaveText("year");
            }
        }
        protected void calFromDate_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetLeaveText("fromdate") != null && GetLeaveText("fromdate").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetLeaveText("fromdate"));
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }
        protected void calToDate_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetLeaveText("todate") != null && GetLeaveText("todate").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetLeaveText("todate"));
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }
        
        private string GetLeaveText(string fieldName)
        {
            int index = grdLeave.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grdLeave.GetRowValues(index, fieldName).ToString();

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


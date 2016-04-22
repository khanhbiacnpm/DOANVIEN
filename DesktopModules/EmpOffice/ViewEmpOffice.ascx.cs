using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using System.Collections.Generic;
using System.Drawing;
using System.Collections;
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
using DevExpress.Web.ASPxHiddenField;
using VNPT.Modules.Unit;

namespace Philip.Modules.EmpOffice
{    
    partial class ViewEmpOffice : PortalModuleBase, IActionable
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

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Employees.EmployeesInfo employees = new VNPT.Modules.Employees.EmployeesInfo();
        Philip.Modules.EmpOffice.EmpOfficeInfo emp = new EmpOfficeInfo();
        Philip.Modules.EmpOffice.EmpOfficeController objectEmp = new EmpOfficeController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            CreateNodes();
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
        void CreateNodes()
        {
            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (emp != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        string k1 = "u" + u.id;
                        TreeListNode root = CreateNodeRoot(k1, "frontpage", "<font size='2' face='Tahoma'><b>&nbsp;" + u.name + "</b></font>");
                        root.Expanded = true;

                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            string k2 = "u" + u1.id;
                            TreeListNode root1 = CreateNodeCore(k2, "home", "<font size='2' face='Tahoma'><b>&nbsp;" + u1.name + "</b></font>", root, "");
                        }
                    }
                }
                else
                {

                    VNPT.Modules.Unit.UnitInfo u = objUnit.GetUnit(objUnit.GetUnit(emp.unitid).parentid);
                    string k1 = "u" + u.id;
                    TreeListNode root = CreateNodeRoot(k1, "frontpage", "<font size='2' face='Tahoma'><b>&nbsp;" + u.name + "</b></font>");
                    root.Expanded = true;
                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        string k2 = "u" + u1.id;
                        TreeListNode root1 = CreateNodeCore(k2, "home", "<font size='2' face='Tahoma'><b>&nbsp;" + u1.name + "</b></font>", root, "");
                    }
                }
            }
           
            treeList.SettingsBehavior.AllowFocusedNode = true;
        }
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "empid")
            {
                ASPxLabel lblEmp = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblEmp") as ASPxLabel;
                if (objEmployees.GetEmployees(Int32.Parse(e.CellValue.ToString())) != null)
                {
                    lblEmp.Text = objEmployees.GetEmployees(Int32.Parse(e.CellValue.ToString())).fullname;
                }
            }
            if (e.DataColumn.FieldName == "officeid")
            {
                Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
                ASPxLabel lblOffice = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblOffice") as ASPxLabel;
                if (objOffice.GetOffice(Int32.Parse(e.CellValue.ToString())) != null)
                {
                    lblOffice.Text = objOffice.GetOffice(Int32.Parse(e.CellValue.ToString())).name;
                }
            }
            if (e.DataColumn.FieldName == "statemanagementid")
            {
                VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
                ASPxLabel lblState = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblState") as ASPxLabel;
                if (objSate.GetStateManagement(Int32.Parse(e.CellValue.ToString())) != null)
                {
                    lblState.Text = objSate.GetStateManagement(Int32.Parse(e.CellValue.ToString())).name;
                }
            }
        }
        protected void grid_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Height = 30;
        }
        protected void ASPxCallbackPanel21_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            
            ASPxHiddenField ASPxHiddenField1 = grid.FindEditFormTemplateControl("ASPxCallbackPanel21").FindControl("ASPxHiddenField1") as ASPxHiddenField;

            string id = e.Parameter.ToString();
            this.employees =objEmployees.GetEmployees(Int32.Parse(id));
            if (this.employees != null)
            {

                ASPxHiddenField1["value"] = this.employees.id;
            }
        }

        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {            
            ASPxComboBox cboOffice = grid.FindEditFormTemplateControl("cboOffice") as ASPxComboBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxComboBox cboState = grid.FindEditFormTemplateControl("cboState") as ASPxComboBox;
            ASPxComboBox cboEmp = grid.FindEditFormTemplateControl("cboEmp") as ASPxComboBox;
            ASPxHiddenField ASPxHiddenField1 = grid.FindEditFormTemplateControl("ASPxCallbackPanel21").FindControl("ASPxHiddenField1") as ASPxHiddenField;

            if (ASPxHiddenField1.Count > 0)
            {
                this.emp = objectEmp.GetEmpOffice(Int32.Parse(textId.Text));

                if (this.emp != null)
                {
                    this.emp.empid = Int32.Parse(ASPxHiddenField1.Get("value").ToString());
                    this.emp.uid = objEmployees.GetEmployees(Int32.Parse(ASPxHiddenField1.Get("value").ToString())).unitid;
                    this.emp.unitid = objUnit.GetUnit(objEmployees.GetEmployees(Int32.Parse(ASPxHiddenField1.Get("value").ToString())).unitid).parentid;
                    this.emp.officeid = Int32.Parse(cboOffice.SelectedItem.Value.ToString());
                    this.emp.statemanagementid = Int32.Parse(cboState.SelectedItem.Value.ToString());

                    this.objectEmp.UpdateEmpOffice(emp);
                }
            }
            else {
                if (cboEmp != null)
                {
                    this.emp = objectEmp.GetEmpOffice(Int32.Parse(textId.Text));
                    if (this.emp != null)
                    {
                        this.emp.empid = Int32.Parse(cboEmp.SelectedItem.Value.ToString());
                        this.emp.uid = objEmployees.GetEmployees(Int32.Parse(ASPxHiddenField1.Get("value").ToString())).unitid;
                        this.emp.unitid = objUnit.GetUnit(objEmployees.GetEmployees(Int32.Parse(cboEmp.SelectedItem.Value.ToString())).unitid).parentid;
                        
                        this.emp.officeid = Int32.Parse(cboOffice.SelectedItem.Value.ToString());
                        this.emp.statemanagementid = Int32.Parse(cboState.SelectedItem.Value.ToString());

                        this.objectEmp.UpdateEmpOffice(emp);
                    }
                }
            
            }
            grid.CancelEdit();
            e.Cancel = true;
            if (Session["Id"] != null)
            {
                grid.DataSource = objectEmp.GetEmpOfficeByUnit(Int32.Parse(Session["Id"].ToString()));
                grid.DataBind();
            }
            else
            {
                grid.DataSource = objectEmp.GetEmpOffices();
                grid.DataBind();
            }
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            ASPxComboBox cboOffice = grid.FindEditFormTemplateControl("cboOffice") as ASPxComboBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            ASPxComboBox cboState = grid.FindEditFormTemplateControl("cboState") as ASPxComboBox;
            ASPxComboBox cboEmp = grid.FindEditFormTemplateControl("cboEmp") as ASPxComboBox;
            ASPxHiddenField ASPxHiddenField1 = grid.FindEditFormTemplateControl("ASPxCallbackPanel21").FindControl("ASPxHiddenField1") as ASPxHiddenField;
             if (ASPxHiddenField1.Count > 0)
             {
                 this.emp.id = -1;
                 this.emp.empid = Int32.Parse(ASPxHiddenField1.Get("value").ToString());
                 this.emp.uid = objEmployees.GetEmployees(Int32.Parse(ASPxHiddenField1.Get("value").ToString())).unitid;
                 this.emp.unitid = objUnit.GetUnit(objEmployees.GetEmployees(Int32.Parse(ASPxHiddenField1.Get("value").ToString())).unitid).parentid;
                 
                 this.emp.officeid = Int32.Parse(cboOffice.SelectedItem.Value.ToString());
                 this.emp.statemanagementid = Int32.Parse(cboState.SelectedItem.Value.ToString());
                 this.objectEmp.AddEmpOffice(emp);
             }

            grid.CancelEdit();
            e.Cancel = true;
            if (Session["Id"] != null)
            {
                grid.DataSource = objectEmp.GetEmpOfficeByUnit(Int32.Parse(Session["Id"].ToString()));
                grid.DataBind();
            }
            else
            {
                grid.DataSource = objectEmp.GetEmpOffices();
                grid.DataBind();
            }

        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.emp = objectEmp.GetEmpOffice(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.emp != null)
            {

                this.objectEmp.DeleteEmpOffice(emp);
            }

            grid.CancelEdit();
            e.Cancel = true;
            if (Session["Id"] != null)
            {
                grid.DataSource = objectEmp.GetEmpOfficeByUnit(Int32.Parse(Session["Id"].ToString()));
                grid.DataBind();
            }
            else
            {
                grid.DataSource = objectEmp.GetEmpOffices();
                grid.DataBind();
            }

        }
        protected void cboUnit_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboUnit = grid.FindEditFormTemplateControl("cboUnit") as ASPxComboBox;
            VNPT.Modules.Employees.EmployeesInfo em = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (em != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    cboUnit.Items.Clear();
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        cboUnit.Items.Add(new ListEditItem(u.name, u.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            cboUnit.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            //cboUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                            foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                            {
                                cboUnit.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                            }
                        }
                    }
                    // cmbDonVi.SelectedIndex = 0;
                }
                else
                {
                    cboUnit.Items.Clear();
                    cboUnit.Items.Add(new ListEditItem(objUnit.GetUnit(objUnit.GetUnit(em.unitid).parentid).name, objUnit.GetUnit(objUnit.GetUnit(em.unitid).parentid).id.ToString()));
                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(objUnit.GetUnit(objUnit.GetUnit(em.unitid).parentid).id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        cboUnit.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                        {
                            cboUnit.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                        }
                    }
                    //cmbDonVi.SelectedIndex = 0;
                }
            }
           
            if (GetText("uid") != null && GetText("uid").Trim() != "")
            {
                ListEditItem item = cboUnit.Items.FindByValue((object)GetText("uid"));
                if (item != null)
                {
                    item.Selected = true;
                }
                else
                {
                    cboUnit.SelectedIndex = 0;
                }
            }
        }
        protected void cboEmp_CallBack(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            
            ASPxComboBox cboEmp = sender as ASPxComboBox;
            cboEmp.Items.Clear();
            cboEmp.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("--- Chọn nhân viên ---","0"));
            foreach (VNPT.Modules.Employees.EmployeesInfo em in objEmployees.GetEmployeesByUnit(Int32.Parse(e.Parameter.ToString())))
            {
                cboEmp.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(em.fullname,em.id.ToString()));
                
            }
        }
        protected void cboEmp_Load(object sender, System.EventArgs e)
        {            
            ASPxComboBox cboEmp = grid.FindEditFormTemplateControl("cboEmp") as ASPxComboBox;
            if (cboEmp != null)
            {
                if (GetText("uid") != null && GetText("uid").Trim() != "")
                {
                    int unitId = Int32.Parse(GetText("uid"));
                    cboEmp.Items.Clear();
                    cboEmp.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("--- Chọn nhân viên ---", "0"));
                    foreach (VNPT.Modules.Employees.EmployeesInfo p in objEmployees.GetEmployeesByUnit(unitId))
                    {
                        cboEmp.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.fullname, p.id.ToString()));

                    }
                }

                if (GetText("empid") != null && GetText("empid").Trim() != "")
                {
                    int id=Int32.Parse(GetText("empid").Trim());
                    ListEditItem item = cboEmp.Items.FindByValue(id.ToString());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
                else { cboEmp.SelectedIndex = 0; }
            }
        }
        protected void cboOffice_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboOffice = sender as ASPxComboBox;
            Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
            cboOffice.Items.Clear();
            foreach (Philip.Modules.Office.OfficeInfo p in objOffice.GetOffices(0))
            {
                cboOffice.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(p.name, p.id.ToString()));

            }
            
            if (GetText("officeid") != null && GetText("officeid").Trim() != "")
            {
                int id = Int32.Parse(GetText("officeid"));
                ListEditItem item = cboOffice.Items.FindByValue(id.ToString().Trim());
                if (item != null)
                {
                    item.Selected = true;
                }
               
            }
        }
        protected void cboState_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboState = sender as ASPxComboBox;
            VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
            List<VNPT.Modules.StateManagement.StateManagementInfo> list = objSate.GetStateManagements();
            cboState.DataSource = list;
            cboState.TextField = "name";
            cboState.ValueField = "id";
            cboState.DataBind();
            
            if (GetText("statemanagementid") != null && GetText("statemanagementid").Trim() != "")
            {
                int id = Int32.Parse(GetText("statemanagementid"));
                ListEditItem item = cboState.Items.FindByValue(id.ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
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
        protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string id = e.Parameter.ToString();
            if (id.Contains("u"))
            {
                int ItemId = Int32.Parse(id.Substring(1));
                Session["Id"] = ItemId;
                try
                {
                    Philip.Modules.EmpOffice.EmpOfficeController objEmp=new EmpOfficeController();
                    this.grid.DataSource = objEmp.GetEmpOfficeByUnit(ItemId);
                    this.grid.DataBind();
                    this.grid.Caption = "<b>Viên chức chuyên môn nghiệp vụ : " + objUnit.GetUnit(ItemId).name + "</b>";
                }
                catch (Exception ex) { }
            }
            else { }
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


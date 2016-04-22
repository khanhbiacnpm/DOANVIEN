using System;
using System.Data;
using System.Data.SqlClient;
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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;
using DotNetNuke.UI.Utilities;
using DevExpress.Web.ASPxUploadControl;
using DotNetNuke.Common;
using DevExpress.Web.ASPxHiddenField;
using System.Text.RegularExpressions;
using DevExpress.Web.ASPxClasses;
namespace VNPT.Modules.Employees
{
    public partial class PrintSoYeuLyLich3 : PortalModuleBase, IActionable
    {
        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //ExpandTreeList();   
            }
            LoadcmbSearch();
        }
        
        private void LoadcmbSearch()
        {
            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            decimal UnitUser = 0;
            if (emp != null)
            {
                decimal EmpIdTimKiem = Convert.ToDecimal(emp.unitid);// donvi user login                
                if (objUnit.GetUnit(EmpIdTimKiem).parentid == 14)
                { UnitUser = objUnit.GetUnit(EmpIdTimKiem).id; }
                else
                { UnitUser = objUnit.GetUnit(objUnit.GetUnit(EmpIdTimKiem).parentid).id; }
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    cmbSearch.DataSource = SearchEmp(UnitUser, 0);
                    cmbSearch.DataBind();
                }
                else // don vị
                {
                    cmbSearch.DataSource = SearchEmp(UnitUser, 1);
                    cmbSearch.DataBind();
                }
            }// viễn thông tỉnh
           
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        public static DataTable SearchEmp(decimal NunitId, int Noption)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[HRM_GetEmployeesSearch]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter unitid = Cmd.Parameters.Add("@unitid", SqlDbType.Int, 20);
            unitid.Value = NunitId;
            SqlParameter option = Cmd.Parameters.Add("@option", SqlDbType.Int, 20);
            option.Value = Noption;
            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("id");
            Table.Columns.Add(Col);
            Col = new DataColumn("fullname");
            Table.Columns.Add(Col);
            Col = new DataColumn("empcode");
            Table.Columns.Add(Col);
            Col = new DataColumn("name");
            Table.Columns.Add(Col);
            Col = new DataColumn("dvcha");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["id"].ToString();
                Row[1] = Dr["fullname"].ToString();
                Row[2] = Dr["empcode"].ToString();
                Row[3] = Dr["name"].ToString();
                Row[4] = Dr["dvcha"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();
            return Table;
        }
        protected void treeList_Callback(object sender, TreeListCustomCallbackEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            if (e.Argument.ToString() != "" && e.Argument.Length > 1)
            {
                hiddenIdEmp.Value = e.Argument.ToString().Substring(1);
                string idEmp = e.Argument.ToString().Substring(1);
                decimal UnitPerentId = 0, UnitChildId = 0;
                UnitChildId = objEmployees.GetEmployees(Convert.ToInt32(idEmp)).unitid;
                UnitPerentId = objUnit.GetUnit(objEmployees.GetEmployees(Convert.ToInt32(idEmp)).unitid).parentid;
                foreach (TreeListNode nodeParent in tree.Nodes)
                {
                    if (Convert.ToInt32(nodeParent.Key.Substring(1)) == UnitPerentId)
                    {
                        nodeParent.Expanded = true;
                        foreach (TreeListNode p in nodeParent.ChildNodes)
                        {
                            if (p.Key.Contains("u"))
                            {
                                if (p.Expanded) { p.Expanded = false; }
                                if (Convert.ToInt32(p.Key.Substring(1)) == UnitChildId)
                                {
                                    p.Expanded = true;
                                    foreach (TreeListNode c in p.ChildNodes)
                                    {
                                        if (Convert.ToInt32(idEmp) == Convert.ToInt32(c.Key.Substring(1)))
                                        {
                                            c.Expanded = true;
                                            c.Focus();
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if (nodeParent.Expanded) { nodeParent.Expanded = false; }
                        TreeListNode nodeParentC2 = tree.FindNodeByKeyValue(UnitChildId.ToString());
                        if (nodeParentC2 != null)
                        {
                            nodeParentC2.Expanded = true;
                            foreach (TreeListNode c in nodeParentC2.ChildNodes)
                            {
                                if (c.Expanded) { c.Expanded = false; }
                                if (Convert.ToInt32(idEmp) == Convert.ToInt32(c.Key.Substring(1)))
                                {
                                    c.Expanded = true;
                                    c.Focus();
                                }
                            }
                        }
                    }
                }
            }
            tree.RefreshVirtualTree();
        }
        protected string GetIconUrl(TreeListDataCellTemplateContainer container)
        {
            return string.Format("~/Images/Menu/{0}.png", container.GetValue("IconName"));
        }

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

        #region Tree

        public List<VNPT.Modules.Unit.UnitInfo> GetListDonVi()
        {
            VNPT.Modules.Unit.UnitInfo rootUnit = null;
            if (UserInfo.IsInRole("ToChucVTT"))
            {
                return objUnit.GetChildUnits(objUnit.GetRootUnit(0, 0).id);
            }
            if (UserInfo.IsInRole("ToChucDonVi"))
            {
                var empId = objEmployees.GetEmployeeByCode(UserInfo.Username);
                rootUnit = objUnit.GetRootUnit(empId.unitid, 1);
                List<VNPT.Modules.Unit.UnitInfo> retList = new List<VNPT.Modules.Unit.UnitInfo>();
                retList.Add(rootUnit);
                return retList;
            }
            else
                return objUnit.GetChildUnits(objUnit.GetRootUnit(0, 0).id);

        }
        public List<VNPT.Modules.Unit.UnitInfo> GetListDonViCon(decimal parentId)
        {
            return objUnit.GetChildUnits(parentId);
        }
        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {
            if (e.NodeObject is VNPT.Modules.Unit.UnitInfo)
            {
                var unit = e.NodeObject as VNPT.Modules.Unit.UnitInfo;
                if (unit == null) return;
                e.NodeKeyValue = string.Format("u{0}", unit.id);
                e.IsLeaf = false;
                e.SetNodeValue("IconName", "frontpage");
                e.SetNodeValue("Name", unit.name);
            }
            else
            {
                var emp = e.NodeObject as EmployeesInfo;
                e.IsLeaf = true;
                e.NodeKeyValue = string.Format("e{0}", emp.id);
                e.SetNodeValue("IconName", "support");
                e.SetNodeValue("Name", emp.fullname);
            }
        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            if (e.NodeObject == null)
            {
                e.Children = GetListDonVi();
            }
            else
            {
                if (e.NodeObject is VNPT.Modules.Unit.UnitInfo)
                {
                    VNPT.Modules.Unit.UnitInfo parent = e.NodeObject as VNPT.Modules.Unit.UnitInfo;
                    if (parent.ischild == true)
                    {
                        var listDonviCon = GetListDonViCon(parent.id);
                        e.Children = listDonviCon;
                    }
                    else
                    {
                        e.Children = objEmployees.GetEmployeesByUnit(parent.id);
                    }
                }
            }
        }
        #endregion

        protected void callbackPanel_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string id = e.Parameter.ToString();
            if (id.Contains("e"))
            {
                int ItemId = Int32.Parse(id.Substring(1));
               // this.employees = objEmployees.GetEmployees(ItemId);
                this.soluoclilich.Attributes["src"] = DotNetNuke.Common.Globals.ApplicationPath + "/Default.aspx?tabid=331&Id=" + ItemId;
            }
        }
        
    }

}
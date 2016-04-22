using System;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
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

using VNPT.Modules.Leave;

using DevExpress.Web.ASPxEditors;
using DotNetNuke.UI.Utilities;
using Philip.Modules.Salary_Group;
using VNPT.Modules.SalaryType;
using System.Globalization;
using System.Threading;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;


namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewViewNotice class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class SapTangLuong : PortalModuleBase, IActionable
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
        /// -----------------------------------------------------------------------------
        VNPT.Modules.Notices.NoticesController objNotice = new VNPT.Modules.Notices.NoticesController();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();    
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
           
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
          

            gridTangLuong.DataSource = IncreaseSalary();
            gridTangLuong.DataBind();           
        }
     
        public DataTable IncreaseSalary()
        {
            string strConn = getConnectionString();
            SqlConnection sqlCnn = new SqlConnection(strConn);
            SqlCommand sqlCmd;

            DataTable table = new DataTable();
            DataColumn colum;
            DataRow row;
            SqlDataReader dr;
            sqlCmd = new SqlCommand("HRM_IncreaseSalary", sqlCnn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCnn.Open();
            dr = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            sqlCmd.Dispose();
            colum = new DataColumn("empid");
            table.Columns.Add(colum);
            colum = new DataColumn("unitname");
            table.Columns.Add(colum);
            colum = new DataColumn("salary");
            table.Columns.Add(colum);
            colum = new DataColumn("level");
            table.Columns.Add(colum);
            colum = new DataColumn("type");
            table.Columns.Add(colum);
            colum = new DataColumn("changedate");
            table.Columns.Add(colum);
            colum = new DataColumn("fullname");
            table.Columns.Add(colum);

            SalaryTypeController objSalary = new VNPT.Modules.SalaryType.SalaryTypeController();
            Salary_GroupController objGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
            while (dr.Read())
            {
                row = table.NewRow();
                row[0] = dr["empid"].ToString();
              
                row[1] = dr["name"];
                row[2] = dr["ngachluong"];
                row[3] = dr["salarylevel"].ToString();
                row[4] = dr["hinhthuc"].ToString();
                row[5] = dr["changedate"].ToString();
                row[6] = dr["fullname"].ToString();
                table.Rows.Add(row);
            }
            dr.Close();
            sqlCnn.Close();
           
            return table;
        }
        
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
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

        protected void lbt_xemtiep_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.ApplicationPath + "/tabid/67/Default.aspx");
        }
        
       
     
        protected void gridTangLuong_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#DEEDFF';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
        }
        
    }
}


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
    partial class HetHopDong : PortalModuleBase, IActionable
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
        
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();    
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            decimal ma_unit = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username));
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
            grdExpried.DataSource = GetContractExpried(ma_unit);
            grdExpried.DataBind();                              
        }
        public DataTable GetContractExpried(decimal ma_unit)
        {
            SqlConnection Cnn = new SqlConnection(strconn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[HRM_GetContractExpried]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@ma_unit", SqlDbType.Decimal).Value = ma_unit;

            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("id");
            Table.Columns.Add(Col);

            Col = new DataColumn("hoten");
            Table.Columns.Add(Col);
            Col = new DataColumn("donvi");
            Table.Columns.Add(Col);
            Col = new DataColumn("hopdong");
            Table.Columns.Add(Col);
            Col = new DataColumn("batdau");
            Table.Columns.Add(Col);
            Col = new DataColumn("ketthuc");
            Table.Columns.Add(Col);
            Col = new DataColumn("empid");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["id"].ToString();
                Row[1] = Dr["fullname"].ToString();
                Row[2] = Dr["Name"].ToString();
                Row[3] = Dr["hopdong"].ToString();
                Row[4] = Dr["ngaybatdau"].ToString();
                Row[5] = Dr["ngayketthuc"].ToString();
                Row[6] = Dr["empid"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();

            return Table;
        }
       
        
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        protected void grdExpried_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "hoten")
            {
                LinkButton ltNhanVien = grdExpried.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "ltNhanVien") as LinkButton;
                //ltNhanVien.PostBackUrl =String.Format(DotNetNuke.Common.Globals.ApplicationPath + "/nhanvien/kyhopdong/tabid/908/Default.aspx?Id={0}&ac=1", e.GetValue("empid"));
                ltNhanVien.OnClientClick = " KyHopDong(" + e.GetValue("empid") + "); return false; ";
                ltNhanVien.Text = e.CellValue.ToString();
            }           
            if (e.DataColumn.FieldName == "ketthuc")
            {                
                DateTime ngaykt = DateTime.Parse(e.CellValue.ToString());
                if (ngaykt.Month < DateTime.Now.Month)
                {
                    e.Cell.ForeColor = Color.Red;
                }
                else
                {
                    e.Cell.ForeColor = Color.Green;
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

        protected void lbt_xemtiep_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.ApplicationPath + "/tabid/67/Default.aspx");
        }
           
        protected void grdExpried_HtmlRowCreated1(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#DEEDFF';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");         
        }
      
    }
}


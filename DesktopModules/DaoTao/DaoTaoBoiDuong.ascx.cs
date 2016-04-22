using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxUploadControl;
//using Philip.Modules.NghiViec;
//using VNPT.Modules.Unit;
using System.Configuration;
using System.Text;
using Microsoft.ApplicationBlocks.Data;

namespace DotNetNuke.Modules.DaoTao
{
    public partial class DaoTaoBoiDuong : PortalModuleBase, IActionable
    {
        //SqlConnection conn = null;
        //public string listFilter = null;
        //private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        ////NghiViecController objHuuTri = new NghiViecController();

        ////NghiViecInfo huutri = new NghiViecInfo();
        //VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        //VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        //VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        //VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        //VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        ////XtraReport_HuuTri report = new XtraReport_HuuTri();
       protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                this.navTab.Items[0].Selected = true;
            }
        }
      
       
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }       
}
}

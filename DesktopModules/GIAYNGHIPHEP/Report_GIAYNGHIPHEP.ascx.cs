using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DotNetNuke.Entities.Modules;


namespace DotNetNuke.Modules.GIAYNGHIPHEP
{
    public partial class Report_GIAYNGHIPHEP : DotNetNuke.Entities.Modules.PortalModuleBase, Entities.Modules.IActionable
    {

        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        VNPT.Modules.WorkHistory.WorkHistoryInfo history = new VNPT.Modules.WorkHistory.WorkHistoryInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Employees.EmployeesInfo employees = new VNPT.Modules.Employees.EmployeesInfo();
        VNPT.Modules.Position.PositionInfo position = new VNPT.Modules.Position.PositionInfo();
        VNPT.Modules.SalaryType.SalaryTypeController objSalary = new VNPT.Modules.SalaryType.SalaryTypeController();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
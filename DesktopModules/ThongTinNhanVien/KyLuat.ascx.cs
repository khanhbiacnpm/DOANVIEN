using System;
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
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using VNPT.Modules.Employees;
using DevExpress.Web.ASPxHiddenField;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class KyLuat : PortalModuleBase, IActionable    
    {
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.RewardDiscipline.RewardDisciplineController objRewaard = new VNPT.Modules.RewardDiscipline.RewardDisciplineController();
        VNPT.Modules.RewardDiscipline.RewardDisciplineInfo reward = new VNPT.Modules.RewardDiscipline.RewardDisciplineInfo();

        public int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

      
        #region Optional Interfaces
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

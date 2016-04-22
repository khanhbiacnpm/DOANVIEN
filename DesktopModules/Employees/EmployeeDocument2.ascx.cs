using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Security;
using DotNetNuke.UI.Utilities;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;


namespace VNPT.Modules.Employees
{   
    partial class EmployeeDocument : PortalModuleBase, IActionable
    {             
        protected void Page_Load(System.Object sender, System.EventArgs e)
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


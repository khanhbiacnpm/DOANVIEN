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
using DevExpress.Web.ASPxHiddenField;
using System.IO;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using Unit;

namespace VNPT.Modules.Unit
{
    partial class KhenThuong : PortalModuleBase, IActionable    
    {        
        DonVi dv = new DonVi();        
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUnit();
        }
        private void LoadUnit()
        {
            cmbSearch.DataSource = dv.GetDonViList();
            cmbSearch.DataBind();
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

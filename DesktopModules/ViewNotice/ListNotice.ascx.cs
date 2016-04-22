
using System;
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
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

public partial class DesktopModules_ViewNotice_ListNotice : PortalModuleBase, IActionable
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
    private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {

              
                    ListNotice();
               


            }
            catch (Exception ex)
            {
                Exceptions.ProcessModuleLoadException(this, ex);
            }


        }


    }
    protected void grid_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        e.Row.Height = 30;
    }

  
    private void ListNotice()
    {
        DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetNotices]", this.UserId).Tables[0];
        if (tb.Rows.Count > 0)
            grid.DataSource = tb;
        grid.DataBind();

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
}

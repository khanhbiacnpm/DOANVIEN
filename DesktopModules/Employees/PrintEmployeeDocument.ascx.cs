using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using VNPT.Modules;
using System.Threading;
using WebApplication1;
using System.Configuration;
using System.Data.SqlClient;
using DevExpress.XtraReports.Web;
using HRM_REPORT;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

namespace VNPT.Modules.Employees
{    
    partial class PrintEmployeeDocument : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void ReportViewer1_OnUnload(object sender, EventArgs e)
        {
            ((ReportViewer)ReportViewer1).Report = null;
        }
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            InReport();
        }
        private void InReport()
        {
            int empid = 0;
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
            {
                empid = Convert.ToInt32(Request.Params["IdNV"]);
                
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_MauC21", empid).Tables[0];
                DataSet ds = SqlHelper.ExecuteDataset(strconn, "HRM_GetThongTinMau2C", empid);

                XtraReport_Mau2C report = new XtraReport_Mau2C();
                report.load_report(tb, ds.Tables[0], ds.Tables[1], ds.Tables[2], ds.Tables[3], ds.Tables[4]);

                ReportViewer1.Report = report;
            }
        }       
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }
    }
}


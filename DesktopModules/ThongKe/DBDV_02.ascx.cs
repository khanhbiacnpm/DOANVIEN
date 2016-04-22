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
using DotNetNuke.UI.Utilities;
using DotNetNuke.Entities.Users;
using System.Globalization;
using System.IO;
using System.Data;
using DotNetNuke.Framework.Providers;
using VNPT.Modules.Employees;
using VNPT.Modules.Unit;

using System.Text;
using System.Data.SqlClient;
using DevExpress.Web.ASPxEditors;
using Microsoft.ApplicationBlocks.Data;
using HRM_REPORT;
using DevExpress.XtraReports.Web;
using DevExpress.XtraReports.UI;

namespace VNPT.Modules.ThongKe
{
    public partial class DBDV_02 : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                object ma_unit = SqlHelper.ExecuteScalar(ConnectionString, "QLDVIEN_QUYEN_GET", UserInfo.Username);
                DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_baocao_doi_tuong_quan_doi_nam", ma_unit);
                rptDBDV_2 rpt = new rptDBDV_2();
                rpt.InitData(ds.Tables[0]);
                ReportViewer1.Report = rpt;
                Session["rptDBDV02"] = rpt;
            }
            if (Session["rptDBDV02"] != null)
            {
                ReportViewer1.Report = Session["rptDBDV02"] as XtraReport;
            }
        }

        string ConnectionString
        {
            get
            {
                return System.Configuration.ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
            }
        }

        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                DotNetNuke.Entities.Modules.Actions.ModuleActionCollection Actions = new DotNetNuke.Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                DotNetNuke.Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }

        protected void ReportViewer1_Unload(object sender, EventArgs e)
        {
            ((ReportViewer)sender).Report = null;
        }
}
}

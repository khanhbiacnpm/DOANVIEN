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
    public partial class BieuMau02 : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                dteNgay.Date = DateTime.Now.Date.AddDays(1 - DateTime.Now.Day).AddMonths(1);
            }
            if (Session["rptBM02"] != null)
            {
                ReportViewer1.Report = Session["rptBM02"] as XtraReport;
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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            object ma_unit = SqlHelper.ExecuteScalar(ConnectionString, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DateTime ngay = dteNgay.Date;
            DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_baocao_bieumau02", ngay, ma_unit);
            rptBieuMau02 rpt = new rptBieuMau02();
            rpt.InitData(ds.Tables[0], ngay);
            ReportViewer1.Report = rpt;
            Session["rptBM02"] = rpt;
        }

        protected void ReportViewer1_Unload(object sender, EventArgs e)
        {
            ((ReportViewer)sender).Report = null;
        }
}
}

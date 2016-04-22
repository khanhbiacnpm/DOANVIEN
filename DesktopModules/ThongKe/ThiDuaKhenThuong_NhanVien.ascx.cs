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
    public partial class ThiDuaKhenThuong_NhanVien : PortalModuleBase, IActionable
    {
        int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                    idNV = Convert.ToInt32(Request.Params["idNV"]);
                DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_baocao_khenthuong_nhanvien", idNV);
                rptThanhTichNhanVien rpt = new rptThanhTichNhanVien();
                rpt.InitData(ds.Tables[0], string.Format("{1} - {0}", ds.Tables[1].Rows[0][0], ds.Tables[1].Rows[0][1]));
                ReportViewer1.Report = rpt;
                Session["rptTDKTNV"] = rpt;
            }
            else
            {
                if (Session["rptTDKTNV"] != null)
                {
                    ReportViewer1.Report = Session["rptTDKTNV"] as XtraReport;
                }
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

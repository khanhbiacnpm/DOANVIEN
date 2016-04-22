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
    public partial class BieuDoDaoTao_HinhThuc : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                dteTu.Date = new DateTime(DateTime.Now.Year, 1, 1);
                dteDen.Date = DateTime.Today;

                DataTable tblData = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_hinhthuc",dteTu.Date, dteDen.Date, 0).Tables[0];
                var series1 = wccBieuDo.Series[0];
                series1.Points.Clear();
                for (int i = 0; i < tblData.Rows.Count; i++)
                {
                    var row = tblData.Rows[i];

                    series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["loai"].ToString(), row["so_luong"]));
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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            DataTable tblData = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_hinhthuc", dteTu.Date, dteDen.Date, Convert.ToInt32(cbbDonVi.SelectedItem.Value)).Tables[0];
            var series1 = wccBieuDo.Series[0];
            series1.Points.Clear();
            for (int i = 0; i < tblData.Rows.Count; i++)
            {
                var row = tblData.Rows[i];

                series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["loai"].ToString(), row["so_luong"]));
            }
        }
}
}

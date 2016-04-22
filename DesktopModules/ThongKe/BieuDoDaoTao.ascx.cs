﻿using System;
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
using DevExpress.XtraCharts;

namespace VNPT.Modules.ThongKe
{
    public partial class BieuDoDaoTao : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                dteTu.Date = new DateTime(DateTime.Now.Year, 1, 1);
                dteDen.Date = DateTime.Today;
                DataTable tblData = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_all", dteTu.Date, dteDen.Date).Tables[0];
                wccBieuDo.Series.Clear();
                for (int i = 0; i < tblData.Rows.Count; i++)
                {
                    var row = tblData.Rows[i];
                    var series = new Series();
                    series.ShowInLegend = false;
                    series.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["donvi"].ToString(), row["so_luong"]));
                    wccBieuDo.Series.Add(series);
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
            DataTable tblData = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_all", dteTu.Date, dteDen.Date).Tables[0];
            wccBieuDo.Series.Clear();
            for (int i = 0; i < tblData.Rows.Count; i++)
            {
                var row = tblData.Rows[i];
                var series = new Series();
                series.ShowInLegend = false;
                series.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["donvi"].ToString(), row["so_luong"]));
                wccBieuDo.Series.Add(series);
            }
        }
}
}

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
using DevExpress.XtraCharts;

namespace VNPT.Modules.ThongKe
{
    public partial class BieuDoDaoTao_ChuyenNganh : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                dteTu.Date = new DateTime(DateTime.Now.Year, 1, 1);
                dteDen.Date = DateTime.Today;

                DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_chuyennganh1", dteTu.Date, dteDen.Date);
                DataTable tblData = ds.Tables[0];
                DataTable tblData1 = ds.Tables[1];

                var series1 = wccBieuDo.Series[0];
                var series2 = wccBieuDo1.Series[0];
                series1.Points.Clear();
                series2.Points.Clear();
                
                double max1 = 0, max2 = 0;
                int max_idx1 = 0, max_idx2 = 0;
                for (int i = 0; i < tblData.Rows.Count; i++)
                {
                    var row = tblData.Rows[i];
                    if (Convert.ToDouble(row["slbd"]) > max1)
                    {
                        max1 = Convert.ToDouble(row["slbd"]);
                        max_idx1 = i;
                    }
                    series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["lbd"].ToString(), row["slbd"]));
                }
                var pallete = BuildPallete(max_idx1);
                wccBieuDo.PaletteRepository.Add("NhanSu", pallete);
                wccBieuDo.PaletteName = "NhanSu";

                for (int i = 0; i < tblData1.Rows.Count; i++)
                {
                    var row = tblData1.Rows[i];
                    if (Convert.ToDouble(row["sldt"]) > max2)
                    {
                        max2 = Convert.ToDouble(row["sldt"]);
                        max_idx2 = i;
                    }
                    series2.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["ldt"].ToString(), row["sldt"]));
                }
                var pallete1 = BuildPallete1(max_idx2);
                wccBieuDo1.PaletteRepository.Add("NhanSu1", pallete1);
                wccBieuDo1.PaletteName = "NhanSu1";
                //litSoLop.Text = ds.Tables[1].Rows[0][0].ToString();
                //litSoNguoi.Text = ds.Tables[2].Rows[0][0].ToString();
                //litSoLuot.Text = ds.Tables[3].Rows[0][0].ToString();
            }
        }

        private DevExpress.XtraCharts.Palette BuildPallete(int max_idx)
        {
            DevExpress.XtraCharts.Palette pallete = new DevExpress.XtraCharts.Palette("NhanSu");
            //pallete.Add(System.Drawing.Color.FromArgb(0, 102, 179));
            pallete.Add(System.Drawing.Color.FromArgb(255, 128, 128));
            pallete.Add(System.Drawing.Color.Yellow);
            pallete.Add(System.Drawing.Color.Lime);
            pallete.Add(System.Drawing.Color.FromArgb(0, 128, 64));
            pallete.Add(System.Drawing.Color.Navy);
            pallete.Add(System.Drawing.Color.FromArgb(255, 128, 255));
            pallete.Add(System.Drawing.Color.FromArgb(128, 128, 192));
            pallete.Add(System.Drawing.Color.Blue);
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(0, 255, 64));
            pallete.Add(System.Drawing.Color.Aqua);
            pallete.Add(System.Drawing.Color.FromArgb(0, 128, 255));
            pallete.Add(System.Drawing.Color.FromArgb(64, 0, 0));
            pallete.Add(System.Drawing.Color.FromArgb(128, 64, 0));
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(255, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 0));
            pallete.Add(System.Drawing.Color.FromArgb(64, 0, 64));
            pallete.Add(System.Drawing.Color.FromArgb(255, 0, 128));
            pallete.Add(System.Drawing.Color.Pink);

            pallete[max_idx].Color = System.Drawing.Color.FromArgb(0, 102, 179);
            pallete[max_idx].Color2 = System.Drawing.Color.FromArgb(0, 102, 179);

            return pallete;
        }
        private DevExpress.XtraCharts.Palette BuildPallete1(int max_idx)
        {
            DevExpress.XtraCharts.Palette pallete = new DevExpress.XtraCharts.Palette("NhanSu1");
            //pallete.Add(System.Drawing.Color.FromArgb(0, 102, 179));
            pallete.Add(System.Drawing.Color.FromArgb(255, 128, 128));
            pallete.Add(System.Drawing.Color.Yellow);
            pallete.Add(System.Drawing.Color.Lime);
            pallete.Add(System.Drawing.Color.FromArgb(0, 128, 64));
            pallete.Add(System.Drawing.Color.Navy);
            pallete.Add(System.Drawing.Color.FromArgb(255, 128, 255));
            pallete.Add(System.Drawing.Color.FromArgb(128, 128, 192));
            pallete.Add(System.Drawing.Color.Blue);
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(0, 255, 64));
            pallete.Add(System.Drawing.Color.Aqua);
            pallete.Add(System.Drawing.Color.FromArgb(0, 128, 255));
            pallete.Add(System.Drawing.Color.FromArgb(64, 0, 0));
            pallete.Add(System.Drawing.Color.FromArgb(128, 64, 0));
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(255, 255, 128));
            pallete.Add(System.Drawing.Color.FromArgb(128, 255, 0));
            pallete.Add(System.Drawing.Color.FromArgb(64, 0, 64));
            pallete.Add(System.Drawing.Color.FromArgb(255, 0, 128));
            pallete.Add(System.Drawing.Color.Pink);

            pallete[max_idx].Color = System.Drawing.Color.FromArgb(0, 102, 179);
            pallete[max_idx].Color2 = System.Drawing.Color.FromArgb(0, 102, 179);

            return pallete;
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
            DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_daotao_chuyennganh", dteTu.Date, dteDen.Date);
            DataTable tblData = ds.Tables[0];
            DataTable tblData1 = ds.Tables[1];

            var series1 = wccBieuDo.Series[0];
            var series2 = wccBieuDo1.Series[0];
            series1.Points.Clear();
            series2.Points.Clear();

            double max1 = 0, max2 = 0;
            int max_idx1 = 0, max_idx2 = 0;
            for (int i = 0; i < tblData.Rows.Count; i++)
            {
                var row = tblData.Rows[i];
                if (Convert.ToDouble(row["slbd"]) > max1)
                {
                    max1 = Convert.ToDouble(row["slbd"]);
                    max_idx1 = i;
                }
                series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["lbd"].ToString(), row["slbd"]));
            }
            var pallete = BuildPallete(max_idx1);
            wccBieuDo.PaletteRepository.Add("NhanSu", pallete);
            wccBieuDo.PaletteName = "NhanSu";

            for (int i = 0; i < tblData1.Rows.Count; i++)
            {
                var row = tblData1.Rows[i];
                if (Convert.ToDouble(row["sldt"]) > max2)
                {
                    max2 = Convert.ToDouble(row["sldt"]);
                    max_idx2 = i;
                }
                series2.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["ldt"].ToString(), row["sldt"]));
            }
            var pallete1 = BuildPallete1(max_idx2);
            wccBieuDo1.PaletteRepository.Add("NhanSu1", pallete1);
            wccBieuDo1.PaletteName = "NhanSu1";

            //litSoLop.Text = ds.Tables[1].Rows[0][0].ToString();
            //litSoNguoi.Text = ds.Tables[2].Rows[0][0].ToString();
            //litSoLuot.Text = ds.Tables[3].Rows[0][0].ToString();
        }
    }
}

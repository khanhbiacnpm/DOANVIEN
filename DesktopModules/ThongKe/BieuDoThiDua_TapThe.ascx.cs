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
    public partial class BieuDoThiDua_TapThe : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                for (int i = 2008; i <= DateTime.Now.Year; i++)
                {
                    cbbNam.Items.Add("Năm " + i, i);
                }
                cbbNam.Value = DateTime.Now.Year;

                DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_thidua_donvi", DateTime.Now.Year);
                DataTable tblData = ds.Tables[0];
                var series1 = wccBieuDo.Series[0];
                series1.Points.Clear();
                double max = 0;
                int max_idx = 0;
                for (int i = 0; i < tblData.Rows.Count; i++)
                {
                    var row = tblData.Rows[i];
                    if (Convert.ToDouble(row["so_luong"]) > max)
                    {
                        max = Convert.ToDouble(row["so_luong"]);
                        max_idx = i;
                    }
                    series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["loai"].ToString(), row["so_luong"]));
                }
                var pallete = BuildPallete(max_idx);
                wccBieuDo.PaletteRepository.Add("NhanSu", pallete);
                wccBieuDo.PaletteName = "NhanSu";

                rptTD.DataSource = ds.Tables[1];
                rptTD.DataBind();
            }
        }

        public string GetColor(int idx)
        {
            var pallete = BuildPallete(20);
            return string.Format("#{0:X2}{1:X2}{2:X2}", pallete[idx].Color.R, pallete[idx].Color.G, pallete[idx].Color.B);
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
            if (max_idx < 20) {
                pallete[max_idx].Color = System.Drawing.Color.FromArgb(0, 102, 179);
                pallete[max_idx].Color2 = System.Drawing.Color.FromArgb(0, 102, 179);
            }
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
            DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_bieudo_thidua_donvi", cbbNam.SelectedItem.Value);
            DataTable tblData = ds.Tables[0];
            var series1 = wccBieuDo.Series[0];
            series1.Points.Clear();
            double max = 0;
            int max_idx = 0;
            for (int i = 0; i < tblData.Rows.Count; i++)
            {
                var row = tblData.Rows[i];
                if (Convert.ToDouble(row["so_luong"]) > max)
                {
                    max = Convert.ToDouble(row["so_luong"]);
                    max_idx = i;
                }
                series1.Points.Add(new DevExpress.XtraCharts.SeriesPoint(row["loai"].ToString(), row["so_luong"]));
            }
            var pallete = BuildPallete(max_idx);
            wccBieuDo.PaletteRepository.Add("NhanSu", pallete);
            wccBieuDo.PaletteName = "NhanSu";

            rptTD.DataSource = ds.Tables[1];
            rptTD.DataBind();
        }
    }
}

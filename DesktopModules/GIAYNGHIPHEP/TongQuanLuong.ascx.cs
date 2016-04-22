using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxUploadControl;

using VNPT.Modules.Unit;
using System.Configuration;
using System.Text;
using Microsoft.ApplicationBlocks.Data;

namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    public partial class TongQuanLuong : PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public string listFilter = null;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        private string strconnHRM = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
      
        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();

       protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
               
            }

            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_ThongKe_Luong]", 1).Tables[0];
            
            grid.DataSource = tb;
            grid.DataBind();
               
            TongQuanGioiTinh();
            TongQuanHopDong();
            TongQuanTrinhDo();
            BieuDo();
        }
       private DevExpress.XtraCharts.Palette BuildPallete(int max_idx)
       {
           DevExpress.XtraCharts.Palette pallete = new DevExpress.XtraCharts.Palette("NhanSu");
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

           pallete[max_idx].Color = System.Drawing.Color.FromArgb(0, 102, 179);
           pallete[max_idx].Color2 = System.Drawing.Color.FromArgb(0, 102, 179);

           return pallete;
       }
       private void BieuDo()
       {
           int iddv = Convert.ToInt32(Request.Params["iddv"]);
           DataTable tblData = SqlHelper.ExecuteDataset(strconnHRM, "sp_bieudo_loailaodong", iddv).Tables[0];
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
       }
       public int CountEmp()
       {
           string sql = "SELECT count(*) as tongsonv FROM hrm.dbo.Employees where isactive=1";


           object obj = SqlHelper.ExecuteScalar(strconn, CommandType.Text, sql);
           return Convert.ToInt32(obj);

       }
       private void TongQuanGioiTinh()
       {
           DataTable tb2 = SqlHelper.ExecuteDataset(strconnHRM, "[dbo].[sp_bieudo_gioitinh]", 0).Tables[0];
           gridGioiTinh.DataSource = tb2;
           gridGioiTinh.DataBind();
         this.lblLaoDong.Text ="<font color='#0066b3'><b>Tổng số lao động :</b> "+ CountEmp()+"</font>";
       }
       private void TongQuanHopDong()
       {
           DataTable tb2 = SqlHelper.ExecuteDataset(strconnHRM, "[dbo].[sp_bieudo_hopdong]", 0).Tables[0];
           gridHopDong.DataSource = tb2;
           gridHopDong.DataBind();
       }
       private void TongQuanTrinhDo()
       {
           DataTable tb2 = SqlHelper.ExecuteDataset(strconnHRM, "[dbo].[sp_bieudo_trinhdo]", 0).Tables[0];
           gridTrinhDo.DataSource = tb2;
           gridTrinhDo.DataBind();
       }

       public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }       
}
}

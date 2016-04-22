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

namespace VNPT.Modules.CanhBao
{
    public partial class CanhBao : PortalModuleBase, IActionable
    {
        EmployeesInfo employee = new EmployeesInfo();
        EmployeesController objEmployees = new EmployeesController();
        UnitController objUnit = new UnitController();
        protected void Page_Load(object sender, EventArgs e)
        {
            noidungCanhbaco.InnerHtml = LoadCanhBao();
        }
        private string LoadCanhBao()
        {
            string sb = "";
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            SqlCommand Cmd2;
            Cnn.Open();

            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            string url = DotNetNuke.Common.Globals.ApplicationPath;
            string urlCTV = DotNetNuke.Common.Globals.ApplicationPath + "/HSCongTacVien/QTCongTacVien/tabid/273/Default.aspx";
            if (emp != null)
            {
                int Nunitid = objUnit.GetUnit(emp.unitid).parentid;
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    Cmd = new SqlCommand("HRM_Get_NhanVienChoCapMa", Cnn);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter unitid = Cmd.Parameters.Add("@idUnit", SqlDbType.Int, 20);
                    unitid.Value = 0;
                    int nRecord = Convert.ToInt32(Cmd.ExecuteScalar());
                    int UnitId = objUnit.GetUnit(emp.unitid).parentid;
                    Cmd2 = new SqlCommand("select COUNT(id) from hrm.dbo.CTV_CTV where TrangThai=1 and MaCTV=''", Cnn);
                    int nRecordCTV = Convert.ToInt32(Cmd2.ExecuteScalar());                
                    if (nRecord > 0)
                        sb = "<a href='" + url + "/hoso/AddEmployee/tabid/179/Default.aspx" + "'>Có " + nRecord + " nhân viên đang chờ cấp mã</a>";
                    if (nRecord > 0 && nRecordCTV > 0)
                        sb += "</br>";
                    if (nRecordCTV > 0)
                        sb += "<a href='" + urlCTV + "" + "'>Có " + nRecordCTV + " cộng tác viên đang chờ cấp mã</a>";
                    Cmd.Dispose();
                    Cmd2.Dispose();
                }
                else
                {
                    Cmd = new SqlCommand("HRM_Get_NhanVienChoCapMa", Cnn);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter unitid = Cmd.Parameters.Add("@idUnit", SqlDbType.Int, 20);
                    unitid.Value = Nunitid;
                    int nRecord = Convert.ToInt32(Cmd.ExecuteScalar());
                    if (nRecord > 0)
                        sb = "<a href='" + url + "/nhanvien/kyhopdong/tabid/154/Default.aspx" + "'>Có " + nRecord + " nhân viên chờ ký hợp đồng</a>";
                    Cmd.Dispose();
                }                
            }                        
            Cnn.Close();
            return sb;
        }

        private static string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
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
    }
}

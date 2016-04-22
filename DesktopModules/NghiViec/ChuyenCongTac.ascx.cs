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

namespace DotNetNuke.Modules.NghiViec
{
    public partial class ChuyenCongTac : PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public string listFilter = null;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
     
        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.ChangeSalary.ChangeSalaryController objChangeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryController();
        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.SalaryType.SalaryTypeController objSalaryType = new VNPT.Modules.SalaryType.SalaryTypeController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();

       protected void Page_Load(object sender, EventArgs e)
        {

            listFilter = null;
            listFilter = BindName();
        }
       private string BindName()
       {
           DataTable dt = null;
           using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HRM"].ConnectionString))
           {
               using (SqlCommand cmd = conn.CreateCommand())
               {
                   cmd.CommandType = CommandType.Text;
                   cmd.CommandText = "select FullName,Empcode,e.Id,u.Name as TenDonVi,p.Name as DonViCha,po.Name as ChucVu from Employees e, Unit u,Unit p,Position po where e.Unitid=U.id and u.ParentId=p.Id and e.PositionId=po.Id and e.Isactive=1";
                   using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                   {
                       dt = new DataTable();
                       da.Fill(dt);
                   }
               }
           }

           StringBuilder output = new StringBuilder();
           output.Append("[");
           for (int i = 0; i < dt.Rows.Count; ++i)
           {
               string text = "{\"label\" :\"" + dt.Rows[i]["Empcode"].ToString().Trim() + "-" + dt.Rows[i]["FullName"].ToString() + " - " + dt.Rows[i]["ChucVu"].ToString() + "-" + dt.Rows[i]["TenDonVi"].ToString() + "-" + dt.Rows[i]["DonViCha"].ToString() + "\" ,\"value\": \"" + dt.Rows[i]["Empcode"].ToString().Trim() + " - " + dt.Rows[i]["FullName"].ToString() + " - " + dt.Rows[i]["ChucVu"].ToString() + " - " + dt.Rows[i]["TenDonVi"].ToString() + " - " + dt.Rows[i]["DonViCha"].ToString() + "\" ,\"id\": " + dt.Rows[i]["Id"].ToString() + "}";
               output.Append("" + text + "");

               if (i != (dt.Rows.Count - 1))
               {
                   output.Append(",");
               }
           }
           output.Append("]");
           return output.ToString();
       }
       protected void CallbackPanel_ChuyenCongTac_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
       {
           string str = e.Parameter.ToString();
          
           if (e.Parameter.Trim() == "H")
           {
               if (hiddenIdEmp.Value.Trim() != "")
               {
                  
                  // chuyencongtac.id = -1;
                 //  chuyencongtac.soQD = txtQuyetDinh.Text.Trim();
                  // chuyencongtac.empid = Convert.ToInt32(hiddenIdEmp.Value);
                //   chuyencongtac.lydonghi = "Chuyển công tác";
                  // chuyencongtac.tungay = dateNgayHieuLuc.Date;
                  // chuyencongtac.denngay = dateNgayHieuLuc.Date;
                  // objChuyenCongTac.AddNghiViec(chuyencongtac);
                   //panel1.Visible = false;
                   //panel2.Visible = true;
                   //LoadReport(Convert.ToInt32(hiddenIdEmp.Value));
               }
           }
           else
           {
               BindEmployee(Convert.ToInt32(e.Parameter.ToString()));               
           }
       }
    

       private void BindEmployee(int IdEmp)
       {
           this.employees = objEmployees.GetEmployees(IdEmp);           
           hiddenIdEmp.Value = IdEmp.ToString();
           lbl_maNV.Text = employees.empcode.Trim();
           lbl_TenNV.Text = employees.fullname.ToString();
           lbl_DonViHienTai.Text = objUnit.GetUnit(employees.unitid).name.ToString() + " -> " + objUnit.GetUnit(objUnit.GetUnit(employees.unitid).parentid).name;
           lbl_NgaySinh.Text = employees.birthday.Year != 1900 ? string.Format("{0:dd/MM/yyyy}", employees.birthday) : "";
           lbl_NoiSinh.Text = employees.placeofbirth.ToString();
           int idchucvu = objHistory.GetWorkHistoryByEmployee(IdEmp).Count > 0 ? objHistory.GetWorkHistoryByEmployee(IdEmp).OrderByDescending(whe => whe.desiciondate).ToList()[0].positionid : 155;

           lbl_ChucVu.Text = idchucvu == 0 ? objPosition.GetPosition(155).name : objPosition.GetPosition(idchucvu).name;
           if (objChangeSalary.GetChangeSalaryByEmployee(IdEmp).Count > 0)
           {
               lbl_bacLuong.Text = objChangeSalary.GetChangeSalaryByEmployee(Convert.ToInt32(IdEmp)).OrderByDescending(s => s.id).ToList()[0].salarylevel.IndexOf("/") != -1 ? objChangeSalary.GetChangeSalaryByEmployee(Convert.ToInt32(IdEmp)).OrderByDescending(s => s.id).ToList()[0].salarylevel : objChangeSalary.GetChangeSalaryByEmployee(Convert.ToInt32(IdEmp)).OrderByDescending(s => s.id).ToList()[0].salarylevel + "/" + Tenbacluong(objChangeSalary.GetChangeSalaryByEmployee(Convert.ToInt32(IdEmp)).OrderByDescending(s => s.id).ToList()[0].classid, false, objChangeSalary.GetChangeSalaryByEmployee(Convert.ToInt32(IdEmp)).OrderByDescending(s => s.id).ToList()[0].changedate);
               lbl_heSo.Text = objChangeSalary.GetChangeSalaryByEmployee(IdEmp).OrderByDescending(o => o.id).ToList()[0].salarycoefficient;
           }
           if (objLeave.GetLeaveByEmp(IdEmp).Count > 0)
           {
               lbl_phepNam.Text = objLeave.GetLeaveByEmp(IdEmp).ToList()[0].fromdate.Year == DateTime.Now.Year ? "Đã nghỉ" : "Chưa nghỉ";
           }
       }
       private string Tenbacluong(int classid, bool kieuluong, DateTime thoidiem)
       {
           string tenbacluong = "";
           int idNhomLuong = 0;
           idNhomLuong = objSalaryType.GetSalaryType(classid).parentid != 0 ? objSalaryType.GetSalaryType(classid).parentid : objSalaryType.GetSalaryType(classid).id;
           if (objSalaryType.GetSalaryType(idNhomLuong).groupid != 0)
               tenbacluong = objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem) != null ? objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem).bacLuongTheoNhom : "";
           return tenbacluong;
       }
        
        private string DiaDanhDonVi()
        {
            decimal idDonvi = 0;
            string donvi = "";
            VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (emp != null)
            {
                decimal idUnit = emp.unitid;
                if (objUnit.GetUnit(idUnit).parentid == 14)// cap trung tam
                {
                    idDonvi = idUnit;
                }
                else // cap to
                {
                    idDonvi = objUnit.GetUnit(objUnit.GetUnit(idUnit).parentid).id;
                }
                switch (Convert.ToInt32(idDonvi))
                {
                    case 305:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 115:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 116:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 288:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 114:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 105:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 106:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    case 107:
                        {
                            donvi = "Tp Buôn Ma Thuột";
                            break;
                        }
                    default:
                        {
                            donvi = objUnit.GetUnit(idDonvi).name.Replace("Trung tâm Viễn thông", "");
                            break;
                        }
                }
            }
            return donvi;
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
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

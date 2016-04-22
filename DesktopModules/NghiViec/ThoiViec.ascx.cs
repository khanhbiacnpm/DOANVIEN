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
    public partial class ThoiViec: PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public string listFilter = null;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
  
        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
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
       protected void CallbackPanel_ThoiViec_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
       {
           string str = e.Parameter.ToString();
           
           if (e.Parameter.Trim() == "H")
           {
               if (hiddenIdEmp.Value.Trim() != "")
               {
                  
                  // thoiviec.id = -1;
                 //  thoiviec.soQD = txtQuyetDinh.Text.Trim();
                  // thoiviec.empid = Convert.ToInt32(hiddenIdEmp.Value);
                  // thoiviec.lydonghi = "Chấm dút hợp đồng";
                  // thoiviec.tungay = dateNgayHieuLuc.Date;
                  // thoiviec.denngay = dateNgayHieuLuc.Date;
                  // objThoiViec.AddNghiViec(thoiviec);
                   //panel1.Visible = false;
                   //panel2.Visible = true;
                   //LoadReport(Convert.ToInt32(hiddenIdEmp.Value));
               }
           }
           else
           {
               BindEmployee(Convert.ToInt32(e.Parameter.Substring(1)));               
           }
       }
    
       private void BindEmployee(int IdEmp)
       {
           this.employees = objEmployees.GetEmployees(IdEmp);           
           hiddenIdEmp.Value = IdEmp.ToString();
           lbl_TenNV.Text = employees.fullname.ToString();
           lbl_maNV.Text = employees.empcode.Trim();          
           lbl_DonViHienTai.Text = objUnit.GetUnit(employees.unitid).name.ToString() + " -> " + objUnit.GetUnit(objUnit.GetUnit(employees.unitid).parentid).name;
           lbl_NgaySinh.Text = employees.birthday.Year != 1900 ? string.Format("{0:dd/MM/yyyy}", employees.birthday) : "";
           lbl_NoiSinh.Text = employees.placeofbirth.ToString();
           int idchucvu = objHistory.GetWorkHistoryByEmployee(IdEmp).Count > 0 ? objHistory.GetWorkHistoryByEmployee(IdEmp).OrderByDescending(whe => whe.desiciondate).ToList()[0].positionid : 155;           
           lbl_ChucVu.Text = idchucvu == 0 ? objPosition.GetPosition(155).name : objPosition.GetPosition(idchucvu).name; ;
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

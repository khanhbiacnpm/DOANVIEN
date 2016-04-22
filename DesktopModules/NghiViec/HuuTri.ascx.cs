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
using System.Threading;
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Text;

namespace DotNetNuke.Modules.NghiViec
{
    public partial class HuuTri: PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public string listFilter = null;
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;

        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();

       private int IdEmp = 0;
       protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");


            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();

                
                dateNgayHieuLuc.Date = DateTime.Now;


                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);

                    BindEmployee(IdEmp);
                }
            }
        }
      
       protected void CallbackPanel_HuuTri_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
       {
           string str = e.Parameter.ToString();

           if (e.Parameter.Trim() == "H")
           {
               if ((dateNgayHieuLuc.Date - DateTime.Now).Days < 90)
               {
                   if (hiddenIdEmp.Value.Trim() != "")
                   {                                             
                      
                     
                       int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_NV_NghiViec]", 0, Convert.ToInt32(hiddenIdEmp.Value), cmb_lydo.Text, dateNgayHieuLuc.Date, dateNgayHieuLuc.Date,txtQuyetDinh.Text.Trim(), 0);
                       CallbackPanel_HuuTri.JSProperties["cpErrorNgayHT"] = false;
                       
                   }
               }
               else
               {
                   CallbackPanel_HuuTri.JSProperties["cpErrorNgayHT"] = true;
                  
               }
           }
       }
      

       private void BindEmployee(int IdEmp)
       {
           DataTable tbl = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTin_NghiViec]", IdEmp).Tables[0];
           if (tbl.Rows.Count > 0)
           {
               hiddenIdEmp.Value = tbl.Rows[0]["id"].ToString();
               lbl_TenNV.Text = tbl.Rows[0]["hoten"].ToString();
               lbl_soBHXH.Text = tbl.Rows[0]["sobhxh"].ToString();
               lbl_DonViHienTai.Text = tbl.Rows[0]["TenDonVi"].ToString();
               lbl_NgaySinh.Text = tbl.Rows[0]["Birthday"].ToString();
               lbl_NoiSinh.Text = tbl.Rows[0]["noisinhxa"].ToString() + " - " + tbl.Rows[0]["noisinhhuyen"].ToString() + " - " + tbl.Rows[0]["Tinh"].ToString();
               int ngayNH = employees.sex == true ? 60 : 55;
               dateNgayHieuLuc.Date = DateTime.Now;// Convert.ToDateTime(tbl.Rows[0]["Birthday"]).Year != 1900 ? Convert.ToDateTime(tbl.Rows[0]["Birthday"]).AddYears(ngayNH) : DateTime.Now;
               lbl_ChucVu.Text = tbl.Rows[0]["ChucVu"].ToString();
           }

                 
           
        
       
           
           
           
           
           

           
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
                switch(Convert.ToInt32(idDonvi))
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

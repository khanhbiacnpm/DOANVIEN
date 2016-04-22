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

using System.IO;
using VNPT.Modules.Unit;
using System.Globalization;
using System.Threading;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace DotNetNuke.Modules.GIAYNGHIPHEP
{
    public partial class NghiKhongLuong : PortalModuleBase, IActionable
    {

        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Employees.EmployeesInfo employees = new VNPT.Modules.Employees.EmployeesInfo();        
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objContractType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        private int IdEmp = 0;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            if (!IsPostBack)
            {

               

                if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["idNV"]);

                    BindGridContract(IdEmp);
                   
                }
               
            }
            //if (Session["idEmpNP"] != null)
            //{
            //    if (hiddenngayNghiPhepChuan.Value != null)
            //    {
            //        ReportNghiPhep(Convert.ToInt32(Session["idEmpNP"]), Convert.ToInt32(hiddenngayNghiPhepChuan.Value));
            //    }
            //}
     
        }
      
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        protected void grdContract_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {           
            ASPxDateEdit dateNgayKetThuc = grdContract.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = grdContract.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtLyDo = grdContract.FindEditFormTemplateControl("txtLyDo") as ASPxTextBox;

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }


            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhongLuong]", e.Keys["Id"], dateNgayBatDau.Date,
                   dateNgayKetThuc.Date,txtLyDo.Text, IdEmp, 1);
     


            grdContract.CancelEdit();
            e.Cancel = true;

            BindGridContract(IdEmp);
        }
        protected void grdContract_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = grdContract.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = grdContract.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtLyDo = grdContract.FindEditFormTemplateControl("txtLyDo") as ASPxTextBox;
            

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }

            if (IdEmp > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhongLuong]", -1, dateNgayBatDau.Date,
                    dateNgayKetThuc.Date, txtLyDo.Text, IdEmp, 0);
            }


            grdContract.CancelEdit();
            e.Cancel = true;

            BindGridContract(IdEmp);
        }


        protected void grdContract_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            try
            {
                int n = 0;
                if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["idNV"]);
                }

                if (IdEmp > 0)
                {
                    n = SqlHelper.ExecuteNonQuery(strconn, "HRM_KhongLuong", e.Keys["Id"], "1/1/1900",
                      "1/1/1900","", IdEmp, 2);
                }


                grdContract.CancelEdit();
                e.Cancel = true;
                grdContract.JSProperties["cpResult"] = n;
                BindGridContract(IdEmp);
            }
            catch (Exception ex) {  }

        }
        private void BindGridContract(int ItemId)
        {
            if (ItemId != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetLeaveByEmployee]", ItemId).Tables[0];               
                grdContract.DataSource = tb;
                grdContract.DataBind();              
            }

        }
      
       
       

        protected void grdContract_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
           
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

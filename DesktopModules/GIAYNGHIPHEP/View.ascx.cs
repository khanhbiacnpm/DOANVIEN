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
    public partial class View: PortalModuleBase,IActionable
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
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            if (!IsPostBack)
            {


                DotNetNuke.Framework.jQuery.RequestRegistration();
                if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["idNV"]);
                    GioiTinh(IdEmp);
                   
                    BindGridContract(IdEmp);
                    BindGridKhongLuong(IdEmp);
                    BindGridThaiSan(IdEmp);
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
        public void GioiTinh(int idnv)
        {
            this.employees = objEmployees.GetEmployees(idnv);
            thaisan.InnerHtml = "<ul class=\"tabs\">";
            thaisan.InnerHtml += "<li class=''><a href=\"#tab1\">Nghỉ phép</a></li>";
            thaisan.InnerHtml += "<li class=''><a href=\"#tab2\">Nghỉ không lương</a></li>";
            if (this.employees.sex == false)
            {
                thaisan.InnerHtml += "<li class=''><a href=\"#tab3\">Nghỉ thai sản</a></li>";    
            }            
            thaisan.InnerHtml += "</ul>";
        }
        #region KhongLuong
        private void BindGridKhongLuong(int ItemId)
        {
            if (ItemId != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_KhongLuong]", 0,"1/1/1900","1/1/1900","",ItemId,3).Tables[0];
                gridKhongLuong.DataSource = tb;
                gridKhongLuong.DataBind();
            }

        }
        protected void gridKhongLuong_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = gridKhongLuong.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = gridKhongLuong.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtLydo = gridKhongLuong.FindEditFormTemplateControl("txtLydo") as ASPxTextBox;


            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }


            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhongLuong]", e.Keys["Id"], dateNgayBatDau.Date,
                      dateNgayKetThuc.Date, txtLydo.Text, IdEmp, 1);



            gridKhongLuong.CancelEdit();
            e.Cancel = true;

            BindGridKhongLuong(IdEmp);
        }
        protected void gridKhongLuong_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = gridKhongLuong.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = gridKhongLuong.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtLydo = gridKhongLuong.FindEditFormTemplateControl("txtLydo") as ASPxTextBox;

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }

            if (IdEmp > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhongLuong]", -1, dateNgayBatDau.Date,
                     dateNgayKetThuc.Date, txtLydo.Text, IdEmp, 0);
            }


            gridKhongLuong.CancelEdit();
            e.Cancel = true;

            BindGridKhongLuong(IdEmp);
        }


        protected void gridKhongLuong_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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


                gridKhongLuong.CancelEdit();
                e.Cancel = true;
                
                BindGridKhongLuong(IdEmp);
            }
            catch (Exception ex) { }

        }
        #endregion
        #region ThaiSan
        private void BindGridThaiSan(int ItemId)
        {
            if (ItemId != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_NghiThaiSan]", 0, "1/1/1900", "1/1/1900",  ItemId, 3).Tables[0];
                gridThaiSan.DataSource = tb;
                gridThaiSan.DataBind();
            }

        }
        protected void gridThaiSan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = gridThaiSan.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = gridThaiSan.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            


            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }


            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_NghiThaiSan]", e.Keys["Id"], dateNgayBatDau.Date,
                      dateNgayKetThuc.Date,  IdEmp, 1);



            gridThaiSan.CancelEdit();
            e.Cancel = true;

            BindGridThaiSan(IdEmp);
        }
        protected void gridThaiSan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = gridThaiSan.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = gridThaiSan.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }

            if (IdEmp > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_NghiThaiSan]", -1, dateNgayBatDau.Date,dateNgayKetThuc.Date, IdEmp, 0);
            }


            gridThaiSan.CancelEdit();
            e.Cancel = true;

            BindGridThaiSan(IdEmp);
        }


        protected void gridThaiSan_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
                    n = SqlHelper.ExecuteNonQuery(strconn, "HRM_NghiThaiSan", e.Keys["Id"], "1/1/1900",
                       "1/1/1900",  IdEmp, 2);
                }


                gridThaiSan.CancelEdit();
                e.Cancel = true;

                BindGridThaiSan(IdEmp);
            }
            catch (Exception ex) { }

        }
        #endregion
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        protected void grdContract_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {           
            ASPxDateEdit dateNgayKetThuc = grdContract.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = grdContract.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtSoQD = grdContract.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxComboBox cmbNoiNghiPhep = grdContract.FindEditFormTemplateControl("cmbNoiNghiPhep") as ASPxComboBox;

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }

            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Leave", e.Keys["Id"], IdEmp, dateNgayBatDau.Date.Year, dateNgayBatDau.Date,
               dateNgayKetThuc.Date, Int32.Parse(cmbNoiNghiPhep.Value.ToString()), cmbNoiNghiPhep.Text, txtSoQD.Text, 1);

            grdContract.CancelEdit();
            e.Cancel = true;

            BindGridContract(IdEmp);
        }
        protected void grdContract_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit dateNgayKetThuc = grdContract.FindEditFormTemplateControl("dateNgayKetThuc") as ASPxDateEdit;
            ASPxDateEdit dateNgayBatDau = grdContract.FindEditFormTemplateControl("dateNgayBatDau") as ASPxDateEdit;
            ASPxTextBox txtSoQD = grdContract.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxComboBox cmbNoiNghiPhep = grdContract.FindEditFormTemplateControl("cmbNoiNghiPhep") as ASPxComboBox;

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
            {
                IdEmp = Convert.ToInt32(Request.Params["idNV"]);
            }

            if (IdEmp > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Leave", 0, IdEmp, dateNgayBatDau.Date.Year, dateNgayBatDau.Date,
                    dateNgayKetThuc.Date, Int32.Parse(cmbNoiNghiPhep.Value.ToString()), cmbNoiNghiPhep.Text, txtSoQD.Text, 0);
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
                    n = SqlHelper.ExecuteNonQuery(strconn, "HRM_Leave", e.Keys["Id"], IdEmp, 1900, "1/1/1900",
                       "1/1/1900", 0, "", "", 2);
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
      
       
       
        protected void CallbackPanel_NghiPhep_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            //string idTreeList = e.Parameter.ToString();
            //if (idTreeList.Contains("e"))
            //{
            //    txtSoQD.Text = "";
            //    IdEmp = Int32.Parse(idTreeList.Substring(1));
            //    if (objContract.GetContractsByEmployess(IdEmp).Count > 0)
            //    {
            //        int idLoaiHopDong =objContract.GetContractsByEmployess(IdEmp).OrderByDescending(ce => ce.datestart).ToList()[0].contracttype;
            //        if (idLoaiHopDong == 6 || idLoaiHopDong == 7 || idLoaiHopDong == 8)
            //        {
            //            int ngayNghiPhep = 12;
            //            btDieuChuyen.Enabled = true;
            //            this.employees = objEmployees.GetEmployees(IdEmp);
            //            if (objOffice.GetOffice(employees.officeid) != null)
            //            {
            //                if (objOffice.GetOffice(employees.officeid).DocHai == 1)
            //                {
            //                    ngayNghiPhep = 14;
            //                }
            //                else if (objOffice.GetOffice(employees.officeid).DocHai == 2)
            //                {
            //                    ngayNghiPhep = 16;
            //                }
            //            }
            //            double day = (DateTime.Now - employees.daterecruit).Days / 365;
            //            int t = (int)Math.Round(day);
            //            if (t >= 5 && t < 10)
            //            {
            //                ngayNghiPhep += 1;
            //            }
            //            else if (t >= 10 && t < 15)
            //            {
            //                ngayNghiPhep += 2;
            //            }
            //            else if (t >= 15 && t < 20)
            //            {
            //                ngayNghiPhep += 3;
            //            }
            //            else if (t >= 20 && t < 25)
            //            {
            //                ngayNghiPhep += 4;
            //            }
            //            else if (t >= 25 && t < 30)
            //            {
            //                ngayNghiPhep += 5;
            //            }
            //            else if (t >= 30 && t < 35)
            //            {
            //                ngayNghiPhep += 6;
            //            }
            //            else if (t >= 35 && t < 40)
            //            {
            //                ngayNghiPhep += 7;
            //            }
            //            else if (t >= 40 && t < 45)
            //            {
            //                ngayNghiPhep += 8;
            //            }
            //            hiddenngayNghiPhepChuan.Value = ngayNghiPhep.ToString();
            //            lbl_ThoiGianNghi.Text = ngayNghiPhep + " ngày";
            //        }                    
            //    }

              
            
            //}
            
            //else if (e.Parameter == "NP")
            //{
            //    NhanVienNghiPhep(hiddenIdEmp.Value);
            //}
        }
        private void NhanVienNghiPhep(string IdEmp)
        {
            
        }
        private void Load_cmbNoiNghiPhep()
        {

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTimKiemCmb]");
            ASPxComboBox cmbNoiNghiPhep = grdContract.FindEditFormTemplateControl("cmbNoiNghiPhep") as ASPxComboBox;
            cmbNoiNghiPhep.DataSource = ds.Tables[5];
            cmbNoiNghiPhep.ValueField = "Id";
            cmbNoiNghiPhep.TextField = "ten";
            cmbNoiNghiPhep.DataBind();
           
            if (!grdContract.IsNewRowEditing)
            {
                var ProvinceId = cmbNoiNghiPhep.Items.FindByValue(Int32.Parse(grdContract.GetRowValues(grdContract.EditingRowVisibleIndex, "ProvinceId").ToString()));
                if (ProvinceId != null)
                {
                    ProvinceId.Selected = true;

                }
                else
                {
                    cmbNoiNghiPhep.SelectedIndex = 0;
                }
            }
            else {
                cmbNoiNghiPhep.SelectedIndex = 0;
            }
        }

        protected void grdContract_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            Load_cmbNoiNghiPhep();
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

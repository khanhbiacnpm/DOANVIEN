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
using System.Configuration;
using System.Text;
using Microsoft.ApplicationBlocks.Data;

namespace DotNetNuke.Modules.GIAYNGHIPHEP
{
    public partial class NangBacLuongB : PortalModuleBase, IActionable
    {        

        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        VNPT.Modules.WorkHistory.WorkHistoryInfo history = new VNPT.Modules.WorkHistory.WorkHistoryInfo();
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.SalaryType.SalaryTypeController objSalary = new VNPT.Modules.SalaryType.SalaryTypeController();
        VNPT.Modules.ChangeSalary.ChangeSalaryController objChangeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryController();
        VNPT.Modules.ChangeSalary.ChangeSalaryInfo changeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryInfo();
        VNPT.Modules.SalaryType.SalaryTypeController objSalaryType = new VNPT.Modules.SalaryType.SalaryTypeController();
        Philip.Modules.Salary_Group.Salary_GroupController objGroup = new Philip.Modules.Salary_Group.Salary_GroupController();
        Philip.Modules.EmpQualification.EmpQualificationController objEmpQualification = new Philip.Modules.EmpQualification.EmpQualificationController();
        Philip.Modules.EmpQualification.EmpQualificationInfo empquanlification = new Philip.Modules.EmpQualification.EmpQualificationInfo();
        VNPT.Modules.Qualification.QualificationController objQualification = new VNPT.Modules.Qualification.QualificationController();
        Philip.Modules.Professional.ProfessionalController objProfessional = new Philip.Modules.Professional.ProfessionalController();
        Philip.Modules.BaoHiem.BaoHiemController objBaoHiem = new Philip.Modules.BaoHiem.BaoHiemController();
        SqlConnection conn = null;
        private int IdEmp = 0;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            


            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                BindASalary();
                dateNgayThiThanh.Date = DateTime.Now;
                dateNgayKi.Date = DateTime.Now;

                if (Session["fileNangLuongB"] != null)
                {
                    Session.Remove("fileNangLuongB");
                }
                 if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                   
                    LoadEmp(IdEmp);
                }
               
            }
            //if (Session["idEmpDC"] != null)
            //{                
            //    reportNangBacLuong(Session["idEmpDC"].ToString());
            //}
            
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
        private string Tenbacluong(int classid, bool kieuluong, DateTime thoidiem)
        {
            string tenbacluong = "";
            int idNhomLuong = 0;
            idNhomLuong = objSalaryType.GetSalaryType(classid).parentid != 0 ? objSalaryType.GetSalaryType(classid).parentid : objSalaryType.GetSalaryType(classid).id;
            if (objSalaryType.GetSalaryType(idNhomLuong).groupid != 0)
                tenbacluong = objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem) != null ? objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem).bacLuongTheoNhom : "";
            return tenbacluong;
        }
       
        private void BindASalary()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinLuong]", 0, 1).Tables[0];            
            cmbNhomLuongA.DataSource = tb;
            cmbNhomLuongA.ValueField = "id";
            cmbNhomLuongA.TextField = "nhomluong";
            cmbNhomLuongA.DataBind();
            cmbNhomLuongA.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbNhomLuongA.SelectedIndex = 0;
            
        }
        private void LoadBacLuong(int nhomluong)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", nhomluong, 0, 0).Tables[0];
            cmbBacLuongMoi.DataSource = tb;
            cmbBacLuongMoi.TextField = "bacluong";
            cmbBacLuongMoi.ValueField = "id";
            cmbBacLuongMoi.DataBind();
            cmbBacLuongMoi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbBacLuongMoi.SelectedIndex = 0;
        }
        protected void cmbBacLuongMoi_CallBack(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

            LoadBacLuong(Int32.Parse(e.Parameter.ToString()));
         
        }
        protected void ASPxCallbackPanelHESOLUONG_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", Convert.ToInt32(e.Parameter),0, 4).Tables[0];
            if (tb.Rows.Count > 0)
            {
                txtHeSoLuongMoi.Text= tb.Rows[0]["heso"].ToString();
              
            }
        }        
      
        private void LoadEmp(int id)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "HRM_ThongTinNhanVien", id).Tables[0];
            if (tbl.Rows.Count > 0)
            {
                lbl_TenNV.Text = tbl.Rows[0]["hoten"].ToString();
                lbl_MaNV.Text = tbl.Rows[0]["EmpCode"].ToString();
                lblChucVu.Text = tbl.Rows[0]["ChucVu"].ToString();
                lbl_DonViHienTai.Text = tbl.Rows[0]["donvi"].ToString();
                lbl_BacLuongCu.Text = tbl.Rows[0]["trdo"].ToString();
                lbl_NgachDangHuong.Text = "<b>" + tbl.Rows[0]["gluongB"].ToString() + "</b> - <b>Bậc : </b>" + tbl.Rows[0]["bluongb"].ToString() + " - <b>Hệ số</b> : " + tbl.Rows[0]["hsluongb"].ToString() + " - <b>Ngày biến động :</b> " + tbl.Rows[0]["ngayluongB"].ToString();
             
                lblChucDanh.Text = tbl.Rows[0]["chucdanhb"].ToString();


                txtHeSoLuongMoi.Text = tbl.Rows[0]["hsluongb"].ToString();



                var itemNhomLuong = cmbNhomLuongA.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["NhomLuongB"].ToString().Trim()));
                if (itemNhomLuong != null)
                {
                    itemNhomLuong.Selected = true;
                }
                LoadBacLuong(Convert.ToInt32(tbl.Rows[0]["NhomLuongB"]));
                var itemBacLuong = cmbBacLuongMoi.Items.FindByText(tbl.Rows[0]["bluong"].ToString().Trim());
                if (itemBacLuong != null)
                {
                    itemBacLuong.Selected = true;
                }
                btDieuChuyen.Enabled = true;
            }
        
            
        }
       
        //upload file tai day 
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileNangLuongB"] = filename;
            }
        }
        private string CreateServerFilename(string clientFilename)
        {
            if (clientFilename.LastIndexOf(System.IO.Path.DirectorySeparatorChar) > -1)
            {
                return clientFilename.Substring(clientFilename.LastIndexOf(System.IO.Path.DirectorySeparatorChar) + 1);
            }
            else
            {
                return clientFilename;
            }
        }
        protected void CallbackPanel_DieuChuyen_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter == "Di")
            {
                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                    string file = "";
                    if (Session["fileNangLuongB"] != null)
                    {
                        file = Session["fileNangLuongB"].ToString();
                    }
                    int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_QuaTrinhLuong_UI", 0, IdEmp, dateNgayKi.Value, dateNgayThiThanh.Value, cmbBacLuongMoi.Value,
                        cmbBacLuongMoi.Text.Trim(),2, txtHeSoLuongMoi.Text, txtQuyetDinh.Text, "1/1/1900", file, 0, "", 0);
                    
                    CallbackPanel_DieuChuyen.JSProperties["cpResult"] = true;
                }

              

                    
                   
            }
        }
        private void LoadNangBacLuong(string IdEmp)
        {
           
            this.objChangeSalary.AddChangeSalary(this.changeSalary);

            //panel1.Visible = false;
            //panel2.Visible = true;
            //Session["idEmpDC"] = IdEmp;
            //reportNangBacLuong(IdEmp);
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

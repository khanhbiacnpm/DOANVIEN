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

namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    public partial class BoNhiemCanBo : PortalModuleBase, IActionable
    {

        Philip.Modules.SalaryOffice.SalaryOfficeController objSalaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        VNPT.Modules.WorkHistory.WorkHistoryInfo history = new VNPT.Modules.WorkHistory.WorkHistoryInfo();
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.SalaryType.SalaryTypeController objSalary = new VNPT.Modules.SalaryType.SalaryTypeController();
        VNPT.Modules.ChangeSalary.ChangeSalaryController objChangeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryController();
        Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
        VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
        VNPT.Modules.Qualification.QualificationController objQualification = new VNPT.Modules.Qualification.QualificationController();
        Philip.Modules.Professional.ProfessionalController objProfession = new Philip.Modules.Professional.ProfessionalController();
        Philip.Modules.EmpQualification.EmpQualificationController objEmpQualification = new Philip.Modules.EmpQualification.EmpQualificationController();
        private int IdEmp = 0;        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        public string listFilter = null;
        SqlConnection conn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
           
         
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
               
                LoadComBobox();
                dateHieuLuc.Date = DateTime.Now;
               
              
                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                   
                    LoadEmp(IdEmp);
                }
            }
          
           
        }

        private string BindName()
        {
            DataTable dt = null;
            using (conn = new SqlConnection(strconn))
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
        private void LoadComBobox()
        {

            cmbDonViMoi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmbDonViMoi.TextField = "ten";
            cmbDonViMoi.ValueField = "id";
            cmbDonViMoi.DataBind();            
            cmbDonViMoi.SelectedIndex = 0;

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_TCCB_Combo]", 0, 0);
            cmbChucVuMoi.DataSource = ds.Tables[1];
            cmbChucVuMoi.TextField = "Name";
            cmbChucVuMoi.ValueField = "id";
            cmbChucVuMoi.DataBind();
            cmbChucVuMoi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbChucVuMoi.SelectedIndex = 0;

            cmbChucDanhB.DataSource = ds.Tables[2];
            cmbChucDanhB.TextField = "Name";
            cmbChucDanhB.ValueField = "id";
            cmbChucDanhB.DataBind();
            cmbChucDanhB.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbChucDanhB.SelectedIndex = 0;

            cmbChucDanh.DataSource = ds.Tables[3];
            cmbChucDanh.TextField = "Name";
            cmbChucDanh.ValueField = "id";
            cmbChucDanh.DataBind();
            cmbChucDanh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbChucDanh.SelectedIndex = 0;

            cmbNhomChucDanh.DataSource = ds.Tables[6];
            cmbNhomChucDanh.TextField = "ten";
            cmbNhomChucDanh.ValueField = "id";
            cmbNhomChucDanh.DataBind();
            cmbNhomChucDanh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbNhomChucDanh.SelectedIndex = 0;

            for (int i = 1; i <= 5; i++)
            {
                txtThoiHan.Items.Add(new ListEditItem(i+" Năm ", i));
            }
          
        }

        //private void LoadNhomLuong(int idchucdanh, int idqlnn)
        //{
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_LuongA", idchucdanh, idqlnn, 2).Tables[0];
        //    cmbNhomLuong.DataSource = tb;
        //    cmbNhomLuong.ValueField = "id";
        //    cmbNhomLuong.TextField = "ten";
        //    cmbNhomLuong.DataBind();
        //    cmbNhomLuong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
        //    cmbNhomLuong.SelectedIndex = 0;
        //}
        //private void LoadBacLuong(int id)
        //{
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_LuongA]", id,0, 0).Tables[0];
        //    cmbBacLuong.DataSource = tb;
        //    cmbBacLuong.TextField = "bacluong";
        //    cmbBacLuong.ValueField = "id";
        //    cmbBacLuong.DataBind();
        //}

        //protected void cmbNhomLuong_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        //{
        //    string s = e.Parameter.ToString();
        //    string[] st = s.Split(',');
        //    int qlnn = int.Parse(st[0]);
        //    int idchucdanh = int.Parse(st[1]);

        //    LoadNhomLuong(34, 15);
        //}
        //protected void cmbBacLuong_CallBack(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        //{
        //    LoadBacLuong(Int32.Parse(e.Parameter.ToString()));


        //}
    
        private string Tenbacluong(int classid, bool kieuluong, DateTime thoidiem)
        {
            VNPT.Modules.SalaryType.SalaryTypeController objSalaryType = new VNPT.Modules.SalaryType.SalaryTypeController();
            string tenbacluong = "";
            int idNhomLuong = 0;
            idNhomLuong = objSalaryType.GetSalaryType(classid).parentid != 0 ? objSalaryType.GetSalaryType(classid).parentid : objSalaryType.GetSalaryType(classid).id;
            if (objSalaryType.GetSalaryType(idNhomLuong).groupid != 0)
                tenbacluong = objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem) != null ? objSalaryType.GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(objSalaryType.GetSalaryType(idNhomLuong).groupid, kieuluong, thoidiem).bacLuongTheoNhom : "";
            return tenbacluong;
        }
        private void LoadEmp(int id)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "HRM_ThongTinNhanVien", id).Tables[0];
           
            btDieuChuyen.Enabled = true;
            IdEmp = id;
            string ql = tbl.Rows[0]["IdQLNN"].ToString();
            string cd = tbl.Rows[0]["IdChucDanhB"].ToString();
            hf_idQLNN.Set("idQLNNuoc", ql);
            hf_idQLNN.Set("cdcongviec", cd);

            ListEditItem item = cmbDonViMoi.Items.FindByValue(Int32.Parse(tbl.Rows[0]["UnitId"].ToString()));
            if (item != null)
            {
                item.Selected = true;
            }
            ListEditItem itemChucVu = cmbChucVuMoi.Items.FindByValue(Int32.Parse(tbl.Rows[0]["PositionId"].ToString()));
            if (itemChucVu != null)
            {
                itemChucVu.Selected = true;
            }
            ListEditItem itemNhom = cmbNhomChucDanh.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdNhomChucDanhB"].ToString()));
            if (itemNhom != null)
            {
                itemNhom.Selected = true;
            }
            ListEditItem item1 = cmbChucDanh.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdChucDanh"].ToString()));
            if (item1 != null)
            {
                item1.Selected = true;
            }
            BinhQLNN(Int32.Parse(tbl.Rows[0]["IdChucDanh"].ToString()));
            
            ListEditItem item3 = cmbQLNhaNuoc.Items.FindByValue(Int32.Parse(ql)); ;
            if (item3 != null)
            {
                item3.Selected = true;
            }
            BindChucDanh(Int32.Parse(tbl.Rows[0]["IdNhomChucDanhB"].ToString()));

            ListEditItem itemChucDanhB = cmbChucDanhB.Items.FindByValue(Int32.Parse(cd)); ;
            if (itemChucDanhB != null)
            {
                itemChucDanhB.Selected = true;
            }
        }
        protected void pnlBoNhiem_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            
               
            
        }
        protected void CallbackPanel_DieuChuyen_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter == "Di")
            {

                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                    LoadBoNhiemCanBo(IdEmp);
                    CallbackPanel_DieuChuyen.JSProperties["cpResult"] = true;
                }
            }
           
            
        }
        private void BinhQLNN(int offId)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_LuongA]", offId,0, 3).Tables[0];
            cmbQLNhaNuoc.DataSource = tb;
            cmbQLNhaNuoc.ValueField = "id";
            cmbQLNhaNuoc.TextField = "ten";
            cmbQLNhaNuoc.DataBind();
           
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
                Session["fileBoNhiem"] = filename;
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
        protected void cmbQLNhaNuoc_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            BinhQLNN(Convert.ToInt32(e.Parameter.ToString()));
        }
        private void LoadBoNhiemCanBo(int empid)
        {
        
            int positionid = Int32.Parse(cmbChucVuMoi.SelectedItem.Value.ToString());
            int unitid = Convert.ToInt32(cmbDonViMoi.SelectedItem.Value.ToString());
            int idchucdanhb = Int32.Parse(hf_idQLNN.Get("cdcongviec").ToString());
             int idchucdanh = Int32.Parse(cmbChucDanh.SelectedItem.Value.ToString());
             int idqlnn = Int32.Parse(hf_idQLNN.Get("idQLNNuoc").ToString());
            DateTime ngayhl = dateHieuLuc.Date;
            string fileqd = "";
            if (Session["fileBoNhiem"] != null)
            {
                fileqd = Session["fileBoNhiem"].ToString();
                Session.Remove("fileBoNhiem");
            }
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_QuaTrinhCongTac_UI]", 0, empid, unitid, "", idchucdanhb,
                    idchucdanh, idqlnn, positionid, ngayhl, ngayhl, fileqd,ngayhl.AddYears(Int32.Parse(txtThoiHan.Value.ToString())),txtQuyetDinh.Text, 0);

           
        }
        private void BindChucDanh(int offId)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetChucDanhTheoNhom]", offId).Tables[0];
            cmbChucDanhB.DataSource = tb;
            cmbChucDanhB.ValueField = "id";
            cmbChucDanhB.TextField = "ten";
            cmbChucDanhB.DataBind();
            cmbChucDanhB.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbChucDanhB.SelectedIndex = 0;
        }
        protected void cmb_chucdanhb_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

            if (e.Parameter.ToString().Trim() != "")
            {
                BindChucDanh(Int32.Parse(e.Parameter.ToString()));
            }
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

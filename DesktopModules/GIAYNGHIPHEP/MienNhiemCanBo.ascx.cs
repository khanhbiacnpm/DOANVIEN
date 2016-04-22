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

namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    public partial class BoNhiemCanBo : PortalModuleBase, IActionable
    {

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
        Philip.Modules.SalaryOffice.SalaryOfficeController objSalaryOffice = new Philip.Modules.SalaryOffice.SalaryOfficeController();
        private int IdEmp = 0;
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
           
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                LoadComBobox();
                dateHieuLuc.Date = DateTime.Now;
                panel1.Visible = true;
                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);

                    LoadEmp(IdEmp);
                }
            }
            //if (Session["idEmpDC"] != null)
            //{
            //    reportBoNhiemCanBo(Session["idEmpDC"].ToString());
            //}
           
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
        private void LoadEmp(int id)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "HRM_ThongTinNhanVien", id).Tables[0];
            if (tbl.Rows.Count > 0)
            {
              
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

                ListEditItem item3 = cmbQLNhaNuoc.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdQLNN"].ToString())); ;
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
                btDieuChuyen.Enabled = true;
            }
           
           
          
           
          
        }
        protected void CallbackPanel_DieuChuyen_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string idTreeList = e.Parameter.ToString();
            if (e.Parameter == "Di")
            {
                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                    LoadMienNhiemCanBo(IdEmp);
                    CallbackPanel_DieuChuyen.JSProperties["cpResult"] = true;
                }
               
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
                Session["fileMienNhiem"] = filename;
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
        private void BinhQLNN(int offId)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_LuongA]", offId, 0, 3).Tables[0];
            cmbQLNhaNuoc.DataSource = tb;
            cmbQLNhaNuoc.ValueField = "id";
            cmbQLNhaNuoc.TextField = "ten";
            cmbQLNhaNuoc.DataBind();
        }
        protected void cmbQLNhaNuoc_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            BinhQLNN(Convert.ToInt32(e.Parameter.ToString()));
        }
        private void LoadMienNhiemCanBo(int IdEmp)
        {
            int positionid = Int32.Parse(cmbChucVuMoi.SelectedItem.Value.ToString());
            int unitid = Convert.ToInt32(cmbDonViMoi.SelectedItem.Value.ToString());
            int idchucdanhb = Int32.Parse(hf_idQLNN.Get("cdcongviec").ToString());
            int idchucdanh = Int32.Parse(cmbChucDanh.SelectedItem.Value.ToString());
            int idqlnn = Int32.Parse(cmbQLNhaNuoc.SelectedItem.Value.ToString());
            DateTime ngayhl = dateHieuLuc.Date;
            string fileqd = "";
            if (Session["fileMienNhiem"] != null)
            {
                fileqd = Session["fileMienNhiem"].ToString();
                Session.Remove("fileMienNhiem");
            }
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_QuaTrinhCongTac_UI]", 0, IdEmp, unitid, "", idchucdanhb,
                    idchucdanh, idqlnn, positionid, ngayhl, ngayhl, fileqd, "1/1/1900", txtQuyetDinh.Text, 0);
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

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
using VNPT.Modules.RewardDiscipline;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxGridView;
using System.Globalization;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using DevExpress.Web.ASPxRoundPanel;
using Microsoft.ApplicationBlocks.Data;
using System.Text;
using System.Collections;
using System.Configuration;
using VNPT.Modules.Unit;

namespace DotNetNuke.Modules.KhenThuong
{
    public partial class GiayKhenVTT : PortalModuleBase, IActionable
    {
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Unit.UnitInfo unit = new VNPT.Modules.Unit.UnitInfo();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.Position.PositionInfo position = new VNPT.Modules.Position.PositionInfo();
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.RewardDiscipline.RewardDisciplineController objReward = new VNPT.Modules.RewardDiscipline.RewardDisciplineController();



        protected void Page_Load(object sender, EventArgs e)
        {

            int year = DateTime.Now.Year;
            if (!this.IsPostBack)
            {

                DotNetNuke.Framework.jQuery.RequestRegistration();



                BindComBoBox();
                LoadDanhHieuThiDuaKhenThuong(year, 0);




            }
        }
        private void load_combo_capkhenthuong(ASPxComboBox cmb)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GET_CAPKHENTHUONG", 0, 0).Tables[0];
            cmb.DataSource = tb;
            cmb.TextField = "ten";
            cmb.ValueField = "id";
            cmb.DataBind();
        }
        protected void grid_CustomerCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {


            LoadDanhHieuThiDuaKhenThuong(Int32.Parse(e.Parameters.ToString()), 0);

        }
        protected void BindComBoBox()
        {

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", 0);
            foreach (DataRow row in ds.Tables[9].Rows)
            {
                cmbNam.Items.Add("Năm " + row[0], row[0]);
            }
            ListEditItem itemNam = this.cmbNam.Items.FindByValue(DateTime.Now.Year);
            if (itemNam != null)
            {
                itemNam.Selected = true;
            }
            else
            {
                cmbNam.Items.Insert(0, new ListEditItem("Năm " + DateTime.Now.Year, DateTime.Now.Year));
                cmbNam.SelectedIndex = 0;
            }
        }

       
       
        protected void grid_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_dataCombox();
        }
        private void load_dataCombox()
        {
            ASPxComboBox cmb_capkhenthuong = gridKhenThuong.FindEditFormTemplateControl("cmb_capkhenthuong") as ASPxComboBox;            
            ASPxComboBox cmbDanhHieuThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbDanhHieuThiDua") as ASPxComboBox;
            ASPxComboBox cmbThanhTich = gridKhenThuong.FindEditFormTemplateControl("cmbThanhTich") as ASPxComboBox;
            ASPxComboBox cmbNamThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbNamThiDua") as ASPxComboBox;

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", 0);
            load_combo_capkhenthuong(cmb_capkhenthuong);

            cmbDanhHieuThiDua.DataSource = ds.Tables[4];
            cmbDanhHieuThiDua.TextField = "Ten";
            cmbDanhHieuThiDua.ValueField = "Id";
            cmbDanhHieuThiDua.DataBind();
            cmbDanhHieuThiDua.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            if (!gridKhenThuong.IsNewRowEditing)
            {
              
                string danhhieu = gridKhenThuong.GetRowValues(gridKhenThuong.EditingRowVisibleIndex, "DanhHieu").ToString();
                cmbDanhHieuThiDua.Text = danhhieu;

                var item = cmb_capkhenthuong.Items.FindByValue(gridKhenThuong.GetRowValues(gridKhenThuong.EditingRowVisibleIndex, "idcapkhenthuong"));
                if (item != null)
                    item.Selected = true;
            }
            else
            {
                cmbDanhHieuThiDua.SelectedIndex = 0;
            }



            cmbThanhTich.DataSource = ds.Tables[1];
            cmbThanhTich.TextField = "ten";
            cmbThanhTich.ValueField = "id";
            cmbThanhTich.DataBind();




            if (!gridKhenThuong.IsNewRowEditing)
            {


                string loaidanhhieu = gridKhenThuong.GetRowValues(gridKhenThuong.EditingRowVisibleIndex, "loaidanhhieu").ToString();
                cmbThanhTich.Text = loaidanhhieu;


            }
            else
            {
                cmbThanhTich.SelectedIndex = 0;
            }

            for (int i = DateTime.Now.Year; i >= DateTime.Now.Year - 20; i--)
            {
                cmbNamThiDua.Items.Add(new ListEditItem("Năm " + i, i));
            }
            //nam thang
            if (!gridKhenThuong.IsNewRowEditing)
            {
                string Nam = gridKhenThuong.GetRowValues(gridKhenThuong.EditingRowVisibleIndex, "Nam").ToString();

                ListEditItem item = cmbNamThiDua.Items.FindByValue(Int32.Parse(Nam));
                if (item != null)
                {
                    item.Selected = true;
                }


            }
            else
            {
                ListEditItem item = cmbNamThiDua.Items.FindByValue(DateTime.Now.Year);
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
       
      
        protected void UploadControl_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileKhenThuong"] = filename;
            }

        }
        private void LoadDanhHieuThiDua(int doituong, int loaithanhtich)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DanhHieuThiDua]", 0, doituong, loaithanhtich, 1).Tables[0];
            ASPxComboBox cmbDanhHieuThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbDanhHieuThiDua") as ASPxComboBox;
            cmbDanhHieuThiDua.DataSource = tb;
            cmbDanhHieuThiDua.TextField = "ten";
            cmbDanhHieuThiDua.ValueField = "id";
            cmbDanhHieuThiDua.DataBind();
            cmbDanhHieuThiDua.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));

        }

        protected void cmbDanhHieu_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string s = e.Parameter.ToString();
            string[] st = s.Split(',');
            int doituong = int.Parse(st[1]);
            int loaithanhtich = int.Parse(st[0]);

            LoadDanhHieuThiDua(doituong, loaithanhtich);
            //  cmbDanhHieuThiDua.SelectedIndex = 0;

        }
        private string GetText(string fieldName)
        {
            int index = gridKhenThuong.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridKhenThuong.GetRowValues(index, fieldName).ToString();

            }
            return values;

        }


        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtQuyetDinh = gridKhenThuong.FindEditFormTemplateControl("txtQuyetDinh") as ASPxTextBox;
            ASPxDateEdit dateNgayQuyetDinh = gridKhenThuong.FindEditFormTemplateControl("dateNgayQuyetDinh") as ASPxDateEdit;
            ASPxTextBox txtNguoiKy = gridKhenThuong.FindEditFormTemplateControl("txtNguoiKy") as ASPxTextBox;
            ASPxTextBox txtGhiChu = gridKhenThuong.FindEditFormTemplateControl("txtGhiChu") as ASPxTextBox;
            ASPxComboBox cmbNamThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbNamThiDua") as ASPxComboBox;
            ASPxComboBox cmbThanhTich = gridKhenThuong.FindEditFormTemplateControl("cmbThanhTich") as ASPxComboBox;
            ASPxComboBox cmbDanhHieuThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbDanhHieuThiDua") as ASPxComboBox;
            ASPxComboBox cmb_capkhenthuong = gridKhenThuong.FindEditFormTemplateControl("cmb_capkhenthuong") as ASPxComboBox;
            string fileqd = "";

            if (Session["fileKhenThuong"] != null)
            {
                fileqd = Session["fileKhenThuong"].ToString();
            }

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_UI]", 0, 14, 0, 1,
                     txtGhiChu.Text, txtQuyetDinh.Text, dateNgayQuyetDinh.Date.ToString("dd/MM/yyyy"), "", 0, fileqd, 0, 
                     Int32.Parse(cmbDanhHieuThiDua.Value.ToString()), Convert.ToInt32(cmbNamThiDua.Value.ToString()), 
                     txtNguoiKy.Text, Convert.ToInt32(cmbThanhTich.Value.ToString()),0,cmb_capkhenthuong.Value ,0);

            gridKhenThuong.CancelEdit();
            e.Cancel = true;

            LoadDanhHieuThiDuaKhenThuong(Int32.Parse(cmbNam.Value.ToString()), 0);
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            ASPxTextBox txtQuyetDinh = gridKhenThuong.FindEditFormTemplateControl("txtQuyetDinh") as ASPxTextBox;
            ASPxDateEdit dateNgayQuyetDinh = gridKhenThuong.FindEditFormTemplateControl("dateNgayQuyetDinh") as ASPxDateEdit;
            ASPxTextBox txtNguoiKy = gridKhenThuong.FindEditFormTemplateControl("txtNguoiKy") as ASPxTextBox;
            ASPxTextBox txtGhiChu = gridKhenThuong.FindEditFormTemplateControl("txtGhiChu") as ASPxTextBox;
            ASPxComboBox cmbNamThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbNamThiDua") as ASPxComboBox;
            ASPxComboBox cmbThanhTich = gridKhenThuong.FindEditFormTemplateControl("cmbThanhTich") as ASPxComboBox;
            ASPxComboBox cmbDanhHieuThiDua = gridKhenThuong.FindEditFormTemplateControl("cmbDanhHieuThiDua") as ASPxComboBox;
            ASPxComboBox cmb_capkhenthuong = gridKhenThuong.FindEditFormTemplateControl("cmb_capkhenthuong") as ASPxComboBox;
            string fileqd = "";

            if (Session["fileKhenThuong"] != null)
            {
                fileqd = Session["fileKhenThuong"].ToString();
            }

            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_UI]", Int32.Parse(e.Keys[gridKhenThuong.KeyFieldName].ToString()), 14, 0, 1,
                     txtGhiChu.Text, txtQuyetDinh.Text, dateNgayQuyetDinh.Date.ToString("dd/MM/yyyy"), "", 0, fileqd, 0, 
                     Int32.Parse(cmbDanhHieuThiDua.Value.ToString()), Convert.ToInt32(cmbNamThiDua.Value.ToString()), 
                     txtNguoiKy.Text, Convert.ToInt32(cmbThanhTich.Value.ToString()),0,cmb_capkhenthuong.Value ,1);

            gridKhenThuong.CancelEdit();
            e.Cancel = true;

            LoadDanhHieuThiDuaKhenThuong(Int32.Parse(cmbNam.Value.ToString()), 0);
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_UI]", Int32.Parse(e.Keys[gridKhenThuong.KeyFieldName].ToString()), 14, 0, 1,
                     "", "", "", "", 0, "", 0, 0, 0, "", 0, 0, 0, 2);

            gridKhenThuong.CancelEdit();
            e.Cancel = true;

            LoadDanhHieuThiDuaKhenThuong(Int32.Parse(cmbNam.Value.ToString()), 0);
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

        private void LoadDanhHieuThiDuaKhenThuong(int nam, int loaithanhtich)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_KhenThuong_VTT]", nam, 0).Tables[0];
            gridKhenThuong.DataSource = tb;
            gridKhenThuong.DataBind();
        }
        
      
      
        
    }
}



using System;
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
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewCountry class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class DanhHieuKhenThuong : PortalModuleBase, IActionable
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


                LoadDanhHieuThiDuaKhenThuong(year, 0, 0);

                load_combo_capkhenthuong();


            }
        }

        private void load_combo_capkhenthuong()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GET_CAPKHENTHUONG", 0, 0).Tables[0];
            cmb_capkhenthuong .DataSource = tb;
            cmb_capkhenthuong.TextField = "ten";
            cmb_capkhenthuong.ValueField = "id";
            cmb_capkhenthuong.DataBind();
            cmb_capkhenthuong.Items.Insert(0, new ListEditItem("-- Chọn --", 0));
            cmb_capkhenthuong.SelectedIndex = 0;
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

        private void LoadDanhHieuThiDuaKhenThuong(int nam, int loaithanhtich, int type)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DanhHieuThiDua_DonVi]", nam, loaithanhtich, type).Tables[0];
            gridKhenThuong.DataSource = tb;
            gridKhenThuong.DataBind();
        }
        private void LoadDanhHieuThiDua(int doituong, int loaithanhtich)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_DanhHieuThiDua]", 0, doituong, loaithanhtich, 1).Tables[0];
            cmbDanhHieuThiDua.DataSource = tb;
            cmbDanhHieuThiDua.TextField = "ten";
            cmbDanhHieuThiDua.ValueField = "id";
            cmbDanhHieuThiDua.DataBind();
            cmbDanhHieuThiDua.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));

        }
        protected void cmb_capkhenthuong_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_combo_capkhenthuong();
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
        protected void grid_CustomerCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string s = e.Parameters.ToString();
            string[] st = s.Split(',');
            int nam = int.Parse(st[1]);

            int loaithanhtich = int.Parse(st[0]);

            LoadDanhHieuThiDuaKhenThuong(nam, loaithanhtich, 0);

        }

        protected void BindComBoBox()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", 0);
            cmbUnit.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmbUnit.TextField = "ten";
            cmbUnit.ValueField = "id";
            cmbUnit.DataBind();


            cmbThanhTich.DataSource = ds.Tables[1];
            cmbThanhTich.TextField = "ten";
            cmbThanhTich.ValueField = "id";
            cmbThanhTich.DataBind();
            cmbThanhTich.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbThanhTich.SelectedIndex = 0;
          
            foreach (DataRow row in ds.Tables[7].Rows)
            {
                cmbNam.Items.Add("Năm " + row[0], row[0]);
            }
          
            cmbThanhTichKhenThuong.DataSource = ds.Tables[1];
            cmbThanhTichKhenThuong.TextField = "ten";
            cmbThanhTichKhenThuong.ValueField = "id";
            cmbThanhTichKhenThuong.DataBind();
            cmbThanhTichKhenThuong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbThanhTichKhenThuong.SelectedIndex = 0;

            for (int i = DateTime.Now.Year; i >= DateTime.Now.Year - 20; i--)
            {
                cmbNamThiDua.Items.Add(new ListEditItem("Năm " + i, i));
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

        protected void gridNhanVien_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            decimal donvi = Convert.ToDecimal(e.Parameters);
            BindGridNhanVien(donvi);
        }

        private void BindGridNhanVien(decimal idDonVi)
        {            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", idDonVi);
            gridNhanVien.DataSource = ds.Tables[3];
            gridNhanVien.DataBind();
        }

        protected void pnlList_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.StartsWith("xoa"))
            {
                int nhom = int.Parse(e.Parameter.ToString().Substring(3));
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_XoaGiayKhen]", nhom);
            }
        }
        
        protected void pnlChiTietKhenThuong_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

            int nhom =Int32.Parse(e.Parameter.ToString());

            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_TapThe2]", nhom).Tables[0];
            if (tb.Rows.Count > 0)
            {
                DataRow row = tb.Rows[0];
                int nam = Int32.Parse(row["Nam"].ToString());
                int loaithanhtich = Int32.Parse(row["HinhThucThiDua"].ToString());
                
                int idthanhtich = Int32.Parse(row["idthanhtich"].ToString());
                LoadDanhHieuThiDua(2, idthanhtich);
                
                txtQuyetDinh.Text = row["Desicion"].ToString();
                txtNguoiKy.Text = row["NguoiKyQuyetDinh"].ToString();
                txtGhiChu.Text = row["Title"].ToString();
              
               
                    dateNgayQuyetDinh.Date =DateTime.ParseExact(row["desiciondate"].ToString(), "dd/MM/yyyy", null);

                    var itemcapkhenthuong = cmb_capkhenthuong.Items.FindByValue(row["idcapkhenthuong"]);
                    if (itemcapkhenthuong != null)
                        itemcapkhenthuong.Selected = true;

                ListEditItem namthidua = cmbNamThiDua.Items.FindByValue(nam);
                if (namthidua != null)
                {
                    namthidua.Selected = true;
                }
                else {
                    ListEditItem nt = cmbNamThiDua.Items.FindByValue(DateTime.Now.Year);
                    if (nt != null)
                    {
                        nt.Selected = true;
                    }
                }
                ListEditItem thanhtich = cmbThanhTich.Items.FindByValue(idthanhtich);
                if (thanhtich != null)
                {
                    thanhtich.Selected = true;
                }
                ListEditItem thidua = cmbDanhHieuThiDua.Items.FindByValue(loaithanhtich);
                if (thidua != null)
                {
                    thidua.Selected = true;
                }
                else
                {
                    cmbDanhHieuThiDua.SelectedIndex = 0;
                }

            }

        }
        public int GetMaxId()
        {            
            object obj = SqlHelper.ExecuteScalar(strconn, "qldv_GetMaxId_KhenThuong");
            return Convert.ToInt32(obj) + 1;

        }
        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

            string s = e.Parameter.ToString();
            List<decimal> lsId = new List<decimal>();
            if (s.StartsWith("send"))
            {
                string noidung = s.Substring(4);

                foreach (string sItem in listnv.Get("s").ToString().Split(','))
                {
                    if (string.IsNullOrEmpty(sItem))
                        continue;
                    decimal id = Convert.ToDecimal(sItem);
                    lsId.Add(id);
                }
                string fileqd = "";
               
                if (Session["fileKhenThuong"] != null)
                {
                    fileqd = Session["fileKhenThuong"].ToString();
                }

                if (hiddenNhom.Contains("nhom"))
                {
                    int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_XoaGiayKhen]", Int32.Parse(hiddenNhom.Get("nhom").ToString()));
                }
                int nhom = GetMaxId();
                foreach (decimal idnv in lsId)
                {

                    KhenThuongNhanVien(idnv, fileqd,nhom);
                }


                ASPxCallbackPanel1.JSProperties["cpResult"] = 1;
                Session.Remove("fileKhenThuong");


            }
            else if (s.StartsWith("reset"))
            {
                listChiTiet.DataSource = null;
                listChiTiet.DataBind();
            }
            else
            {

                int nhom = Int32.Parse(e.Parameter.ToString());
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_TapThe2]", nhom).Tables[0];

                listChiTiet.DataSource = tb;
                listChiTiet.DataBind();
                DataTable tb1 = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_TapThe3]", nhom).Tables[0];
                listNhanVien.DataSource = tb1;
                listNhanVien.TextField = "name";
                listNhanVien.ValueField = "id";
                listNhanVien.DataBind();

            }
        }


        private void KhenThuongNhanVien(decimal idnv, string fileqd,int nhom)
        {
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KhenThuong_UI]", 0, idnv, 0, 1,
                   txtGhiChu.Text, txtQuyetDinh.Text, dateNgayQuyetDinh.Date.ToString("dd/MM/yyyy"), "", 0, fileqd, 
                   Int32.Parse(cmbDanhHieuThiDua.Value.ToString()), 0, Convert.ToInt32(cmbNamThiDua.Value.ToString()), 
                   txtNguoiKy.Text, 0,nhom, cmb_capkhenthuong.Value ,0);
        }

        protected void listNhanVienChon_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

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

        public string ChuyenTVKhongDau(string strVietNamese)
        {
            string FindText = "ÀàảẢãáÁạẠăằẳẵắặâÂầẩẫấẤậđĐèẻẽéẹêÊềểễếệìỉĩíịòỏõóọôÔồổỗốộơờởỡớợùủũúụưƯừửữứựỳỷỹýỵ";
            string ReplText = "AaaAaaAaAaaaaaaaAaaaaAadDeeeeeeEeeeeeiiiiiooooooOooooooooooouuuuuuUuuuuuyyyyy";
            int index = -1, index2;
            while ((index = strVietNamese.IndexOfAny(FindText.ToCharArray())) != -1)
            {
                index2 = FindText.IndexOf(strVietNamese[index]);
                strVietNamese = strVietNamese.Replace(strVietNamese[index], ReplText[index2]);
            }
            return strVietNamese;
        }


        protected void listNhanVienChon_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void listChiTiet_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            string s = e.Parameters.ToString();
            List<UnitInfo> lsEmp = new List<UnitInfo>();
            foreach (string sItem in s.Split(','))
            {
                if (string.IsNullOrEmpty(sItem))
                    continue;
                decimal id = Convert.ToDecimal(sItem);
                unit = objUnit.GetUnit(id);
                lsEmp.Add(unit);
            }

            listChiTiet.DataSource = lsEmp;
            listChiTiet.DataBind();
        }

        protected void grid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Id")
            {
                LinkButton ltChiTiet = gridKhenThuong.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "ltChiTiet") as LinkButton;
                string songuoi = gridKhenThuong.GetRowValues(e.VisibleIndex, "songuoi").ToString();
                string nhom = gridKhenThuong.GetRowValues(e.VisibleIndex, "Nhom").ToString();

                
                ltChiTiet.Text = songuoi + " tập thể";
                ltChiTiet.OnClientClick = " KhenThuong(" + nhom + "); return false; ";
            }
        }
        protected void listChiTiet_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "parentid")
            {
                ASPxLabel lbldonVi = listChiTiet.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblDV") as ASPxLabel;
                {
                    if (e.CellValue != null)
                    {
                        unit = objUnit.GetUnit(Int32.Parse(e.CellValue.ToString()));
                        if (unit != null)
                        {
                            if (lbldonVi != null)
                            {

                                lbldonVi.Text = unit.name;
                            }
                        }
                    }
                }
            }
        }
    }
}


using System;
using System.Collections;
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
using System.Drawing;
using System.Globalization;
using System.Threading;
using System.Configuration;
using System.Text;
using Microsoft.ApplicationBlocks.Data;

namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    public partial class KYHOPDONG: PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;        
        private int IdEmp = 0;
        public string listFilter = null;
        protected void Page_Load(object sender, EventArgs e)
        {            
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                BindComBobox();

                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                    ChonEmployee(IdEmp);
                }
                this.txtRepresent.Text = "Nguyễn Hữu Anh";
                this.txtRepresentAdd.Text = "06 Lê Duẩn - Thành phố Buôn Ma Thuột - Tỉnh Đắk Lắk";
                this.txtRepresentPhone.Text = "0500 - 3811270";
                this.txtRepresentUnit.Text = "Viễn Thông Đắk Lắk";       
                calDateStart.Date = DateTime.Now;                         
            }           
        }
        private void load_quanlynhanuoc(int idchucdanh)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_LuongA]", idchucdanh, 0, 3).Tables[0];
            cmbQLNhaNuoc.DataSource = tb;
            cmbQLNhaNuoc.ValueField = "id";
            cmbQLNhaNuoc.TextField = "ten";
            cmbQLNhaNuoc.DataBind();
            cmbQLNhaNuoc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbQLNhaNuoc.SelectedIndex = 0;
        }
        
        private void LoadNhomLuong(int idchucdanh,int idqlnn)
        {   
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_LuongChinhSach]", idchucdanh, idqlnn, 2).Tables[0];
            cmbNhomLuong.DataSource = tb;
            cmbNhomLuong.ValueField = "id";
            cmbNhomLuong.TextField = "ten";
            cmbNhomLuong.DataBind();
            cmbNhomLuong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbNhomLuong.SelectedIndex = 0;
        }
        private void LoadBacLuong(object idnhomluong)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", idnhomluong, 0, 0).Tables[0];
            cmbBacLuong.DataSource = tb;
            cmbBacLuong.TextField = "bacluong";
            cmbBacLuong.ValueField = "id";
            cmbBacLuong.DataBind();           
        }
        private void BindComBobox()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KyHopDong_Combo]");
            cmbDonViCTac.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmbDonViCTac.TextField = "ten";
            cmbDonViCTac.ValueField = "id";
            cmbDonViCTac.DataBind();
            cmbDonViCTac.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbDonViCTac.SelectedIndex = 0;

            cmbChucDanhCongViec.DataSource = ds.Tables[2];
            cmbChucDanhCongViec.TextField = "ten";
            cmbChucDanhCongViec.ValueField = "id";
            cmbChucDanhCongViec.DataBind();
            cmbChucDanhCongViec.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbChucDanhCongViec.SelectedIndex = 0;

            ddlContractType.DataSource = ds.Tables[4];
            ddlContractType.TextField = "ten";
            ddlContractType.ValueField = "id";
            ddlContractType.DataBind();
            ddlContractType.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            ddlContractType.SelectedIndex = 0;
        }
        protected void cmbNhomLuong_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string s = e.Parameter.ToString();
            string[] st = s.Split(',');
            int qlnn = int.Parse(st[0]);
            int idchucdanh = int.Parse(st[1]);

            LoadNhomLuong(idchucdanh, qlnn);
        }
        protected void cmbQLNhaNuoc_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            int id = Convert.ToInt32(e.Parameter.ToString());
           load_quanlynhanuoc(id);
        }
        protected void cmbBacLuong_CallBack(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            LoadBacLuong(e.Parameter);
        }
        protected void ASPxCallbackPanelHESOLUONG_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", Convert.ToInt32(e.Parameter), 0, 4).Tables[0];
            if (tb.Rows.Count > 0)
            {
                txtHeSoLuongMoi.Text = tb.Rows[0]["heso"].ToString();
            }
        }        
        private void ChonEmployee(int IdEmp)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "HRM_ThongTinNhanVien", IdEmp).Tables[0];
            if (tbl.Rows.Count > 0)
            {
                ListEditItem itemHd = ddlContractType.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdHopDong"].ToString()));
                if (itemHd != null)
                {
                    itemHd.Selected = true;
                }
                ListEditItem item = cmbDonViCTac.Items.FindByValue(Int32.Parse(tbl.Rows[0]["UnitId"].ToString()));
                if (item != null)
                {
                    item.Selected = true;
                }
               
                ListEditItem itemB = cmbChucDanhCongViec.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdChucDanh"].ToString()));
                if (itemB != null)
                {
                    itemB.Selected = true;
                }

                load_quanlynhanuoc(Int32.Parse(tbl.Rows[0]["IdChucDanh"].ToString()));

                ListEditItem item3 = cmbQLNhaNuoc.Items.FindByValue(Int32.Parse(tbl.Rows[0]["IdQLNN"].ToString())); ;
                if (item3 != null)
                {
                    item3.Selected = true;
                }
                LoadNhomLuong(Int32.Parse(tbl.Rows[0]["IdChucDanh"].ToString()), Convert.ToInt32(tbl.Rows[0]["IdQLNN"]));
                var itemNhomLuong = cmbNhomLuong.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["NhomLuong"].ToString().Trim()));
                if (itemNhomLuong != null)
                {
                    itemNhomLuong.Selected = true;
                }
                LoadBacLuong(tbl.Rows[0]["NhomLuong"]);
                var itemBacLuong = cmbBacLuong.Items.FindByText(tbl.Rows[0]["bluong"].ToString().Trim());
                if (itemBacLuong != null)
                {
                    itemBacLuong.Selected = true;
                }
            }          
        }
        protected void CallbackPanel_DieuChuyen_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.Contains("save"))
            {
                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
                {
                    IdEmp = Convert.ToInt32(Request.Params["IdNv"]);
                    KyHopDongMoi(IdEmp);
                }
            }
        }
        //them
        private void KyHopDongMoi(int IdEmp)
        {
            var shd = hdfDataKHD.Get("shd").ToString();
            var dd = hdfDataKHD.Get("dd").ToString();
            var dvdd = hdfDataKHD.Get("dvdd").ToString();
            var dtdd = hdfDataKHD.Get("dtdd").ToString();
            var dcdd = hdfDataKHD.Get("dcdd").ToString();
            var nbd =  (DateTime)hdfDataKHD.Get("nbd");
            var lhd = Convert.ToInt32(hdfDataKHD.Get("lhd"));
            var dvct = Convert.ToInt32(hdfDataKHD.Get("dvct"));
            var cdcv = Convert.ToInt32(hdfDataKHD.Get("cdcv"));
            var qlnn = Convert.ToInt32(hdfDataKHD.Get("qlnn"));
            var nl = Convert.ToInt32(hdfDataKHD.Get("nl"));
            var bl = Convert.ToInt32(hdfDataKHD.Get("bl"));
            var blt = hdfDataKHD.Get("blt").ToString();
            var hslm = hdfDataKHD.Get("hslm").ToString();
            var ltv = hdfDataKHD.Get("ltv").ToString() == "" ? 0 : Convert.ToInt32(hdfDataKHD.Get("ltv"));

            int n1 = SqlHelper.ExecuteNonQuery(strconn, "[HRM_KYHOPDONG_UI]",
                IdEmp, shd, dd, dvdd,
                dtdd, dcdd, nbd, lhd,
                dvct, cdcv, qlnn, nl,
                bl, blt, hslm, ltv, 0);                 
            CallbackPanel_DieuChuyen.JSProperties["cpResult"] = true;         
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

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Configuration;
using System.Drawing.Imaging;

using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Security;
using DotNetNuke.UI.Utilities;
using DotNetNuke.Common;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using VNPT.Modules.Unit;
using Microsoft.ApplicationBlocks.Data;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using System.IO;
using System.Text;


namespace VNPT.Modules.Employees
{   
    partial class EmployeeDocument : PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public string listFilter = null;
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        public decimal IdNV = 0;
        
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                LoadDataCmb();
                this.navTab.Items[0].Selected = true;
            }
          
            listFilter = null;
            listFilter = loadNhanvien();//Employees.DataProvider.BindName(UserInfo.Username);
        }        
        
        private string loadNhanvien()
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DataTable dt = SqlHelper.ExecuteDataset(strconn, "[QLDVIEN_THANHVIEN_LIST]", ma_unit).Tables[0];

            StringBuilder output = new StringBuilder();
            output.Append("[");
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                string text = "{\"label\" :\"" + dt.Rows[i]["manv"].ToString().Trim() + "-" + dt.Rows[i]["hoten"].ToString() + " - " + dt.Rows[i]["tento"].ToString() + "\" ,\"value\": \"" + dt.Rows[i]["manv"].ToString().Trim() + " - " + dt.Rows[i]["hoten"].ToString() + " - " + dt.Rows[i]["tento"].ToString() + "\" ,\"id\": " + dt.Rows[i]["id"].ToString() + "}";
                output.Append("" + text + "");

                if (i != (dt.Rows.Count - 1))
                {
                    output.Append(",");
                }
            }
            output.Append("]");
            return output.ToString();
        }
        private void LoadDataCmb()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTimKiemCmb]");


            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cmb_donvi.ValueField = "Id";
            cmb_donvi.TextField = "ten";
            cmb_donvi.DataBind();
            cmb_donvi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));

            cmb_donvi.SelectedIndex = 0;
            cmb_noicapcmnd.DataSource = ds.Tables[5];
            cmb_noicapcmnd.ValueField = "Id";
            cmb_noicapcmnd.TextField = "ten";
            cmb_noicapcmnd.DataBind();
            cmb_noicapcmnd.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_noicapcmnd.SelectedIndex = 0;

            cmb_dantoc.DataSource = ds.Tables[3];
            cmb_dantoc.ValueField = "Id";
            cmb_dantoc.TextField = "ten";
            cmb_dantoc.DataBind();
            cmb_dantoc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_dantoc.SelectedIndex = 0;

            cmb_tongiao.DataSource = ds.Tables[15];
            cmb_tongiao.ValueField = "Id";
            cmb_tongiao.TextField = "ten";
            cmb_tongiao.DataBind();
            cmb_tongiao.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tongiao.SelectedIndex = 0;

            cmb_noisinhtinh.DataSource = ds.Tables[5];
            cmb_noisinhtinh.ValueField = "Id";
            cmb_noisinhtinh.TextField = "ten";
            cmb_noisinhtinh.DataBind();
            cmb_noisinhtinh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_noisinhtinh.SelectedIndex = 0;

            cmb_quequantinh.DataSource = ds.Tables[5];
            cmb_quequantinh.ValueField = "Id";
            cmb_quequantinh.TextField = "ten";
            cmb_quequantinh.DataBind();
            cmb_quequantinh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_quequantinh.SelectedIndex = 0;

            cmb_nhommau.DataSource = ds.Tables[14];
            cmb_nhommau.ValueField = "Id";
            cmb_nhommau.TextField = "ten";
            cmb_nhommau.DataBind();
            cmb_nhommau.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_nhommau.SelectedIndex = 0;

            cmb_hangthuongbinh.DataSource = ds.Tables[7];
            cmb_hangthuongbinh.ValueField = "Id";
            cmb_hangthuongbinh.TextField = "ten";
            cmb_hangthuongbinh.DataBind();
            cmb_hangthuongbinh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_hangthuongbinh.SelectedIndex = 0;

            cmb_chinhsachxahoi.DataSource = ds.Tables[6];
            cmb_chinhsachxahoi.ValueField = "Id";
            cmb_chinhsachxahoi.TextField = "ten";
            cmb_chinhsachxahoi.DataBind();
            cmb_chinhsachxahoi.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_chinhsachxahoi.SelectedIndex = 0;

            //cmb_loaisuckhoe.DataSource = ds.Tables[16];
            //cmb_loaisuckhoe.ValueField = "Id";
            //cmb_loaisuckhoe.TextField = "ten";
            //cmb_loaisuckhoe.DataBind();
            //cmb_loaisuckhoe.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            //cmb_loaisuckhoe.SelectedIndex = 0;

            cmb_noicappassport.DataSource = ds.Tables[5];
            cmb_noicappassport.ValueField = "Id";
            cmb_noicappassport.TextField = "ten";
            cmb_noicappassport.DataBind();
            cmb_noicappassport.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_noicappassport.SelectedIndex = 0;

            cmb_phothong.DataSource = ds.Tables[11];
            cmb_phothong.ValueField = "Id";
            cmb_phothong.TextField = "ten";
            cmb_phothong.DataBind();
            cmb_phothong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_phothong.SelectedIndex = 0;

            cmb_ngoaingu.DataSource = ds.Tables[13];
            cmb_ngoaingu.ValueField = "Id";
            cmb_ngoaingu.TextField = "ten";
            cmb_ngoaingu.DataBind();
            cmb_ngoaingu.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_ngoaingu.SelectedIndex = 0;

            cmb_tinhoc.DataSource = ds.Tables[12];
            cmb_tinhoc.ValueField = "Id";
            cmb_tinhoc.TextField = "ten";
            cmb_tinhoc.DataBind();
            cmb_tinhoc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tinhoc.SelectedIndex = 0;

            cmb_lyluanchinhtri.DataSource = ds.Tables[8];
            cmb_lyluanchinhtri.ValueField = "Id";
            cmb_lyluanchinhtri.TextField = "ten";
            cmb_lyluanchinhtri.DataBind();
            cmb_lyluanchinhtri.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_lyluanchinhtri.SelectedIndex = 0;

            cmbTPBanThan.DataSource = ds.Tables[17];
            cmbTPBanThan.ValueField = "Id";
            cmbTPBanThan.TextField = "Name";
            cmbTPBanThan.DataBind();
            cmbTPBanThan.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbTPBanThan.SelectedIndex = 0;

            cmbTPGiaDinh.DataSource = ds.Tables[17];
            cmbTPGiaDinh.ValueField = "Id";
            cmbTPGiaDinh.TextField = "Name";
            cmbTPGiaDinh.DataBind();
            cmbTPGiaDinh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmbTPGiaDinh.SelectedIndex = 0;

            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);

            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds_quyen]", ma_unit).Tables[0];//SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy]", ma_unit).Tables[0];
            cmb_tochuc.DataSource = tb;
            cmb_tochuc.TextField = "ten";
            cmb_tochuc.ValueField = "id";
            cmb_tochuc.DataBind();            
            cmb_tochuc.SelectedIndex = 0;
        }        
        protected void uploadFileDinhKemTagDT_Load(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.UploadedFile.FileName !="")
            {
                string filename = string.Format("{0:ddMMyyyyHHmmss}_{1}", DateTime.Now, e.UploadedFile.FileName);
                string filepath = System.IO.Path.Combine(Server.MapPath("~/images/EmpImages"), filename);
                e.UploadedFile.SaveAs(filepath);
                e.CallbackData = filename;
                Session["img"] = filename;
            }
        }
        #region Optional Interfaces
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }
        #endregion

        protected void pnlImage_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (Session["img"] != null)
            {               
                imghinhanh.ImageUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/EmpImages/" + Session["img"].ToString();
            }
        }
        protected void cbp_thongtinchung_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.Contains("null"))
                load_data_null();
            else if (e.Parameter.Contains("load"))
            {
                string[] keys = e.Parameter.Split(';');

                IdNV = Convert.ToDecimal(keys[1]);
                string ma_dv = keys[2];
                load_thongtinchung(IdNV, ma_dv);                
            }
            else if (e.Parameter.Contains("update"))
            {
                IdNV = Convert.ToDecimal(e.Parameter.Replace("update", "").Trim());
                update_thongtinchung(IdNV, 1);
                //insert_suckhoe(IdNV);
                cbp_thongtinchung.JSProperties["cpresult"] = 1;
            }
            else if (e.Parameter.Contains("insert"))
            {                
                IdNV = update_thongtinchung(0, 0);
                if (IdNV != 1 )
                {
                   // insert_suckhoe(IdNV);
                    cbp_thongtinchung.JSProperties["cpresult"] = 0;
                    cbp_thongtinchung.JSProperties["cpidnv"] = IdNV;
                }
                else
                {
                    cbp_thongtinchung.JSProperties["cpresult"] = 2;
                }
            }
        }
        private int update_thongtinchung(decimal idnv, int trangthai)
        {
            object hinhanh = "";
            if(Session["img"] != null){
                hinhanh = Session["img"];
                Session.Remove("img");
            }
            decimal ma_dv = Convert.ToDecimal(cmb_tochuc.Value);
            object n = SqlHelper.ExecuteScalar(strconn, "HRM_UPThongTinCaNhan", idnv, txt_manv.Text, txt_hoten.Text, txt_tenkhac.Text, cmb_gioitinh.Value, txt_cmnd.Text, date_ngaycapcmnd.Value,
                cmb_noicapcmnd.Value, cmb_dantoc.Value, cmb_tongiao.Value, txt_noisinh_Xa.Text + " - " + txt_noisinh_huyen.Text, cmb_noisinhtinh.Value, date_ngaysinh.Value,
                txt_quequan_xa.Text + " - " + txt_quequan_huyen.Text, cmb_quequantinh.Value, txt_thuongtru.Text, txt_choohiennay.Text, cmb_nhommau.Value, cmb_hangthuongbinh.Value, cmb_chinhsachxahoi.Value,
                txt_bhxh.Text, date_ngaydongbhxh.Value, txt_bhyt.Text, txt_noikhambhyt.Text, txt_sopassport.Text, date_ngaycappassport.Value, cmb_noicappassport.Value,
                txt_dienthoai.Text, txt_email.Text, txt_masothue.Text, hinhanh, cmb_tinhoc.Value, cmb_ngoaingu.Value, cmb_phothong.Value, cmb_lyluanchinhtri.Value, cmbTPGiaDinh.Value, cmbTPBanThan.Value, ma_dv, trangthai);
            return Convert.ToInt32(n);
        }
        //private void insert_suckhoe(int idnv)
        //{
        //    if (Convert.ToInt32(cmb_loaisuckhoe.Value) != 0)
        //    {
        //        SqlHelper.ExecuteNonQuery(strconn, "HRM_UPThongTinCaNhan_SucKhoe", idnv, txt_chieucao.Text, txt_cannang.Text, txt_huyetap.Text,
        //                                   date_thoidiemkham.Value, cmb_loaisuckhoe.Value);
        //    }
        //}
        private void load_thongtinchung(decimal idnv, string ma_dv)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "HRM_Get_ThongTinCaNhan", idnv, 0).Tables[0];
            if (tbl.Rows.Count > 0)
            {              
                txt_manv.Text = tbl.Rows[0]["manv"].ToString();
                txt_hoten.Text = tbl.Rows[0]["hoten"].ToString();
                txt_tenkhac.Text = tbl.Rows[0]["tenkhac"].ToString();
                var itemgioitinh = cmb_gioitinh.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["gioitinh"]));
                itemgioitinh.Selected = true;
                txt_cmnd.Text = tbl.Rows[0]["cmnd"].ToString();
                date_ngaycapcmnd.Value = tbl.Rows[0]["ngaycapcmnd"];
                var itemnoicapcmnd = cmb_noicapcmnd.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["noicapcmnd"]));
                itemnoicapcmnd.Selected = true;
                var itemdantoc = cmb_dantoc.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["dantoc"]));
                itemdantoc.Selected = true;
                var itemtongiao = cmb_tongiao.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["tongiao"]));
                itemtongiao.Selected = true;
                txt_noisinh_Xa.Text = tbl.Rows[0]["noisinhxa"].ToString();
                txt_noisinh_huyen.Text = tbl.Rows[0]["noisinhhuyen"].ToString();
                var itemnoisinh = cmb_noisinhtinh.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["noisinhtinh"]));
                itemnoisinh.Selected = true;
                date_ngaysinh.Value = tbl.Rows[0]["ngaysinh"];
                txt_quequan_xa.Text = tbl.Rows[0]["quequanxa"].ToString();
                txt_quequan_huyen.Text = tbl.Rows[0]["quequanhuyen"].ToString();
                var itemquequantinh = cmb_quequantinh.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["quequantinh"]));
                itemquequantinh.Selected = true;
                txt_thuongtru.Text = tbl.Rows[0]["thuongtru"].ToString();
                txt_choohiennay.Text = tbl.Rows[0]["choohiennay"].ToString();
                var itemnhommau = cmb_nhommau.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["nhommau"]));
                itemnhommau.Selected = true;
                var itemhangthuongbinh = cmb_hangthuongbinh.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["hangthuongbinh"]));
                itemhangthuongbinh.Selected = true;
                var itemchinhsachxh = cmb_chinhsachxahoi.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["doituongchinhsach"]));
                itemchinhsachxh.Selected = true;
                //txt_chieucao.Text = tbl.Rows[0]["chieucao"].ToString();
               // txt_cannang.Text = tbl.Rows[0]["cannang"].ToString();
                //txt_huyetap.Text = tbl.Rows[0]["huyetap"].ToString();
                //var itemloaisuckhoe = cmb_loaisuckhoe.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["loaisuckhoe"]));
                //itemloaisuckhoe.Selected = true;
                txt_bhxh.Text = tbl.Rows[0]["sobhxh"].ToString();
                date_ngaydongbhxh.Value = tbl.Rows[0]["ngaydongbhxh"];
                txt_bhyt.Text = tbl.Rows[0]["sobhyt"].ToString();
                txt_noikhambhyt.Text = tbl.Rows[0]["noikhambenh"].ToString();
                //date_thoidiemkham.Value = tbl.Rows[0]["thoidiemkham"];
                txt_sopassport.Text = tbl.Rows[0]["sopassport"].ToString();
                date_ngaycappassport.Value = tbl.Rows[0]["ngaycappassport"];
                var itemnoicappassport = cmb_noicappassport.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["noicappassport"]));
                itemnoicappassport.Selected = true;
                txt_dienthoai.Text = tbl.Rows[0]["dienthoai"].ToString();
                txt_email.Text = tbl.Rows[0]["email"].ToString();
                txt_masothue.Text = tbl.Rows[0]["masothue"].ToString();
                var itemtinhoc = cmb_tinhoc.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["tinhoc"]));
                itemtinhoc.Selected = true;
                var itemngoaingu = cmb_ngoaingu.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["ngoaingu"]));
                itemngoaingu.Selected = true;
                var itemtrinhdophothong = cmb_phothong.Items.FindByValue(tbl.Rows[0]["trinhdophothong"].ToString().Trim());
                itemtrinhdophothong.Selected = true;
                var itemlyluanchinhtri = cmb_lyluanchinhtri.Items.FindByValue(Convert.ToInt32(tbl.Rows[0]["lyluanchinhtri"]));
                itemlyluanchinhtri.Selected = true;

                var itemTPGiaDinh = cmbTPGiaDinh.Items.FindByValue(tbl.Rows[0]["FamilyTypeId"].ToString().Trim());                
                itemTPGiaDinh.Selected = true;
                var itemTPBanThan = cmbTPBanThan.Items.FindByValue(tbl.Rows[0]["FamilyType_CurrentId"].ToString().Trim());
                itemTPBanThan.Selected = true;

                cbp_thongtinchung.JSProperties["cpHinhAnh"] = tbl.Rows[0]["hinhanh"];               
                               
                var item_ToChuc = cmb_tochuc.Items.FindByValue(ma_dv);
                if (item_ToChuc != null)
                    item_ToChuc.Selected = true;
            }
        }
        private void load_data_null()
        {
            txt_manv.Text = null;
            txt_hoten.Text = null;
            txt_tenkhac.Text = null;
            cmb_gioitinh.SelectedIndex = 0;
            txt_cmnd.Text = null;
            date_ngaycapcmnd.Value = null;
            cmb_noicapcmnd.SelectedIndex = 0;
            cmb_dantoc.SelectedIndex = 0;
            cmb_tongiao.SelectedIndex = 0;
            txt_noisinh_Xa.Text = null;
            txt_noisinh_huyen.Text = null;
            cmb_noisinhtinh.SelectedIndex = 0;
            date_ngaysinh.Value = null;
            txt_quequan_xa.Text = null;
            txt_quequan_huyen.Text = null;
            cmb_quequantinh.SelectedIndex = 0;
            txt_thuongtru.Text = null;
            txt_choohiennay.Text = null;
            cmb_nhommau.SelectedIndex = 0;
            cmb_hangthuongbinh.SelectedIndex = 0;
            cmb_chinhsachxahoi.SelectedIndex = 0;
            //txt_chieucao.Text = null;
            //txt_cannang.Text = null;
            //txt_huyetap.Text = null;
            //cmb_loaisuckhoe.SelectedIndex = 0;
            txt_bhxh.Text = null;
            date_ngaydongbhxh.Value = null;
            txt_bhyt.Text = null;
            txt_noikhambhyt.Text = null;            
            txt_sopassport.Text = null;
            date_ngaycappassport.Value = null;
            cmb_noicappassport.SelectedIndex = 0;
            txt_dienthoai.Text = null;
            txt_email.Text = null;
            txt_masothue.Text = null;
            cmb_tinhoc.SelectedIndex = 0;
            cmb_ngoaingu.SelectedIndex = 0;
            cmb_phothong.SelectedIndex = 0;
            cmb_lyluanchinhtri.SelectedIndex = 0;
            cbp_thongtinchung.JSProperties["cpHinhAnh"] = "noimage.jpg";
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using DotNetNuke;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHiddenField;
using DotNetNuke.UI.Utilities;

namespace VNPT.Modules.ThongKe
{
    partial class TKYeuCau : PortalModuleBase, IActionable
    {
        #region Event Handlers
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                LoadDataCmb();

                ClientAPI.RegisterClientScriptBlock(this.Page, "cht",
@"<script type='text/javascript'>
$(function () {
        khoitaocothienthi();
});
</script>");
            }
        }

        public string strconn
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
            }
        }

        private void LoadDataCmb()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTimKiemCmb]");
            decimal ma_unit = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username));
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds_quyen]", ma_unit).Tables[0];

            cmb_donvi.DataSource = tb;
            cmb_donvi.ValueField = "id";
            cmb_donvi.TextField = "ten";
            cmb_donvi.DataBind();
            cmb_donvi.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_donvi.SelectedIndex = 0;

            cmb_chucvu.DataSource = ds.Tables[1];
            cmb_chucvu.ValueField = "Id";
            cmb_chucvu.TextField = "ten";
            cmb_chucvu.DataBind();
            cmb_chucvu.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_chucvu.SelectedIndex = 0;
            cmb_trinhdo.DataSource = ds.Tables[0];
            cmb_trinhdo.ValueField = "Id";
            cmb_trinhdo.TextField = "ten";
            cmb_trinhdo.DataBind();
            cmb_trinhdo.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_trinhdo.SelectedIndex = 0;
            cmb_quequan.DataSource = ds.Tables[5];
            cmb_quequan.ValueField = "Id";
            cmb_quequan.TextField = "ten";
            cmb_quequan.DataBind();
            cmb_quequan.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_quequan.SelectedIndex = 0;
            cmb_dantoc.DataSource = ds.Tables[3];
            cmb_dantoc.ValueField = "Id";
            cmb_dantoc.TextField = "ten";
            cmb_dantoc.DataBind();
            cmb_dantoc.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_dantoc.SelectedIndex = 0;
            cmb_loaihopdong.DataSource = ds.Tables[2];
            cmb_loaihopdong.ValueField = "Id";
            cmb_loaihopdong.TextField = "ten";
            cmb_loaihopdong.DataBind();
            cmb_loaihopdong.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_loaihopdong.SelectedIndex = 0;
            cmb_thuongbinh.DataSource = ds.Tables[7];
            cmb_thuongbinh.ValueField = "Id";
            cmb_thuongbinh.TextField = "ten";
            cmb_thuongbinh.DataBind();
            cmb_thuongbinh.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_thuongbinh.SelectedIndex = 0;
            cmb_csxahoi.DataSource = ds.Tables[6];
            cmb_csxahoi.ValueField = "Id";
            cmb_csxahoi.TextField = "ten";
            cmb_csxahoi.DataBind();
            cmb_csxahoi.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_csxahoi.SelectedIndex = 0;
            cmb_llchinhtri.DataSource = ds.Tables[8];
            cmb_llchinhtri.ValueField = "Id";
            cmb_llchinhtri.TextField = "ten";
            cmb_llchinhtri.DataBind();
            cmb_llchinhtri.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cmb_llchinhtri.SelectedIndex = 0;

            cbbCVDoanThe.DataSource = ds.Tables[20];
            cbbCVDoanThe.ValueField = "id";
            cbbCVDoanThe.TextField = "ten";
            cbbCVDoanThe.DataBind();
            cbbCVDoanThe.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cbbCVDoanThe.SelectedIndex = 0;

            cbbCVDang.DataSource = ds.Tables[21];
            cbbCVDang.ValueField = "id";
            cbbCVDang.TextField = "ten";
            cbbCVDang.DataBind();
            cbbCVDang.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cbbCVDang.SelectedIndex = 0;

            cbbNhomCN.DataSource = ds.Tables[22];
            cbbNhomCN.ValueField = "id";
            cbbNhomCN.TextField = "ten";
            cbbNhomCN.DataBind();
            cbbNhomCN.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cbbNhomCN.SelectedIndex = 0;

            cbbLuongNgachBac.DataSource = ds.Tables[23];
            cbbLuongNgachBac.ValueField = "id";
            cbbLuongNgachBac.TextField = "ten";
            cbbLuongNgachBac.DataBind();
            cbbLuongNgachBac.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cbbLuongNgachBac.SelectedIndex = 0;

            cbbLuongCV.DataSource = ds.Tables[24];
            cbbLuongCV.ValueField = "id";
            cbbLuongCV.TextField = "ten";
            cbbLuongCV.DataBind();
            cbbLuongCV.Items.Insert(0, new ListEditItem("-- Chọn tất --", "0"));
            cbbLuongCV.SelectedIndex = 0;

            grdCotHienThi.DataSource = ds.Tables[9];
            grdCotHienThi.DataBind();

        }

        protected void btExcel_Click(object sender, EventArgs e)
        {
            loadThongKe();
            gridExport.WriteXlsxToResponse();            
        }

        protected void btThongKe_Click(object sender, EventArgs e)
        {
            loadThongKe();
        }

        protected void gridThongKe_PageIndexChanged(object sender, EventArgs e)
        {
            loadThongKe();
        }

        private void loadThongKe()
        {
            decimal iddonvi = Convert.ToDecimal(cmb_donvi.SelectedItem.Value);
            int idchucvu = Convert.ToInt32(cmb_chucvu.SelectedItem.Value);
            int gioitinh = Convert.ToInt32(cmb_gioitinh.SelectedItem.Value);
            int idquequan = Convert.ToInt32(cmb_quequan.SelectedItem.Value);
            int iddantoc = Convert.ToInt32(cmb_dantoc.SelectedItem.Value);
            int idtrinhdo = Convert.ToInt32(cmb_trinhdo.SelectedItem.Value);
            int idLoaiHD = Convert.ToInt32(cmb_loaihopdong.SelectedItem.Value);
            int idthuongbinh = Convert.ToInt32(cmb_thuongbinh.SelectedItem.Value);
            int idchinhsachxh = Convert.ToInt32(cmb_csxahoi.SelectedItem.Value);
            int idlyluanct = Convert.ToInt32(cmb_llchinhtri.SelectedItem.Value);
            int iddang = Convert.ToInt32(cbbCVDang.SelectedItem.Value);
            int iddoanthe = Convert.ToInt32(cbbCVDoanThe.SelectedItem.Value);
            int idncn = Convert.ToInt32(cbbNhomCN.SelectedItem.Value);
            int luongA = Convert.ToInt32(cbbLuongNgachBac.SelectedItem.Value);

            if(iddonvi == 0)
                iddonvi = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username));

            DateTime ngaysinh = txtNamSinh.Text.Trim() == "" ? DateTime.Now : new DateTime(Convert.ToInt32(txtNamSinh.Text), 1, 1);
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "[HRM_GetThongKe_YeuCau]", 
                iddonvi, idchucvu, gioitinh, idquequan, iddantoc, idtrinhdo, idLoaiHD,
                idthuongbinh, idchinhsachxh, idlyluanct, iddang, iddoanthe, idncn, luongA, chkDang.Checked, chkNhapNgu.Checked, chkHoChieu.Checked, ngaysinh).Tables[0];
            gridThongKe.DataSource = tbl;
            gridThongKe.DataBind();

            for (int i = 1; i < gridThongKe.Columns.Count; i++)
            {
                bool bShowField = false;
                for (int j = 0; j < grdCotHienThi.VisibleRowCount; j++)
                {
                    ASPxCheckBox cbox = grdCotHienThi.FindRowCellTemplateControl(j, grdCotHienThi.Columns["ten"] as GridViewDataColumn, "cbox") as ASPxCheckBox;
                    ASPxCheckBox cbox2 = grdCotHienThi.FindRowCellTemplateControl(j, grdCotHienThi.Columns["ten2"] as GridViewDataColumn, "cbox2") as ASPxCheckBox;
                    ASPxTextBox txtTT1 = grdCotHienThi.FindRowCellTemplateControl(j, grdCotHienThi.Columns["tt1"] as GridViewDataColumn, "txtTT1") as ASPxTextBox;
                    ASPxTextBox txtTT2 = grdCotHienThi.FindRowCellTemplateControl(j, grdCotHienThi.Columns["tt2"] as GridViewDataColumn, "txtTT2") as ASPxTextBox;
                    string ten = grdCotHienThi.GetRowValues(j, "ten").ToString().Trim();
                    string ten2 = grdCotHienThi.GetRowValues(j, "ten2").ToString().Trim();
                    int tt1 = 0, tt2 = 0;

                    int.TryParse(txtTT1.Text, out tt1);
                    int.TryParse(txtTT2.Text, out tt2);

                    if (((GridViewDataColumn)gridThongKe.Columns[i]).FieldName == ten && cbox.Checked)
                    {
                        ((GridViewDataColumn)gridThongKe.Columns[i]).VisibleIndex = tt1;
                        bShowField = true;
                        break;
                    }

                    if (!bShowField && ((GridViewDataColumn)gridThongKe.Columns[i]).FieldName == ten2 && cbox2.Checked)
                    {
                        ((GridViewDataColumn)gridThongKe.Columns[i]).VisibleIndex = tt2;
                        bShowField = true;
                        break;
                    }
                }

                if (bShowField)
                    ((GridViewDataColumn)gridThongKe.Columns[i]).Visible = true;
                else
                    ((GridViewDataColumn)gridThongKe.Columns[i]).Visible = false;
            }
        }

        #endregion
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }

        protected void grdCotHienThi_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            var tent = new object[grdCotHienThi.VisibleRowCount];
            var tenp = new object[grdCotHienThi.VisibleRowCount];
            for (int i = 0; i < grdCotHienThi.VisibleRowCount; i++)
            {
                tent[i] = grdCotHienThi.GetRowValues(i, "ten").ToString().Trim();
                tenp[i] = grdCotHienThi.GetRowValues(i, "ten2").ToString().Trim();
            }
            grdCotHienThi.JSProperties["cpTenT"] = tent;
            grdCotHienThi.JSProperties["cpTenP"] = tenp;
        }
    }
}


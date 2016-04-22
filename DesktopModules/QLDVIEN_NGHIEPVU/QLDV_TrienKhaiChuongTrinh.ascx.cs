using System;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using System.IO;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxHiddenField;

namespace VNPT.Modules.QLDVIEN_NGHIEPVU
{
    partial class QLDV_TrienKhaiChuongTrinh : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();                
                LoadComBobox();
            }
        }
        private void LoadComBobox()
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy]", ma_unit).Tables[0];
            cmb_tochuc.DataSource = tb;
            cmb_tochuc.TextField = "TEN_TOCHUC";
            cmb_tochuc.ValueField = "MA_DV";
            cmb_tochuc.DataBind();
            cmb_tochuc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tochuc.SelectedIndex = 0;

            DataTable tb_loaichuongtrinh = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_LOAICHUONGTRINH_DS").Tables[0];
            cmb_loaichuongtrinh.DataSource = tb_loaichuongtrinh;
            cmb_loaichuongtrinh.TextField = "TEN_LOAICHUONGTRINH";
            cmb_loaichuongtrinh.ValueField = "MA_LOAICHUONGTRINH";
            cmb_loaichuongtrinh.DataBind();
            cmb_loaichuongtrinh.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_loaichuongtrinh.SelectedIndex = 0;
        }
        protected void grid_chuongtrinh_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var hdfData = grid_chuongtrinh.FindStatusBarTemplateControl("hdfData") as ASPxHiddenField;            
            decimal ma_dv = Convert.ToDecimal(hdfData.Get("ma_dv"));
            int ma_loaichuongtrinh = Convert.ToInt32(hdfData.Get("ma_loaichuongtrinh"));
            int trien_khai = Convert.ToInt32(hdfData.Get("trien_khai"));


            DataTable tb_chuongtrinh = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_CHUONGTRINH_DS", ma_dv, ma_loaichuongtrinh, trien_khai, 2).Tables[0];
            grid_chuongtrinh.DataSource = tb_chuongtrinh;
            grid_chuongtrinh.DataBind();
        }
        protected void gridTrienKhai_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string dieukien = e.Parameters;
            var hdfTrienKhai = gridTrienKhai.FindStatusBarTemplateControl("hdfTrienKhai") as ASPxHiddenField;
            decimal ma_dv = 0;
            int ma_chuongtrinh = 0;
            if (dieukien == "luu")
            {
                object[] data = (object[])hdfTrienKhai.Get("data");
                object[] rowData = (object[])hdfTrienKhai.Get("rowData");
                for (int i = 0; i < data.Length; i++)
                {
                    Dictionary<string, object> rowValues = (Dictionary<string, object>)data[i];
                    ma_dv = Convert.ToDecimal(rowValues["ma_dv"]);
                    ma_chuongtrinh = Convert.ToInt32(rowValues["ma_ct"]);
                    bool bDelete = false;
                    for (int j = 0; j < rowData.Length; j++)
                    {
                        Dictionary<string, object> rowValues_1 = (Dictionary<string, object>)rowData[j];
                        if (Convert.ToDecimal(rowValues_1["ma_dv"]) == ma_dv && Convert.ToInt32(rowValues_1["ma_ct"]) == ma_chuongtrinh)
                        {
                            bDelete = true;
                            break;
                        }
                    }
                    if (bDelete)
                        SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_CHUONGTRINH_TOCHUC_UI", ma_chuongtrinh, ma_dv, rowValues["ma_danhgia"], rowValues["ket_qua"], 0);
                    else
                        SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_CHUONGTRINH_TOCHUC_UI", ma_chuongtrinh, ma_dv, rowValues["ma_danhgia"], rowValues["ket_qua"], 1);
                }                
                gridTrienKhai.JSProperties["cpTK"] = 0;
            }
            else
            {
                ma_dv = Convert.ToDecimal(hdfTrienKhai.Get("ma_dv"));
                ma_chuongtrinh = Convert.ToInt32(e.Parameters);
                DataTable tb_tochuccon = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_TRIENKHAI_CHUONGTRINH", ma_dv, ma_chuongtrinh, 0).Tables[0];
                gridTrienKhai.DataSource = tb_tochuccon;
                gridTrienKhai.DataBind();
            }                        
        }
        protected void gridTrienKhai_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "MA_DANHGIA")
            {
                ASPxComboBox cmb_danhgia = gridTrienKhai.FindRowCellTemplateControl(e.VisibleIndex, gridTrienKhai.Columns[2] as GridViewDataColumn, "cmb_danhgia") as ASPxComboBox;
                if (cmb_danhgia != null)
                    hienthi_danhgia(cmb_danhgia);
                var item = cmb_danhgia.Items.FindByValue(e.CellValue);
                if (item != null)
                    item.Selected = true;
                else
                    cmb_danhgia.SelectedIndex = 0;
            }
        }
        protected void gridTrienKhai_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            gridTrienKhai.JSProperties["cpVisibleRowCount"] = gridTrienKhai.VisibleRowCount;
            object[] ma_dvs = new object[gridTrienKhai.VisibleRowCount];
            object[] ma_dv_trienkhai = new object[gridTrienKhai.VisibleRowCount];
            object[] ma_danhgia = new object[gridTrienKhai.VisibleRowCount];
            for (int i = 0; i < gridTrienKhai.VisibleRowCount; i++)
            {
                ma_dvs[i] = gridTrienKhai.GetRowValues(i, "MA_DV");
                ma_dv_trienkhai[i] = gridTrienKhai.GetRowValues(i, "MA_TOCHUC");
                ma_danhgia[i] = gridTrienKhai.GetRowValues(i, "MA_DANHGIA");
            }
            gridTrienKhai.JSProperties["cpMADV"] = ma_dvs;
            gridTrienKhai.JSProperties["cpMADVTK"] = ma_dv_trienkhai;
            gridTrienKhai.JSProperties["cpMADG"] = ma_danhgia;
        }
        private void hienthi_danhgia(ASPxComboBox cmb)
        {
            DataTable tb_danhgia = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_DANHGIA_CHUONGTRINH_GET", 0, 0).Tables[0];
            cmb.DataSource = tb_danhgia;
            cmb.DataBind();
            cmb.SelectedIndex = 0;
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
    }
}

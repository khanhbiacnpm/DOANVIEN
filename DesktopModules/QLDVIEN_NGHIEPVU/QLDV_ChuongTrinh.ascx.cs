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
using DevExpress.Web.ASPxTreeList;

namespace VNPT.Modules.QLDVIEN_NGHIEPVU
{
    partial class QLDV_ChuongTrinh : PortalModuleBase, IActionable    
    {        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                date_tungay.Date = DateTime.Now;
                date_tungay.MinDate = DateTime.Now;
                date_denngay.Date = DateTime.Now;
                date_denngay.MinDate = DateTime.Now;
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
            string dieukien = e.Parameters;

            decimal ma_dv = Convert.ToDecimal(hdfData.Get("ma_dv"));
            int ma_loaichuongtrinh = Convert.ToInt32(hdfData.Get("ma_loaichuongtrinh"));
            
            if (dieukien == "luu")
            {
                int ma_chuongtrinh = Convert.ToInt32(hdfData.Get("ma_chuongtrinh"));
                SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_CHUONGTRINH_UI",
                    ma_chuongtrinh, ma_loaichuongtrinh, ma_dv, txt_tenchuongtrinh.Text, txt_mota.Text,
                    date_tungay.Value, date_denngay.Value, txt_sovanban.Text, txt_diem.Text);
                grid_chuongtrinh.JSProperties["cpChuongTrinh"] = 0;
            }
            else if (dieukien == "xoa")
            {
                int ma_chuongtrinh = Convert.ToInt32(hdfData.Get("ma_chuongtrinh"));
                SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_CHUONGTRINH_DS", 0, 0, ma_chuongtrinh, 10);
                grid_chuongtrinh.JSProperties["cpChuongTrinh"] = 0;
            }
                        
            DataTable tb_chuongtrinh = SqlHelper.ExecuteDataset(strconn, "QLDVIEN_CHUONGTRINH_DS", ma_dv, ma_loaichuongtrinh, 0, 0).Tables[0];
            grid_chuongtrinh.DataSource = tb_chuongtrinh;
            grid_chuongtrinh.DataBind();
        }
        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {
            var node = (DataRowView)e.NodeObject;
            e.IsLeaf = !(bool)node["HasChild"];
            e.NodeKeyValue = node["MA_DV"];
            e.SetNodeValue("TEN", node["TEN"]);
        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);

            if (e.NodeObject == null)
            {
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "SP_CAPTHOCHUC_GET", ma_unit, 0, 0).Tables[0];
                e.Children = new DataView(tb_dstt);
            }
            else
            {
                decimal id_cha = Convert.ToDecimal(((DataRowView)e.NodeObject)["MA_DV"]);
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "SP_CAPTHOCHUC_GET", "", id_cha, 1).Tables[0];
                e.Children = new DataView(tb_dstt);
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
    }
}

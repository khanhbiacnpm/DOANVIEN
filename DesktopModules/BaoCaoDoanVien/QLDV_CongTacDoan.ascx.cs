﻿using System;
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
using DevExpress.Web.ASPxGridView;

namespace DotNetNuke.Modules.BaoCaoDoanVien
{
    public partial class QLDV_CongTacDoan : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                LoadComBobox();
                date_tu.Date = Convert.ToDateTime(string.Format("01/01/{0}", DateTime.Now.Year));
                date_den.Date = DateTime.Now;
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
        }
        protected void btexcel_OnClick(object sender, EventArgs e)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "sp_qldv_baocao_congtacdoan", cmb_tochuc.Value, 0, date_tu.Value, date_den.Value, 0).Tables[0];
            gridDoanVien.DataSource = tb;
            gridDoanVien.DataBind();
            GridExporter.GridViewID = gridDoanVien.UniqueID;
            GridExporter.WriteXlsToResponse();
        }
        protected void gridDoanVien_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            object ma_dv = e.Parameters;
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "sp_qldv_baocao_congtacdoan", ma_dv, 0, date_tu.Value, date_den.Value, 0).Tables[0];
            gridDoanVien.DataSource = tb;
            gridDoanVien.DataBind();
        }
        protected void gridDVChiTiet_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string[] keys = e.Parameters.Split(';');
            decimal ma_dv = Convert.ToDecimal(keys[0]);
            int ma_loai = Convert.ToInt32(keys[1]);
            int option = 1;
            if (ma_loai == 0)
                option = 2;
            DataTable tb_chitiet = SqlHelper.ExecuteDataset(strconn, "sp_qldv_baocao_congtacdoan", ma_dv, ma_loai, date_tu.Value, date_den.Value, option).Tables[0];            
            gridDVChiTiet.DataSource = tb_chitiet;
            gridDVChiTiet.DataBind();
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

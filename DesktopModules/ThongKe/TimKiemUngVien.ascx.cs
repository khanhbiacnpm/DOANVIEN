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

namespace VNPT.Modules.ThongKe
{
    partial class TimKiemUngVien : PortalModuleBase, IActionable
    {           
        #region Event Handlers        
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {   
            if(!IsPostBack)
                LoadData();
        }
        private void LoadData()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_Combo]", 0);


            lstLyLuanChinhTri.DataSource = ds.Tables[5];
            lstLyLuanChinhTri.DataBind();

            lstChuyenNganh.DataSource = ds.Tables[3];
            lstChuyenNganh.DataBind();

            listTrinhDo.DataSource = ds.Tables[4];
            listTrinhDo.DataBind();

            listKinhNghiem.DataSource = ds.Tables[6];
            listKinhNghiem.DataBind();

            lstKyNang.DataSource = ds.Tables[7];
            lstKyNang.DataBind();

            listTrinhDoKhac.DataSource = ds.Tables[8];
            listTrinhDoKhac.DataBind();
        }
        protected void btExcel_Click(object sender, EventArgs e)
        {
            decimal ma_unit = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username));
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "[HRM_TimUngVien]", hdKey.Get("data").ToString(), ma_unit).Tables[0];
            gridThongKe.DataSource = tbl;
            gridThongKe.DataBind();
            gridExport.WriteXlsxToResponse();            
        }
        protected void gridThongKe_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {           
                loadThongKe(e.Parameters.ToString());
        }
        protected void gridThongKe_PageIndexChanged(object sender, EventArgs e)
        {            
          
        }
        private void loadThongKe(string data)
        {
            decimal ma_unit = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username));
            DataTable tbl = SqlHelper.ExecuteDataset(strconn, "[HRM_TimUngVien]", data, ma_unit).Tables[0];
            gridThongKe.DataSource = tbl;
            gridThongKe.DataBind();                       
        }
        private void LoadDataChiTiet(int empid)
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_UngVien_KyNang]", empid);

            lstKyNangCT.DataSource = ds.Tables[0];
            lstKyNangCT.DataBind();
        }
        private void LoadTrinhDo(int empid)
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_UngVien_KyNang]", empid);

            lstTrinhDoKhacCT.DataSource = ds.Tables[1];
            lstTrinhDoKhacCT.DataBind();
        }
        protected void pnlChiTiet_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            int id = Convert.ToInt32(e.Parameter);
            LoadDataChiTiet(id);
        }
        protected void pnlTrinhDoKhac_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            int id = Convert.ToInt32(e.Parameter);
            LoadTrinhDo(id);
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
    }
}


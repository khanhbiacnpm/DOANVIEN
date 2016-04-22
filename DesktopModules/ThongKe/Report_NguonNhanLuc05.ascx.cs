using System;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
using System.IO;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DotNetNuke.UI.Utilities;
using HRM_REPORT;
using DevExpress.Web.ASPxEditors;

namespace VNPT.Modules.ThongKe
{
    partial class Report_NguonNhanLuc05 : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idkh = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                load_donvi();               
            }
            decimal donvi = Convert.ToDecimal(cmb_donvi.Value);
            load_data(donvi);
        }
        private void load_data(decimal donvi)
        {
            string tieude = string.Format("Đơn vị: {0}", cmb_donvi.Text);
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_NHANLUC_05]", donvi);
            XtraReport_BoiDuongNguonNhanLuc report = new XtraReport_BoiDuongNguonNhanLuc();
            report.load_data(ds.Tables[0],tieude);            
            ReportViewer1.Report = report;
        }
        private void load_donvi()
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            cmb_donvi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds_quyen]", ma_unit).Tables[0];
            cmb_donvi.TextField = "ten";
            cmb_donvi.ValueField = "id";
            cmb_donvi.DataBind();
            cmb_donvi.SelectedIndex = 0;
        }        
        protected void cbp_report_CallbackPanel(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            decimal donvi = Convert.ToDecimal(cmb_donvi.Value);
            load_data(donvi);
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

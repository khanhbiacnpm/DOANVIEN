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
using BaoCao;
using DevExpress.Web.ASPxEditors;

namespace VNPT.Modules.ThongKe
{
    partial class Report_TrinhDo : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        private int idkh = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_donvi();               
            }
            load_data(cmb_donvi.Value);
        }
        private void load_data(object donvi)
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_TRINHDO]", donvi, 0);
            XtraReport_TrinhDo report = new XtraReport_TrinhDo();
            report.load_data(ds.Tables[0], ds.Tables[1]);            
            ReportViewer1.Report = report;
        }
        private void load_donvi()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_TRINHDO]", 0, 1);
            cmb_donvi.DataSource = ds.Tables[0];
            cmb_donvi.TextField = "ten";
            cmb_donvi.ValueField = "id";
            cmb_donvi.DataBind();
            cmb_donvi.SelectedIndex = 0;
        }
        protected void cbp_report_CallbackPanel(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_data(cmb_donvi.Value);
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

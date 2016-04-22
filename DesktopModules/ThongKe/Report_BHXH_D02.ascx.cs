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
    partial class Report_BHXH_D02 : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                date_thoidiem.Date = DateTime.Now;                
            }
            load_data();
        }
        private void load_data()
        {            
            string tieude = string.Format("Thống kê thời điểm: Tháng {0:MM} năm {0:yyyy}", date_thoidiem.Date);
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_BAOHIEM_D02]", date_thoidiem.Date);
            XtraReport_BHXH_D02 report = new XtraReport_BHXH_D02();
            report.load_report(ds.Tables[0], tieude);            
            ReportViewer1.Report = report;
        }
        protected void cbp_report_CallbackPanel(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_data();
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

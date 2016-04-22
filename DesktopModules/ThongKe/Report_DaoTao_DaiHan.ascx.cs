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
using System.Text;

namespace VNPT.Modules.ThongKe
{
    partial class Report_DaoTao_DaiHan : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_combo();
            }
            load_data();
        }
        private void load_combo()
        {            
            int nam = 0;
            while (nam <= 5)
            {
                cmb_nam.Items.Add("Năm " + (DateTime.Now.Year + nam), DateTime.Now.Year+nam);
                nam++;
            }
            var itemn = cmb_nam.Items.FindByValue(DateTime.Now.Year);
            if (itemn != null)
                itemn.Selected = true;
        }

        private void load_data()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "HRM_GET_THONGKE_DAOTAO_DAIHAN_04", cmb_nam.Value);
            XtraReport_BoiDuongDaiHan_04 report = new XtraReport_BoiDuongDaiHan_04();
            report.load_data(ds.Tables[0], cmb_nam.Value.ToString());             
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

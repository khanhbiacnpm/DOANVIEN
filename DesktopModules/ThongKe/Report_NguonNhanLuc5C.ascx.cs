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
    partial class Report_NguonNhanLuc : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idkh = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_combo();             
            }
            load_data();
        }
        private void load_data()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_NHANLUC_5C2]", cmb_nam.Value);
            XtraReport_BoiDuongNguonNhanLuc_5C report = new XtraReport_BoiDuongNguonNhanLuc_5C();
            report.load_data(ds.Tables[0], ds.Tables[1], string.Format("Năm {0}", cmb_nam.Value));
            ReportViewer1.Report = report;
        }
        private void load_combo()
        {
            int nam = 2010;
            while (nam <= DateTime.Now.Year)
            {
                cmb_nam.Items.Add("Năm " + nam, nam);
                nam++;
            }
            var itemn = cmb_nam.Items.FindByValue(DateTime.Now.Year.ToString());
            if (itemn != null)
                itemn.Selected = true;
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

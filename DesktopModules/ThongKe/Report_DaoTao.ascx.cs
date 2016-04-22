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
using System.Text;

namespace VNPT.Modules.ThongKe
{
    partial class Report_DaoTao : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        public string listFilter = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            load_data(idNV);
        }
       
        private void load_data(object idnhanvien)
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_DAOTAO_CANHAN]", idnhanvien);
            XtraReport_DaoTao report = new XtraReport_DaoTao();
            report.load_report(ds.Tables[0], ds.Tables[1]);
            ReportViewer1.Report = report;
        }
        protected void cbp_report_CallbackPanel(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_data(e.Parameter);
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

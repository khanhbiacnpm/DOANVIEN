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
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;
using WebApplication1;

namespace VNPT.Modules.Unit
{
    partial class ToTrucThuoc : PortalModuleBase, IActionable
    {
        private string strConn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        private string IdDonVi = string.Empty;
        XtraReport_TrucThuocDonVi report = new XtraReport_TrucThuocDonVi();
        protected void Page_Load(object sender, EventArgs e)
        {
            IdDonVi = string.IsNullOrEmpty(Request.Params["IdDonVi"].ToString()) ? "" : Request.Params["IdDonVi"].ToString();
            DonViTrucThuoc(IdDonVi);
        }       
        private void DonViTrucThuoc(string IdDonVi)
        {
            DataTable tbl = SqlHelper.ExecuteDataset(strConn, "HRM_ThongTinThuocDonVi", IdDonVi).Tables[0];
            report.loadReport(tbl);
            ReportViewer1.Report = report;
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

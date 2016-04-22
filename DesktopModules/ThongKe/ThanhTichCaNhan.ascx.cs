using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DotNetNuke.Entities.Modules;
using DotNetNuke.UI.Utilities;
using DotNetNuke.Entities.Users;
using System.Globalization;
using System.IO;
using System.Data;
using DotNetNuke.Framework.Providers;
using VNPT.Modules.Employees;
using VNPT.Modules.Unit;

using System.Text;
using System.Data.SqlClient;
using DevExpress.Web.ASPxEditors;
using Microsoft.ApplicationBlocks.Data;
using HRM_REPORT;
using DevExpress.XtraReports.Web;
using DevExpress.XtraReports.UI;
using System.Configuration;

namespace VNPT.Modules.ThongKe
{
    public partial class ThanhTichCaNhan : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                for (int i = 2008; i <= DateTime.Now.Year; i++)
                {
                    cbbTuNam.Items.Add("Năm " + i, i);
                    cbbDenNam.Items.Add("Năm " + i, i);
                }
                cbbTuNam.Value = DateTime.Now.Year;
                cbbDenNam.Value = DateTime.Now.Year;
                load_donvi();
            }
            if (Session["rptTTCN"] != null)
            {
                ReportViewer1.Report = Session["rptTTCN"] as XtraReport;
            }
        }
        private void load_donvi()
        {
            cbbDonVi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
            cbbDonVi.TextField = "ten";
            cbbDonVi.ValueField = "id";
            cbbDonVi.DataBind();
            cbbDonVi.SelectedIndex = 0;
        }
        string ConnectionString
        {
            get
            {
                return System.Configuration.ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
            }
        }

        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                DotNetNuke.Entities.Modules.Actions.ModuleActionCollection Actions = new DotNetNuke.Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                DotNetNuke.Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }

        protected void ReportViewer1_Unload(object sender, EventArgs e)
        {
            ((ReportViewer)sender).Report = null;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int tunam = Convert.ToInt32(cbbTuNam.SelectedItem.Value);
            int dennam = Convert.ToInt32(cbbDenNam.SelectedItem.Value);
            decimal donvi = Convert.ToDecimal(cbbDonVi.SelectedItem.Value);
            string tendonvi = string.Empty;
            if (donvi != 0)
                tendonvi = cbbDonVi.SelectedItem.Text;
            DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_baocao_khenthuong_canhan", donvi, tunam, dennam);
            rptThanhTichCaNhan rpt = new rptThanhTichCaNhan();
            rpt.InitData(ds.Tables[0], tendonvi, tunam, dennam);
            ReportViewer1.Report = rpt;
            Session["rptTTCN"] = rpt;
        }
    }
}

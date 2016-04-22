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

namespace VNPT.Modules.ThongKe
{
    public partial class BieuMau01 : PortalModuleBase, IActionable
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                for (int i = 2008; i <= DateTime.Now.Year; i++)
                    cbbNam.Items.Add("Năm " + i, i);
                for (int i = 1; i <= 4; i++)
                    cbbQuy.Items.Add("Quý " + i, i);
                cbbNam.Items.Insert(0, new ListEditItem("---Chọn năm---", 0));
                cbbQuy.Items.Insert(0, new ListEditItem("---Chọn quý---", 0));
                cbbNam.Value = DateTime.Now.Year;
                cbbQuy.Value = (DateTime.Now.Month - 1) / 3 + 1;

                ClientAPI.RegisterClientScriptBlock(this.Page, "setscroll", @"
                <script type='text/javascript'>
                    $(function () {
                        var w = $(window).width();
                        var h = $(window).height() - $('#print_page').offset().top;
                        $('#print_page').width(w);
                        $('#print_page').height(h);
                    });
                </script>
                ");
            }
            if (Session["rptBM01"] != null)
            {
                ReportViewer1.Report = Session["rptBM01"] as XtraReport;
            }
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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int nam = (int)cbbNam.SelectedItem.Value;
            int quy = (int)cbbQuy.SelectedItem.Value;

            DateTime start = new DateTime(nam, (quy - 1) * 3 + 1, 1);
            DateTime end = start.AddMonths(3).AddDays(-1);
            object ma_unit = SqlHelper.ExecuteScalar(ConnectionString, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DataSet ds = SqlHelper.ExecuteDataset(ConnectionString, "sp_baocao_bieumau01", start, end, ma_unit);            
            rptBieuMau01 rpt = new rptBieuMau01();             
            rpt.LoadData(ds, start, end);
            ReportViewer1.Report = rpt;
            Session["rptBM01"] = rpt;

            ClientAPI.RegisterClientScriptBlock(this.Page, "setscroll", @"
<script type='text/javascript'>
    $(function () {
        var w = $(window).width();
        var h = $(window).height() - $('#print_page').offset().top;
        $('#print_page').width(w);
        $('#print_page').height(h);
    });
</script>
");
        }

        protected void ReportViewer1_Unload(object sender, EventArgs e)
        {
            ((ReportViewer)sender).Report = null;
        }
}
}

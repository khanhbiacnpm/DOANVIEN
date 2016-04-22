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
    partial class Report_AnToanVeSinhLaoDong : PortalModuleBase, IActionable    
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
            int thang = 0;
            string tieude = "";
            if (lcheck.Checked)
            {
                thang = 6;
                tieude = string.Format("6 tháng đầu năm/Năm {0}", cmb_nam.Value);
            }
            else if (rcheck.Checked)
            {
                thang = 12;
                tieude = string.Format("6 tháng cuối năm/Năm {0}", cmb_nam.Value);
            }
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_THONGKE_ANTOANVESINHLAODONG]", thang, cmb_nam.Value);
            gridATVSLD.DataSource = ds.Tables[0];
            gridATVSLD.DataBind();
        }
        private void load_combo()
        {
            int nam = 2010;
            while (nam <= DateTime.Now.Year)
            {
                cmb_nam.Items.Add("Năm " + nam, nam);
                nam++;
            }
            var itemn = cmb_nam.Items.FindByValue(DateTime.Now.Year);
            if (itemn != null)
                itemn.Selected = true;
        }
        protected void gridATVSLD_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
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

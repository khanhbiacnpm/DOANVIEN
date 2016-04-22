using System;
using System.Web;
using System.Linq;
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
using DevExpress.Web.ASPxEditors;
using System.Threading;
using System.Globalization;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;


namespace VNPT.Modules.ThongTinNhanVien
{
    partial class NhapNgu : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!IsPostBack)
            {
                load_data();
            }
        }
        protected void cbp_nhapngu_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (idNV != 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Them_DoanThe]", idNV, txt_quanhamcaonhat.Text, date_ngayxuatngu.Value, date_ngaynhapngu.Value,
                    date_ngayketnapdoan.Value, txt_noiketnapdoan.Text, date_ngayketnapdang.Value, txt_noiketnapdang.Text, date_ngaychinhthuc.Value,
                    txt_sothedang.Text, date_ngaycapthe.Value, txt_nguoigioithieu.Text, txt_chiboketnap.Text, txt_dangboketnap.Text,txtNoiXuatNgu.Text);                
                cbp_nhapngu.JSProperties["cpresult"] = n;
            }
        }        
        private void load_data()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetDoanThe_IdNV]", idNV).Tables[0];
                txt_quanhamcaonhat.Text = tb.Rows[0]["quanhamcaonhat"].ToString();
                date_ngaynhapngu.Value = tb.Rows[0]["ngaynhapngu"];
                date_ngayxuatngu.Value = tb.Rows[0]["ngayxuatngu"];
                date_ngayketnapdoan.Value = tb.Rows[0]["ngayketnapdoan"];
                txt_noiketnapdoan.Text = tb.Rows[0]["noiketnapdoan"].ToString();
                date_ngayketnapdang.Value = tb.Rows[0]["ngayketnapdang"];
                txt_noiketnapdang.Text = tb.Rows[0]["noiketnapdang"].ToString();
                date_ngaychinhthuc.Value = tb.Rows[0]["ngaychinhthucdang"];
                txt_sothedang.Text = tb.Rows[0]["sothedang"].ToString();
                date_ngaycapthe.Value = tb.Rows[0]["ngaycapthedang"];
                txt_nguoigioithieu.Text = tb.Rows[0]["nguoigioithieudang"].ToString();
                txt_chiboketnap.Text = tb.Rows[0]["chiboketnap"].ToString();
                txt_dangboketnap.Text = tb.Rows[0]["dangboketnap"].ToString();
                txtNoiXuatNgu.Text = tb.Rows[0]["donvixuatngu"].ToString();
            }
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

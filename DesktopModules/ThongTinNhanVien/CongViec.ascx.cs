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
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxEditors;
using System.Globalization;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class CongViec : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        public int idloaihopdong = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!IsPostBack)
            {                                
                load_data(idNV);
            }
        }
        protected void cbp_congviec_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_ThemCongViec1]", idNV, txt_nghekhiduoctuyendung.Text, date_ngaytuyendung.Value, txt_coquantuyendung.Text);
                cbp_congviec.JSProperties["cpresult"] = n;
            }
        }            
        private void load_data(int idnv)
        {
            if (idnv > 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetCongViec_IdNV]", idnv).Tables[0];
                if (tb.Rows.Count > 0)
                {
                    txt_nghekhiduoctuyendung.Text = tb.Rows[0]["nghetuyendung"].ToString();
                    txt_coquantuyendung.Text = tb.Rows[0]["donvituyendung"].ToString();
                    date_ngaytuyendung.Value = tb.Rows[0]["ngayhopdong"];
                    lbl_hopdong.Text = tb.Rows[0]["tenhopdong"].ToString();
                    lbl_donvi.Text = tb.Rows[0]["tendonvi"].ToString();
                    lbl_chucvu.Text = tb.Rows[0]["tenchucvu"].ToString();
                    lbl_chucdanh.Text = tb.Rows[0]["tenchucdanh"].ToString();
                    lbl_quanlynhanuoc.Text = tb.Rows[0]["tenquanlynhanuoc"].ToString();
                    lbl_nhomluong.Text = tb.Rows[0]["tennhomluong"].ToString();
                    lbl_bacluong.Text = tb.Rows[0]["bacluong"].ToString();
                    lbl_heso.Text = tb.Rows[0]["heso"].ToString();
                    if (Convert.ToInt32(tb.Rows[0]["loaihopdong"]) == 4)
                    {
                        hopdong.Visible = false;
                        hopdongthuviec.Visible = true;
                        lbl_luongcb.Text = string.Format("{0:#,##}", Convert.ToInt32(tb.Rows[0]["luongcb"]));
                    }
                    else
                    {
                        hopdongthuviec.Visible = false;
                        hopdong.Visible = true;
                    }
                }
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

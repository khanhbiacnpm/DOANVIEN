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
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxEditors;


namespace VNPT.Modules.ThongTinNhanVien
{
    partial class ThongTinChung : PortalModuleBase, IActionable
    {                
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        int idnv = 0;
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {
                if (Request.Params["IdNV"] != null)
                    idnv = Convert.ToInt32(Request.Params["IdNV"]);
                //LoadDataCmb();
                //LoadData();
            }
        }
        private void LoadDataCmb()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GetTimKiemCmb]");

            cmb_noicap.DataSource = ds.Tables[5];
            cmb_noicap.ValueField = "Id";
            cmb_noicap.TextField = "ten";
            cmb_noicap.DataBind();
            cmb_noicap.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_noicap.SelectedIndex = 0;

            cmb_dantoc.DataSource = ds.Tables[3];
            cmb_dantoc.ValueField = "Id";
            cmb_dantoc.TextField = "ten";
            cmb_dantoc.DataBind();
            cmb_dantoc.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_dantoc.SelectedIndex = 0;

            cmb_tongiao.DataSource = ds.Tables[15];
            cmb_tongiao.ValueField = "Id";
            cmb_tongiao.TextField = "ten";
            cmb_tongiao.DataBind();
            cmb_tongiao.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_tongiao.SelectedIndex = 0;

            cmb_noisinh.DataSource = ds.Tables[5];
            cmb_noisinh.ValueField = "Id";
            cmb_noisinh.TextField = "ten";
            cmb_noisinh.DataBind();
            cmb_noisinh.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_noisinh.SelectedIndex = 0;

            cmb_quequan.DataSource = ds.Tables[5];
            cmb_quequan.ValueField = "Id";
            cmb_quequan.TextField = "ten";
            cmb_quequan.DataBind();
            cmb_quequan.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_quequan.SelectedIndex = 0;

            cmb_nhommau.DataSource = ds.Tables[14];
            cmb_nhommau.ValueField = "Id";
            cmb_nhommau.TextField = "ten";
            cmb_nhommau.DataBind();
            cmb_nhommau.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_nhommau.SelectedIndex = 0;

            cmb_hangthuongbinh.DataSource = ds.Tables[7];
            cmb_hangthuongbinh.ValueField = "Id";
            cmb_hangthuongbinh.TextField = "ten";
            cmb_hangthuongbinh.DataBind();
            cmb_hangthuongbinh.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_hangthuongbinh.SelectedIndex = 0;

            cmb_chinhsachxahoi.DataSource = ds.Tables[6];
            cmb_chinhsachxahoi.ValueField = "Id";
            cmb_chinhsachxahoi.TextField = "ten";
            cmb_chinhsachxahoi.DataBind();
            cmb_chinhsachxahoi.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_chinhsachxahoi.SelectedIndex = 0;

            cmb_loaisuckhoe.DataSource = ds.Tables[16];
            cmb_loaisuckhoe.ValueField = "Id";
            cmb_loaisuckhoe.TextField = "ten";
            cmb_loaisuckhoe.DataBind();
            cmb_loaisuckhoe.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_loaisuckhoe.SelectedIndex = 0;

            cmb_noicappassport.DataSource = ds.Tables[5];
            cmb_noicappassport.ValueField = "Id";
            cmb_noicappassport.TextField = "ten";
            cmb_noicappassport.DataBind();
            cmb_noicappassport.Items.Insert(0, new ListEditItem("-- Tất cả --", "0"));
            cmb_noicappassport.SelectedIndex = 0;
           
        }
        private void LoadData()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_Get_ThongTinCaNhan", idnv).Tables[0];
            txt_manv.Text = tb.Rows[0]["manv"].ToString();
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

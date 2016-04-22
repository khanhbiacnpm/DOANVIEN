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
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using System.IO;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace VNPT.Modules.DaoTao
{
    partial class KeHoachDaoTaoDaiHan : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                load_comb_nam();
                load_data_grid(cmb_nam.Value);
            }
        }
        protected void cmb_nam_OnCallback(object sender, EventArgs e)
        {
            load_comb_nam();
        }
        protected void gridKhoaDaoTaoKeHoach_OnCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            load_data_grid(e.Parameters);
        }
        private void load_comb_nam()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAOKEHOACHDAIHAN]", 0, 2);
            DataTable tb = ds.Tables[0];
            cmb_nam.Items.Clear();
            if (tb.Rows.Count == 0)
            {
                cmb_nam.Items.Add("Năm " + DateTime.Now.Year, DateTime.Now.Year);
            }
            foreach (DataRow row in tb.Rows)
            {
                cmb_nam.Items.Add("Năm " + row[0], row[0]);
            }
            cmb_nam.SelectedIndex = 0;
        }
        protected void gridKhoaDaoTaoKeHoach_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmb_trinhdo = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_trinhdo") as ASPxComboBox;
            ASPxTextBox txt_tenkhoadaotao = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_tenkhoadaotao") as ASPxTextBox;
            ASPxTextBox txt_cosodaotao = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_cosodaotao") as ASPxTextBox;            
            ASPxTextBox txt_soluonghocvien = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_soluonghocvien") as ASPxTextBox;
            ASPxTextBox txt_dongia = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_dongia") as ASPxTextBox;
            ASPxComboBox cmb_namkehoach = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_namkehoach") as ASPxComboBox;
            //ASPxDateEdit date_tungay = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("date_tungay") as ASPxDateEdit;
            //ASPxDateEdit date_denngay = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxMemo memo_ghichu = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;

            double dongia = txt_dongia.Text == string.Empty ? 0 : Convert.ToDouble(txt_dongia.Text);
            DateTime tungay = new DateTime(Convert.ToInt32(cmb_namkehoach.Value), 1, 1);

            SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAODAIHAN_UI]", 0, cmb_trinhdo.Value,txt_tenkhoadaotao.Text ,txt_cosodaotao.Text,
                txt_soluonghocvien.Text, dongia, tungay, null, memo_ghichu.Text, 0);
                        
            gridKhoaDaoTaoKeHoach.CancelEdit();
            e.Cancel = true;
            load_data_grid(cmb_nam.Value);
        }
        protected void gridKhoaDaoTaoKeHoach_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cmb_trinhdo = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_trinhdo") as ASPxComboBox;
            ASPxTextBox txt_tenkhoadaotao = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_tenkhoadaotao") as ASPxTextBox;
            ASPxTextBox txt_cosodaotao = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_cosodaotao") as ASPxTextBox;
            ASPxTextBox txt_soluonghocvien = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_soluonghocvien") as ASPxTextBox;
            ASPxTextBox txt_dongia = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("txt_dongia") as ASPxTextBox;
            ASPxComboBox cmb_namkehoach = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_namkehoach") as ASPxComboBox;
            //ASPxDateEdit date_tungay = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("date_tungay") as ASPxDateEdit;
            //ASPxDateEdit date_denngay = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxMemo memo_ghichu = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;

            double dongia = txt_dongia.Text == string.Empty ? 0 : Convert.ToDouble(txt_dongia.Text);
            DateTime tungay = new DateTime(Convert.ToInt32(cmb_namkehoach.Value), 1, 1);

            SqlHelper.ExecuteNonQuery(strconn, "[HRM_KHOADAOTAODAIHAN_UI]", e.Keys["id"], cmb_trinhdo.Value,txt_tenkhoadaotao.Text, txt_cosodaotao.Text,
                txt_soluonghocvien.Text, txt_dongia.Text, tungay, null, memo_ghichu.Text, 1);
            
            gridKhoaDaoTaoKeHoach.CancelEdit();
            e.Cancel = true;
            load_data_grid(cmb_nam.Value);
        }
        protected void gridKhoaDaoTaoKeHoach_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "[HRM_GET_KHOADAOTAOKEHOACHDAIHAN]", e.Keys["id"], 10);            
            gridKhoaDaoTaoKeHoach.CancelEdit();
            e.Cancel = true;
            load_data_grid(cmb_nam.Value);
        }
        private void load_data_grid(object nam)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_GET_KHOADAOTAOKEHOACHDAIHAN", nam, 0).Tables[0];
            gridKhoaDaoTaoKeHoach.DataSource = tb;
            gridKhoaDaoTaoKeHoach.DataBind();
        }
        protected void gridKhoaDaoTaoKeHoach_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_data_combo();
        }
        private void load_data_combo()
        {
            ASPxComboBox cmb_trinhdo = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_trinhdo") as ASPxComboBox;
            ASPxComboBox cmb_namkehoach = gridKhoaDaoTaoKeHoach.FindEditFormTemplateControl("cmb_namkehoach") as ASPxComboBox;
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "HRM_GET_KHOADAOTAOKEHOACHDAIHAN", 0, 1);

            cmb_trinhdo.DataSource = ds.Tables[0];
            cmb_trinhdo.ValueField = "id";
            cmb_trinhdo.TextField = "ten";
            cmb_trinhdo.DataBind();
            int i = 0;
            while (i <= 3)
            {
                cmb_namkehoach.Items.Add("Năm " + (DateTime.Now.Year + i), (DateTime.Now.Year + i));
                i++;
            }

            if (!gridKhoaDaoTaoKeHoach.IsNewRowEditing)
            {
                var itemcndt = cmb_trinhdo.Items.FindByValue(gridKhoaDaoTaoKeHoach.GetRowValues(gridKhoaDaoTaoKeHoach.FocusedRowIndex, "idtrinhdo"));
                if (itemcndt != null)
                    itemcndt.Selected = true;
            }
            var valnkh = gridKhoaDaoTaoKeHoach.GetRowValues(gridKhoaDaoTaoKeHoach.FocusedRowIndex, "tungay");
            var itemnkh = cmb_namkehoach.Items.FindByValue(Convert.ToDateTime(valnkh).Year);
            if (itemnkh != null)
                itemnkh.Selected = true;  
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

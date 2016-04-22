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
    partial class DaoTaoATVSLD : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                load_data_grid();
            }
        }     
        protected void gridKhoaDaoTao_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txt_madaotao = gridKhoaDaoTao.FindEditFormTemplateControl("txt_madaotao") as ASPxTextBox;
            ASPxDateEdit date_tungay = gridKhoaDaoTao.FindEditFormTemplateControl("date_tungay") as ASPxDateEdit;
            ASPxDateEdit date_denngay = gridKhoaDaoTao.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxMemo memo_noidung = gridKhoaDaoTao.FindEditFormTemplateControl("memo_noidung") as ASPxMemo;
            ASPxMemo memo_ghichu = gridKhoaDaoTao.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;
            ASPxListBox lbChoosen = gridKhoaDaoTao.FindEditFormTemplateControl("lbChoosen") as ASPxListBox;
            
            string filename = string.Empty;
            if(Session["file"] !=null)
            {
                filename = Session["file"].ToString();
                Session.Remove("file");
            }

            object idkhoadaotao = SqlHelper.ExecuteScalar(strconn, "[HRM_ANTOANVESINHLAODONG_UI]", 0, txt_madaotao.Text, date_tungay.Value, date_denngay.Value,
                memo_noidung.Text, filename, memo_ghichu.Text, 0);
            
            foreach (ListEditItem item in lbChoosen.SelectedItems)
            {
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_ANTOANVESINHLAODONG_KETQUA_UI]", 0, idkhoadaotao, item.Value, null, 0, null, 0);
            }
            gridKhoaDaoTao.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }
        protected void gridKhoaDaoTao_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txt_madaotao = gridKhoaDaoTao.FindEditFormTemplateControl("txt_madaotao") as ASPxTextBox;
            ASPxDateEdit date_tungay = gridKhoaDaoTao.FindEditFormTemplateControl("date_tungay") as ASPxDateEdit;
            ASPxDateEdit date_denngay = gridKhoaDaoTao.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxMemo memo_noidung = gridKhoaDaoTao.FindEditFormTemplateControl("memo_noidung") as ASPxMemo;
            ASPxMemo memo_ghichu = gridKhoaDaoTao.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;
            ASPxListBox lbChoosen = gridKhoaDaoTao.FindEditFormTemplateControl("lbChoosen") as ASPxListBox;

            string filename = string.Empty;
            if (Session["file"] != null)
            {
                filename = Session["file"].ToString();
                Session.Remove("file");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridKhoaDaoTao.GetRowValues(gridKhoaDaoTao.FocusedRowIndex, "quyetdinh"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }

            object idkhoadaotao = SqlHelper.ExecuteNonQuery(strconn, "[HRM_ANTOANVESINHLAODONG_UI]", e.Keys["id"], txt_madaotao.Text, date_tungay.Value, date_denngay.Value,
                memo_noidung.Text, filename, memo_ghichu.Text, 1);

            foreach (ListEditItem item in lbChoosen.SelectedItems)
            {
                SqlHelper.ExecuteNonQuery(strconn, "[HRM_ANTOANVESINHLAODONG_KETQUA_UI]", 0, e.Keys["id"], item.Value, null, 0, null, 0);
            }
            
            gridKhoaDaoTao.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }
        protected void gridKhoaDaoTao_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            SqlHelper.ExecuteNonQuery(strconn, "[HRM_GET_ANTOANVESINHLAODONG]", e.Keys["id"], 10);
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridKhoaDaoTao.GetRowValues(gridKhoaDaoTao.FocusedRowIndex, "quyetdinh"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            gridKhoaDaoTao.CancelEdit();
            e.Cancel = true;
            load_data_grid();
        }
        private void load_data_grid()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_ANTOANVESINHLAODONG]", 0, 0).Tables[0];
            gridKhoaDaoTao.DataSource = tb;
            gridKhoaDaoTao.DataBind();
        }
        protected void gridKhoaDaoTao_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_data_combo();
        }
        private void load_data_combo()
        {
            ASPxDateEdit date_tungay = gridKhoaDaoTao.FindEditFormTemplateControl("date_tungay") as ASPxDateEdit;
            ASPxDateEdit date_denngay = gridKhoaDaoTao.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxComboBox cmb_donvi = gridKhoaDaoTao.FindEditFormTemplateControl("cmb_donvi") as ASPxComboBox;
            ASPxListBox ls_nhanvien = gridKhoaDaoTao.FindEditFormTemplateControl("lbChoosen") as ASPxListBox;
           
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", 0, 0);
            
            cmb_donvi.DataSource = ds.Tables[3];
            cmb_donvi.ValueField = "id";
            cmb_donvi.TextField = "tendonvi";
            cmb_donvi.DataBind();

            if (!gridKhoaDaoTao.IsNewRowEditing)
            {
                ls_nhanvien.Items.Clear();
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_ANTOANVESINHLAODONG_KETQUA]", gridKhoaDaoTao.GetRowValues(gridKhoaDaoTao.EditingRowVisibleIndex, "id"), 0).Tables[0];
                ls_nhanvien.DataSource = tb;
                ls_nhanvien.TextField = "hoten";
                ls_nhanvien.ValueField = "idnhanvien";
                ls_nhanvien.DataBind();               
            }           
        }
        protected void lbAvailable_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxListBox lstBox = sender as ASPxListBox;
            
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_KHOADAOTAO]", e.Parameter, 1);
            lstBox.DataSource = ds.Tables[0];
            lstBox.TextField = "hoten";
            lstBox.ValueField = "id";
            lstBox.DataBind();
        }
        protected void uploadFile_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["file"] = filename;
            }
        }
        protected void grid_nhanvien_Callback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters.Contains("save"))
            {
                for (int i = 0; i < grid_nhanvien.VisibleRowCount; i++)
                {
                    ASPxTextBox txt_ketqua = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["ketqua"] as GridViewDataColumn, "txt_ketqua") as ASPxTextBox;
                    ASPxDateEdit date_thoidiem = grid_nhanvien.FindRowCellTemplateControl(i, grid_nhanvien.Columns["thoidiem"] as GridViewDataColumn, "date_thoidiem") as ASPxDateEdit;
                    if (txt_ketqua != null)
                    {
                        SqlHelper.ExecuteNonQuery(strconn, "[HRM_ANTOANVESINHLAODONG_KETQUA_UI]", grid_nhanvien.GetRowValues(i, "id"),
                            grid_nhanvien.GetRowValues(i, "idkhoa_atvsld"), 0,
                            txt_ketqua.Text, 0, date_thoidiem.Value, 1);
                    }
                }
                grid_nhanvien.JSProperties["cpoki"] = 1;
            }
            else
            {
                load_nhanvien(e.Parameters);
            }
        }
        private void load_nhanvien(object idkhoahoc)
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GET_ANTOANVESINHLAODONG_KETQUA]", idkhoahoc, 0).Tables[0];
            grid_nhanvien.DataSource = tb;
            grid_nhanvien.DataBind();
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

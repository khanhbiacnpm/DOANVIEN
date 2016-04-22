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
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
using DevExpress.Web.ASPxHiddenField;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class LuongA : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        public int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
               // load_dataLuongB();
                load_dataLuongA();
            }
        }
        #region Luong A
        protected void cmb_bacluong_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            load_combo_bacluong(e.Parameter);
        }
        protected void cb_heso_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            int idbacluong = Convert.ToInt32(e.Parameter);
            ASPxTextBox txt_heso = gridLuongA.FindEditFormTemplateControl("txt_heso") as ASPxTextBox;
            DevExpress.Web.ASPxCallback.ASPxCallback cb_heso = gridLuongA.FindEditFormTemplateControl("cb_heso") as DevExpress.Web.ASPxCallback.ASPxCallback;
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", idbacluong,0, 1).Tables[0];
            if (tb.Rows.Count > 0)
                cb_heso.JSProperties["cpHeso"] = tb.Rows[0]["heso"];
            else cb_heso.JSProperties["cpHeso"] = "";
        }
        protected void gridLuongA_OnHtmlEditFormCreated(object sender, EventArgs e)
        {
            load_dataCombox();
        }
        protected void gridLuongA_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxDateEdit date_thoidiem = gridLuongA.FindEditFormTemplateControl("date_thoidiem") as ASPxDateEdit;
            ASPxDateEdit date_denngay = gridLuongA.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxComboBox cmb_nhomluong = gridLuongA.FindEditFormTemplateControl("cmb_nhomluong") as ASPxComboBox;
            ASPxComboBox cmb_bacluong = gridLuongA.FindEditFormTemplateControl("cmb_bacluong") as ASPxComboBox;
            ASPxTextBox txt_heso = gridLuongA.FindEditFormTemplateControl("txt_heso") as ASPxTextBox;
            ASPxTextBox txt_soqd = gridLuongA.FindEditFormTemplateControl("txt_soqd") as ASPxTextBox;
            ASPxMemo memo_ghichu = gridLuongA.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;
            string fileqd = "";
            if (Session["fileLuongA"] != null)
            {
                fileqd = Session["fileLuongA"].ToString();
                Session.Remove("fileLuongA");
            }
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_QuaTrinhLuong_UI", 0, idNV, date_thoidiem.Value, date_thoidiem.Value, cmb_bacluong.Value,
                    cmb_bacluong.Text.Trim(), 1, txt_heso.Text, txt_soqd.Text, date_denngay.Value, fileqd, 1, memo_ghichu.Text, 0);
            }
            gridLuongA.CancelEdit();
            e.Cancel = true;
            load_dataLuongA();
        }
        protected void gridLuongA_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxDateEdit date_thoidiem = gridLuongA.FindEditFormTemplateControl("date_thoidiem") as ASPxDateEdit;
            ASPxDateEdit date_denngay = gridLuongA.FindEditFormTemplateControl("date_denngay") as ASPxDateEdit;
            ASPxComboBox cmb_nhomluong = gridLuongA.FindEditFormTemplateControl("cmb_nhomluong") as ASPxComboBox;
            ASPxComboBox cmb_bacluong = gridLuongA.FindEditFormTemplateControl("cmb_bacluong") as ASPxComboBox;
            ASPxTextBox txt_heso = gridLuongA.FindEditFormTemplateControl("txt_heso") as ASPxTextBox;
            ASPxTextBox txt_soqd = gridLuongA.FindEditFormTemplateControl("txt_soqd") as ASPxTextBox;
            ASPxMemo memo_ghichu = gridLuongA.FindEditFormTemplateControl("memo_ghichu") as ASPxMemo;

            string fileqd = "";
            if (Session["fileLuongA"] != null)
            {
                fileqd = Session["fileLuongA"].ToString();
                Session.Remove("fileLuongA");
                string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridLuongA.GetRowValues(gridLuongA.FocusedRowIndex, "fileqd"));
                string file = Server.MapPath(url);
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }


            int bacluong =Int32.Parse(hf_idQLNN.Get("bacluong").ToString());
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_QuaTrinhLuong_UI", e.Keys["id"], idNV, date_thoidiem.Value, date_thoidiem.Value, bacluong,
                cmb_bacluong.Text.Trim(), 1, txt_heso.Text, txt_soqd.Text, date_denngay.Value, fileqd, 1, memo_ghichu.Text, 1);
            gridLuongA.CancelEdit();
            e.Cancel = true;
            load_dataLuongA();
        }
        protected void gridLuongA_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridLuongA.GetRowValues(gridLuongA.FocusedRowIndex, "fileqd"));
            string file = Server.MapPath(url);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Get_ThongTinLuong]", e.Keys["id"], 3);
            gridLuongA.CancelEdit();
            e.Cancel = true;
            load_dataLuongA();
        }
        private void load_dataLuongA()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinLuong]", idNV, 0).Tables[0];
           
            gridLuongA.DataSource = tb;
            gridLuongA.DataBind();
            gridLuongA.JSProperties["cpidnv"] = idNV;
        }
        private void load_dataCombox()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinLuong]", 0, 2).Tables[0];
            ASPxComboBox cmb_nhomluong = gridLuongA.FindEditFormTemplateControl("cmb_nhomluong") as ASPxComboBox;
            cmb_nhomluong.DataSource = tb;
            cmb_nhomluong.ValueField = "id";
            cmb_nhomluong.TextField = "nhomluong";
            cmb_nhomluong.DataBind();

            if (!gridLuongA.IsNewRowEditing)
            {
                var itemnhomluong = cmb_nhomluong.Items.FindByValue(gridLuongA.GetRowValues(gridLuongA.EditingRowVisibleIndex, "idnhomluong"));
                if (itemnhomluong != null)
                {
                    itemnhomluong.Selected = true;
                    load_combo_bacluong(itemnhomluong.Value);
                    ASPxComboBox cmb_bacluong = gridLuongA.FindEditFormTemplateControl("cmb_bacluong") as ASPxComboBox;
                    string bacluong=gridLuongA.GetRowValues(gridLuongA.EditingRowVisibleIndex, "idbacluong").ToString();
                    var itembacluong = cmb_bacluong.Items.FindByText(bacluong);
                    if (itembacluong != null)
                        itembacluong.Selected = true;
                    
                }
            }            
        }
        private void load_combo_bacluong(object idnhomluong)
        {
            ASPxComboBox cmb_bacluong = gridLuongA.FindEditFormTemplateControl("cmb_bacluong") as ASPxComboBox;
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", idnhomluong,0, 0).Tables[0];
            cmb_bacluong.DataSource = tb;
            cmb_bacluong.TextField = "bacluong";
            cmb_bacluong.ValueField = "id";
            cmb_bacluong.DataBind();            
        }
        protected void uploadFileDinhKemTagA_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileLuongA"] = filename;
            }
        }
        #endregion

        //#region Luong B
        //protected void cmb_bacluongB_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        //{
        //    load_combo_bacluongB(e.Parameter);
        //}
        //protected void cb_hesoB_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        //{
        //    int idbacluong = Convert.ToInt32(e.Parameter);
        //    ASPxTextBox txt_heso = gridLuongB.FindEditFormTemplateControl("txt_hesoB") as ASPxTextBox;
        //    DevExpress.Web.ASPxCallback.ASPxCallback cb_hesoB = gridLuongB.FindEditFormTemplateControl("cb_hesoB") as DevExpress.Web.ASPxCallback.ASPxCallback;
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", idbacluong,0, 4).Tables[0];
        //    if (tb.Rows.Count > 0)
        //        cb_hesoB.JSProperties["cpHeso"] = tb.Rows[0]["heso"];
        //    else cb_hesoB.JSProperties["cpHeso"] = "";
        //}
        //protected void gridLuongB_OnHtmlEditFormCreated(object sender, EventArgs e)
        //{
        //    load_dataComboxB();
        //}
        //protected void gridLuongB_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    ASPxDateEdit date_thoidiem = gridLuongB.FindEditFormTemplateControl("date_thoidiemB") as ASPxDateEdit;
        //    ASPxDateEdit date_denngay = gridLuongB.FindEditFormTemplateControl("date_denngayB") as ASPxDateEdit;
        //    ASPxComboBox cmb_nhomluong = gridLuongB.FindEditFormTemplateControl("cmb_nhomluongB") as ASPxComboBox;
        //    ASPxComboBox cmb_bacluong = gridLuongB.FindEditFormTemplateControl("cmb_bacluongB") as ASPxComboBox;
        //    ASPxTextBox txt_heso = gridLuongB.FindEditFormTemplateControl("txt_hesoB") as ASPxTextBox;
        //    ASPxTextBox txt_soqd = gridLuongB.FindEditFormTemplateControl("txt_soqdB") as ASPxTextBox;
        //    ASPxMemo memo_ghichu = gridLuongB.FindEditFormTemplateControl("memo_ghichuB") as ASPxMemo;
        //    string fileqd = "";
        //    if (Session["fileLuongB"] != null)
        //    {
        //        fileqd = Session["fileLuongB"].ToString();
        //        Session.Remove("fileLuongB");
        //    }
            
        //    if (idNV > 0)
        //    {
        //        int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_QuaTrinhLuong_UI", 0, idNV, date_thoidiem.Value, date_thoidiem.Value, cmb_bacluong.Value,
        //            cmb_bacluong.Text.Trim(), 2, txt_heso.Text, txt_soqd.Text, date_denngay.Value, fileqd, 0, memo_ghichu.Text, 0);
        //    }
        //    gridLuongB.CancelEdit();
        //    e.Cancel = true;
        //    load_dataLuongB();
        //}
        //protected void gridLuongB_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        //{
        //    ASPxDateEdit date_thoidiem = gridLuongB.FindEditFormTemplateControl("date_thoidiemB") as ASPxDateEdit;
        //    ASPxDateEdit date_denngay = gridLuongB.FindEditFormTemplateControl("date_denngayB") as ASPxDateEdit;
        //    ASPxComboBox cmb_nhomluong = gridLuongB.FindEditFormTemplateControl("cmb_nhomluongB") as ASPxComboBox;
        //    ASPxComboBox cmb_bacluong = gridLuongB.FindEditFormTemplateControl("cmb_bacluongB") as ASPxComboBox;
        //    ASPxTextBox txt_heso = gridLuongB.FindEditFormTemplateControl("txt_hesoB") as ASPxTextBox;
        //    ASPxTextBox txt_soqd = gridLuongB.FindEditFormTemplateControl("txt_soqdB") as ASPxTextBox;
        //    ASPxMemo memo_ghichu = gridLuongB.FindEditFormTemplateControl("memo_ghichuB") as ASPxMemo;
            

        //    string fileqd = "";
        //    if (Session["fileLuongB"] != null)
        //    {
        //        fileqd = Session["fileLuongB"].ToString();
        //        Session.Remove("fileLuongB");

        //    }
           
           
        //    int bacluong = Int32.Parse(hdLuongB.Get("bacluongb").ToString());
        //    if (idNV > 0)
        //    {
        //        int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_QuaTrinhLuong_UI", e.Keys["id"], idNV, date_thoidiem.Value, date_thoidiem.Value, bacluong,
        //            cmb_bacluong.Text.Trim(), 2, txt_heso.Text, txt_soqd.Text, date_denngay.Value, fileqd, 0, memo_ghichu.Text, 1);
        //    }
        //    gridLuongB.CancelEdit();
        //    e.Cancel = true;
        //    load_dataLuongB();
        //}
        //protected void gridLuongB_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        //{
        //    string url = String.Format("{0}/images/FileQD/{1}", DotNetNuke.Common.Globals.ApplicationPath, gridLuongB.GetRowValues(gridLuongB.FocusedRowIndex, "fileqd"));
        //    string file = Server.MapPath(url);
        //    if (File.Exists(file))
        //    {
        //        File.Delete(file);
        //    }
        //    int n = SqlHelper.ExecuteNonQuery(strconn, "[HRM_Get_ThongTinLuong]", e.Keys["id"], 3);
        //    gridLuongB.CancelEdit();
        //    e.Cancel = true;
        //    load_dataLuongB();
        //}
        //private void load_dataLuongB()
        //{
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinLuong]", idNV, 4).Tables[0];
           

        //        gridLuongB.DataSource = tb;
        //    gridLuongB.DataBind();
        //}
        //private void load_dataComboxB()
        //{
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_ThongTinLuong]", 0, 1).Tables[0];
        //    ASPxComboBox cmb_nhomluongB = gridLuongB.FindEditFormTemplateControl("cmb_nhomluongB") as ASPxComboBox;
        //    cmb_nhomluongB.DataSource = tb;
        //    cmb_nhomluongB.ValueField = "id";
        //    cmb_nhomluongB.TextField = "nhomluong";
        //    cmb_nhomluongB.DataBind();

        //    if (!gridLuongB.IsNewRowEditing)
        //    {
        //        var itemnhomluong = cmb_nhomluongB.Items.FindByValue(gridLuongB.GetRowValues(gridLuongB.EditingRowVisibleIndex, "idnhomluong"));
        //        if (itemnhomluong != null)
        //        {
        //            itemnhomluong.Selected = true;
        //            load_combo_bacluongB(itemnhomluong.Value);
        //            ASPxComboBox cmb_bacluongB = gridLuongB.FindEditFormTemplateControl("cmb_bacluongB") as ASPxComboBox;
        //            var itembacluong = cmb_bacluongB.Items.FindByText(gridLuongB.GetRowValues(gridLuongB.EditingRowVisibleIndex, "idbacluong").ToString());
        //            if (itembacluong != null)
        //                itembacluong.Selected = true;
        //            hf_idQLNN.Set("bacluongb", gridLuongB.GetRowValues(gridLuongB.EditingRowVisibleIndex, "idbacluong").ToString());
        //        }
        //    }
        //}
        //private void load_combo_bacluongB(object idnhomluong)
        //{
        //    ASPxComboBox cmb_bacluong = gridLuongB.FindEditFormTemplateControl("cmb_bacluongB") as ASPxComboBox;
        //    DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_Get_Luong_heso]", idnhomluong,0, 0).Tables[0];
        //    cmb_bacluong.DataSource = tb;
        //    cmb_bacluong.TextField = "bacluong";
        //    cmb_bacluong.ValueField = "id";
        //    cmb_bacluong.DataBind();
        //}
        //protected void uploadFileDinhKemTagB_Load(object sender, FileUploadCompleteEventArgs e)
        //{
        //    ASPxUploadControl upload = sender as ASPxUploadControl;
        //    if (!upload.FileName.ToString().Trim().Equals(""))
        //    {
        //        string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
        //        string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
        //        (sender as ASPxUploadControl).SaveAs(fullFilePath);
        //        Session["fileLuongB"] = filename;
        //    }
        //}
        //#endregion

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

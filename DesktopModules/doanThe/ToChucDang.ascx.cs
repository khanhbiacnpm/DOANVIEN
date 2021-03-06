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
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;


namespace Philip.Modules.doanThe
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewCountry class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class dangVien : PortalModuleBase, IActionable
    {

        #region Private Members

        private string strTemplate;

        #endregion

        #region Public Methods

        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }

        #endregion

        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------

       doanTheController objtochucdangchuan = new doanTheController();
       toChucDangChuanInfo tochucdangchuan = new toChucDangChuanInfo();
       toChucDangInfo tochucdang = new toChucDangInfo();
        private int idNV = 0;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                BindToChucDang();
            }
        }
        
        // khu vụ grid 1
        protected void gridToChucDang_Callback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            BindToChucDang();
            if (Session["idToChucDangChuan"] != null)
            {
                Session.Remove("idToChucDangChuan");
            }
        }
        int nParty = 1;
        protected void gridToChucDang_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lbl_tenToChuc = gridToChucDang.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_tenToChuc") as ASPxLabel;
                ASPxLabel lbl_ngay = gridToChucDang.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_ngay") as ASPxLabel;
                ASPxLabel lbl_ghiChu = gridToChucDang.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_ghiChu") as ASPxLabel;
                ASPxHyperLink hyperDowload = gridToChucDang.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "hyperDowload") as ASPxHyperLink;
                int idToChucDang = Convert.ToInt32(e.CellValue);
                if (objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).Count > 0)
                {
                    if (lbl_tenToChuc != null)
                    {
                        lbl_tenToChuc.Text = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).OrderByDescending(tcd => tcd.ngay).ToList()[0].tentochucdang;
                    }else
                        if (lbl_ghiChu != null)
                        {
                            lbl_ghiChu.Text = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).OrderByDescending(tcd => tcd.ngay).ToList()[0].ghichu;
                        }
                    else if(lbl_ngay !=null) {
                        lbl_ngay.Text = string.Format("{0:dd/MM/yyyy}", objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).OrderByDescending(tcd => tcd.ngay).ToList()[0].ngay);
                        }
                        else if (hyperDowload != null)
                        {
                            hyperDowload.Text = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).OrderByDescending(tcd => tcd.ngay).ToList()[0].soqd;
                            string file=objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDang,0).OrderByDescending(tcd => tcd.ngay).ToList()[0].file.Trim();
                            if (file != "")
                            {
                                hyperDowload.NavigateUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/FileQD/" + file;
                            }
                        }                    
                }
            }
        }
        
        private void BindToChucDang()
        {
            this.gridToChucDang.DataSource = objtochucdangchuan.GetToChucDangChuan(0,0);
            this.gridToChucDang.DataBind();
        }
        // them moi to chuc dang chuan
        protected void gridDangVienControl_htmDataCell(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "soqd")
            {
                ASPxHyperLink hyperDowload = gridDangVienControl.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "hyperDowload") as ASPxHyperLink;
                string file = e.CellValue.ToString();
                hyperDowload.Text = file;
                if (e.GetValue("file").ToString().Trim() != "")
                {
                    hyperDowload.NavigateUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/FileQD/" + e.GetValue("file").ToString();
                }
            }
        }
        protected void callbackPanel_ThemToChuc_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.Contains("Xoa"))
            {
                int idToChucDangChuan = Convert.ToInt32(e.Parameter.Substring(3));
                if (objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).Count > 1)
                {
                    tochucdang.id = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).ToList()[0].id;
                    tochucdang.ngay = DateTime.Now;
                    objtochucdangchuan.xoaToChucDang(tochucdang);
                }
                else
                {                    
                    tochucdang.id = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).ToList()[0].id;
                    tochucdang.ngay=DateTime.Now;
                    objtochucdangchuan.xoaToChucDang(tochucdang);
                    
                    tochucdangchuan.id = idToChucDangChuan;
                    objtochucdangchuan.xoaToChucDangChuan(tochucdangchuan);                    
                }
            }
            else
            {
                tochucdangchuan.id = -1;
                tochucdangchuan.ghichu = txtTenToChuc1.Text;
                tochucdangchuan.loaitochuc = 0;
                objtochucdangchuan.themToChucDangChuan(tochucdangchuan);

                tochucdang.id = -1;
                tochucdang.tentochucdang = txtTenToChuc1.Text;
                tochucdang.soqd = txtSoQD1.Text;
                tochucdang.ghichu = memoGhiChu1.Text;
                tochucdang.ngay = dateNgayQD1.Date;
                tochucdang.loaitochuc = 0;// to chuc dang // 1 to chuc doan
                int idToChucDangChuan = objtochucdangchuan.GetToChucDangChuan(0,0).OrderByDescending(tcdc => tcdc.id).ToList()[0].id;
                tochucdang.idtochucdangchuan = idToChucDangChuan;
                if (Session["fileKem"] != null)
                {
                    tochucdang.file = Session["fileKem"].ToString();
                    Session.Remove("fileKem");
                }
                else
                    tochucdang.file = "";

                objtochucdangchuan.themToChucDang(tochucdang);
            }
        }

        // grid in popupControl
        protected void callBackPanel_gridDangVienControl_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.Contains("Them"))
            {
                gridDangVienControl.DataSource = objtochucdangchuan.GetToChucDang_idToChucDangChuan(Convert.ToInt32(e.Parameter.Substring(4)),0);
                gridDangVienControl.DataBind();
                Session["idToChucDangChuan"] = e.Parameter.Substring(4);                
            }
        }
        
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string dv = "TCĐ" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileKem"] = dv + name;
            }
        }
        // them moi
        protected void uploadFileDinhKemThem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string dv = "TCĐ" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileKem"] = dv + name;
            }
        }
        protected void gridDangVienControl_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtTenToChuc = gridDangVienControl.FindEditFormTemplateControl("txtTenToChuc") as ASPxTextBox;
            ASPxTextBox txtSoQD = gridDangVienControl.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridDangVienControl.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxDateEdit dateNgayQD = gridDangVienControl.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            
            tochucdang.id = -1;
            tochucdang.tentochucdang = txtTenToChuc.Text;
            tochucdang.soqd = txtSoQD.Text;
            tochucdang.ghichu = memoGhiChu.Text;
            tochucdang.ngay = dateNgayQD.Date;
            tochucdang.loaitochuc = 0;// to chuc dang // 1 to chuc doan
            int idToChucDangChuan = Session["idToChucDangChuan"] != null ? Convert.ToInt32(Session["idToChucDangChuan"]) : 0;
            tochucdang.idtochucdangchuan = idToChucDangChuan;
            if (Session["fileKem"] != null)
            {
                tochucdang.file = Session["fileKem"].ToString();
                Session.Remove("fileKem");
            }
            else
                tochucdang.file = "";

            objtochucdangchuan.themToChucDang(tochucdang);

            gridDangVienControl.CancelEdit();
            e.Cancel = true;
            LoadToChucDang2(idToChucDangChuan);
        }
        protected void gridDangVienControl_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtTenToChuc = gridDangVienControl.FindEditFormTemplateControl("txtTenToChuc") as ASPxTextBox;
            ASPxTextBox txtSoQD = gridDangVienControl.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridDangVienControl.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            ASPxDateEdit dateNgayQD = gridDangVienControl.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;

            tochucdang.id = Convert.ToInt32(e.Keys[0].ToString());
            tochucdang.tentochucdang = txtTenToChuc.Text;
            tochucdang.soqd = txtSoQD.Text;
            tochucdang.ghichu = memoGhiChu.Text;
            tochucdang.ngay = dateNgayQD.Date;
            tochucdang.loaitochuc = 0;// to chuc dang // 1 to chuc doan
            int idToChucDangChuan = Session["idToChucDangChuan"] != null ? Convert.ToInt32(Session["idToChucDangChuan"]) : 0;
            tochucdang.idtochucdangchuan = idToChucDangChuan;
            if (Session["fileKem"] != null)
            {
                tochucdang.file = Session["fileKem"].ToString();
                Session.Remove("fileKem");
            }
            else
                tochucdang.file = "";

            objtochucdangchuan.suaToChucDang(tochucdang);

            gridDangVienControl.CancelEdit();
            e.Cancel = true;
            LoadToChucDang2(idToChucDangChuan);
        }
        protected void gridDangVienControl_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int idToChucDangChuan = Session["idToChucDangChuan"] != null ? Convert.ToInt32(Session["idToChucDangChuan"]) : 0;
            if (objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).Count > 1)
            {
                tochucdang.id = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).ToList()[0].id;
                tochucdang.ngay = DateTime.Now;
                objtochucdangchuan.xoaToChucDang(tochucdang);
            }
            else
            {
                tochucdang.id = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).ToList()[0].id;
                tochucdang.ngay = DateTime.Now;
                objtochucdangchuan.xoaToChucDang(tochucdang);

                tochucdangchuan.id = idToChucDangChuan;
                objtochucdangchuan.xoaToChucDangChuan(tochucdangchuan);
            }
            gridDangVienControl.CancelEdit();
            e.Cancel = true;
            LoadToChucDang2(idToChucDangChuan);
        }
        private void LoadToChucDang2(int idToChucDangChuan)
        {
            gridDangVienControl.DataSource = objtochucdangchuan.GetToChucDang_idToChucDangChuan(idToChucDangChuan,0).OrderByDescending(tcd =>tcd.id);
            gridDangVienControl.DataBind();
        }
        protected void txtFileKem_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetToChucDang("file") != null && GetToChucDang("file").Trim() != "")
            {
                txt.Text = GetToChucDang("file");
            }
        }
        
        protected void dateNgayQD_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit ngay = sender as ASPxDateEdit;
            if (GetToChucDang("ngay") != null && GetToChucDang("ngay").Trim() != "")            
                ngay.Value = Convert.ToDateTime(GetToChucDang("ngay"));                        
             else
                ngay.Date = DateTime.Now;            
        }
       
        private string GetToChucDang(string fieldName)
        {
            int index = gridDangVienControl.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridDangVienControl.GetRowValues(index, fieldName).ToString();
            }
            return values;

        }
        private string CreateServerFilename(string clientFilename)
        {
            if (clientFilename.LastIndexOf(System.IO.Path.DirectorySeparatorChar) > -1)
            {
                return clientFilename.Substring(clientFilename.LastIndexOf(System.IO.Path.DirectorySeparatorChar) + 1);
            }
            else
            {
                return clientFilename;
            }
        }
        #endregion

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Registers the module actions required for interfacing with the portal framework
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
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


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
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxHiddenField;

namespace Philip.Modules.BaoHiem
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
    partial class ViewLuongCB : PortalModuleBase, IActionable
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
        LuongCBInfo luongcb = new LuongCBInfo();
        BaoHiem.BaoHiemController objBaoHiem = new Philip.Modules.BaoHiem.BaoHiemController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                this.grid.DataSource = objBaoHiem.GetLuongCBs();
                this.grid.DataBind();
            }
        }
        //upload file tai day 
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string dv = "LCB" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
            }
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
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtLuongCB = grid.FindEditFormTemplateControl("txtLuongCB") as ASPxTextBox;
            ASPxDateEdit txtThoiDiem = grid.FindEditFormTemplateControl("txtThoiDiem") as ASPxDateEdit;
            ASPxHiddenField HiddentfileKem = grid.FindEditFormTemplateControl("HiddentfileKem") as ASPxHiddenField;
            ASPxTextBox txtfilekem = grid.FindEditFormTemplateControl("txtfilekem") as ASPxTextBox;
            ASPxTextBox txtQuyetDinh = grid.FindEditFormTemplateControl("txtQuyetDinh") as ASPxTextBox;
            this.luongcb = objBaoHiem.GetLuongCBId(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.luongcb != null)
            {
                this.luongcb.luongcb = Convert.ToDecimal(txtLuongCB.Text.Trim());
                this.luongcb.thoidiem = txtThoiDiem.Date;
                this.luongcb.soqd = txtQuyetDinh.Text.Trim();
                if (HiddentfileKem.Count > 0)
                {
                    this.luongcb.fileKem = "LCB" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_" + HiddentfileKem.Get("filekem").ToString();
                }
                else
                {
                    this.luongcb.fileKem = "LCB" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_" + txtfilekem.Text.Trim();
                }
                this.objBaoHiem.UpdateLuongCB(luongcb);
            }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLuongCBs();
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtLuongCB = grid.FindEditFormTemplateControl("txtLuongCB") as ASPxTextBox;
            ASPxDateEdit txtThoiDiem = grid.FindEditFormTemplateControl("txtThoiDiem") as ASPxDateEdit;
            ASPxHiddenField HiddentfileKem = grid.FindEditFormTemplateControl("HiddentfileKem") as ASPxHiddenField;
            ASPxTextBox txtQuyetDinh = grid.FindEditFormTemplateControl("txtQuyetDinh") as ASPxTextBox;

            this.luongcb.id = -1;
            this.luongcb.luongcb = Convert.ToDecimal(txtLuongCB.Text.Trim());
            this.luongcb.thoidiem = txtThoiDiem.Date;
            this.luongcb.soqd = txtQuyetDinh.Text.Trim();
            if (HiddentfileKem.Count > 0)
            {
                this.luongcb.fileKem = "LCB" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_" + HiddentfileKem.Get("filekem").ToString();
            }
            this.objBaoHiem.AddLuongCB(luongcb);

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLuongCBs();
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.luongcb = objBaoHiem.GetLuongCBId(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.luongcb != null)
            {
                this.objBaoHiem.DeleteLuongCB(luongcb);
            }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetLuongCBs();
            this.grid.DataBind();
        }
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "luongcb")
            {
                ASPxLabel lbl_LuongCB = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_LuongCB") as ASPxLabel;
                lbl_LuongCB.Text = InsertSymbol(e.CellValue.ToString());
            }
            if (e.DataColumn.FieldName == "thoidiem")
            {
                ASPxLabel lbl_thoidiem = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_thoidiem") as ASPxLabel;
                lbl_thoidiem.Text = string.Format("{0:dd/MM/yyyy}", e.CellValue);
            }
            if (e.DataColumn.FieldName == "soqd")
            {
                ASPxHyperLink hyperDowload = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "hyperDowload") as ASPxHyperLink;
                ASPxImage imgFile = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgFile") as ASPxImage;
                hyperDowload.Text = e.CellValue.ToString();
                if (e.GetValue("fileKem").ToString().Trim() != "")
                {
                    imgFile.ImageUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/imgadmin/file.png";
                    hyperDowload.NavigateUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/FileQD/" + e.GetValue("fileKem").ToString();
                }
                else
                {
                    imgFile.Visible = false;
                }
            } 
        }
        protected void txtLuongCB_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("luongcb") != null && GetText("luongcb").Trim() != "")
            {
                txt.Text = GetText("luongcb");
            }
        }
        protected void txtQuyetDinh_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("soqd") != null && GetText("soqd").Trim() != "")
            {
                txt.Text = GetText("soqd");
            }
        }
        protected void txtfilekem_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("fileKem") != null && GetText("fileKem").Trim() != "")
            {
                txt.Text = GetText("fileKem");
            }
        }
        protected void txtThoiDiem_Load(object sender, EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetText("thoidiem") != null && GetText("thoidiem").Trim() != "")
            {
                txt.Date = Convert.ToDateTime(GetText("thoidiem"));
            }
        }

        private string GetText(string fieldName)
        {
            int index = grid.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grid.GetRowValues(index, fieldName).ToString();

            }
            return values;
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
        private string InsertSymbol(string str_Temps)
        {
            if (str_Temps == "0" | str_Temps == "" | str_Temps.Length < 3) return str_Temps;
            int int_Count = 0;
            for (int i = str_Temps.Length; i > 0; i--)
            {
                if (int_Count % 3 == 0 && int_Count != 0)
                {
                    str_Temps = str_Temps.Insert(i, ",");
                }
                int_Count++;
            }
            return str_Temps;
        }
    }
}


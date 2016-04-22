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
    partial class ViewBaoHiem : PortalModuleBase, IActionable
    {
       
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
        BaoHiem.BaoHiemInfo baohiem = new Philip.Modules.BaoHiem.BaoHiemInfo();
        BaoHiem.BaoHiemController objBaoHiem = new Philip.Modules.BaoHiem.BaoHiemController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {                
                LoadLoaiBH();
                this.grid.DataSource = objBaoHiem.GetBaoHiemByIdLoaiBH(Convert.ToInt32(cmbLoaiBH.SelectedItem.Value));
                this.grid.DataBind();
            }
        }
        protected void grid_Callback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string str = e.Parameters.ToString();
            this.grid.DataSource = objBaoHiem.GetBaoHiemByIdLoaiBH(Convert.ToInt32(e.Parameters));
            this.grid.DataBind();
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {            
            ASPxTextBox txtTLNSDLDong = grid.FindEditFormTemplateControl("txtTLNSDLDong") as ASPxTextBox;
            ASPxTextBox txtTLNLaoDong = grid.FindEditFormTemplateControl("txtTLNLaoDong") as ASPxTextBox;
            ASPxDateEdit txtThoiDiem = grid.FindEditFormTemplateControl("txtThoiDiem") as ASPxDateEdit;

            this.baohiem = objBaoHiem.GetBaoHiemId(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            int idLoaiBH = HiddenIdLoaiBH.Count > 0 ? Convert.ToInt32(HiddenIdLoaiBH.Get("idLoaiBH")) : 2;
            if (this.baohiem != null)
            {                
                this.baohiem.idloaibh = idLoaiBH;
                this.baohiem.tlnsudunglaodong = txtTLNSDLDong.Text.Trim();
                this.baohiem.tllaodong = txtTLNLaoDong.Text.Trim();
                this.baohiem.thoidiem = txtThoiDiem.Date;
                this.objBaoHiem.UpdateBaoHiem(baohiem);
            }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetBaoHiemByIdLoaiBH(idLoaiBH);
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {            
            ASPxTextBox txtTLNSDLDong = grid.FindEditFormTemplateControl("txtTLNSDLDong") as ASPxTextBox;
            ASPxTextBox txtTLNLaoDong = grid.FindEditFormTemplateControl("txtTLNLaoDong") as ASPxTextBox;
            ASPxDateEdit txtThoiDiem = grid.FindEditFormTemplateControl("txtThoiDiem") as ASPxDateEdit;

            int idLoaiBH = HiddenIdLoaiBH.Count > 0 ? Convert.ToInt32(HiddenIdLoaiBH.Get("idLoaiBH")) : 2;
            
            this.baohiem.id = -1;
            this.baohiem.idloaibh = idLoaiBH;
            this.baohiem.tlnsudunglaodong = txtTLNSDLDong.Text.Trim();
            this.baohiem.tllaodong = txtTLNLaoDong.Text.Trim();
            this.baohiem.thoidiem = txtThoiDiem.Date;
            this.objBaoHiem.AddBaoHiem(baohiem);

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetBaoHiemByIdLoaiBH(idLoaiBH);
            this.grid.DataBind();
        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            this.baohiem = objBaoHiem.GetBaoHiemId(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            int idLoaiBH = HiddenIdLoaiBH.Count > 0 ? Convert.ToInt32(HiddenIdLoaiBH.Get("idLoaiBH")) : 2;
            if (this.baohiem != null)
            {
                this.objBaoHiem.DeleteBaoHiem(baohiem);
            }
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objBaoHiem.GetBaoHiemByIdLoaiBH(idLoaiBH);
            this.grid.DataBind();
        }
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "idloaibh")
            {
                ASPxLabel lbl_BaoHiem = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_BaoHiem") as ASPxLabel;
                lbl_BaoHiem.Text = objBaoHiem.GetLoaiBaoHiemId(Convert.ToInt32(e.CellValue.ToString())).loaibh.ToString();
            }
            if (e.DataColumn.FieldName == "thoidiem")
            {
                ASPxLabel lbl_thoidiem = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_thoidiem") as ASPxLabel;
                lbl_thoidiem.Text = string.Format("{0:dd/MM/yyyy}",e.CellValue);
            }
        }
        private void LoadLoaiBH()
        {
            cmbLoaiBH.Items.Clear();
            foreach (LoaiBaoHiemInfo lbh in objBaoHiem.GetLoaiBaoHiems())
            {
                cmbLoaiBH.Items.Add(new ListEditItem(lbh.loaibh, lbh.id.ToString()));
            }
            cmbLoaiBH.SelectedIndex = 0;            
        }        
        protected void txtTLNSDLDong_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("tlnsudunglaodong") != null && GetText("tlnsudunglaodong").Trim() != "")
            {
                txt.Text = GetText("tlnsudunglaodong");
            }
        }
        protected void txtThoiDiem_Load(object sender, EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetText("thoidiem") != null && GetText("thoidiem").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetText("thoidiem"));
            }
        }
        protected void txtTLNLaoDong_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("tllaodong") != null && GetText("tllaodong").Trim() != "")
            {
                txt.Text = GetText("tllaodong");
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
}
}


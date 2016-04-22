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


namespace VNPT.Modules.Position
{
    partial class hschucvu : PortalModuleBase
    {
        private int idChucVu = 0;
        hschucvuInfo hschucvus = new hschucvuInfo();
        PositionController objposition = new PositionController();

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator = ".";
            idChucVu = Convert.ToInt32(Request.Params["idchucvu"]);
            loadGrid(idChucVu);            
        }
        private void loadGrid(int idchucvu)
        {
            gridhschucvu.Caption = "Thông tin hệ số chức vụ " + objposition.GetPosition(idchucvu).name;
            gridhschucvu.DataSource = objposition.GetPositionByChucVu(idchucvu);
            gridhschucvu.DataBind();
        }
        protected void gridhschucvu_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txthschucvu = gridhschucvu.FindEditFormTemplateControl("txthschucvu") as ASPxTextBox;
            ASPxTextBox txthstrachnhiem = gridhschucvu.FindEditFormTemplateControl("txthstrachnhiem") as ASPxTextBox;
            ASPxTextBox txthsdochai = gridhschucvu.FindEditFormTemplateControl("txthsdochai") as ASPxTextBox;            
            ASPxDateEdit dateThoiDiem = gridhschucvu.FindEditFormTemplateControl("dateThoiDiem") as ASPxDateEdit;

            hschucvus.id = -1;
            hschucvus.positionid = idChucVu;
            hschucvus.hschucvu = txthschucvu.Text.Trim() != "" ? float.Parse(txthschucvu.Text) : 0;
            hschucvus.hstrachnhiem = txthstrachnhiem.Text.Trim() != "" ? float.Parse(txthstrachnhiem.Text) : 0;
            hschucvus.hsdochai = txthsdochai.Text.Trim() != "" ? float.Parse(txthsdochai.Text) : 0;
            hschucvus.thoidiem = dateThoiDiem.Date;
            objposition.themHSChucVu(hschucvus);

            gridhschucvu.CancelEdit();
            e.Cancel = true;
            loadGrid(idChucVu);
        }
        protected void gridhschucvu_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txthschucvu = gridhschucvu.FindEditFormTemplateControl("txthschucvu") as ASPxTextBox;
            ASPxTextBox txthstrachnhiem = gridhschucvu.FindEditFormTemplateControl("txthstrachnhiem") as ASPxTextBox;
            ASPxTextBox txthsdochai = gridhschucvu.FindEditFormTemplateControl("txthsdochai") as ASPxTextBox;
            ASPxDateEdit dateThoiDiem = gridhschucvu.FindEditFormTemplateControl("dateThoiDiem") as ASPxDateEdit;

            hschucvus.id = Convert.ToInt32(e.Keys[0].ToString());
            hschucvus.positionid = idChucVu;
            hschucvus.hschucvu = txthschucvu.Text.Trim() != "" ? float.Parse(txthschucvu.Text) : 0;
            hschucvus.hstrachnhiem = txthstrachnhiem.Text.Trim() != "" ? float.Parse(txthstrachnhiem.Text) : 0;
            hschucvus.hsdochai = txthsdochai.Text.Trim() != "" ? float.Parse(txthsdochai.Text) : 0;
            hschucvus.thoidiem = dateThoiDiem.Date;
            objposition.suaHSChucVu(hschucvus);

            gridhschucvu.CancelEdit();
            e.Cancel = true;
            loadGrid(idChucVu);
        }
        protected void gridhschucvu_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            hschucvus.id = Int32.Parse(e.Keys[0].ToString());
            hschucvus.thoidiem = DateTime.Now;
            objposition.xoaHSChucVu(hschucvus);

            gridhschucvu.CancelEdit();
            e.Cancel = true;
            loadGrid(idChucVu);
        }
        protected void datethoidiem_init(object sender, EventArgs e)
        {
            ASPxDateEdit dateThoiDiem = sender as ASPxDateEdit;
            if (GetText("thoidiem") != null && GetText("thoidiem").Trim() != "")
                dateThoiDiem.Date = Convert.ToDateTime(GetText("thoidiem"));            
            else
                dateThoiDiem.Date = DateTime.Now;
        }
        private string GetText(string fieldName)
        {
            int index = gridhschucvu.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridhschucvu.GetRowValues(index, fieldName).ToString();
            }
            return values;
        }               
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


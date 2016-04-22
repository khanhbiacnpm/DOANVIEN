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

    partial class PartyPosition : PortalModuleBase
    {
      
        #region Event Handlers
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.Position.PositionInfo position = new VNPT.Modules.Position.PositionInfo();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            this.grid.DataSource = objPosition.GetPositionByType(4);
            this.grid.DataBind();
        }


        protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            if (textId != null)
            {
                textId.Enabled = false;
            }
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text=grid.FindEditFormTemplateControl("strNaziv")    as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            this.position = objPosition.GetPosition(Int32.Parse(textId.Text));
           
            if (this.position != null)
            {
                this.position.name = text.Text;
                this.position.rcoefficient = "0";
                this.position.ecoefficient = "0";
                this.position.isactive = true;
                this.position.type = 4;
                this.position.coefficient = "0";
                this.objPosition.UpdatePosition(position);
            }

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objPosition.GetPositionByType(4);
            this.grid.DataBind();            
        }
        protected void grid_callback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            this.grid.DataSource = objPosition.GetPositionByType(4);
            this.grid.DataBind();
        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("strNaziv") as ASPxTextBox;
            ASPxTextBox textId = grid.FindEditFormTemplateControl("txtId") as ASPxTextBox;
             
            this.position.id = -1;
            this.position.name = text.Text;
            this.position.rcoefficient = "0";
            this.position.ecoefficient = "0";
            this.position.isactive = true;
            this.position.type =4;
            this.position.coefficient = "0";
            this.objPosition.AddPosition(position);
           

            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objPosition.GetPositionByType(4);
            this.grid.DataBind();


        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {            
            this.position = objPosition.GetPosition(Int32.Parse(e.Keys[grid.KeyFieldName].ToString()));
            if (this.position != null)
            {
                this.objPosition.DeletePosition(position);
            }           
            grid.CancelEdit();
            e.Cancel = true;
            this.grid.DataSource = objPosition.GetPositionByType(4);
            this.grid.DataBind();
        }
        protected void strNaziv_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("name") != null && GetText("name").Trim() != "")
            {
                txt.Text = GetText("name");
            }
        }
        protected void txtCoefficient_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("coefficient") != null && GetText("coefficient").Trim() != "")
            {
                txt.Text = GetText("coefficient");
            }
        }
        protected void txtEviroment_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("ecoefficient") != null && GetText("ecoefficient").Trim() != "")
            {
                txt.Text = GetText("ecoefficient");
            }
        }
        protected void txtResponlity_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("rcoefficient") != null && GetText("rcoefficient").Trim() != "")
            {
                txt.Text = GetText("rcoefficient");
            }
        }        
        protected void txtId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                txt.Text = GetText("id");
            }
        }
        protected void chkLanhDao_Load(object sender, System.EventArgs e)
        {
            ASPxCheckBox chk = sender as ASPxCheckBox;
            if (GetText("islead") != null && GetText("islead").Trim() != "")
            {
                chk.Checked = Convert.ToBoolean(GetText("islead"));
            }
        }
        private string GetText(string fieldName)
        {
            int index = grid.EditingRowVisibleIndex;
            string values ="";
            if (index >= 0)
            {
                values= grid.GetRowValues(index, fieldName).ToString();                
            }
            return values;        
        }       
        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "type")
            {
                ASPxLabel lblType = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblType") as ASPxLabel;
                if (e.CellValue.ToString() == "1")
                {
                    lblType.Text = "Chức vụ";
                }
                if (e.CellValue.ToString() == "2")
                {
                    lblType.Text = "Chức vụ đoàn thể";
                }
                if (e.CellValue.ToString() == "3")
                {
                    lblType.Text = "Chức danh";
                }
                if (e.CellValue.ToString() == "4")
                {
                    lblType.Text = "Chức vụ đảng";
                }
            }
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lbl_hschucvu = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_hschucvu") as ASPxLabel;
                ASPxLabel lbl_hstrachnhiem = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_hstrachnhiem") as ASPxLabel;
                ASPxLabel lbl_hsdochai = grid.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_hsdochai") as ASPxLabel;
                hschucvuInfo ls = objPosition.GetPositionByThoiDiem(Convert.ToInt32(e.CellValue));
                if (lbl_hschucvu != null)
                    lbl_hschucvu.Text = ls != null ? ls.hschucvu.ToString() : "";
                if (lbl_hstrachnhiem != null)
                    lbl_hstrachnhiem.Text = ls != null ? ls.hstrachnhiem.ToString() : "";
                if (lbl_hsdochai != null)
                    lbl_hsdochai.Text = ls != null ? ls.hsdochai.ToString() : "";
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


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
using VNPT.Modules.Employees;
using DevExpress.Web.ASPxHiddenField;
using System.IO;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class ChinhTriXaHoi : PortalModuleBase, IActionable    
    {
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        SocietyHistory.SocietyHistoryController objSocialHistory = new VNPT.Modules.SocietyHistory.SocietyHistoryController();
        VNPT.Modules.SocietyHistory.SocietyHistoryController objSociety = new VNPT.Modules.SocietyHistory.SocietyHistoryController();
        VNPT.Modules.SocietyHistory.SocietyHistoryInfo society = new VNPT.Modules.SocietyHistory.SocietyHistoryInfo();
        Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();

        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != null)
            {
                idNV = Convert.ToInt32(Request.Params["idNV"].ToString());
                BindGridSociety(idNV);
            }
        }
        #region SocietyHistory
        protected void grdSociety_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtSocietyEmpId = grdSociety.FindEditFormTemplateControl("txtSocietyEmpId") as ASPxTextBox;
            ASPxTextBox txtSocietyId = grdSociety.FindEditFormTemplateControl("txtSocietyId") as ASPxTextBox;
            ASPxMemo txtContent = grdSociety.FindEditFormTemplateControl("txtContent") as ASPxMemo;

            ASPxDateEdit calSocietyOutDate = grdSociety.FindEditFormTemplateControl("calSocietyOutDate") as ASPxDateEdit;
            ASPxDateEdit calSocietyInDate = grdSociety.FindEditFormTemplateControl("calSocietyInDate") as ASPxDateEdit;
            ASPxComboBox cmbChucVuDoanThe = grdSociety.FindEditFormTemplateControl("cmbChucVuDoanThe") as ASPxComboBox;
            this.society = this.objSociety.GetSocietyHistory(Int32.Parse(txtSocietyId.Text));
            if (this.society != null)
            {
                this.society.content = txtContent.Text;
                this.society.fromdate = Convert.ToDateTime(calSocietyInDate.Value.ToString());
                this.society.todate = Convert.ToDateTime(calSocietyOutDate.Value.ToString());
                this.society.employeeid = idNV;
                this.society.ChucVuDoanThe = Convert.ToInt32(cmbChucVuDoanThe.Value);
                objSociety.UpdateSocietyHistory(society);
            }
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }
        protected void grdSociety_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtSocietyEmpId = grdSociety.FindEditFormTemplateControl("txtSocietyEmpId") as ASPxTextBox;
            ASPxTextBox txtSocietyId = grdSociety.FindEditFormTemplateControl("txtSocietyId") as ASPxTextBox;
            ASPxMemo txtContent = grdSociety.FindEditFormTemplateControl("txtContent") as ASPxMemo;

            ASPxDateEdit calSocietyOutDate = grdSociety.FindEditFormTemplateControl("calSocietyOutDate") as ASPxDateEdit;
            ASPxDateEdit calSocietyInDate = grdSociety.FindEditFormTemplateControl("calSocietyInDate") as ASPxDateEdit;
            ASPxComboBox cmbChucVuDoanThe = grdSociety.FindEditFormTemplateControl("cmbChucVuDoanThe") as ASPxComboBox;

            this.society.id = -1;
            this.society.content = txtContent.Text;
            this.society.fromdate = Convert.ToDateTime(calSocietyInDate.Value.ToString());
            this.society.todate = Convert.ToDateTime(calSocietyOutDate.Value.ToString());
            this.society.employeeid = idNV;
            this.society.ChucVuDoanThe = Convert.ToInt32(cmbChucVuDoanThe.Value);
            objSociety.AddSocietyHistory(society);
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }
       
        int nSociety = 1;
        protected void grdSociety_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lblTime = grdSociety.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblTime") as ASPxLabel;
                lblTime.Text = objSociety.GetSocietyHistory(Int32.Parse(e.CellValue.ToString())).fromdate.ToShortDateString() + " - " + objSociety.GetSocietyHistory(Int32.Parse(e.CellValue.ToString())).todate.ToShortDateString();
            }
            if (e.DataColumn.FieldName == "employeeid")
            {
                ASPxLabel lbl_STTSociety = grdSociety.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STTSociety") as ASPxLabel;
                lbl_STTSociety.Text = "" + nSociety++;
            }
            if (e.DataColumn.FieldName == "ChucVuDoanThe")
            {
                ASPxLabel lbl_ChucVuDoanThe = grdSociety.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_ChucVuDoanThe") as ASPxLabel;
                if (objPosition.GetPosition(Convert.ToInt32(e.CellValue.ToString())) != null)
                {
                    if (e.CellValue.ToString() == "0" || e.CellValue.ToString() == "-1")
                    {
                        lbl_ChucVuDoanThe.Text = "";
                    }
                    else { lbl_ChucVuDoanThe.Text = objPosition.GetPosition(Convert.ToInt32(e.CellValue.ToString())).name.ToString(); }
                }
            }
        }
        protected void grdSociety_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            this.society = objSocialHistory.GetSocietyHistory(Int32.Parse(e.Keys[grdSociety.KeyFieldName].ToString()));
            if (this.society != null)
            {

                this.objSocialHistory.DeleteSocietyHistory(society);
            }
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }
        private void BindGridSociety(int ItemId)
        {
            if (ItemId != 0)
            {
                this.grdSociety.Caption = "Thông tin tham gia tổ chức chính trị - xã hội nhân viên " + objEmployees.GetEmployees(ItemId).fullname;
                this.grdSociety.DataSource = objSocialHistory.GetSocietyHistoryByEmployess(ItemId);
                this.grdSociety.DataBind();
            }
        }
        protected void cmbChucVuDoanThe_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cmbChucVuDoanThe = sender as ASPxComboBox;
            cmbChucVuDoanThe.Items.Clear();
            cmbChucVuDoanThe.Items.Add(new ListEditItem("-- Chức vụ đoàn thể -- ", "0"));
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositionByType(2);
            foreach (VNPT.Modules.Position.PositionInfo u in list)
            {
                cmbChucVuDoanThe.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbChucVuDoanThe.SelectedIndex = 0;
            if (GetSocietyText("ChucVuDoanThe") != null && GetSocietyText("ChucVuDoanThe").Trim() != "")
            {
                ListEditItem item = cmbChucVuDoanThe.Items.FindByValue(GetSocietyText("ChucVuDoanThe"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void txtSocietyEmpId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetSocietyText("employeeid") != null && GetSocietyText("employeeid").Trim() != "")
            {
                txt.Text = GetSocietyText("employeeid");
            }
        }
        protected void txtSocietyId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetSocietyText("id") != null && GetSocietyText("id").Trim() != "")
            {
                txt.Text = GetSocietyText("id");
            }
        }

        protected void txtContent_Load(object sender, System.EventArgs e)
        {
            ASPxMemo txt = sender as ASPxMemo;
            if (GetSocietyText("content") != null && GetSocietyText("content").Trim() != "")
            {
                txt.Text = GetSocietyText("content");
            }
        }
        protected void calSocietyInDate_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetSocietyText("fromdate") != null && GetSocietyText("fromdate").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetSocietyText("fromdate"));
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }
        protected void calSocietyOutDate_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetSocietyText("todate") != null && GetSocietyText("todate").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetSocietyText("todate"));
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }

        private string GetSocietyText(string fieldName)
        {
            int index = grdSociety.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grdSociety.GetRowValues(index, fieldName).ToString();

            }
            return values;

        }


        #endregion
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

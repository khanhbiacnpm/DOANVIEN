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
    partial class XepLoai : PortalModuleBase, IActionable    
    {
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        SocietyHistory.SocietyHistoryController objSocialHistory = new VNPT.Modules.SocietyHistory.SocietyHistoryController();
        VNPT.Modules.SocietyHistory.SocietyHistoryController objSociety = new VNPT.Modules.SocietyHistory.SocietyHistoryController();
        VNPT.Modules.SocietyHistory.SortSociety society = new VNPT.Modules.SocietyHistory.SortSociety();
        Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();

        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["Id"].Contains("e"))
            {
            idNV = Convert.ToInt32(Request.Params["Id"].Substring(1));
             BindGridSociety(idNV);
            }
        }
        #region SocietyHistory
        protected void grdSociety_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
          
            ASPxMemo txtContent = grdSociety.FindEditFormTemplateControl("txtContent") as ASPxMemo;            
            ASPxComboBox cmbYear = grdSociety.FindEditFormTemplateControl("cmbYear") as ASPxComboBox;
            ASPxComboBox cmbXepLoai = grdSociety.FindEditFormTemplateControl("cmbXepLoai") as ASPxComboBox;
            ASPxComboBox cmbChucVuDoanThe = grdSociety.FindEditFormTemplateControl("cmbChucVuDoanThe") as ASPxComboBox;
            this.society = objSocialHistory.GetSortSociety(Int32.Parse(e.Keys[grdSociety.KeyFieldName].ToString()));
            if (this.society != null)
            {
                this.society.content = txtContent.Text;
                this.society.Year = Convert.ToInt32(cmbYear.Value.ToString());
                this.society.Sort = Convert.ToInt32(cmbXepLoai.Value.ToString());
                this.society.EmpId = idNV;
                this.society.PositionId = Convert.ToInt32(cmbChucVuDoanThe.Value);
                objSociety.UpdateSort(society);
            }
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }
        protected void grdSociety_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxMemo txtContent = grdSociety.FindEditFormTemplateControl("txtContent") as ASPxMemo;
            ASPxComboBox cmbYear = grdSociety.FindEditFormTemplateControl("cmbYear") as ASPxComboBox;
            ASPxComboBox cmbXepLoai = grdSociety.FindEditFormTemplateControl("cmbXepLoai") as ASPxComboBox;
            ASPxComboBox cmbChucVuDoanThe = grdSociety.FindEditFormTemplateControl("cmbChucVuDoanThe") as ASPxComboBox;

            this.society.Id = -1;
            this.society.content = txtContent.Text;
            this.society.Year = Convert.ToInt32(cmbYear.Value.ToString());
            this.society.Sort = Convert.ToInt32(cmbXepLoai.Value.ToString());
            this.society.EmpId = idNV;
            this.society.PositionId = Convert.ToInt32(cmbChucVuDoanThe.Value);
            objSociety.AddSort(society);
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }

        int nSociety = 1;
        private string BindXepLoai(int loai)
        { 
            string s="";
            if (loai == 1)
            {
                s = "Xuất sắc";
            }
            if (loai == 2)
            {
                s = "Giỏi";
            }
            if (loai == 3)
            {
                s = "Khá";
            }
            if (loai == 4)
            {
                s = "Trung Bình";
            }
            if (loai == 5)
            {
                s = "Yếu";
            }
            if (loai == 6)
            {
                s = "Kém";
            }
            return s;
        
        }
        protected void grdSociety_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "EmpId")
            {
                ASPxLabel lbl_STTSociety = grdSociety.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STTSociety") as ASPxLabel;
                lbl_STTSociety.Text = "" + nSociety++;
            }

            if (e.DataColumn.FieldName == "Sort")
            {
                ASPxLabel lblSort = grdSociety.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblSort") as ASPxLabel;
                if (objPosition.GetPosition(Convert.ToInt32(e.CellValue.ToString())) != null)
                {
                    if (e.CellValue.ToString() == "0" || e.CellValue.ToString() == "-1")
                    {
                        lblSort.Text = "";
                    }
                    else { lblSort.Text = BindXepLoai(Convert.ToInt32(e.CellValue.ToString())); }
                }
            }

            if (e.DataColumn.FieldName == "PositionId")
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

            this.society = objSocialHistory.GetSortSociety(Int32.Parse(e.Keys[grdSociety.KeyFieldName].ToString()));
            if (this.society != null)
            {

                this.objSocialHistory.DeleteSort(society);
            }
            grdSociety.CancelEdit();
            e.Cancel = true;
            BindGridSociety(idNV);
        }
        private void BindGridSociety(int ItemId)
        {
            if (ItemId != 0)
            {
                this.grdSociety.Caption = "Xếp loại đoàn viên " + objEmployees.GetEmployees(ItemId).fullname;
                this.grdSociety.DataSource = objSocialHistory.GetSortSocietyByEmployess(ItemId);
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
            if (GetSocietyText("PositionId") != null && GetSocietyText("PositionId").Trim() != "")
            {
                ListEditItem item = cmbChucVuDoanThe.Items.FindByValue(GetSocietyText("PositionId"));
                if (item != null)
                {
                    item.Selected = true;
                }
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
        protected void cmbXepLoai_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cmbXepLoai = sender as ASPxComboBox;
          
            if (GetSocietyText("Sort") != null && GetSocietyText("Sort").Trim() != "")
            {
                ListEditItem item = cmbXepLoai.Items.FindByValue(GetSocietyText("Sort"));
                if (item != null)
                {
                    item.Selected = true;
                }
                else {
                    cmbXepLoai.SelectedIndex = 0;
                }
            }
            else
            {
                cmbXepLoai.SelectedIndex = 0;
            }
        }
        protected void cmbYear_Load(object sender, System.EventArgs e)
        {
           
           
            ASPxComboBox cmbChucVuDoanThe = sender as ASPxComboBox;
            cmbChucVuDoanThe.Items.Clear();
            for (int i = DateTime.Now.Year; i >=2010; i--)
            {
                cmbChucVuDoanThe.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
            }
           
           
            if (GetSocietyText("Year") != null && GetSocietyText("Year").Trim() != "")
            {
                ListEditItem item = cmbChucVuDoanThe.Items.FindByValue(GetSocietyText("Year"));
                if (item != null)
                {
                    item.Selected = true;
                }
                else { cmbChucVuDoanThe.SelectedIndex = 0; }
            }
            else { cmbChucVuDoanThe.SelectedIndex = 0; }
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

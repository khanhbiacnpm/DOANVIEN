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
using DevExpress.Web.ASPxUploadControl;


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
    partial class doanThe : PortalModuleBase, IActionable
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

        doanTheInfo doanthe = new doanTheInfo();
        doanTheController objDoanThe = new doanTheController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.Employees.EmployeesController objEmployee = new VNPT.Modules.Employees.EmployeesController();
        private int idNV = 0;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (Request.Params["idNV"].Contains("e"))
                idNV = Convert.ToInt32(Request.Params["idNV"].Substring(1));
            if (!IsPostBack)
            {                
                hiddenIdNV.Value = idNV.ToString();
                BindDoanThe(idNV);
            }
        }
        //upload file tai day 
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string dv = "fileDoanThe" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileDoanThe/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileDT"] = dv + name;
            }
        }
        protected void gridDoanThe_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmbChuVuDoanThe = gridDoanThe.FindEditFormTemplateControl("cmbChuVuDoanThe") as ASPxComboBox;
            ASPxTextBox txtCapQuyetDinh = gridDoanThe.FindEditFormTemplateControl("txtCapQuyetDinh") as ASPxTextBox;
            ASPxTextBox txtSoQD = gridDoanThe.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtfilekem = gridDoanThe.FindEditFormTemplateControl("txtfilekem") as ASPxTextBox;
            ASPxMemo memoNoiDung = gridDoanThe.FindEditFormTemplateControl("memoNoiDung") as ASPxMemo;
            ASPxDateEdit dateThoiDiem = gridDoanThe.FindEditFormTemplateControl("dateThoiDiem") as ASPxDateEdit;

            doanthe.id = -1;
            doanthe.idChucVuDoanThe = Convert.ToInt32(cmbChuVuDoanThe.SelectedItem.Value);
            doanthe.idNhanVien = Convert.ToInt32(hiddenIdNV.Value);
            doanthe.soQuyetDinh = txtSoQD.Text;
            doanthe.capQuyetDinh = txtCapQuyetDinh.Text;
            doanthe.fileQuyetDinh = Session["fileDT"] != null ? Session["fileDT"].ToString() : "";
            doanthe.noiDung = memoNoiDung.Text;
            doanthe.ngay = dateThoiDiem.Date;
            objDoanThe.themDoanThe(doanthe);

            gridDoanThe.CancelEdit();
            e.Cancel = true;
            BindDoanThe(idNV);
        }
        protected void gridDoanThe_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cmbChuVuDoanThe = gridDoanThe.FindEditFormTemplateControl("cmbChuVuDoanThe") as ASPxComboBox;
            ASPxTextBox txtCapQuyetDinh = gridDoanThe.FindEditFormTemplateControl("txtCapQuyetDinh") as ASPxTextBox;
            ASPxTextBox txtSoQD = gridDoanThe.FindEditFormTemplateControl("txtSoQD") as ASPxTextBox;
            ASPxTextBox txtfilekem = gridDoanThe.FindEditFormTemplateControl("txtfilekem") as ASPxTextBox;
            ASPxMemo memoNoiDung = gridDoanThe.FindEditFormTemplateControl("memoNoiDung") as ASPxMemo;
            ASPxDateEdit dateThoiDiem = gridDoanThe.FindEditFormTemplateControl("dateThoiDiem") as ASPxDateEdit;

            doanthe.id = Int32.Parse(e.Keys[gridDoanThe.KeyFieldName].ToString());
            doanthe.idChucVuDoanThe = Convert.ToInt32(cmbChuVuDoanThe.SelectedItem.Value);
            doanthe.idNhanVien = Convert.ToInt32(hiddenIdNV.Value);
            doanthe.soQuyetDinh = txtSoQD.Text;
            doanthe.capQuyetDinh = txtCapQuyetDinh.Text;
            doanthe.fileQuyetDinh = Session["fileDT"] != null ? Session["fileDT"].ToString() : txtfilekem.Text;
            doanthe.noiDung = memoNoiDung.Text;
            doanthe.ngay = dateThoiDiem.Date;
            objDoanThe.suaDoanThe(doanthe);

            gridDoanThe.CancelEdit();
            e.Cancel = true;
            BindDoanThe(idNV);
        }        
        protected void gridDoanThe_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            doanthe.id = Int32.Parse(e.Keys[gridDoanThe.KeyFieldName].ToString());
            doanthe.ngay = DateTime.Now;
            objDoanThe.xoaDoanThe(doanthe);

            gridDoanThe.CancelEdit();
            e.Cancel = true;
            BindDoanThe(idNV);            
        }
        protected void gridDoanThe_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {                        
            if (e.DataColumn.FieldName == "idChucVuDoanThe")
            {
                ASPxLabel lbl_ChucVuDoanThe = gridDoanThe.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_ChucVuDoanThe") as ASPxLabel;
                lbl_ChucVuDoanThe.Text = objPosition.GetPosition(Convert.ToInt32(e.CellValue.ToString())).name;
            }
            if (e.DataColumn.FieldName == "soQuyetDinh")
            {                
                ASPxHyperLink lbl_fileQuyetDinh = gridDoanThe.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_fileQuyetDinh") as ASPxHyperLink;
                lbl_fileQuyetDinh.Text = e.CellValue.ToString();
                if (e.GetValue("fileQuyetDinh").ToString().Trim() != "")
                    lbl_fileQuyetDinh.NavigateUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/fileDoanThe/" + e.GetValue("fileQuyetDinh").ToString();
            }
        }
        private void BindDoanThe(int idNV)
        {
            if (idNV != 0)
            {
                gridDoanThe.Caption = "Quản trị thông tin đoàn thể nhân viên " + objEmployee.GetEmployees(idNV).fullname;
                gridDoanThe.DataSource = objDoanThe.GetdoanThe(idNV);
                gridDoanThe.DataBind();
            }
        }
        protected void cmbChuVuDoanThe_Init(object sender, System.EventArgs e)
        {
            ASPxComboBox cmbChucVuDoanThe = sender as ASPxComboBox;
            cmbChucVuDoanThe.Items.Clear();
            cmbChucVuDoanThe.Items.Add(new ListEditItem("-- Chọn chức vụ Đoàn thể -- ", "0"));
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositionByType(2);
            foreach (VNPT.Modules.Position.PositionInfo u in list)
            {
                cmbChucVuDoanThe.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            
            if (GetText("idChucVuDoanThe") != null && GetText("idChucVuDoanThe").Trim() != "")
            {
                ListEditItem item = cmbChucVuDoanThe.Items.FindByValue(GetText("idChucVuDoanThe"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }else
                cmbChucVuDoanThe.SelectedIndex = 0;
        }
        protected void dateThoiDiem_init(object sender, EventArgs e)
        {
            ASPxDateEdit dateThoiDiem = sender as ASPxDateEdit;
            if (GetText("ngay") != null && GetText("ngay").Trim() != "")
            {
                dateThoiDiem.Date = Convert.ToDateTime(GetText("ngay"));
            }
        }       
        private string GetText(string fieldName)
        {
            int index = gridDoanThe.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridDoanThe.GetRowValues(index, fieldName).ToString();

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


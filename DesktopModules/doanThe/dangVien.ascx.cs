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
using System.Threading;
using System.Globalization;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;


namespace Philip.Modules.doanThe
{    
    partial class dangVien : PortalModuleBase, IActionable
    {       
        #region Event Handlers
        VNPT.Modules.PartyMember.PartyMemberController objParty = new VNPT.Modules.PartyMember.PartyMemberController();
        VNPT.Modules.PartyMember.PartyMemberInfo party = new VNPT.Modules.PartyMember.PartyMemberInfo();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.Employees.EmployeesController objEmployee = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Employees.EmployeesInfo employees = new VNPT.Modules.Employees.EmployeesInfo();
        doanTheController objtochucdang = new doanTheController();
        private int idNV = 0;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {                   
            if (!IsPostBack)
            {                            
                BindGridParty();
            }
        }                
        //upload file tai day Dangvien
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string dv = "ĐV" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileKemDV"] = dv + name;
            }
        }
        // callback tag Dang Vien
        protected void gridDangVienControl_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox txtPartyEmpId = gridDangVienControl.FindEditFormTemplateControl("txtPartyEmpId") as ASPxTextBox;
            ASPxTextBox txtPartyId = gridDangVienControl.FindEditFormTemplateControl("txtPartyId") as ASPxTextBox;
            ASPxMemo memoNoiDung = gridDangVienControl.FindEditFormTemplateControl("memoNoiDung") as ASPxMemo;
            ASPxTextBox txtSoQD = gridDangVienControl.FindEditFormTemplateControl("txtDoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = gridDangVienControl.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = gridDangVienControl.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxComboBox cboPosition = gridDangVienControl.FindEditFormTemplateControl("cboPosition") as ASPxComboBox;
            ASPxTextBox txtToChucDang = gridDangVienControl.FindEditFormTemplateControl("txtToChucDang") as ASPxTextBox;            
            ASPxTextBox txtFileKem = gridDangVienControl.FindEditFormTemplateControl("txtFileKem") as ASPxTextBox;
            ASPxComboBox cmbloaikiemnhiem = gridDangVienControl.FindEditFormTemplateControl("CmbLoaiKiemNhiem") as ASPxComboBox;
            if (Request.Params["idNV"] != null)
                idNV = Convert.ToInt32(Request.Params["idNV"].ToString());
            this.party.id = -1;

            this.party.IdNhanVien = idNV;
     
            this.party.NoiDung = memoNoiDung.Text.Trim();
            
            this.party.SoQD = txtSoQD.Text;
            this.party.ThoiGianQD = dateNgayQD.Text;
            this.party.CapQD = txtCapQD.Text;
            party.tenchucvudang = cboPosition.Text;
            party.tentochucdang = txtToChucDang.Text;
            party.loaikiemnhiem = cmbloaikiemnhiem.Text;            
            this.party.FileQD = Session["fileKemDV"] != null ? Session["fileKemDV"].ToString() : "";
            
            objParty.AddPartyMember(party);

            gridDangVienControl.CancelEdit();
            e.Cancel = true;
          
                BindGridParty();
           
            Session.Remove("fileKemDV");
        }
        protected void gridDangVienControl_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtPartyEmpId = gridDangVienControl.FindEditFormTemplateControl("txtPartyEmpId") as ASPxTextBox;
            ASPxTextBox txtFileKem = gridDangVienControl.FindEditFormTemplateControl("txtFileKem") as ASPxTextBox;
            ASPxTextBox txtPartyId = gridDangVienControl.FindEditFormTemplateControl("txtPartyId") as ASPxTextBox;
            ASPxMemo memoNoiDung = gridDangVienControl.FindEditFormTemplateControl("memoNoiDung") as ASPxMemo;
            ASPxTextBox txtSoQD = gridDangVienControl.FindEditFormTemplateControl("txtDoQD") as ASPxTextBox;
            ASPxTextBox txtCapQD = gridDangVienControl.FindEditFormTemplateControl("txtCapQD") as ASPxTextBox;
            ASPxDateEdit dateNgayQD = gridDangVienControl.FindEditFormTemplateControl("dateNgayQD") as ASPxDateEdit;
            ASPxComboBox cboPosition = gridDangVienControl.FindEditFormTemplateControl("cboPosition") as ASPxComboBox;
            ASPxTextBox txtToChucDang = gridDangVienControl.FindEditFormTemplateControl("txtToChucDang") as ASPxTextBox;
            ASPxComboBox cmbloaikiemnhiem = gridDangVienControl.FindEditFormTemplateControl("CmbLoaiKiemNhiem") as ASPxComboBox;
            
            if (this.party != null)
            {
                if (Request.Params["idNV"] != null)
                    idNV = Convert.ToInt32(Request.Params["idNV"].ToString());
               
                    this.party.IdNhanVien = idNV;
                
                party.id = Convert.ToInt32(txtPartyId.Text);
                this.party.NoiDung = memoNoiDung.Text.Trim();
                party.tenchucvudang = cboPosition.Text;
                this.party.SoQD = txtSoQD.Text;
                this.party.ThoiGianQD = dateNgayQD.Text;
                this.party.CapQD = txtCapQD.Text;
                if (Session["fileKemDV"] != null)
                {
                    this.party.FileQD = Session["fileKemDV"] != null ? Session["fileKemDV"].ToString() : "";
                }
                else
                {
                    this.party.FileQD = txtFileKem.Text.Trim();
                }
             
                party.tentochucdang = txtToChucDang.Text;
                party.loaikiemnhiem = cmbloaikiemnhiem.Text; 

                objParty.UpdatePartyMember(party);
                Session.Remove("fileKemDV");
            }

            gridDangVienControl.CancelEdit();
            e.Cancel = true;
           
                BindGridParty();
     
        }
        protected void gridDangVienControl_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {            
            party.id = Int32.Parse(e.Keys[gridDangVienControl.KeyFieldName].ToString());
            if (this.party != null)
            {
                this.objParty.DeletePartyMember(party);
            }
            gridDangVienControl.CancelEdit();
            e.Cancel = true;                     
                BindGridParty();           
        }

        protected void cboPosition_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox cboPosition = sender as ASPxComboBox;
            cboPosition.Items.Clear();
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositions();
            foreach (var u in list.OrderBy(p => p.name))
            {
                cboPosition.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(u.name, u.id.ToString()));
            }          
        }
        
        private void BindGridParty()
        {
            if (Request.Params["idNV"] != null)
                idNV = Convert.ToInt32(Request.Params["idNV"].ToString());
            if (idNV != 0)
            {
                string strconnect = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
                DataTable tbl = SqlHelper.ExecuteDataset(strconnect, "HRM_GetPartyMemberByEmployee1", idNV, 0).Tables[0];
                gridDangVienControl.Caption = "Quản trị thông tin kiêm nhiệm của nhân viên " + objEmployee.GetEmployees(idNV).fullname;
                this.gridDangVienControl.DataSource = tbl;
                this.gridDangVienControl.DataBind();
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


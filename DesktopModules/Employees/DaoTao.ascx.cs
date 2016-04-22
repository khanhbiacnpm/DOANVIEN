using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System.Data;
using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxHiddenField;
using DotNetNuke.Entities.Tabs;
namespace VNPT.Modules.Employees
{
    partial class DaoTao : DotNetNuke.Entities.Modules.PortalModuleBase, DotNetNuke.Entities.Modules.IActionable
    {
        private string strTemplate;
        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }
        VNPT.Modules.Province.ProvinceInfo provice = new VNPT.Modules.Province.ProvinceInfo();
        VNPT.Modules.Province.ProvinceController objProvice = new VNPT.Modules.Province.ProvinceController();
        EmployeesInfo employees = new EmployeesInfo();
        EmployeesController objEmployees = new EmployeesController();
        Unit.UnitController objUnit = new Unit.UnitController();
        Qualification.QualificationController objQualification = new VNPT.Modules.Qualification.QualificationController();
        Training.TrainingController objTraining = new Training.TrainingController();        
        Training.TrainingInfo training = new Training.TrainingInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadcmbQuyetDinh();
                LoadcmbDiaDiemDaoTao();
                LoadcboTrainingForm();
                LoadcboQualification();
                calStartDateTraining.Date = DateTime.Now;
                calDateEnd.Date = DateTime.Now;
                if (cmbQuyetDinh.SelectedItem != null)
                {
                    BindGridTraining(cmbQuyetDinh.SelectedItem.Value.ToString());
                }
                if (Session["Decision"] != null)
                {
                    lbChoosen.Items.Clear();
                    this.lbChoosen.EnableViewState = true;
                    List<Training.TrainingInfo> list = objTraining.GetTrainingByDecision(Session["Decision"].ToString());
                    foreach (Training.TrainingInfo obj in list)
                    {
                        lbChoosen.Items.Add(new ListEditItem(objEmployees.GetEmployees(obj.employeeid).fullname, obj.employeeid.ToString()));
                    }
                    this.ASPxButton2.Enabled = true;
                }
                else
                {
                    this.lbChoosen.EnableViewState = false;
                }
            }
            if (sender != null)
            {
                if (sender.ToString() == "delete")
                {                
                    Response.Redirect(DotNetNuke.Common.Globals.ApplicationPath + "/Default.aspx?tabid=232");
                }
            }
        }
        private void LoadcmbQuyetDinh()
        {
            cmbQuyetDinh.Items.Clear();
            cmbQuyetDinh.Items.Add(new ListEditItem("----- Chọn quyết định -----","-1"));
            DataTable dt = new DataTable();
            string strSQL = "SELECT distinct decision FROM hrm.dbo.Training order by decision desc";
            dt.Clear();
            dt = VNPT.Modules.Notices.DataProvider.Select(strSQL);
            foreach (DataRow row in dt.Rows)
            {
                cmbQuyetDinh.Items.Add(new ListEditItem(row["decision"].ToString(), row["decision"].ToString()));
            }
            cmbQuyetDinh.SelectedIndex = 0;
            if (Session["Decision"] != null)
            {
                ListEditItem item = cmbQuyetDinh.Items.FindByValue(Session["Decision"].ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
            }            
        }        
        
        protected void cmbDonVi_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbDonVi = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao1").FindControl("cmbDonVi") as ASPxComboBox;

            if (cmbDonVi != null)
            {
                cmbDonVi.Items.Clear();
                List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                foreach (VNPT.Modules.Unit.UnitInfo u in list)
                {
                    cmbDonVi.Items.Add(new ListEditItem(u.name, u.id.ToString()));
                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        cmbDonVi.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                        {
                            cmbDonVi.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                        }
                    }
                }
                cmbDonVi.SelectedIndex = 0;
            }
        }

        protected void LoadcmbDiaDiemDaoTao()
        {         
            cmbDiaDiemDaoTao.Items.Clear();
            List<Province.ProvinceInfo> list = objProvice.GetProvinces();
            foreach (Province.ProvinceInfo u in list)
            {
                cmbDiaDiemDaoTao.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(u.Name.ToString(), u.Id.ToString()));
            }
            cmbDiaDiemDaoTao.SelectedIndex = 0; 
        }

        protected void LoadcboTrainingForm()
        {         
            cboTrainingForm.Items.Clear();
            TrainingForm.TrainingFormController objTrainingForm = new VNPT.Modules.TrainingForm.TrainingFormController();
            List<VNPT.Modules.TrainingForm.TrainingFormInfo> list = objTrainingForm.GetTrainingForms();
            foreach (VNPT.Modules.TrainingForm.TrainingFormInfo u in list)
            {
                cboTrainingForm.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(u.name, u.id.ToString()));
            }
            cboTrainingForm.SelectedIndex = 0;            
        }

        protected void LoadcboQualification()
        {            
            cboQualification.Items.Clear();
            List<VNPT.Modules.Qualification.QualificationsInfo> list = objQualification.GetQualifications();
            foreach (VNPT.Modules.Qualification.QualificationsInfo u in list)
            {
                cboQualification.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(u.name, u.id.ToString()));
            }
            cboQualification.SelectedIndex = 0;
        }

        protected void lbAvailable_callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxListBox lstBox = sender as ASPxListBox;
            string idDonVi = e.Parameter.ToString();
            List<EmployeesInfo> list = objEmployees.GetEmployeesByUnit(Convert.ToInt32(idDonVi));
            foreach (EmployeesInfo emp in list)
            {
                lstBox.Items.Add(new ListEditItem(emp.fullname.ToString(), emp.id.ToString()));
            }
        }
        
        protected void grdTraining_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "id")
                {
                    ASPxLabel lblTime = grdTraining.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblTime") as ASPxLabel;
                    lblTime.Text = objTraining.GetTraining(Int32.Parse(e.CellValue.ToString())).fromdate.ToShortDateString() + " -" + objTraining.GetTraining(Int32.Parse(e.CellValue.ToString())).todate.ToShortDateString();
                }
                if (e.DataColumn.FieldName == "employeeid")
                {
                    ASPxLabel lblEmp = grdTraining.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblEmp") as ASPxLabel;
                    lblEmp.Text = objEmployees.GetEmployees(Int32.Parse(e.CellValue.ToString())).fullname;
                }
                if (e.DataColumn.FieldName == "decision")
                {
                    ASPxHyperLink hyperDowload = grdTraining.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "hyperDowload") as ASPxHyperLink;
                    ASPxImage imgFile = grdTraining.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgFile") as ASPxImage;
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
            catch { }
        }
        private void BindGridTraining(string decsion)
        {
            this.grdTraining.DataSource = objTraining.GetTrainingByDecision(decsion.Trim());
            this.grdTraining.DataBind();
        }                              
        protected void grdTraining_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (!e.Parameters.ToString().Equals(""))
            {
                this.grdTraining.DataSource = objTraining.GetTrainingByDecision(e.Parameters.ToString());
                this.grdTraining.DataBind();
            }
            else
            {                              
                if (Session["Decision"] != null) {
                    this.grdTraining.DataSource = objTraining.GetTrainingByDecision(Session["Decision"].ToString());
                    this.grdTraining.DataBind();
                    Session.Remove("Decision");
                }
            }
        }
        protected void cmbQuyetDinh_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox cmbQD = sender as ASPxComboBox;
            cmbQuyetDinh.Items.Clear();
            DataTable dt = new DataTable();
            string strSQL = "SELECT distinct decision FROM hrm.dbo.Training order by decision desc";
            dt.Clear();
            dt = VNPT.Modules.Notices.DataProvider.Select(strSQL);
            foreach (DataRow row in dt.Rows)
            {
                cmbQD.Items.Add(new ListEditItem(row["decision"].ToString(), row["decision"].ToString()));
            }
            cmbQD.SelectedIndex = 0;
            if (Session["Decision"] != null)
            {
                ListEditItem item = cmbQD.Items.FindByValue(Session["Decision"].ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        //upload file tai day 
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "";
            string dv = "DT" + DateTime.Now.ToShortDateString().Replace("/", "_") + "_";
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {                
                name = CreateServerFilename(upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + dv + name.Trim();
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
            }
            Session["img"] = dv + name;
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
        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxTextBox txtTrainingEmpId = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtTrainingEmpId") as ASPxTextBox;
            ASPxTextBox txtTrainingId = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtTrainingId") as ASPxTextBox;
            ASPxTextBox txtSkill = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtSkill") as ASPxTextBox;
            ASPxTextBox txtDecision = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtTrainingDecision") as ASPxTextBox;
            ASPxTextBox txtCoSoDaoTao = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtCoSoDaoTao") as ASPxTextBox;
            ASPxTextBox txtTrainingDecision = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtTrainingDecision") as ASPxTextBox;
            ASPxDateEdit calDateEnd = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("calDateEnd") as ASPxDateEdit;
            ASPxDateEdit calStartDateTraining = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("calStartDateTraining") as ASPxDateEdit;
            ASPxListBox lstBoxChon = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao1").FindControl("lbChoosen") as ASPxListBox;
            ASPxTextBox txtFee = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("txtFee") as ASPxTextBox;
            ASPxComboBox cboQualification = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("cboQualification") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("cboTrainingForm") as ASPxComboBox;            
            ASPxComboBox cmbDonViToChuc = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("cmbDonViToChuc") as ASPxComboBox;
            ASPxComboBox cmbDiaDiemDaoTao = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("cmbDiaDiemDaoTao") as ASPxComboBox;
            ASPxDateEdit tuNgay = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("calStartDateTraining") as ASPxDateEdit;
            ASPxDateEdit denNgay = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("calDateEnd") as ASPxDateEdit;
            ASPxComboBox cboResult = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("cboResult") as ASPxComboBox;
            ASPxHiddenField HiddentfileKem = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("HiddentfileKem") as ASPxHiddenField;
            ASPxCheckBox checkCamKet = ASPxCallbackPanel1.FindControl("RoundPanelDaoTao2").FindControl("checkCamKet") as ASPxCheckBox;
            

            if (e.Parameter.ToString().Equals("1"))
            {
                txtCoSoDaoTao.Text = "";
                txtDecision.Text = "";
                txtFee.Text = "";
                txtSkill.Text = "";
                LoadcboQualification();
                LoadcboTrainingForm();
                LoadcmbDiaDiemDaoTao();
                lbChoosen.Items.Clear();
                lstBoxChon.EnableViewState = false;
                Session["Add"] = 1;
                lbChoosen.EnableViewState = false;
            }
            else if (e.Parameter.ToString().Equals(""))
            {
                txtDecision.ReadOnly = false;
                List<Training.TrainingInfo> emps = objTraining.GetTrainingByDecision(txtDecision.Text.ToString());

                if (emps.Count > 0)
                {
                    foreach (Training.TrainingInfo item in emps)
                    {
                        this.training = objTraining.GetTraining(Int32.Parse(item.id.ToString()));
                        if (this.training != null)
                        {
                            this.objTraining.DeleteTraining(training);
                        }
                    }
                }

                if (Session["Add"] != null)
                {
                    if (Session["Decision"] != null)
                    {
                        List<Training.TrainingInfo> list = objTraining.GetTrainingByDecision(Session["Decision"].ToString());
                        foreach (Training.TrainingInfo obj in list)
                        {
                            ListEditItem item = lbChoosen.Items.FindByValue(obj.employeeid.ToString());
                            if (item != null)
                            {
                                lbChoosen.Items.Remove(item);
                            }
                        }
                    }
                    foreach (ListEditItem item in lbChoosen.Items)
                    {
                        this.training.id = -1;
                        this.training.donvitochucId = Convert.ToInt32(cmbDonViToChuc.SelectedItem.Value.ToString());
                        this.training.diadiemtochucId = Convert.ToInt32(cmbDiaDiemDaoTao.SelectedItem.Value.ToString());
                        this.training.decision = txtDecision.Text;
                        this.training.schoolname = txtCoSoDaoTao.Text.Trim();
                        this.training.skill = txtSkill.Text;
                        this.training.fee = txtFee.Text;
                        this.training.fromdate = Convert.ToDateTime(calStartDateTraining.Value);
                        this.training.todate = Convert.ToDateTime(calDateEnd.Value);
                        this.training.editor = this.UserId;
                        this.training.result = cboResult.SelectedItem.Text;
                        this.training.modifieddate = DateTime.Now;
                        this.training.ip = HttpContext.Current.Request.UserHostAddress;
                        this.training.employeeid = Int32.Parse(item.Value.ToString());
                        this.training.qualificationid = Int32.Parse(cboQualification.SelectedItem.Value.ToString());
                        this.training.trainingformid = Int32.Parse(cboTrainingForm.SelectedItem.Value.ToString());
                        this.training.camket = checkCamKet.Checked == true ? checkCamKet.Checked : false;
                        if(Session["img"] !=null)                        
                        {
                            this.training.fileKem = Session["img"].ToString();
                        }
                        Session.Remove("img");
                        objTraining.AddTraining(this.training);
                    }                                            
                }
                else {

                    foreach (ListEditItem item in lbChoosen.Items)
                    {
                        this.training.id = -1;
                        this.training.donvitochucId = Convert.ToInt32(cmbDonViToChuc.SelectedItem.Value.ToString());
                        this.training.diadiemtochucId = Convert.ToInt32(cmbDiaDiemDaoTao.SelectedItem.Value.ToString());
                        this.training.decision = txtDecision.Text;
                        this.training.schoolname = txtCoSoDaoTao.Text.Trim();
                        this.training.skill = txtSkill.Text;
                        this.training.fee = txtFee.Text;
                        this.training.fromdate = Convert.ToDateTime(calStartDateTraining.Value);
                        this.training.todate = Convert.ToDateTime(calDateEnd.Value);
                        this.training.result = cboResult.SelectedItem.Text;
                        this.training.editor = this.UserId;
                        this.training.modifieddate = DateTime.Now;
                        this.training.ip = HttpContext.Current.Request.UserHostAddress;
                        this.training.employeeid = Int32.Parse(item.Value.ToString());
                        this.training.qualificationid = Int32.Parse(cboQualification.SelectedItem.Value.ToString());
                        this.training.trainingformid = Int32.Parse(cboTrainingForm.SelectedItem.Value.ToString());
                        this.training.camket = checkCamKet.Checked == true ? checkCamKet.Checked : false;
                        if(Session["img"] !=null)
                        {
                            this.training.fileKem = Session["img"].ToString();
                        }
                        Session.Remove("img");
                        objTraining.AddTraining(this.training);
                    }
                }
                Session["Decision"] = txtDecision.Text.Trim();
                Session.Remove("Add");               
                ASPxWebControl.RedirectOnCallback(DotNetNuke.Common.Globals.ApplicationPath + "/Default.aspx?tabid=232");                
            }
            else if (e.Parameter.ToString().Equals("2"))
            {
                Session.Remove("Add");
                List<Training.TrainingInfo> list = objTraining.GetTrainingByDecision(cmbQuyetDinh.SelectedItem.Value.ToString());
                foreach (Training.TrainingInfo obj in list)
                {
                    this.training = obj;                   
                }
                if (this.training != null)
                {
                    if (training.schoolname != null)
                    {
                        txtCoSoDaoTao.Text = training.schoolname.ToString();
                    }
                    if (training.decision != null)
                    {
                        txtDecision.Text = training.decision.ToString();
                    }
                    if (training.fee != null)
                    {
                        txtFee.Text = training.fee.ToString();
                    }
                    if (training.skill != null)
                    {
                        txtSkill.Text = training.skill.ToString();
                    }

                    //txtDecision.ReadOnly = true;
                    ListEditItem item1 = cboQualification.Items.FindByValue(training.qualificationid.ToString());
                    if (item1 != null)
                    {
                        item1.Selected = true;
                    }
                    ListEditItem item7 = cboResult.Items.FindByText(training.result.ToString());
                    if (item7 != null)
                    {
                        item7.Selected = true;
                    }
                    ListEditItem item2 = cboTrainingForm.Items.FindByValue(training.trainingformid.ToString());
                    if (item2 != null)
                    {
                        item2.Selected = true;
                    }
                    ListEditItem item3 = cmbDonViToChuc.Items.FindByValue(training.donvitochucId.ToString());
                    if (item3 != null)
                    {
                        item3.Selected = true;
                    }
                    ListEditItem item4 = cmbDiaDiemDaoTao.Items.FindByValue(training.diadiemtochucId.ToString());
                    if (item4 != null)
                    {
                        item4.Selected = true;
                    }
                    tuNgay.Date = training.fromdate;
                    denNgay.Date = training.todate;
                }
            }
        }
        protected void btXoa_Click(object sender, EventArgs e)
        {
            List<Training.TrainingInfo> list = objTraining.GetTrainingByDecision(cmbQuyetDinh.SelectedItem.Value.ToString());
            foreach (Training.TrainingInfo obj in list)
            {
                this.objTraining.DeleteTraining(obj);
            }
            Page_Load("delete", null);
        }
        protected void cmbQuyetDinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cmbQuyetDinh.SelectedIndex > 0)
            {
                lbChoosen.Items.Clear();
                this.lbChoosen.EnableViewState = true;
                List<Training.TrainingInfo> list = objTraining.GetTrainingByDecision(cmbQuyetDinh.SelectedItem.Value.ToString());
                foreach (Training.TrainingInfo obj in list)
                {
                    lbChoosen.Items.Add(new ListEditItem(objEmployees.GetEmployees(obj.employeeid).fullname, obj.employeeid.ToString()));
                }
                Session["Decision"] = cmbQuyetDinh.SelectedItem.Value.ToString();
                BindGridTraining(cmbQuyetDinh.SelectedItem.Value.ToString());
                this.ASPxButton2.Enabled = true;
            }
            else {
                lbChoosen.Items.Clear();
                this.ASPxButton2.Enabled = false;
                this.grdTraining.DataSource=null;
                this.grdTraining.DataBind();
            }
        }
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                DotNetNuke.Entities.Modules.Actions.ModuleActionCollection Actions = new DotNetNuke.Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                DotNetNuke.Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }
    }
}

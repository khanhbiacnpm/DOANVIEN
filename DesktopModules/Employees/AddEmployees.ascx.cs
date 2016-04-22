using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Design;

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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;
using DotNetNuke.UI.Utilities;
using DevExpress.Web.ASPxUploadControl;
using DotNetNuke.Common;
using DevExpress.Web.ASPxHiddenField;
using System.Text.RegularExpressions;
using DevExpress.Web.ASPxClasses;
using System.Drawing;

namespace VNPT.Modules.Employees
{
    partial class AddEmployees : PortalModuleBase, IActionable
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
        VNPT.Modules.Nationality.NationalityController objNationlity = new VNPT.Modules.Nationality.NationalityController();
        VNPT.Modules.SocialWelfareType.SocialWelfareTypeInfoController objSocialWelfareType = new VNPT.Modules.SocialWelfareType.SocialWelfareTypeInfoController();
        VNPT.Modules.SoldierType.SoldierTypeController objSolider = new VNPT.Modules.SoldierType.SoldierTypeController();
        VNPT.Modules.StateManagement.StateManagementController objSate = new VNPT.Modules.StateManagement.StateManagementController();
        VNPT.Modules.SocietyHistory.SocietyHistoryInfo society = new VNPT.Modules.SocietyHistory.SocietyHistoryInfo();
        VNPT.Modules.SocietyHistory.SocietyHistoryController objSociety = new VNPT.Modules.SocietyHistory.SocietyHistoryController();

        EmployeesController objEmployees = new EmployeesController();

        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();
        SoldierType.SoldierTypeController objSoliderType = new VNPT.Modules.SoldierType.SoldierTypeController();
        HealthCare.HealthCareController objHealth = new VNPT.Modules.HealthCare.HealthCareController();
        SocietyHistory.SocietyHistoryController objSocialHistory = new VNPT.Modules.SocietyHistory.SocietyHistoryController();
        EmployeesInfo employees = new EmployeesInfo();
        Unit.UnitController objUnit = new Unit.UnitController();
        Nationality.NationalityController objNation = new VNPT.Modules.Nationality.NationalityController();
        StateManagement.StateManagementController objState = new VNPT.Modules.StateManagement.StateManagementController();
        Religion.ReligionController objReligion = new VNPT.Modules.Religion.ReligionController();
        Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        PoliticalConsciousness.PoliticalConsciousnessController objPolitical = new VNPT.Modules.PoliticalConsciousness.PoliticalConsciousnessController();
        Qualification.QualificationController objQualification = new VNPT.Modules.Qualification.QualificationController();
        BloodGroup.BloodGroupController objBlood = new VNPT.Modules.BloodGroup.BloodGroupController();
        SocialWelfareType.SocialWelfareTypeInfoController objSocial = new VNPT.Modules.SocialWelfareType.SocialWelfareTypeInfoController();
        FamilyRelationship.FamilyRelationshipController obiFamily = new FamilyRelationship.FamilyRelationshipController();
        FamilyRelationship.FamilyRelationshipInfo family = new FamilyRelationship.FamilyRelationshipInfo();
        VNPT.Modules.Relationship.RelationshipController objRelation = new VNPT.Modules.Relationship.RelationshipController();
        WorkHistory.WorkHistoryController objHistory = new WorkHistory.WorkHistoryController();
        WorkHistory.WorkHistoryInfo history = new WorkHistory.WorkHistoryInfo();
        Training.TrainingController objTraining = new Training.TrainingController();
        Training.TrainingInfo training = new Training.TrainingInfo();
        VNPT.Modules.PartyMember.PartyMemberController objParty = new VNPT.Modules.PartyMember.PartyMemberController();
        VNPT.Modules.PartyMember.PartyMemberInfo party = new VNPT.Modules.PartyMember.PartyMemberInfo();
        ChangeSalary.ChangeSalaryController objSalary = new ChangeSalary.ChangeSalaryController();
        ChangeSalary.ChangeSalaryInfo salary = new ChangeSalary.ChangeSalaryInfo();
        VNPT.Modules.SalaryType.SalaryTypeController objSalaryType = new VNPT.Modules.SalaryType.SalaryTypeController();
        VNPT.Modules.RewardDiscipline.RewardDisciplineController objRewaard = new VNPT.Modules.RewardDiscipline.RewardDisciplineController();
        VNPT.Modules.RewardDiscipline.RewardDisciplineInfo reward = new VNPT.Modules.RewardDiscipline.RewardDisciplineInfo();
        VNPT.Modules.EmployeesHistory.EmployeesHistoryInfo empHistory = new VNPT.Modules.EmployeesHistory.EmployeesHistoryInfo();
        VNPT.Modules.EmployeesHistory.EmployeesHistoryController objEmpHistory = new VNPT.Modules.EmployeesHistory.EmployeesHistoryController();
        VNPT.Modules.HealthCare.HealthCareInfo health = new VNPT.Modules.HealthCare.HealthCareInfo();
        Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
        Philip.Modules.EmpQualification.EmpQualificationController objEmpQualification = new Philip.Modules.EmpQualification.EmpQualificationController();
        Philip.Modules.EmpQualification.EmpQualificationInfo empquanlification = new Philip.Modules.EmpQualification.EmpQualificationInfo();
        Philip.Modules.Professional.ProfessionalController objProfessional = new Philip.Modules.Professional.ProfessionalController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetDefault();
                if (Session["BC"] != null)
                {
                    Session.Remove("BC");
                }
                if (Session["idNhanVien"] != null)
                {
                    Session.Remove("idNhanVien");
                }
            }
            if (Session["idNhanVien"] != null)
            {
                string id = Session["idNhanVien"].ToString();
                if (id.Contains("e"))
                {
                    BindgridBangCap(Int32.Parse(id.Substring(1)));
                }
                else
                {
                    BindgridBangCap(Int32.Parse(id));
                }
            }            
        }
        private static string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
        }
        
        private bool CheckCMND(string cmnd, Employees.EmployeesInfo emp)
        {
            bool result = true;
            if (cmnd.Trim() != "")
            {
                if (emp.identitynum.Trim() != cmnd.Trim())//kiem tra truong hop update nhanvien da co so CMND
                {
                    if (objEmployees.GetEmployeeByCardId(cmnd) != null)
                    {
                        result = false;
                    }
                }
                else
                {
                    result = true;
                }
            }
            return result;
        }
        private bool CheckCMND(string cmnd)
        {
            bool result = true;
            if (cmnd.Trim() != "")
            {
                if (objEmployees.GetEmployeeByCardId(cmnd) != null)
                {
                    result = false;
                }
            }
            return result;
        }
        private int CheckCode(string code, Employees.EmployeesInfo emp)
        {
            int result = 0;
            //0 la luu duoc
            //1 la trung ma
            //2 la ma dai hon 4
            if (code.Trim() != "")
            {
                if (emp.empcode.Trim() != code.Trim())//update ma ma  thay doi 
                {
                    if (code.Length > 4)//ma lon hon 4
                    {
                        result = 2;
                    }
                    else
                    {
                        if (objEmployees.GetEmployeeByCode(code) != null)//trung hay ko trung
                        {
                            result = 1;
                        }
                    }
                }
                else
                {
                    result = 0;
                }
            }
            return result;
        }
        private int CheckCode(string code)
        {
            int result = 0;
            if (code.Trim() != "")
            {
                if (code.Length > 4)//ma lon hon 4
                {
                    result = 2;
                }
                else
                {
                    if (objEmployees.GetEmployeeByCode(code) != null)
                    {
                        result = 1;
                    }
                }
            }
            return result;
        }
        private void ReadOnlyBoxEmployee(bool display)
        {
            dateNgaySinh.Enabled = display;
            dateNgayCap.Enabled = display;
            dateNgayKetNapDCSVN.Enabled = display;
            dateNgayKetNapDTNCSHCM.Enabled = display;
            uploadHinhAnh.Visible = display;
            txtMST.Enabled = display;
            txtDienThoai.Enabled = display;
            txtChoOHienNay.Enabled = display;
            txtDienThoai.Enabled = display;
            txtEmail.Enabled = display;
            txtHoTen.Enabled = display;
            txtMST.Enabled = display;
            txtNguyenQuanHuyen.Enabled = display;
            txtNguyenQuanXa.Enabled = display;
            txtNoiKetNapDCSVN.Enabled = display;
            txtNoiKetNapDTNCSHCM.Enabled = display;
            txtNoiSinhHuyen.Enabled = display;
            txtNoiSinhXa.Enabled = display;
            txtSoCMND.Enabled = display;
            txtTenKhac.Enabled = display;
            txtThuongTru.Enabled = display;
            cmbGioiTinh.Enabled = display;
            cmbLyLuanCT.Enabled = display;
            cmbNgoaiNgu.Enabled = display;
            cmbNguyenQuanTinh.Enabled = display;
            cmbNoiCap.Enabled = display;
            cmbNoiSinhTinh.Enabled = display;
            cmbQuocTich.Enabled = display;
            cmbTinHoc.Enabled = display;
            cmbTonGiao.Enabled = display;
            cmbTPBT.Enabled = display;
            cmbTDPhoThong.Enabled = display;
            cmbTPGD.Enabled = display;
            cmbDanToc.Enabled = display;
            cmbLoaiHopDong.Enabled = display;
        }
    
        protected void uploadHinhAnh_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            string name = "", newname = "", fullname3 = "";
            string ngay, thang, nam, gio, phut, giay;
            giay = DateTime.Now.Second.ToString();
            phut = DateTime.Now.Minute.ToString();
            gio = DateTime.Now.Hour.ToString();
            ngay = DateTime.Now.Day.ToString();
            thang = DateTime.Now.Month.ToString();
            nam = DateTime.Now.Year.ToString();
            newname = nam + thang + ngay + gio + phut + giay;
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                name = CreateServerFilename(upload.FileName);
                fullname3 = newname + "_" + name;
            }
            else
            {
                name = newname + "_" + Session["img"];
            }
            string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/EmpImages/") + fullname3.Trim();
            (sender as ASPxUploadControl).SaveAs(fullFilePath);
            if (name != null && name.Trim() != "")
            {
                this.employees.image = fullname3;
            }
            else { this.employees.image = ""; }
            Session["img"] = fullname3;
        }
        
        // khanh
        protected void callbackPanelEmployees_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (e.Parameter.Equals("Luu"))
            {                
                
                    //if (txtMaNV.Text.Trim() != "")
                    //{
                        if (CheckCode(txtMaNV.Text.Trim()) == 0)
                        {
                            if (CheckCMND(txtSoCMND.Text.Trim()))
                            {
                                ThemNhanVien("Them");
                                callbackPanelEmployees.JSProperties["cpResultAddSuccess"] = true;
                            }
                            else { 
                                btLuuC.Enabled = true; 
                                callbackPanelEmployees.JSProperties["cpResultTrungSoCMND"] = true; 
                            }
                        }
                        else if (CheckCode(txtMaNV.Text.Trim()) == 2)
                        {
                            btLuuC.Enabled = true;
                            callbackPanelEmployees.JSProperties["cpLengthMa"] = true;
                        }
                        else if (CheckCode(txtMaNV.Text.Trim()) == 1)
                        {
                            btLuuC.Enabled = true;
                            callbackPanelEmployees.JSProperties["cpMaTrung"] = true;
                        }
                    //}
                    //else
                    //{
                    //    if (CheckCMND(txtSoCMND.Text.Trim()))
                    //    {
                    //        ThemNhanVien("Them");
                    //        callbackPanelEmployees.JSProperties["cpResultAddSuccess"] = true;
                    //    }
                    //    else {
                    //        btLuuC.Enabled = true;
                    //        callbackPanelEmployees.JSProperties["cpResultTrungSoCMND"] = true; 
                    //    }
                    //}
                
            }
            else if (e.Parameter.Trim() == "Huy")
            {
               
                ResetTextBoxEmployee();
            }            
        }
        private void ThemNhanVien(string str)
        {
            if (this.txtHoTen.Text.Trim() != "")
            {
                this.employees.fullname = this.txtHoTen.Text.Trim();
            }
            else { this.employees.fullname = ""; }

            if (this.txtMaNV.Text.Trim() != "")
            {
                this.employees.empcode = this.txtMaNV.Text.Trim();
            }
            else { this.employees.empcode = ""; }

            if (this.txtTenKhac.Text.Trim() != "")
            {
                this.employees.othername = this.txtTenKhac.Text.Trim();
            }
            else { this.employees.othername = ""; }

            this.employees.specialname = "";
            if (this.cmbGioiTinh.SelectedIndex == 0)
            {
                this.employees.sex = true;
            }
            else { this.employees.sex = false; }
            if (this.dateNgaySinh.Value != null)
            {
                this.employees.birthday = Convert.ToDateTime(this.dateNgaySinh.Value);
            }                        
            if (this.txtMST.Text.Trim() != "")
            {
                this.employees.taxcode = this.txtMST.Text.Trim();
            }
            else { this.employees.taxcode = ""; }
            //noi sinh
            if (this.cmbNoiSinhTinh.SelectedItem.Value.ToString() != "0")
            {
                this.employees.place_provinceid = Convert.ToInt32(cmbNoiSinhTinh.SelectedItem.Value.ToString());

                if (this.txtNoiSinhXa.Text.Trim() != "" || this.txtNoiSinhHuyen.Text.Trim() != "")
                {
                    this.employees.placeofbirth = this.txtNoiSinhXa.Text + " - " + this.txtNoiSinhHuyen.Text.Trim() + " - " + cmbNoiSinhTinh.SelectedItem.Text;
                }
                else { this.employees.placeofbirth = ""; }
            }
            else
            {
                if (this.txtNoiSinhXa.Text.Trim() != "" || this.txtNoiSinhHuyen.Text.Trim() != "")
                {
                    this.employees.placeofbirth = this.txtNoiSinhXa.Text + " - " + this.txtNoiSinhHuyen.Text.Trim();
                }
                else { this.employees.placeofbirth = ""; }
            }
            //nguyen quan
            if (this.cmbNguyenQuanTinh.SelectedItem.Value.ToString() != "0")
            {
                this.employees.nativeplace_provinceid = Convert.ToInt32(cmbNguyenQuanTinh.SelectedItem.Value.ToString());

                if (this.txtNguyenQuanXa.Text.Trim() != "" || this.txtNguyenQuanHuyen.Text.Trim() != "")
                {
                    this.employees.nativeplace = this.txtNguyenQuanXa.Text + " - " + this.txtNguyenQuanHuyen.Text.Trim() + " - " + cmbNguyenQuanTinh.SelectedItem.Text;
                }
                else { this.employees.nativeplace = ""; }
            }
            else
            {
                if (this.txtNguyenQuanXa.Text.Trim() != "" || this.txtNguyenQuanHuyen.Text.Trim() != "")
                {
                    this.employees.nativeplace = this.txtNguyenQuanXa.Text + " - " + this.txtNguyenQuanHuyen.Text.Trim();
                }
                else { this.employees.nativeplace = ""; }
            }
            if (this.txtThuongTru.Text != "")
            {
                this.employees.placeofresidence = txtThuongTru.Text.Trim();
            }
            else { this.employees.placeofresidence = ""; }

            if (this.txtChoOHienNay.Text != "")
            {
                this.employees.placeofcurrent = txtChoOHienNay.Text.Trim();
            }
            else { this.employees.placeofcurrent = ""; }

            if (this.txtDienThoai.Text != "")
            {
                this.employees.cellphone = this.txtDienThoai.Text.Trim();
                this.employees.officephone = this.txtDienThoai.Text.Trim();
            }
            else { this.employees.officephone = ""; }

            if (this.txtEmail.Text != "")
            {
                this.employees.email = this.txtEmail.Text.Trim();
            }
            else { this.employees.email = ""; }

            if (this.cmbTPGD.SelectedItem != null)
            {
                this.employees.familytypeid = Convert.ToInt32(cmbTPGD.SelectedItem.Value.ToString());
            }

            if (this.cmbTPBT.SelectedItem != null)
            {
                this.employees.familytype_currentid = Convert.ToInt32(cmbTPBT.SelectedItem.Value.ToString());
            }

            if (this.cmbDanToc.SelectedItem != null)
            {
                this.employees.nationalityid = Convert.ToInt32(cmbDanToc.SelectedItem.Value.ToString());
            }

            if (this.cmbTonGiao.SelectedItem != null)
            {
                this.employees.religionid = Int32.Parse(this.cmbTonGiao.SelectedItem.Value.ToString().Trim());
            }
            if (this.cmbQuocTich.SelectedItem != null)
            {
                this.employees.countryid = Int32.Parse(this.cmbQuocTich.SelectedItem.Value.ToString().Trim());
            }            

            // quoc tich con thieu

            if (this.txtSoCMND.Text.Trim() != "")
            {
                this.employees.identitynum = txtSoCMND.Text.Trim();
            }
            else { this.employees.identitynum = ""; }

            if (this.dateNgayCap.Value != null)
            {
                this.employees.dateofissue = Convert.ToDateTime(this.dateNgayCap.Value);
            }
            else { this.employees.dateofissue = Convert.ToDateTime("1/1/1900"); }

            if (this.cmbNoiCap.SelectedItem != null)
            {
                this.employees.provinceid = Convert.ToInt32(cmbNoiCap.SelectedItem.Value);
            }

            this.employees.healthid = 0;

            this.employees.height = "";

            this.employees.weigh = "";
            this.employees.placetomedicalexam = "";

            this.employees.bloodgroupid = 0;

            this.employees.socialinsurancenum = "";

            this.employees.datesocialinsurance = Convert.ToDateTime("1/1/1900");

            this.employees.healthinsurancenum = "";

            this.employees.soldiertypeid = 0;

            this.employees.socialwelfaretypeid = 0;

            if (this.dateNgayKetNapDTNCSHCM.Value != null)
            {
                this.employees.youthdate = dateNgayKetNapDTNCSHCM.Date;
            }
            else { this.employees.youthdate = Convert.ToDateTime("1/1/1900"); }

            if (this.txtNoiKetNapDTNCSHCM.Text.Trim() != "")
            {
                this.employees.youthplace = txtNoiKetNapDTNCSHCM.Text.Trim();
            }

            if (this.dateNgayKetNapDCSVN.Value != null)
            {
                this.employees.NgayKetNapDang = dateNgayKetNapDCSVN.Date;//partydate
            }
            else { this.employees.partydate = Convert.ToDateTime("1/1/1900"); }

            if (txtNoiKetNapDCSVN.Text.Trim() != "")
            {
                this.employees.NoiKetNapDang = txtNoiKetNapDCSVN.Text.Trim();//.partyplace
            }

            // tab 2

            if (this.cmbLyLuanCT.SelectedItem != null)
            {
                this.employees.politicalconsciousnessid = Int32.Parse(this.cmbLyLuanCT.SelectedItem.Value.ToString().Trim());
            }            
            if (cmbTDPhoThong.SelectedItem != null)
            {
                this.employees.culturalid = Convert.ToInt32(cmbTDPhoThong.SelectedItem.Value.ToString());
            }

            if (cmbTinHoc.SelectedItem != null)
            {
                this.employees.itid = Convert.ToInt32(cmbTinHoc.SelectedItem.Value.ToString());
            }

            if (cmbNgoaiNgu.SelectedItem != null)
            {
                this.employees.languageid = Convert.ToInt32(cmbNgoaiNgu.SelectedItem.Value.ToString());
            }

            // tab 3

            this.employees.unitrecruit = "";
            this.employees.employeetypeid = 0;

            this.employees.startdate = Convert.ToDateTime("1/1/1900");
            this.employees.daterecruit = Convert.ToDateTime("1/1/1900");
            this.employees.officeid = 0;

            this.employees.mainjob = "";
            this.employees.workeviroment = false;
            this.employees.positionid = 155;                                    
            this.employees.allowance = "";
            this.employees.note = "";

            //don vi yeu cau             

            this.employees.asalaryid = 0;
            this.employees.bsalaryid = 0;
            if (Session["img"] != null)
            {
                this.employees.image = Session["img"].ToString();
            }

            else { employees.idHinhThucDaoTao = 0; }
            // Loai hop dong
            if (cmbLoaiHopDong.SelectedItem != null)
            {
                this.employees.idLoaiHopDong = Convert.ToInt32(cmbLoaiHopDong.SelectedItem.Value);
            }
            else { employees.idLoaiHopDong = 0; }
            decimal uid = 0;
            bool dvcon = false;
            this.employees.DVYeuCau = 14;
            foreach (VNPT.Modules.Unit.UnitInfo u in objUnit.GetChildUnits(Int32.Parse(this.cmbDonViCTac.SelectedItem.Value.ToString())))
            {
                if (u.level == 1)
                {
                    uid = u.id;
                    dvcon = true;
                }
            }
            if (dvcon == true)
            {
                this.employees.unitid = uid;
            }
            else
            {
                this.employees.unitid = Int32.Parse(this.cmbDonViCTac.SelectedItem.Value.ToString());
            }
            employees.id = -1;
            objEmployees.AddEmployees(employees);
           
            if (Session["BC"] != null)
            {
                bool highest = false;
                DataTable table = new DataTable();
                table = (DataTable)Session["BC"];
                if (table.Rows.Count == 1)
                {
                    highest = true;
                }
                foreach (DataRow row in table.Rows)
                {                    
                    if (row["highest"].ToString().Trim().Equals("True"))
                    {
                        highest = true;
                        this.employees.qualificationid = Convert.ToInt32(row["qualificationid"].ToString());
                        this.employees.professionid = Convert.ToInt32(row["professionid"].ToString());
                        this.objEmployees.UpdateEmployees(employees);
                    }
                    this.empquanlification.id = -1;
                    this.empquanlification.qualificationid = Convert.ToInt32(row["qualificationid"].ToString());
                    this.empquanlification.professionid = Convert.ToInt32(row["professionid"].ToString());
                    this.empquanlification.trainingid = Convert.ToInt32(row["trainingid"].ToString());
                    this.empquanlification.result = row["result"].ToString();
                    this.empquanlification.empid = objEmployees.GetEmployeesByIdMax().id;
                    this.empquanlification.highest = highest;
                    this.empquanlification.schools = row["schools"].ToString();
                    this.empquanlification.danhhieu = row["danhhieu"].ToString();
                    this.empquanlification.NamTotNghiep = row["NamTotNghiep"].ToString();
                    this.objEmpQualification.AddEmpQualification(empquanlification);
                }
                Session.Remove("BC");                
            }
            if (Session["idNhanVien"] != null)
            {
                Session.Remove("idNhanVien");
            }
        }
        // chinhsua
       
        private string Xa(string str)
        {
            string x = "";
            string[] xa = str.Split('-', ',');
            if (xa != null && xa.Length > 1)
            {
                x = xa[0].ToString();
            }
            return x;
        }
        private string Huyen(string str)
        {
            string h = "";
            string[] Huyen = str.Split('-', ',');
            if (Huyen.Length > 1)
            {
                h = Huyen[1].ToString();
            }
            return h;
        }
        private string gioiTinh(bool _trangThai)
        {
            if (_trangThai) { return "Nam"; }
            return "Nữ";
        }
        private string TrangThai(int _trangThai)
        {
            if (_trangThai == 0) { return "Đang hoạt động"; }
            return "Nghỉ việc";
        }
        private void BindUnit()
        {
            if (!this.IsPostBack)
            {
               
                VNPT.Modules.Employees.EmployeesInfo emp = objEmployees.GetEmployeeByCode(this.UserInfo.Username);

                
                    cmbDonViCTac.Items.Clear();
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        cmbDonViCTac.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem("-- Chọn đơn vị --", "0"));
                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            cmbDonViCTac.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                            foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                            {
                                cmbDonViCTac.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                            }
                        }
                    }
                    cmbDonViCTac.SelectedIndex = 0;
               
                
            }
        }
        private void ResetTextBoxEmployee()
        {
            hiddenHinh.Value = "";
            hiddenIDDonVi.Value = "";
            txtChoOHienNay.Text = "";
            txtDienThoai.Text = "";
            txtEmail.Text = "";
            txtHoTen.Text = "";
            txtMaNV.Text = "";
            txtMST.Text = "";
            txtNguyenQuanHuyen.Text = "";
            txtNguyenQuanXa.Text = "";
            txtNoiKetNapDCSVN.Text = "";
            txtNoiKetNapDTNCSHCM.Text = "";
            txtNoiSinhHuyen.Text = "";
            txtNoiSinhXa.Text = "";
            txtSoCMND.Text = "";
            txtTenKhac.Text = "";
            txtThuongTru.Text = "";
            //cmbBangCap.SelectedIndex = 0;
            cmbGioiTinh.SelectedIndex = 0;
            cmbLyLuanCT.SelectedIndex = 0;
            //cmbCNDaoTao.SelectedIndex = 0;
            cmbNgoaiNgu.SelectedIndex = 0;
            cmbNguyenQuanTinh.SelectedIndex = 0;
            cmbNoiCap.SelectedIndex = 0;
            cmbNoiSinhTinh.SelectedIndex = 0;
            //cmbQuanLyNhaNuoc.SelectedIndex = 0;
            cmbQuocTich.SelectedIndex = 0;
            cmbTinHoc.SelectedIndex = 0;
            cmbTonGiao.SelectedIndex = 0;
            cmbTPBT.SelectedIndex = 0;
            cmbTDPhoThong.SelectedIndex = 0;
            cmbTPGD.SelectedIndex = 0;
            cmbDanToc.SelectedIndex = 0;
            //cboTrainingForm.SelectedIndex = 0;
            if (Session["BC"] != null)
            {
                Session.Remove("BC");
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
  
        #region gridBangCap
        private void CreateTable(DataTable table)
        {
            DataColumn myDataColumn;
            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "id";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "empid";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "qualificationid";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "professionid";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "trainingid";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "result";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "highest";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "schools";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "danhhieu";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "NamTotNghiep";
            table.Columns.Add(myDataColumn);

            myDataColumn = new DataColumn();
            myDataColumn.DataType = Type.GetType("System.String");
            myDataColumn.ColumnName = "ghichu";
            table.Columns.Add(myDataColumn);
        }
        protected void gridBangCap_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox cmbBangCap = gridBangCap.FindEditFormTemplateControl("cmbBangCap") as ASPxComboBox;
            ASPxComboBox cmbCNDaoTao = gridBangCap.FindEditFormTemplateControl("cmbCNDaoTao") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = gridBangCap.FindEditFormTemplateControl("cboTrainingForm") as ASPxComboBox;
            ASPxComboBox cmbResult = gridBangCap.FindEditFormTemplateControl("cmbResult") as ASPxComboBox;
            ASPxCheckBox checkCaoNhat = gridBangCap.FindEditFormTemplateControl("checkBangCapCaoNhat") as ASPxCheckBox;
            ASPxTextBox txtTruongCap = gridBangCap.FindEditFormTemplateControl("txtTruongCap") as ASPxTextBox;
            ASPxTextBox txtDanhHieu = gridBangCap.FindEditFormTemplateControl("txtDanhHieu") as ASPxTextBox;
            ASPxTextBox txtNamTotNghiep = gridBangCap.FindEditFormTemplateControl("txtNamTotNghiep") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridBangCap.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;

            DataTable table = new DataTable();
            bool highest = false;
            if (checkCaoNhat.Checked)
            {
                highest = true;                
                this.employees.qualificationid = Int32.Parse(cmbBangCap.SelectedItem.Value.ToString());
                this.employees.professionid = Convert.ToInt32(cmbCNDaoTao.SelectedItem.Value.ToString());                

                this.objEmployees.UpdateEmployees(employees);
            }
            
                //them moi chuc danh, luu tam vao datatble
                int maxId = 0;
                if (Session["BC"] != null)
                {
                    maxId = table.Rows.Count;
                    table = (DataTable)Session["BC"];
                    for (int i = 0; i < table.Rows.Count; i++)
                    {
                        maxId = Convert.ToInt32(table.Rows[i]["id"].ToString());
                        for (int j = 1; j < table.Rows.Count; j++)
                        {
                            if (maxId < Convert.ToInt32(table.Rows[j]["id"].ToString()))
                            {
                                maxId = Convert.ToInt32(table.Rows[j]["id"].ToString());
                            }
                        }
                    }
                }
                else
                {
                    CreateTable(table);
                }
                DataRow row = table.NewRow();
                row["id"] = maxId + 1;
                row["empid"] = objEmployees.GetEmployeesByIdMax().id + 1 + "";
                row["qualificationid"] = cmbBangCap.SelectedItem.Value.ToString();
                row["professionid"] = cmbCNDaoTao.SelectedItem.Value.ToString();
                row["trainingid"] = cboTrainingForm.SelectedItem.Value.ToString();
                row["result"] = cmbResult.SelectedItem.Text.ToString();
                row["highest"] = highest.ToString();
                row["schools"] = txtTruongCap.Text.Trim();
                row["danhhieu"] = txtDanhHieu.Text.Trim();
                row["NamTotNghiep"] = txtNamTotNghiep.Text.Trim();
                row["ghichu"] = memoGhiChu.Text.Trim();
                table.Rows.Add(row);
                Session["BC"] = table;
                gridBangCap.CancelEdit();
                e.Cancel = true;
                gridBangCap.DataSource = table;
                gridBangCap.DataBind();
           
        }
        protected void gridBangCap_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox cmbBangCap = gridBangCap.FindEditFormTemplateControl("cmbBangCap") as ASPxComboBox;
            ASPxComboBox cmbCNDaoTao = gridBangCap.FindEditFormTemplateControl("cmbCNDaoTao") as ASPxComboBox;
            ASPxComboBox cboTrainingForm = gridBangCap.FindEditFormTemplateControl("cboTrainingForm") as ASPxComboBox;
            ASPxComboBox cmbResult = gridBangCap.FindEditFormTemplateControl("cmbResult") as ASPxComboBox;
            ASPxCheckBox checkCaoNhat = gridBangCap.FindEditFormTemplateControl("checkBangCapCaoNhat") as ASPxCheckBox;
            HiddenField idBangCap = gridBangCap.FindEditFormTemplateControl("idBangCap") as HiddenField;
            HiddenField hiddenIdEmp = gridBangCap.FindEditFormTemplateControl("hiddenEmpId") as HiddenField;
            ASPxTextBox txtTruongCap = gridBangCap.FindEditFormTemplateControl("txtTruongCap") as ASPxTextBox;
            ASPxTextBox txtDanhHieu = gridBangCap.FindEditFormTemplateControl("txtDanhHieu") as ASPxTextBox;
            ASPxTextBox txtNamTotNghiep = gridBangCap.FindEditFormTemplateControl("txtNamTotNghiep") as ASPxTextBox;
            ASPxMemo memoGhiChu = gridBangCap.FindEditFormTemplateControl("memoGhiChu") as ASPxMemo;
            DataTable table = new DataTable();
            bool highest = false;
            if (checkCaoNhat.Checked)
            {
                highest = true;
                this.employees.qualificationid = Int32.Parse(cmbBangCap.SelectedItem.Value.ToString());
                this.employees.professionid = Convert.ToInt32(cmbCNDaoTao.SelectedItem.Value.ToString());
                this.objEmployees.UpdateEmployees(employees);
            }

            if (Session["BC"] != null)
            {
                table = (DataTable)Session["BC"];
                foreach (DataRow row in table.Rows)
                {
                    if (row["id"].ToString().Equals(e.Keys[0].ToString()))
                    {
                        row["empid"] = hiddenIdEmp.Value.ToString();
                        row["qualificationid"] = cmbBangCap.SelectedItem.Value.ToString();
                        row["professionid"] = cmbCNDaoTao.SelectedItem.Value.ToString();
                        row["trainingid"] = cboTrainingForm.SelectedItem.Value.ToString();
                        row["result"] = cmbResult.SelectedItem.Text.ToString();
                        row["highest"] = highest.ToString();
                        row["schools"] = txtTruongCap.Text.Trim();
                        row["danhhieu"] = txtDanhHieu.Text.Trim();
                        row["NamTotNghiep"] = txtNamTotNghiep.Text.Trim();
                        row["ghichu"] = memoGhiChu.Text.Trim();
                        table.AcceptChanges();
                        break;
                    }
                }
                Session["BC"] = table;
                gridBangCap.CancelEdit();
                e.Cancel = true;
                gridBangCap.DataSource = table;
                gridBangCap.DataBind();
            }
            
        }
        protected void gridBangCap_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable table = new DataTable();
            if (Session["BC"] != null)
            {
                table = (DataTable)Session["BC"];
                foreach (DataRow row in table.Rows)
                {
                    if (row["id"].ToString().Equals(e.Keys[0].ToString()))
                    {
                        table.Rows.Remove(row);
                        break;
                    }
                }
                Session["BC"] = table;
                gridBangCap.CancelEdit();
                e.Cancel = true;
                gridBangCap.DataSource = table;
                gridBangCap.DataBind();
            }
           
        }
        protected void gridBangCap_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='pink';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
            //grid.f
        }
        protected void gridBangCap_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "qualificationid")
            {
                ASPxLabel lbl_BangCap = gridBangCap.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_BangCap") as ASPxLabel;
                lbl_BangCap.Text = objQualification.GetQualification(Convert.ToInt32(e.CellValue.ToString())).name.ToString();
            }
            if (e.DataColumn.FieldName == "professionid")
            {
                ASPxLabel lbl_CN = gridBangCap.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_CN") as ASPxLabel;
                lbl_CN.Text = e.CellValue.ToString() != "0" ? objProfessional.GetProfessional(Convert.ToInt32(e.CellValue.ToString())).name.ToString() : "";
            }
            if (e.DataColumn.FieldName == "trainingid")
            {
                TrainingForm.TrainingFormController objTrainingForm = new VNPT.Modules.TrainingForm.TrainingFormController();
                ASPxLabel lbl_HTDT = gridBangCap.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_HTDT") as ASPxLabel;
                lbl_HTDT.Text = objTrainingForm.GetTrainingForm(Convert.ToInt32(e.CellValue.ToString())).name.ToString();
            }
        }
        protected void cmbResult_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbResult = sender as ASPxComboBox;
            if (GetTextBangCap("empid") != null && GetTextBangCap("empid").Trim() != "")
            {
                ListEditItem item = cmbResult.Items.FindByText(GetTextBangCap("empid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        protected void gridBangCap_CancelRowEdit(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

        }
        private void BindgridBangCap(int ItemIdEmp)
        {
            gridBangCap.DataSource = objEmpQualification.GetEmpQualificationByEmp(ItemIdEmp);
            gridBangCap.DataBind();
        }
        protected void hiddenEmpId_Load(object sender, EventArgs e)
        {
            HiddenField hiddenIdEmp = sender as HiddenField;
            if (GetTextBangCap("empid") != null && GetTextBangCap("empid").Trim() != "")
            {
                hiddenIdEmp.Value = GetTextBangCap("empid");
            }
        }
        protected void idBangCap_Load(object sender, EventArgs e)
        {
            HiddenField hiddenIdBangCap = sender as HiddenField;
            if (GetTextBangCap("id") != null && GetTextBangCap("id").Trim() != "")
            {
                hiddenIdBangCap.Value = GetTextBangCap("id");
            }
        }
        // result      
        protected void CaoNhat_Init(object sender, EventArgs e)
        {
            ASPxCheckBox checkBangCapCaoNhat = sender as ASPxCheckBox;
            if (Session["BC"] != null)
            {
                DataTable table = (DataTable)Session["BC"];
                foreach (DataRow row in table.Rows)
                {
                    if (row["highest"].ToString().Trim().Equals("True"))
                    {
                        checkBangCapCaoNhat.Enabled = false;
                        break;
                    }
                    else { checkBangCapCaoNhat.Enabled = true; }
                }
            }
            else if (Session["idNhanVien"] != null)
            {
                if (!CheckBangCap(Convert.ToInt32(Session["idNhanVien"].ToString())))
                {
                    checkBangCapCaoNhat.Enabled = false;
                }
                else
                {
                    checkBangCapCaoNhat.Enabled = true;
                }
            }
            if (GetTextBangCap("highest") != null && GetTextBangCap("highest").Trim() != "")
            {
                checkBangCapCaoNhat.Checked = Convert.ToBoolean(GetTextBangCap("highest"));
                if (Convert.ToBoolean(GetTextBangCap("highest"))) { checkBangCapCaoNhat.Enabled = true; }
            }
        }
        private bool CheckBangCap(int empid)
        {
            bool result = true;
            List<Philip.Modules.EmpQualification.EmpQualificationInfo> list = objEmpQualification.GetEmpQualificationByEmp(empid);
            foreach (Philip.Modules.EmpQualification.EmpQualificationInfo em in list)
            {
                if (em.highest == true)
                {
                    result = false;
                    break;
                }
            }
            return result;
        }
       
        // truong dao tao
        protected void txtTruongCap_Init(object sender, EventArgs e)
        {
            ASPxTextBox txtTruongCap = sender as ASPxTextBox;
            if (GetTextBangCap("schools") != null && GetTextBangCap("schools").Trim() != "")
            {
                txtTruongCap.Text = GetTextBangCap("schools");
            }
        }
        // nam to nghiep
        protected void txtNamTotNghiep_Init(object sender, EventArgs e)
        {
            ASPxTextBox txtTruongCap = sender as ASPxTextBox;
            if (GetTextBangCap("NamTotNghiep") != null && GetTextBangCap("NamTotNghiep").Trim() != "")
            {
                txtTruongCap.Text = GetTextBangCap("NamTotNghiep");
            }
        }
        // Danh hieu
        protected void txtDanhHieu_Init(object sender, EventArgs e)
        {
            ASPxTextBox txtTruongCap = sender as ASPxTextBox;
            if (GetTextBangCap("danhhieu") != null && GetTextBangCap("danhhieu").Trim() != "")
            {
                txtTruongCap.Text = GetTextBangCap("danhhieu");
            }
        }
        // Hình thuc dao tao
        protected void cboTrainingForm_Load(object sender, EventArgs e)
        {
            ASPxComboBox cboTrainingForm = sender as ASPxComboBox;
            cboTrainingForm.Items.Clear();
            cboTrainingForm.Items.Add(new ListEditItem("-- Chọn -- ", "0"));
            TrainingForm.TrainingFormController objTrainingForm = new VNPT.Modules.TrainingForm.TrainingFormController();
            List<VNPT.Modules.TrainingForm.TrainingFormInfo> list = objTrainingForm.GetTrainingForms();
            foreach (VNPT.Modules.TrainingForm.TrainingFormInfo u in list)
            {
                cboTrainingForm.Items.Add(new DevExpress.Web.ASPxEditors.ListEditItem(u.name, u.id.ToString()));
            }
            cboTrainingForm.SelectedIndex = 0;
            if (GetTextBangCap("trainingid") != null && GetTextBangCap("trainingid").Trim() != "")
            {
                ListEditItem item = cboTrainingForm.Items.FindByValue(GetTextBangCap("trainingid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        //bang cap 
        protected void cmbBangCap_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbBangCap = sender as ASPxComboBox;
            cmbBangCap.Items.Clear();
            cmbBangCap.Items.Add(new ListEditItem("-- Chọn bằng cấp -- ", "0"));
            List<VNPT.Modules.Qualification.QualificationsInfo> list = objQualification.GetQualifications();
            foreach (VNPT.Modules.Qualification.QualificationsInfo u in list)
            {
                cmbBangCap.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbBangCap.SelectedIndex = 0;
            if (GetTextBangCap("qualificationid") != null && GetTextBangCap("qualificationid").Trim() != "")
            {
                ListEditItem item = cmbBangCap.Items.FindByValue(GetTextBangCap("qualificationid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        //chuyen nganh dao tao 
        protected void cmbNNDaoTao_Load(object sender, EventArgs e)
        {
            ASPxComboBox cmbCNDaoTao = sender as ASPxComboBox;
            cmbCNDaoTao.Items.Clear();
            cmbCNDaoTao.Items.Add(new ListEditItem("-- Chọn CN đào tạo -- ", "0"));
            Philip.Modules.Professional.ProfessionalController objProfession = new Philip.Modules.Professional.ProfessionalController();
            List<Philip.Modules.Professional.ProfessionalInfo> list = objProfession.GetProfessionals();
            foreach (Philip.Modules.Professional.ProfessionalInfo u in list)
            {
                cmbCNDaoTao.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbCNDaoTao.SelectedIndex = 0;
            if (GetTextBangCap("professionid") != null && GetTextBangCap("professionid").Trim() != "")
            {
                ListEditItem item = cmbCNDaoTao.Items.FindByValue(GetTextBangCap("professionid"));
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
        private string GetTextBangCap(string fieldName)
        {
            int index = gridBangCap.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = gridBangCap.GetRowValues(index, fieldName).ToString();
            }
            return values;
        }
        #endregion
        private void SetDefault()
        {
            LoadCombobox();           
          
            //btLuuC.Enabled = false;
           
            ReadOnlyBoxEmployee(true);            
        }
      
        private void LoadCombobox()
        {
            BindUnit();
            BindCountry();
            BindCultural();
            BindIT();
            BindTPBT();
            BindTPSCCRD();
            BindNationality();
            BindNgoaiNgu();
            BindPoliticalConsciousness();
            //BindProfession();
            BindProVince();
            BindProVince_Place();
            BindProVince_QueQuan();
            //BindQualification();
            BindReligion();
            //BindTrainingFrom();
            BindLoaiHopDong();
        }
        #region LoadCombobox
        //Loai hop dong
        protected void BindLoaiHopDong()
        {
            cmbLoaiHopDong.Items.Clear();
            cmbLoaiHopDong.Items.Add(new ListEditItem("--- Chọn loại hợp đồng ---", "0"));
            List<VNPT.Modules.LaborContractType.LaborContractTypeInfo> list = objContracType.GetLaborContractTypes();
            foreach (VNPT.Modules.LaborContractType.LaborContractTypeInfo l in list)
            {
                cmbLoaiHopDong.Items.Add(new ListEditItem(l.name, l.id.ToString()));
            }
            cmbLoaiHopDong.SelectedIndex = 0;
           
        }
        //noi cap 
        private void BindProVince()
        {
            cmbNoiCap.Items.Clear();
            cmbNoiCap.Items.Add(new ListEditItem("-- Chọn nơi cấp -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNoiCap.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNoiCap.SelectedIndex = 0;
        }
        //tinh thanh noi sinh
        private void BindProVince_Place()
        {
            cmbNoiSinhTinh.Items.Clear();
            cmbNoiSinhTinh.Items.Add(new ListEditItem("-- Chọn tỉnh thành -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNoiSinhTinh.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNoiSinhTinh.SelectedIndex = 0;
        }
        //tinh thanh que quan
        private void BindProVince_QueQuan()
        {
            cmbNguyenQuanTinh.Items.Clear();
            cmbNguyenQuanTinh.Items.Add(new ListEditItem("-- Chọn tỉnh thành -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNguyenQuanTinh.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNguyenQuanTinh.SelectedIndex = 0;
        }
        //tp gia dinh
        private void BindTPSCCRD()
        {
            cmbTPGD.Items.Clear();
            cmbTPGD.Items.Add(new ListEditItem("-- Chọn TP gia đình -- ", "0"));
            Philip.Modules.FamilyType.FamilyTypeController objEmpType = new Philip.Modules.FamilyType.FamilyTypeController();
            List<Philip.Modules.FamilyType.FamilyTypeInfo> list = objEmpType.GetFamilyTypes();
            foreach (Philip.Modules.FamilyType.FamilyTypeInfo item in list)
            {
                cmbTPGD.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTPGD.SelectedIndex = 0;
        }
        //tp ban than hien nay
        private void BindTPBT()
        {
            cmbTPBT.Items.Clear();
            cmbTPBT.Items.Add(new ListEditItem("-- Chọn Tp bản thân -- ", "0"));
            Philip.Modules.FamilyType.FamilyTypeController objEmpType = new Philip.Modules.FamilyType.FamilyTypeController();
            List<Philip.Modules.FamilyType.FamilyTypeInfo> list = objEmpType.GetFamilyTypes();
            foreach (Philip.Modules.FamilyType.FamilyTypeInfo item in list)
            {
                cmbTPBT.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTPBT.SelectedIndex = 0;
        }
        //tin hoc
        private void BindIT()
        {
            cmbTinHoc.Items.Clear();
            cmbTinHoc.Items.Add(new ListEditItem("-- Chọn TĐ tin học -- ", "0"));
            Philip.Modules.IT.ITController objIT = new Philip.Modules.IT.ITController();
            List<Philip.Modules.IT.ITInfo> list = objIT.GetITs();
            foreach (Philip.Modules.IT.ITInfo item in list)
            {
                cmbTinHoc.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTinHoc.SelectedIndex = 0;
        }
        //ngoai ngu
        private void BindNgoaiNgu()
        {
            cmbNgoaiNgu.Items.Clear();
            cmbNgoaiNgu.Items.Add(new ListEditItem("-- Chọn TĐ ngoại ngữ -- ", "0"));
            Philip.Modules.Language.LanguageController objLanguage = new Philip.Modules.Language.LanguageController();
            List<Philip.Modules.Language.LanguageInfo> list = objLanguage.GetLanguages();
            foreach (Philip.Modules.Language.LanguageInfo item in list)
            {
                cmbNgoaiNgu.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbNgoaiNgu.SelectedIndex = 0;
        }
        //dan toc
        private void BindNationality()
        {
            this.cmbDanToc.Items.Clear();
            cmbDanToc.Items.Add(new ListEditItem("-- Chọn dân tộc -- ", "0"));
            List<VNPT.Modules.Nationality.NationalityInfo> list = objNationlity.GetNationalities();
            foreach (VNPT.Modules.Nationality.NationalityInfo u in list)
            {
                this.cmbDanToc.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            ListEditItem item = this.cmbDanToc.Items.FindByValue(1);
            if (item != null)
            {
                item.Selected = true;
            }
            else
            {
                cmbDanToc.SelectedIndex = 0;
            }
        }
        //ton giao
        private void BindReligion()
        {
            this.cmbTonGiao.Items.Clear();
            cmbTonGiao.Items.Add(new ListEditItem("-- Chọn tôn giáo -- ", "0"));
            List<VNPT.Modules.Religion.ReligionInfo> list = objReligion.GetReligions();
            foreach (VNPT.Modules.Religion.ReligionInfo u in list)
            {
                this.cmbTonGiao.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbTonGiao.SelectedIndex = 0;
        }
        //quoc tich
        private void BindCountry()
        {
            this.cmbQuocTich.Items.Clear();
            cmbQuocTich.Items.Add(new ListEditItem("-- Chọn quốc tịch -- ", "0"));
            Philip.Modules.Country.CountryController objCountry = new Philip.Modules.Country.CountryController();
            List<Philip.Modules.Country.CountryInfo> list = objCountry.GetCountrys();
            foreach (Philip.Modules.Country.CountryInfo u in list)
            {
                this.cmbQuocTich.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbQuocTich.SelectedIndex = 0;
        }
        // ly luan chinh tri
        private void BindPoliticalConsciousness()
        {
            this.cmbLyLuanCT.Items.Clear();
            cmbLyLuanCT.Items.Add(new ListEditItem("-- Chọn -- ", "0"));
            List<VNPT.Modules.PoliticalConsciousness.PoliticalConsciousnessInfo> list = objPolitical.GetListPoliticalConsciousnesss();
            foreach (VNPT.Modules.PoliticalConsciousness.PoliticalConsciousnessInfo u in list)
            {
                this.cmbLyLuanCT.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbLyLuanCT.SelectedIndex = 0;
        }
        //trinh do van hoa
        private void BindCultural()
        {
            cmbTDPhoThong.Items.Clear();
            cmbTDPhoThong.Items.Add(new ListEditItem("-- Chọn --", "0"));
            Philip.Modules.Cultural.CuturalController objCultural = new Philip.Modules.Cultural.CuturalController();
            List<Philip.Modules.Cultural.CulturalInfo> list = objCultural.GetCulturals();
            foreach (Philip.Modules.Cultural.CulturalInfo u in list)
            {
                this.cmbTDPhoThong.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbTDPhoThong.SelectedIndex = 0;
        }

        //don vi

        #endregion
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }
    }
}

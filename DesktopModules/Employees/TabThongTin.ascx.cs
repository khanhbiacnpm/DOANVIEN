using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

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
using DevExpress.Web.ASPxTabControl;
namespace VNPT.Modules.Employees
{   
    partial class TabThongTin : PortalModuleBase, IActionable
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
          
        int ItemId = 0;
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
        //PartyMember.PartyMemberController objParty = new VNPT.Modules.PartyMember.PartyMemberController();
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
        //VNPT.Modules.HealthCare.HealthCareController objHealth = new VNPT.Modules.HealthCare.HealthCareController();
        VNPT.Modules.HealthCare.HealthCareInfo health = new VNPT.Modules.HealthCare.HealthCareInfo();
        Philip.Modules.Office.OfficeController objOffice = new Philip.Modules.Office.OfficeController();
        Philip.Modules.EmpQualification.EmpQualificationController objEmpQualification = new Philip.Modules.EmpQualification.EmpQualificationController();
        Philip.Modules.EmpQualification.EmpQualificationInfo empquanlification = new Philip.Modules.EmpQualification.EmpQualificationInfo();
        Philip.Modules.Professional.ProfessionalController objProfessional = new Philip.Modules.Professional.ProfessionalController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    string str = Request.Params["id"].ToString();
                    LoadTTCN();
                    BindEmployess(Convert.ToInt32(Request.Params["id"]));
                    hiddenIDEmployee.Value = Request.Params["id"].ToString();
                }
            }
        }
        protected void callThongTin_CallBack(object sender, CallbackEventArgsBase e)
        {
            if (e.Parameter.Trim().Equals("Luu"))
            {
                Update(Convert.ToInt32(hiddenIDEmployee.Value));
            }
        }
        private void Update(int id)
        {
            this.employees.id = id;
            this.employees.empcode = this.txtMaNVK.Text;
            //hoten 
            this.employees.fullname = this.txtHoTenK.Text.Trim();
            //ten khac
            this.employees.othername = this.txtTenKhacK.Text.Trim();
            //ngay sinh
            if (dateNgaySinhK.Value != null)
            {
                this.employees.birthday = Convert.ToDateTime(dateNgaySinhK.Value);
            }
            else
            {
                this.employees.birthday = Convert.ToDateTime("1/1/1900");
            }
            //gioitinh
            if (this.cmbGioiTinhK.SelectedIndex == 0)
            {
                this.employees.sex = true;
            }
            else { this.employees.sex = false; }
            //dantoc
            if (cmbDanTocK.SelectedItem != null)
            {
                this.employees.nationalityid = Int32.Parse(cmbDanTocK.SelectedItem.Value.ToString());
            }
            //tongiao
            if (cmbTonGiaoK.SelectedItem != null)
            {
                this.employees.religionid = Int32.Parse(cmbTonGiaoK.SelectedItem.Value.ToString());
            }
            //quoctich
            if (cmbQuocTichK.SelectedItem != null)
            {
                this.employees.countryid = Int32.Parse(cmbQuocTichK.SelectedItem.Value.ToString());
            }
            //noisinh
            if (this.cmbNoiSinhTinhK.SelectedItem != null)
            {
                this.employees.place_provinceid = Convert.ToInt32(cmbNoiSinhTinhK.SelectedItem.Value.ToString());

                if (this.txtNoiSinhXaK.Text.Trim() != "" || this.txtNoiSinhHuyenK.Text.Trim() != "")
                {
                    this.employees.placeofbirth = this.txtNoiSinhXaK.Text + " - " + this.txtNoiSinhHuyenK.Text.Trim() + " - " + cmbNoiSinhTinhK.SelectedItem.Text;
                }
                else { this.employees.placeofbirth = ""; }
            }
            else
            {
                if (this.txtNoiSinhXaK.Text.Trim() != "" || this.txtNoiSinhHuyenK.Text.Trim() != "")
                {
                    this.employees.placeofbirth = this.txtNoiSinhXaK.Text + " - " + this.txtNoiSinhHuyenK.Text.Trim();
                }
                else { this.employees.placeofbirth = ""; }
            }
            //nguyenquan
            if (this.cmbNguyenQuanTinhK.SelectedItem != null)
            {
                this.employees.nativeplace_provinceid = Convert.ToInt32(cmbNguyenQuanTinhK.SelectedItem.Value.ToString());
                if (this.txtNguyenQuanXaK.Text.Trim() != "" || this.txtNguyenQuanHuyenK.Text.Trim() != "")
                {
                    this.employees.nativeplace = this.txtNguyenQuanXaK.Text + " - " + this.txtNguyenQuanHuyenK.Text.Trim() + " - " + cmbNguyenQuanTinhK.SelectedItem.Text;
                }
                else { this.employees.nativeplace = ""; }
            }
            else
            {
                if (this.txtNguyenQuanXaK.Text.Trim() != "" || this.txtNguyenQuanHuyenK.Text.Trim() != "")
                {
                    this.employees.nativeplace = this.txtNguyenQuanXaK.Text + " - " + this.txtNguyenQuanHuyenK.Text.Trim();
                }
                else { this.employees.nativeplace = ""; }
            }

            //thuongtru
            this.employees.placeofresidence = txtThuongTruK.Text;
            //cho o hien nay
            this.employees.placeofcurrent = txtChoOHienNayK.Text;
            //cmnd
            this.employees.identitynum = txtSoCMNDK.Text;
            if (dateNgayCapK.Value != null)
            {
                this.employees.dateofissue = Convert.ToDateTime(this.dateNgayCapK.Value);
            }
            else
            {
                this.employees.dateofissue = Convert.ToDateTime("1/1/1900");
            }
            if (cmbNoiCapK.SelectedItem != null)
            {
                this.employees.provinceid = Int32.Parse(cmbNoiCapK.SelectedItem.Value.ToString());
            }
            //dien thoai
            this.employees.cellphone = this.txtDienThoaiK.Text.Trim();
            //email
            this.employees.email = txtEmailK.Text;
            //mst
            this.employees.taxcode = this.txtMSTK.Text;
            //thanh phan ban than
            if (cmbTPBTK.SelectedItem != null)
            {
                this.employees.familytype_currentid = Int32.Parse(cmbTPBTK.SelectedItem.Value.ToString());
            }
            //thanh phan gia dinh
            if (cmbTPGDK.SelectedItem != null)
            {
                this.employees.familytypeid = Int32.Parse(cmbTPGDK.SelectedItem.Value.ToString());
            }
            //doan thanh nien
            if (dateNgayKetNapDTNCSHCMK.Value != null)
            {
                this.employees.youthdate = Convert.ToDateTime(this.dateNgayKetNapDTNCSHCMK.Value);
            }
            else
            {
                this.employees.youthdate = Convert.ToDateTime("1/1/1900");
            }
            this.employees.youthplace = txtNoiKetNapDTNCSHCMK.Text;
            //dang cong san viet nam
            if (dateNgayKetNapDCSVNK.Value != null)
            {
                this.employees.partydate = Convert.ToDateTime(this.dateNgayKetNapDCSVNK.Value);
            }
            else
            {
                this.employees.partydate = Convert.ToDateTime("1/1/1900");
            }
            this.employees.partyplace = txtNoiKetNapDCSVNK.Text;
            //loai suc khoe
            if (cmbSuKhoeK.SelectedItem != null)
            {
                this.employees.healthid = Int32.Parse(cmbSuKhoeK.SelectedItem.Value.ToString());
            }
            //nhom mau
            if (cmbNhomMau.SelectedItem != null)
            {
                this.employees.bloodgroupid = Int32.Parse(cmbNhomMau.SelectedItem.Value.ToString());
            }
            //chieu cao 
            this.employees.height = this.txtChieuCaoK.Text;
            //can nang
            this.employees.weigh = this.txtCanNangK.Text;
            //bhxh
            this.employees.socialinsurancenum = this.txtBHXHK.Text;
            //ngay dong bhxh
            if (dateNgayDongBHXHK.Value != null)
            {
                this.employees.datesocialinsurance = Convert.ToDateTime(this.dateNgayDongBHXHK.Value);
            }
            else
            {
                this.employees.datesocialinsurance = Convert.ToDateTime("1/1/1900");
            }
            //noi kham benh
            this.employees.placetomedicalexam = this.txtNoiKhamBenhK.Text;
            //bhyt
            this.employees.healthinsurancenum = this.txtBHYTK.Text;
            //thuong binh
            if (cmbThuongBinhK.SelectedItem != null)
            {
                this.employees.soldiertypeid = Int32.Parse(cmbThuongBinhK.SelectedItem.Value.ToString());
            }
            //doi tuong csxh
            if (cmbDoiTuongCSXHK.SelectedItem != null)
            {
                this.employees.socialwelfaretypeid = Int32.Parse(cmbDoiTuongCSXHK.SelectedItem.Value.ToString());
            }
            //doi tuong lao dong 
            if (cmbDoiTuongLDK.SelectedItem != null)
            {
                this.employees.employeetypeid = Int32.Parse(cmbDoiTuongLDK.SelectedItem.Value.ToString());
            }
            //ngay tuyen dung 
            if (dateNgayTuyenK.Value != null)
            {
                this.employees.daterecruit = Convert.ToDateTime(this.dateNgayTuyenK.Value);
            }
            else
            {
                this.employees.daterecruit = Convert.ToDateTime("1/1/1900");
            }
            //don vi tuyen dung
            this.employees.unitrecruit = this.txtDVTuyenDungK.Text;
            //ngay vao nganh
            if (dateNgayVaoNganhK.Value != null)
            {
                this.employees.startdate = Convert.ToDateTime(this.dateNgayVaoNganhK.Value);
            }
            else
            {
                this.employees.startdate = Convert.ToDateTime("1/1/1900");
            }
            //don vi cong tac
            if (cmbDonViCTacK.SelectedItem != null)
            {
                string str = cmbDonViCTacK.SelectedItem.Value.ToString();
                this.employees.unitid = Int32.Parse(cmbDonViCTacK.SelectedItem.Value.ToString());
            }
            //chuc danh
            if (cmbChucDanhK.SelectedItem != null)
            {
                this.employees.officeid = Int32.Parse(cmbChucDanhK.SelectedItem.Value.ToString());
            }
            //mt lam viec
            if (this.cmbMTLamViecK.SelectedIndex == 0)
            {
                this.employees.workeviroment = true;
            }
            else { this.employees.workeviroment = false; }
            //chuc vu
            //BindPosition();
            if (cmbChucVuK.SelectedItem != null)
            {
                this.employees.positionid = Int32.Parse(cmbChucVuK.SelectedItem.Value.ToString());
            }
            //cong viec chinh
            this.employees.mainjob = "";
            //chuc vu doan the
            if (cmbCVDoanTheK.SelectedItem != null)
            {
                this.employees.comunityposition = Int32.Parse(cmbCVDoanTheK.SelectedItem.Value.ToString());
            }
            //chuc vu dang
            if (cmbCVDangK.SelectedItem != null)
            {
                this.employees.partyposition = Int32.Parse(cmbCVDangK.SelectedItem.Value.ToString());
            }

            //trinh do pho thong
            if (cmbTDPhoThongK.SelectedItem != null)
            {
                this.employees.culturalid = Int32.Parse(cmbTDPhoThongK.SelectedItem.Value.ToString());
            }
            //quan ly nha nuoc
            if (cmbQuanLyNhaNuocK.SelectedItem != null)
            {
                this.employees.statemanagementid = Int32.Parse(cmbQuanLyNhaNuocK.SelectedItem.Value.ToString());
            }
            //ngoai ngu
            if (cmbNgoaiNguK.SelectedItem != null)
            {
                this.employees.languageid = Int32.Parse(cmbNgoaiNguK.SelectedItem.Value.ToString());
            }
            //tin hoc
            if (cmbTinHocK.SelectedItem != null)
            {
                this.employees.itid = Int32.Parse(cmbTinHocK.SelectedItem.Value.ToString());
            }
            //ly luan chinh tri 
            if (cmbLyLuanCTK.SelectedItem != null)
            {
                this.employees.politicalconsciousnessid = Int32.Parse(cmbLyLuanCTK.SelectedItem.Value.ToString());
            }
            // hinh anh khi update
            if (Session["img1"] != null)
            {
                this.employees.image = Session["img1"].ToString();
                Session.Remove("img1");
            }
            else { this.employees.image = hiddenHinh2.Value.Trim(); }
            objEmployees.UpdateEmployees(this.employees);
            //BindEmployess(id);
            callThongTin.JSProperties["cpResult"] = true;
        }
        protected void upLoadK_UploadFile(object sender, FileUploadCompleteEventArgs e)
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
            Session["img1"] = fullname3;
        }
        private void BindEmployess(int id)
        {            
            hiddenIDEmployee.Value = id.ToString();            
            this.employees = objEmployees.GetEmployees(id);
            //manv
            this.txtMaNVK.Text = this.employees.empcode.Trim();
            //hoten 
            this.txtHoTenK.Text = this.employees.fullname.Trim();
            //ten khac
            this.txtTenKhacK.Text = this.employees.othername.Trim();
            //ngay sinh
            if (this.employees.birthday.ToString() != "" && this.employees.birthday.Year > 1900 && this.employees.birthday.Year < 3000)
            {
                this.dateNgaySinhK.Date = this.employees.birthday;
            }
            else
            {
                dateNgaySinhK.Value = null;
            }
            //gioitinh
            if (this.employees.sex == true)
            {
                this.cmbGioiTinhK.SelectedIndex = 0;
            }
            else { this.cmbGioiTinhK.SelectedIndex = 1; }
            //dantoc
            ListEditItem cmdDanToc = this.cmbDanTocK.Items.FindByValue(this.employees.nationalityid.ToString());
            if (cmdDanToc != null)
            {
                cmdDanToc.Selected = true;
            }
            //tongiao
            ListEditItem cmbTonGiao = this.cmbTonGiaoK.Items.FindByValue(this.employees.religionid.ToString());
            if (cmbTonGiao != null)
            {
                cmbTonGiao.Selected = true;
            }
            //quoctich
            ListEditItem cmbQuocTich = this.cmbQuocTichK.Items.FindByValue(this.employees.countryid.ToString());
            if (cmbQuocTich != null)
            {
                cmbQuocTich.Selected = true;
            }
            //noisinh
            txtNoiSinhXaK.Text = Xa(this.employees.placeofbirth.ToString());
            txtNoiSinhHuyenK.Text = Huyen(this.employees.placeofbirth.ToString());
            ListEditItem itemNS = this.cmbNoiSinhTinhK.Items.FindByValue(this.employees.place_provinceid.ToString());
            if (itemNS != null)
            {
                itemNS.Selected = true;
            }
            //nguyenquan
            txtNguyenQuanXaK.Text = Xa(this.employees.nativeplace.ToString());
            txtNguyenQuanHuyenK.Text = Huyen(this.employees.nativeplace.ToString());
            ListEditItem itemNQ = this.cmbNguyenQuanTinhK.Items.FindByValue(this.employees.nativeplace_provinceid.ToString().Trim());
            if (itemNQ != null)
            {
                itemNQ.Selected = true;
            }
            //thuongtru
            txtThuongTruK.Text = this.employees.placeofresidence;
            //cho o hien nay
            txtChoOHienNayK.Text = this.employees.placeofcurrent;
            //cmnd
            txtSoCMNDK.Text = this.employees.identitynum.Trim();
            if (this.employees.dateofissue != null && this.employees.dateofissue.Year > 1900 && this.employees.dateofissue.Year < 3000)
            {
                dateNgayCapK.Date = employees.dateofissue;
            }
            else
            {
                dateNgayCapK.Value = null;
            }
            ListEditItem cmbNoiCap = this.cmbNoiCapK.Items.FindByValue(this.employees.provinceid.ToString());
            if (cmbNoiCap != null)
            {
                cmbNoiCap.Selected = true;
            }
            //dien thoai
            this.txtDienThoaiK.Text = this.employees.cellphone.Trim();
            //email
            txtEmailK.Text = this.employees.email;
            //mst
            this.txtMSTK.Text = this.employees.taxcode;
            //thanh phan ban than
            ListEditItem cmbTPBTHN = this.cmbTPBTK.Items.FindByValue(this.employees.familytype_currentid.ToString());
            if (cmbTPBTHN != null)
            {
                cmbTPBTHN.Selected = true;
            }
            //thanh phan gia dinh
            ListEditItem itemTTGDSCRD = this.cmbTPGDK.Items.FindByValue(this.employees.familytypeid.ToString());
            if (itemTTGDSCRD != null)
            {
                itemTTGDSCRD.Selected = true;
            }
            //doan thanh nien
            if (employees.youthdate != null)
            {
                if (employees.youthdate.Year == 1900 || employees.youthdate.Year == 3000)
                {
                    dateNgayKetNapDTNCSHCMK.Value = null;
                }
                else
                {
                    dateNgayKetNapDTNCSHCMK.Date = employees.youthdate;
                }
            }
            txtNoiKetNapDTNCSHCMK.Text = this.employees.youthplace;
            //dang cong san viet nam
            if (this.employees.partydate != null)
            {
                if (this.employees.partydate.Year == 1900 || this.employees.partydate.Year == 3000)
                {
                    dateNgayKetNapDCSVNK.Value = null;
                }
                else
                {
                    dateNgayKetNapDCSVNK.Date = this.employees.partydate;
                }
            }
            txtNoiKetNapDCSVNK.Text = this.employees.partyplace;
            //loai suc khoe
            ListEditItem loaisuckhoe = this.cmbSuKhoeK.Items.FindByValue(this.employees.healthid.ToString());
            if (loaisuckhoe != null)
            {
                loaisuckhoe.Selected = true;
            }
            //nhom mau
            ListEditItem nhommau = this.cmbNhomMau.Items.FindByValue(this.employees.bloodgroupid.ToString());
            if (nhommau != null)
            {
                nhommau.Selected = true;
            }
            //chieu cao 
            this.txtChieuCaoK.Text = this.employees.height.Trim();
            //can nang
            this.txtCanNangK.Text = this.employees.weigh.Trim();
            //bhxh
            this.txtBHXHK.Text = this.employees.socialinsurancenum.Trim();
            //ngay dong bhxh
            if (this.employees.datesocialinsurance != null)
            {
                if (this.employees.datesocialinsurance.Year == 1900 || this.employees.datesocialinsurance.Year == 3000)
                {
                    dateNgayDongBHXHK.Value = null;
                }
                else
                {
                    dateNgayDongBHXHK.Date = this.employees.datesocialinsurance;
                }
            }
            //noi kham benh
            this.txtNoiKhamBenhK.Text = this.employees.placetomedicalexam.Trim();
            //bhyt
            this.txtBHYTK.Text = this.employees.healthinsurancenum.Trim();
            //thuong binh
            ListEditItem thuongbinh = this.cmbThuongBinhK.Items.FindByValue(this.employees.soldiertypeid.ToString());
            if (thuongbinh != null)
            {
                thuongbinh.Selected = true;
            }
            //doi tuong csxh
            ListEditItem csxh = this.cmbDoiTuongCSXHK.Items.FindByValue(this.employees.socialwelfaretypeid.ToString());
            if (csxh != null)
            {
                csxh.Selected = true;
            }
            //doi tuong lao dong 
            ListEditItem dtlaodong = this.cmbDoiTuongLDK.Items.FindByValue(this.employees.employeetypeid.ToString());
            if (dtlaodong != null)
            {
                dtlaodong.Selected = true;
            }
            //ngay tuyen dung 
            if (this.employees.daterecruit != null)
            {
                if (this.employees.daterecruit.Year == 1900 || this.employees.daterecruit.Year == 3000)
                {
                    dateNgayTuyenK.Value = null;
                }
                else
                {
                    dateNgayTuyenK.Date = this.employees.daterecruit;
                }
            }
            //don vi tuyen dung
            this.txtDVTuyenDungK.Text = this.employees.unitrecruit.Trim();
            //ngay vao nganh
            if (this.employees.startdate != null)
            {
                if (this.employees.startdate.Year == 1900 || this.employees.startdate.Year == 3000)
                {
                    dateNgayVaoNganhK.Value = null;
                }
                else
                {
                    dateNgayVaoNganhK.Date = this.employees.startdate;
                }
            }
            //don vi cong tac
            //cmbDonViCTacK.ClearSelection();// binemployees
            //ListItem dvcongtac = this.cmbDonViCTacK.Items.FindByValue(this.employees.unitid.ToString());            
            ListEditItem dvcongtac = this.cmbDonViCTacK.Items.FindByValue(this.employees.unitid.ToString());
            if (dvcongtac != null)
            {
                string str = this.employees.unitid.ToString();
                dvcongtac.Selected = true;
            }
            //chuc danh
            ListEditItem chucdanh = this.cmbChucDanhK.Items.FindByValue(this.employees.officeid.ToString());
            if (chucdanh != null)
            {
                chucdanh.Selected = true;
            }
            //mt lam viec
            if (this.employees.workeviroment == true)
            {
                this.cmbMTLamViecK.SelectedIndex = 0;
            }
            else { this.cmbMTLamViecK.SelectedIndex = 1; }
            //chuc vu
            ListEditItem chucvu = this.cmbChucVuK.Items.FindByValue(this.employees.positionid.ToString());
            if (chucvu != null)
            {
                chucvu.Selected = true;
            }
            //cong viec chinh la chuc danh
            //chuc vu doan the
            ListEditItem chucvudt = this.cmbCVDoanTheK.Items.FindByValue(this.employees.comunityposition.ToString());
            if (chucvudt != null)
            {
                chucvudt.Selected = true;
            }
            //chuc vu dang
            ListEditItem chucvudang = this.cmbCVDangK.Items.FindByValue(this.employees.partyposition.ToString());
            if (chucvudang != null)
            {
                chucvudang.Selected = true;
            }

            //trinh do pho thong
            ListEditItem tdpt = this.cmbTDPhoThongK.Items.FindByValue(this.employees.culturalid.ToString());
            if (tdpt != null)
            {
                tdpt.Selected = true;
            }
            //quan ly nha nuoc
            ListEditItem qlnn = this.cmbQuanLyNhaNuocK.Items.FindByValue(this.employees.statemanagementid.ToString());
            if (qlnn != null)
            {
                qlnn.Selected = true;
            }
            //ngoai ngu
            ListEditItem av = this.cmbNgoaiNguK.Items.FindByValue(this.employees.languageid.ToString());
            if (av != null)
            {
                av.Selected = true;
            }
            //tin hoc
            ListEditItem th = this.cmbTinHocK.Items.FindByValue(this.employees.itid.ToString());
            if (th != null)
            {
                th.Selected = true;
            }
            //ly luan chinh tri 
            ListEditItem llct = this.cmbLyLuanCTK.Items.FindByValue(this.employees.politicalconsciousnessid.ToString());
            if (llct != null)
            {
                llct.Selected = true;
            }
            // hinh anh            
            if (this.employees.image.Trim() != "")
            {
                hiddenHinh2.Value = this.employees.image.Trim();
                imgEmp.ImageUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/EmpImages/" + this.employees.image;
            }
            else
            {
                imgEmp.ImageUrl = DotNetNuke.Common.Globals.ApplicationPath + "/images/EmpImages/noimage.jpg";
            }
        }
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
        private void LoadTTCN()
        {
            BindBloodGroupK();
            BindCulturalK();
            BindChucDanh();
            BindUnit();
            BindPosition();
            BindPoliticalConsciousnessK();
            BindNgoaiNguK();
            BindNationalityK();
            BindReligionK();
            BindCountryK();
            BindITK();
            BindProVince_QueQuanK();
            BindProVince_PlaceK();
            BindProVinceK();
            BindSocialWelfareTypeK();
            BindSoldierTypeK();
            BindHealthTypeK();
            BindStateManagementk();
            BindCulturalk();
            BindComunityPosition();
            BindPartyPosition();
            BindEmpTypeK();
            BindTPSCCRDK();
            BindTPBTK();
        }    
        // ly luan chinh tri
        private void BindPoliticalConsciousnessK()
        {
            this.cmbLyLuanCTK.Items.Clear();
            cmbLyLuanCTK.Items.Add(new ListEditItem("-- Lý luận chính trị -- ", "0"));
            List<VNPT.Modules.PoliticalConsciousness.PoliticalConsciousnessInfo> list = objPolitical.GetListPoliticalConsciousnesss();
            foreach (VNPT.Modules.PoliticalConsciousness.PoliticalConsciousnessInfo u in list)
            {
                this.cmbLyLuanCTK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbLyLuanCTK.SelectedIndex = 0;
        }
        private void BindPosition()
        {

            this.cmbChucVuK.Items.Clear();
            cmbChucVuK.Items.Add(new ListEditItem("-- Chức vụ -- ", "0"));
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositionByType(1);
            foreach (VNPT.Modules.Position.PositionInfo u in list)
            {
                this.cmbChucVuK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbChucVuK.SelectedIndex = 0;
        }
        private void BindPartyPosition()
        {
            this.cmbCVDangK.Items.Clear();
            cmbCVDangK.Items.Add(new ListEditItem("-- Chức vụ -- ", "0"));
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositionByType(4);
            foreach (VNPT.Modules.Position.PositionInfo u in list)
            {
                this.cmbCVDangK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbCVDangK.SelectedIndex = 0;
        }
        private void BindComunityPosition()
        {
            this.cmbCVDoanTheK.Items.Clear();
            cmbCVDoanTheK.Items.Add(new ListEditItem("-- Chức vụ -- ", "0"));
            List<VNPT.Modules.Position.PositionInfo> list = objPosition.GetPositionByType(2);
            foreach (VNPT.Modules.Position.PositionInfo u in list)
            {
                this.cmbCVDoanTheK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbCVDoanTheK.SelectedIndex = 0;
        }
        private void BindChucDanh()
        {

            cmbChucDanhK.Items.Clear();
            cmbChucDanhK.Items.Add(new ListEditItem("-- Chức danh --", "0"));
            List<Philip.Modules.Office.OfficeInfo> list = objOffice.GetOffices(0);
            foreach (Philip.Modules.Office.OfficeInfo u in list)
            {
                this.cmbChucDanhK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbChucDanhK.SelectedIndex = 0;

        }
        //don vi        
        private void BindUnit()
        {
            VNPT.Modules.Employees.EmployeesInfo e = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (e != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    this.cmbDonViCTacK.Items.Clear();
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        this.cmbDonViCTacK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            cmbDonViCTacK.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            //this.cmbDonVi.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                            foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                            {
                                this.cmbDonViCTacK.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                            }
                        }
                    }
                    cmbDonViCTacK.SelectedIndex = 0;
                }
                else
                {
                    this.cmbDonViCTacK.Items.Clear();
                    this.cmbDonViCTacK.Items.Add(new ListEditItem(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).name, objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id.ToString()));
                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        this.cmbDonViCTacK.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                        {
                            this.cmbDonViCTacK.Items.Add(new ListEditItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                        }
                    }
                    cmbDonViCTacK.SelectedIndex = 0;
                }
            }
            
        }
        private void BindEmpTypeK()
        {

            cmbDoiTuongLDK.Items.Clear();
            cmbDoiTuongLDK.Items.Add(new ListEditItem("-- Đối tượng --", "0"));
            Philip.Modules.EmployeeType.EmployeeTypeController objEmpType = new Philip.Modules.EmployeeType.EmployeeTypeController();
            List<Philip.Modules.EmployeeType.EmployeeTypeInfo> list = objEmpType.GetEmployeeTypes();
            foreach (Philip.Modules.EmployeeType.EmployeeTypeInfo u in list)
            {
                this.cmbDoiTuongLDK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbDoiTuongLDK.SelectedIndex = 0;

        }

        private void BindITK()
        {
            cmbTinHocK.Items.Clear();
            cmbTinHocK.Items.Add(new ListEditItem("-- Trình độ tin học -- ", "0"));
            Philip.Modules.IT.ITController objIT = new Philip.Modules.IT.ITController();
            List<Philip.Modules.IT.ITInfo> list = objIT.GetITs();
            foreach (Philip.Modules.IT.ITInfo item in list)
            {
                cmbTinHocK.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTinHocK.SelectedIndex = 0;

        }
        //ngoai ngu
        private void BindNgoaiNguK()
        {
            cmbNgoaiNguK.Items.Clear();
            cmbNgoaiNguK.Items.Add(new ListEditItem("-- Ngoại ngữ -- ", "0"));
            Philip.Modules.Language.LanguageController objLanguage = new Philip.Modules.Language.LanguageController();
            List<Philip.Modules.Language.LanguageInfo> list = objLanguage.GetLanguages();
            foreach (Philip.Modules.Language.LanguageInfo item in list)
            {
                cmbNgoaiNguK.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbNgoaiNguK.SelectedIndex = 0;

        }
        //dan toc
        private void BindNationalityK()
        {
            this.cmbDanTocK.Items.Clear();
            cmbDanTocK.Items.Add(new ListEditItem("-- Dân tộc -- ", "0"));
            List<VNPT.Modules.Nationality.NationalityInfo> list = objNationlity.GetNationalities();
            foreach (VNPT.Modules.Nationality.NationalityInfo u in list)
            {
                this.cmbDanTocK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            ListEditItem item = this.cmbDanTocK.Items.FindByValue(1);
            if (item != null)
            {
                item.Selected = true;
            }
            else
            {
                cmbDanTocK.SelectedIndex = 0;
            }
        }
        //ton giao
        private void BindReligionK()
        {
            this.cmbTonGiaoK.Items.Clear();
            cmbTonGiaoK.Items.Add(new ListEditItem("-- Tôn giáo -- ", "0"));
            List<VNPT.Modules.Religion.ReligionInfo> list = objReligion.GetReligions();
            foreach (VNPT.Modules.Religion.ReligionInfo u in list)
            {
                this.cmbTonGiaoK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbTonGiaoK.SelectedIndex = 0;
        }
        //quoc tich
        private void BindCountryK()
        {
            this.cmbQuocTichK.Items.Clear();
            cmbQuocTichK.Items.Add(new ListEditItem("-- Quốc tịch -- ", "0"));
            Philip.Modules.Country.CountryController objCountry = new Philip.Modules.Country.CountryController();
            List<Philip.Modules.Country.CountryInfo> list = objCountry.GetCountrys();
            foreach (Philip.Modules.Country.CountryInfo u in list)
            {
                this.cmbQuocTichK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbQuocTichK.SelectedIndex = 0;
        }
        //noi cap 
        private void BindProVinceK()
        {

            cmbNoiCapK.Items.Clear();
            cmbNoiCapK.Items.Add(new ListEditItem("-- Nơi cấp -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNoiCapK.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNoiCapK.SelectedIndex = 0;

        }
        //tinh thanh noi sinh
        private void BindProVince_PlaceK()
        {

            cmbNoiSinhTinhK.Items.Clear();
            cmbNoiSinhTinhK.Items.Add(new ListEditItem("-- Chọn tỉnh -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNoiSinhTinhK.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNoiSinhTinhK.SelectedIndex = 0;

        }
        //tinh thanh que quan
        private void BindProVince_QueQuanK()
        {
            cmbNguyenQuanTinhK.Items.Clear();
            cmbNguyenQuanTinhK.Items.Add(new ListEditItem("-- Chọn tỉnh -- ", "0"));
            VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
            List<VNPT.Modules.Province.ProvinceInfo> list = objProvince.GetProvinces();
            foreach (VNPT.Modules.Province.ProvinceInfo item in list)
            {
                cmbNguyenQuanTinhK.Items.Add(new ListEditItem(item.Name.ToString(), item.Id.ToString()));
            }
            cmbNguyenQuanTinhK.SelectedIndex = 0;
        }
        //loai suc khoe
        private void BindHealthTypeK()
        {
            this.cmbSuKhoeK.Items.Clear();
            this.cmbSuKhoeK.Items.Add(new ListEditItem("-- TT sức khỏe", "0"));
            Philip.Modules.HealthType.HealthTypeController objHealthType = new Philip.Modules.HealthType.HealthTypeController();
            List<Philip.Modules.HealthType.HealthTypeInfo> list = objHealthType.GetHealthTypes();
            foreach (Philip.Modules.HealthType.HealthTypeInfo u in list)
            {
                this.cmbSuKhoeK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbSuKhoeK.SelectedIndex = 0;
        }
        //nhom mau
        private void BindBloodGroupK()
        {
            this.cmbNhomMau.Items.Clear();
            cmbNhomMau.Items.Add(new ListEditItem("-- Nhóm máu -- ", "0"));
            List<VNPT.Modules.BloodGroup.BloodGroupInfo> list = objBlood.GetBloodGroups();
            foreach (VNPT.Modules.BloodGroup.BloodGroupInfo u in list)
            {
                this.cmbNhomMau.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbNhomMau.SelectedIndex = 0;
        }
        //thuong binh
        private void BindSoldierTypeK()
        {
            this.cmbThuongBinhK.Items.Clear();
            cmbThuongBinhK.Items.Add(new ListEditItem("-- Hạng thương binh -- ", "0"));
            List<VNPT.Modules.SoldierType.SoldierTypeInfo> list = objSolider.GetSoldierTypes();
            foreach (VNPT.Modules.SoldierType.SoldierTypeInfo u in list)
            {
                this.cmbThuongBinhK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbThuongBinhK.SelectedIndex = 0;
        }
        private void BindCulturalK()
        {

            cmbTDPhoThongK.Items.Clear();
            cmbTDPhoThongK.Items.Add(new ListEditItem("-- Chọn --", "0"));
            Philip.Modules.Cultural.CuturalController objCultural = new Philip.Modules.Cultural.CuturalController();
            List<Philip.Modules.Cultural.CulturalInfo> list = objCultural.GetCulturals();
            foreach (Philip.Modules.Cultural.CulturalInfo u in list)
            {
                this.cmbTDPhoThongK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbTDPhoThongK.SelectedIndex = 0;

        }
        //cs xa hoi 
        private void BindSocialWelfareTypeK()
        {
            this.cmbDoiTuongCSXHK.Items.Clear();
            cmbDoiTuongCSXHK.Items.Add(new ListEditItem("-- Đối tượng CSXH -- ", "0"));
            List<VNPT.Modules.SocialWelfareType.SocialWelfareTypeInfo> list = objSocialWelfareType.GetSocialWelfareTypes();
            foreach (VNPT.Modules.SocialWelfareType.SocialWelfareTypeInfo u in list)
            {
                this.cmbDoiTuongCSXHK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbDoiTuongCSXHK.SelectedIndex = 0;
        }
        private void BindStateManagementk()
        {

            cmbQuanLyNhaNuocK.Items.Clear();
            cmbQuanLyNhaNuocK.Items.Add(new ListEditItem("-- Chọn --", "0"));
            List<VNPT.Modules.StateManagement.StateManagementInfo> list = objSate.GetStateManagements();
            foreach (VNPT.Modules.StateManagement.StateManagementInfo u in list)
            {
                this.cmbQuanLyNhaNuocK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbQuanLyNhaNuocK.SelectedIndex = 0;

        }
        private void BindCulturalk()
        {
            cmbTDPhoThongK.Items.Clear();
            cmbTDPhoThongK.Items.Add(new ListEditItem("-- Chọn --", "0"));
            Philip.Modules.Cultural.CuturalController objCultural = new Philip.Modules.Cultural.CuturalController();
            List<Philip.Modules.Cultural.CulturalInfo> list = objCultural.GetCulturals();
            foreach (Philip.Modules.Cultural.CulturalInfo u in list)
            {
                this.cmbTDPhoThongK.Items.Add(new ListEditItem(u.name, u.id.ToString()));
            }
            cmbTDPhoThongK.SelectedIndex = 0;
        }
        private void BindTPSCCRDK()
        {

            cmbTPGDK.Items.Clear();
            cmbTPGDK.Items.Add(new ListEditItem("-- TP gia đình -- ", "0"));
            Philip.Modules.FamilyType.FamilyTypeController objEmpType = new Philip.Modules.FamilyType.FamilyTypeController();
            List<Philip.Modules.FamilyType.FamilyTypeInfo> list = objEmpType.GetFamilyTypes();
            foreach (Philip.Modules.FamilyType.FamilyTypeInfo item in list)
            {
                cmbTPGDK.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTPGDK.SelectedIndex = 0;

        }
        //tp ban than hien nay
        private void BindTPBTK()
        {

            cmbTPBTK.Items.Clear();
            cmbTPBTK.Items.Add(new ListEditItem("-- TP bản thân -- ", "0"));
            Philip.Modules.FamilyType.FamilyTypeController objEmpType = new Philip.Modules.FamilyType.FamilyTypeController();
            List<Philip.Modules.FamilyType.FamilyTypeInfo> list = objEmpType.GetFamilyTypes();
            foreach (Philip.Modules.FamilyType.FamilyTypeInfo item in list)
            {
                cmbTPBTK.Items.Add(new ListEditItem(item.name.ToString(), item.id.ToString()));
            }
            cmbTPBTK.SelectedIndex = 0;

        }        
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

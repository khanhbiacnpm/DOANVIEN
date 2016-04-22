using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;
using System.Configuration;

namespace VNPT.Modules.Employees
{
    public class SqlDataProvider : DataProvider
    {

        private const string ProviderType = "data";
        private ProviderConfiguration _providerConfiguration = ProviderConfiguration.GetProviderConfiguration(ProviderType);
        private string _connectionString;
        private string _databaseOwner;
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        public SqlDataProvider()
        {
            Provider objProvider = (Provider)_providerConfiguration.Providers[_providerConfiguration.DefaultProvider];
            _connectionString = Config.GetConnectionString();

            if (_connectionString.Length == 0)
            {
                _connectionString = objProvider.Attributes["connectionString"];
            }

            _databaseOwner = objProvider.Attributes["databaseOwner"];
            if ((_databaseOwner != "") && (_databaseOwner.EndsWith(".") == false))
            {
                _databaseOwner += ".";
            }
        }

        public string ConnectionString
        {
            get { return strconn; }
        }

        public string DatabaseOwner
        {
            get { return _databaseOwner; }
        }

        private string GetFullyQualifiedName(string name)
        {
            return DatabaseOwner + name;
        }

        private Object GetNull(Object Field)
        {
            return Null.GetNull(Field, DBNull.Value);
        }
           
        public override void AddEmployees(EmployeesInfo objEmployees)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Employees"), objEmployees.id, objEmployees.fullname, objEmployees.othername, objEmployees.specialname, objEmployees.empcode, objEmployees.unitid, objEmployees.birthday, objEmployees.sex, objEmployees.image, objEmployees.placeofbirth, objEmployees.place_provinceid, objEmployees.nativeplace, objEmployees.nativeplace_provinceid, objEmployees.provinceid, objEmployees.nationalityid, objEmployees.religionid, objEmployees.identitynum, objEmployees.dateofissue, objEmployees.placeofissue, objEmployees.cellphone, objEmployees.officephone, objEmployees.email, objEmployees.taxcode, objEmployees.forte, objEmployees.hobby, objEmployees.placeofresidence, objEmployees.placeofcurrent, objEmployees.height, objEmployees.weigh, objEmployees.bloodgroupid, objEmployees.culturalid, objEmployees.qualificationid, objEmployees.politicalconsciousnessid, objEmployees.statemanagementid, objEmployees.positionid, objEmployees.socialinsurancenum, objEmployees.healthinsurancenum, objEmployees.placetomedicalexam, objEmployees.soldiertypeid, objEmployees.socialwelfaretypeid, objEmployees.retiredate, objEmployees.startdate, objEmployees.prevunit, objEmployees.prevwork, objEmployees.note, objEmployees.mainjob, objEmployees.honourable, objEmployees.workabroad, objEmployees.goabroad, objEmployees.economy, objEmployees.family, objEmployees.daterecruit, objEmployees.asalaryid, objEmployees.bsalaryid, objEmployees.professionid, objEmployees.isactive, objEmployees.familytypeid, objEmployees.familytype_currentid, objEmployees.employeetypeid, objEmployees.workeviroment, objEmployees.datesocialinsurance, objEmployees.languageid, objEmployees.itid, objEmployees.healthid, objEmployees.partyplace, objEmployees.partydate, objEmployees.youthplace, objEmployees.youthdate, objEmployees.allowance, objEmployees.countryid, objEmployees.occupation,objEmployees.officeid,objEmployees.unitrecruit,objEmployees.partyposition,objEmployees.comunityposition, objEmployees.DVYeuCau,objEmployees.idHinhThucDaoTao, objEmployees.idLoaiHopDong, objEmployees.NgayKetNapDang, objEmployees.NgayChinhThuc, objEmployees.NoiKetNapDang,objEmployees.DangBoKetNap, objEmployees.ChiBoKetNap, objEmployees.SoThe, objEmployees.NgayCap, objEmployees.nguoiGioiThieuVaoDang,  objEmployees.DBDangSinhHoat, objEmployees.CBDangSinhHoat,objEmployees.isoms,objEmployees.Passport,objEmployees.PassportDate,objEmployees.PassPortIssue,objEmployees.NgayNhapNgu,objEmployees.NgayXuatNgu,objEmployees.QuanHamCaoNhat, 0);
        }

        public override void DeleteEmployees(EmployeesInfo objEmployees)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Employees"), objEmployees.id, objEmployees.fullname, objEmployees.othername, objEmployees.specialname, objEmployees.empcode, objEmployees.unitid, objEmployees.birthday, objEmployees.sex, objEmployees.image, objEmployees.placeofbirth, objEmployees.place_provinceid, objEmployees.nativeplace, objEmployees.nativeplace_provinceid, objEmployees.provinceid, objEmployees.nationalityid, objEmployees.religionid, objEmployees.identitynum, objEmployees.dateofissue, objEmployees.placeofissue, objEmployees.cellphone, objEmployees.officephone, objEmployees.email, objEmployees.taxcode, objEmployees.forte, objEmployees.hobby, objEmployees.placeofresidence, objEmployees.placeofcurrent, objEmployees.height, objEmployees.weigh, objEmployees.bloodgroupid, objEmployees.culturalid, objEmployees.qualificationid, objEmployees.politicalconsciousnessid, objEmployees.statemanagementid, objEmployees.positionid, objEmployees.socialinsurancenum, objEmployees.healthinsurancenum, objEmployees.placetomedicalexam, objEmployees.soldiertypeid, objEmployees.socialwelfaretypeid, objEmployees.retiredate, objEmployees.startdate, objEmployees.prevunit, objEmployees.prevwork, objEmployees.note, objEmployees.mainjob, objEmployees.honourable, objEmployees.workabroad, objEmployees.goabroad, objEmployees.economy, objEmployees.family, objEmployees.daterecruit, objEmployees.asalaryid, objEmployees.bsalaryid, objEmployees.professionid, objEmployees.isactive, objEmployees.familytypeid, objEmployees.familytype_currentid, objEmployees.employeetypeid, objEmployees.workeviroment, objEmployees.datesocialinsurance, objEmployees.languageid, objEmployees.itid, objEmployees.healthid, objEmployees.partyplace, objEmployees.partydate, objEmployees.youthplace, objEmployees.youthdate, objEmployees.allowance, objEmployees.countryid, objEmployees.occupation, objEmployees.officeid, objEmployees.unitrecruit, objEmployees.partyposition, objEmployees.comunityposition, objEmployees.DVYeuCau, objEmployees.idHinhThucDaoTao, objEmployees.idLoaiHopDong, objEmployees.NgayKetNapDang, objEmployees.NgayChinhThuc, objEmployees.NoiKetNapDang, objEmployees.DangBoKetNap, objEmployees.ChiBoKetNap, objEmployees.SoThe, objEmployees.NgayCap, objEmployees.nguoiGioiThieuVaoDang, objEmployees.DBDangSinhHoat, objEmployees.CBDangSinhHoat, objEmployees.isoms, objEmployees.Passport, objEmployees.PassportDate, objEmployees.PassPortIssue, objEmployees.NgayNhapNgu, objEmployees.NgayXuatNgu, objEmployees.QuanHamCaoNhat, 2);
        }

        public override IDataReader GetEmployees(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployees"),itemId);
        }

        public override IDataReader GetEmployeess()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployees"),0);
        }
        public override IDataReader GetEmployeesEmpcode(int unitid)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesEmpCode"), unitid);
        }
        public override IDataReader GetEmployeesSearch()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesSearch"));
        }
        
        public override IDataReader GetEmptyEmp()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmptyEmp"));
        }
        public override IDataReader GetColleaguesEmployee(int unitid)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetColleaguesEmployee"),unitid);
        }
        public override IDataReader GetEmployeeByCode(string code)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeByCode"), code);
        }
        public override IDataReader GetEmployeeByCardId(string code)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeByCardId"), code);
        }
        
        public override IDataReader GetBirthDay()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBirthDay"));
        }
        public override IDataReader GetEmployeesByUnit(decimal unitId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesByUnit"), unitId);
        }
        public override IDataReader GetEmployeesById(int Id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesById"), Id);
        }
        public override IDataReader GetEmployeesByIdMax()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesByIdMax"));
        }
        public override void UpdateEmployees(EmployeesInfo objEmployees)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Employees"), objEmployees.id, objEmployees.fullname, objEmployees.othername, objEmployees.specialname, objEmployees.empcode, objEmployees.unitid, objEmployees.birthday, objEmployees.sex, objEmployees.image, objEmployees.placeofbirth, objEmployees.place_provinceid, objEmployees.nativeplace, objEmployees.nativeplace_provinceid, objEmployees.provinceid, objEmployees.nationalityid, objEmployees.religionid, objEmployees.identitynum, objEmployees.dateofissue, objEmployees.placeofissue, objEmployees.cellphone, objEmployees.officephone, objEmployees.email, objEmployees.taxcode, objEmployees.forte, objEmployees.hobby, objEmployees.placeofresidence, objEmployees.placeofcurrent, objEmployees.height, objEmployees.weigh, objEmployees.bloodgroupid, objEmployees.culturalid, objEmployees.qualificationid, objEmployees.politicalconsciousnessid, objEmployees.statemanagementid, objEmployees.positionid, objEmployees.socialinsurancenum, objEmployees.healthinsurancenum, objEmployees.placetomedicalexam, objEmployees.soldiertypeid, objEmployees.socialwelfaretypeid, objEmployees.retiredate, objEmployees.startdate, objEmployees.prevunit, objEmployees.prevwork, objEmployees.note, objEmployees.mainjob, objEmployees.honourable, objEmployees.workabroad, objEmployees.goabroad, objEmployees.economy, objEmployees.family, objEmployees.daterecruit, objEmployees.asalaryid, objEmployees.bsalaryid, objEmployees.professionid, objEmployees.isactive, objEmployees.familytypeid, objEmployees.familytype_currentid, objEmployees.employeetypeid, objEmployees.workeviroment, objEmployees.datesocialinsurance, objEmployees.languageid, objEmployees.itid, objEmployees.healthid, objEmployees.partyplace, objEmployees.partydate, objEmployees.youthplace, objEmployees.youthdate, objEmployees.allowance, objEmployees.countryid, objEmployees.occupation, objEmployees.officeid, objEmployees.unitrecruit, objEmployees.partyposition, objEmployees.comunityposition, objEmployees.DVYeuCau, objEmployees.idHinhThucDaoTao, objEmployees.idLoaiHopDong, objEmployees.NgayKetNapDang, objEmployees.NgayChinhThuc, objEmployees.NoiKetNapDang, objEmployees.DangBoKetNap, objEmployees.ChiBoKetNap, objEmployees.SoThe, objEmployees.NgayCap, objEmployees.nguoiGioiThieuVaoDang, objEmployees.DBDangSinhHoat, objEmployees.CBDangSinhHoat, objEmployees.isoms, objEmployees.Passport, objEmployees.PassportDate, objEmployees.PassPortIssue, objEmployees.NgayNhapNgu, objEmployees.NgayXuatNgu, objEmployees.QuanHamCaoNhat, 1);
        }
        public override IDataReader Get_GiamDocTT(int unitId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_Get_GiamDocTT"), unitId);
        }
    }
}

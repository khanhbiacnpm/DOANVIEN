using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.ChangeSalary
{
    public class SqlDataProvider : DataProvider
    {

        private const string ProviderType = "data";
        private ProviderConfiguration _providerConfiguration = ProviderConfiguration.GetProviderConfiguration(ProviderType);
        private string _connectionString;
        private string _databaseOwner;

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
            get { return _connectionString; }
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

        public override void AddChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ChangeSalary"), objChangeSalary.id, objChangeSalary.employeeid, objChangeSalary.ngayki, objChangeSalary.changedate,objChangeSalary.classid, objChangeSalary.salarylevel,objChangeSalary.type, objChangeSalary.salarycoefficient, objChangeSalary.reason, objChangeSalary.editor, objChangeSalary.modifieddate, objChangeSalary.ip, objChangeSalary.soQD, objChangeSalary.LuongCB, objChangeSalary.BHXH,objChangeSalary.BHYT,objChangeSalary.BHTN,objChangeSalary.PhuCap, objChangeSalary.DenNgay, objChangeSalary.FileKem, objChangeSalary.KieuLuong,objChangeSalary.officeid, 0);
        }

        public override void DeleteChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ChangeSalary"), objChangeSalary.id, objChangeSalary.employeeid, objChangeSalary.ngayki, objChangeSalary.changedate, objChangeSalary.classid, objChangeSalary.salarylevel, objChangeSalary.type, objChangeSalary.salarycoefficient, objChangeSalary.reason, objChangeSalary.editor, objChangeSalary.modifieddate, objChangeSalary.ip, objChangeSalary.soQD, objChangeSalary.LuongCB, objChangeSalary.BHXH, objChangeSalary.BHYT, objChangeSalary.BHTN, objChangeSalary.PhuCap, objChangeSalary.DenNgay, objChangeSalary.FileKem, objChangeSalary.KieuLuong, objChangeSalary.officeid, 2);
        }
        public override void DeleteChangeSalarys(int id,int type)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_DeleteChangeSalary"), id, type);
        }
        
        public override IDataReader GetChangeSalary(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChangeSalary"),itemId);
        }

        public override IDataReader GetNgachBac(int classId, DateTime changedate)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNgachBacLuongA]"), classId,changedate);
        }
        public override IDataReader GetNangBacLuong_QTCongTacByThoiGian(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetNangBacLuong_QTCongTacByThoiGian"), empid, tuNgay, denNgay);
        } 
        public override IDataReader GetChangeSalarys()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChangeSalary"),0);
        }
        public override IDataReader GetChangeSalaryB()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChangeSalaryB"), 0);
        }
        public override IDataReader GetChangeSalaryByEmployee(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChangeSalaryByEmployee"), employeeId);
        }
        public override IDataReader GetChangeSalaryBByEmployee(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChangeSalaryBByEmployee"), employeeId);
        }
        public override void UpdateChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ChangeSalary"), objChangeSalary.id, objChangeSalary.employeeid, objChangeSalary.ngayki, objChangeSalary.changedate, objChangeSalary.classid, objChangeSalary.salarylevel, objChangeSalary.type, objChangeSalary.salarycoefficient, objChangeSalary.reason, objChangeSalary.editor, objChangeSalary.modifieddate, objChangeSalary.ip, objChangeSalary.soQD, objChangeSalary.LuongCB, objChangeSalary.BHXH, objChangeSalary.BHYT, objChangeSalary.BHTN, objChangeSalary.PhuCap, objChangeSalary.DenNgay, objChangeSalary.FileKem, objChangeSalary.KieuLuong, objChangeSalary.officeid, 1);
        }

        public override IDataReader GetSalaryHistory(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSalaryHistory"), empid, tuNgay, denNgay);
        }
    }
}

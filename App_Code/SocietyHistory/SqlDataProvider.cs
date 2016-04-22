using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.SocietyHistory
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

        public override void AddSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SocietyHistory"), objSocietyHistory.id, objSocietyHistory.fromdate, objSocietyHistory.todate, objSocietyHistory.content, objSocietyHistory.employeeid, objSocietyHistory.ChucVuDoanThe, 0);
        }

        public override void DeleteSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SocietyHistory"), objSocietyHistory.id, objSocietyHistory.fromdate, objSocietyHistory.todate, objSocietyHistory.content, objSocietyHistory.employeeid, objSocietyHistory.ChucVuDoanThe, 2);
        }

        public override IDataReader GetSocietyHistory(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSocietyHistory"), itemId);
        }

        public override IDataReader GetSocietyHistorys()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSocietyHistory"), 0);
        }

        public override void UpdateSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SocietyHistory"), objSocietyHistory.id, objSocietyHistory.fromdate, objSocietyHistory.todate, objSocietyHistory.content, objSocietyHistory.employeeid, objSocietyHistory.ChucVuDoanThe, 1);
        }
        public override IDataReader GetSocietyHistoryByEmployess(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSocietyHistoryByEmployeeId"), employeeId);
        }
        //danh gia doan vien 
        public override void AddSort(SortSociety objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_SortSociety]"), objSocietyHistory.Id, objSocietyHistory.Year, objSocietyHistory.EmpId, objSocietyHistory.Sort, objSocietyHistory.content, objSocietyHistory.PositionId, 0);
        }

        public override void DeleteSort(SortSociety objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_SortSociety]"), objSocietyHistory.Id, objSocietyHistory.Year, objSocietyHistory.EmpId, objSocietyHistory.Sort, objSocietyHistory.content, objSocietyHistory.PositionId, 2);
        }

        public override IDataReader GetSortSociety(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetSortSociety]"), itemId);
        }

        public override IDataReader GetSortSocieties()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetSortSociety]"), 0);
        }

        public override void UpdateSort(SortSociety objSocietyHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_SortSociety]"), objSocietyHistory.Id, objSocietyHistory.Year, objSocietyHistory.EmpId, objSocietyHistory.Sort, objSocietyHistory.content, objSocietyHistory.PositionId, 1);
        }
        public override IDataReader GetSortSocietyByEmployess(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetSortSocietyByEmployeeId]"), employeeId);
        }
    }
}
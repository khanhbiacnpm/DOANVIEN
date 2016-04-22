using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.EmployeesHistory
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

        public override void AddEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeesHistory"), objEmployeesHistory.id, objEmployeesHistory.fromdate, objEmployeesHistory.todate, objEmployeesHistory.content, objEmployeesHistory.employeeid, 0);
        }

        public override void DeleteEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeesHistory"), objEmployeesHistory.id, objEmployeesHistory.fromdate, objEmployeesHistory.todate, objEmployeesHistory.content, objEmployeesHistory.employeeid, 2);
        }

        public override IDataReader GetEmployeesHistory(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesHistory"), itemId);
        }

        public override IDataReader GetEmployeesHistorys()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesHistory"), 0);
        }

        public override IDataReader GetEmployeeHistoryByEmployess(int employeeid)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeHistoryByEmployeeId"), employeeid);
        }

        public override void UpdateEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeesHistory"), objEmployeesHistory.id, objEmployeesHistory.fromdate, objEmployeesHistory.todate, objEmployeesHistory.content, objEmployeesHistory.employeeid, 1);
        }

    }
}
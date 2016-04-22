using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Leave
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

        public override void AddLeave(LeaveInfo objLeave)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Leave"), objLeave.id, objLeave.employeeid, objLeave.unitid, objLeave.year, objLeave.fromdate, objLeave.todate,objLeave.provinceid, objLeave.place, objLeave.reason, objLeave.leavetype, objLeave.editor, objLeave.modifieddate, objLeave.ip, objLeave.SoQD, 0);
        }

        public override void DeleteLeave(LeaveInfo objLeave)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Leave"), objLeave.id, objLeave.employeeid, objLeave.unitid, objLeave.year, objLeave.fromdate, objLeave.todate, objLeave.provinceid, objLeave.place, objLeave.reason, objLeave.leavetype, objLeave.editor, objLeave.modifieddate, objLeave.ip, objLeave.SoQD, 2);
        }

        public override IDataReader GetLeave(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLeave"), itemId);
        }

        public override IDataReader GetLeaves()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLeave"), 0);
        }
        public override IDataReader GetLeaveByEmp(int empId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLeaveByEmployee"),empId);
        }
        public override IDataReader GetLeaveByTime(int month, int year)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLeaveByTime"),month,year);
        }
        public override void UpdateLeave(LeaveInfo objLeave)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Leave"), objLeave.id, objLeave.employeeid, objLeave.unitid, objLeave.year, objLeave.fromdate, objLeave.todate, objLeave.provinceid, objLeave.place, objLeave.reason, objLeave.leavetype, objLeave.editor, objLeave.modifieddate, objLeave.ip, objLeave.SoQD, 1);
        }

    }
}
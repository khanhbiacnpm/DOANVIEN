using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;
using System.Configuration;

namespace VNPT.Modules.EmployeeContract
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

        public override void AddEmployeeContract(EmployeeContractInfo objEmployeeContract)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeeContract"), objEmployeeContract.id, objEmployeeContract.employeeid, objEmployeeContract.contractnum, objEmployeeContract.represent,  objEmployeeContract.representunit, objEmployeeContract.representphone, objEmployeeContract.representaddress,  objEmployeeContract.datestart, objEmployeeContract.dateend,objEmployeeContract.contracttype, 0);
        }

        public override void DeleteEmployeeContract(EmployeeContractInfo objEmployeeContract)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeeContract"), objEmployeeContract.id, objEmployeeContract.employeeid, objEmployeeContract.contractnum, objEmployeeContract.represent, objEmployeeContract.representunit, objEmployeeContract.representphone, objEmployeeContract.representaddress, objEmployeeContract.datestart, objEmployeeContract.dateend, objEmployeeContract.contracttype, 2);
        }
        public override void DeleteEmployeeContracts(int id)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_DeleteEmployeeContract]"), id);
        }

        public override IDataReader GetEmployeeContract(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeContract"),itemId);
        }
        public override IDataReader GetContractsByEmployess(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetContractByEmployess"), employeeId);
        }
        public override IDataReader GetEmployeeContractType(int employeeId, int idLoaiHopDong)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeContractType"), employeeId, idLoaiHopDong);
        }
        public override IDataReader GetContractsByEmployess_khanh(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetContractByEmployess"), employeeId);
        }
        public override IDataReader GetEmployeeContracts()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeeContract"), 0);
        }
        public override IDataReader GetContractExpried()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetContractExpried"));
        }

        public override void UpdateEmployeeContract(EmployeeContractInfo objEmployeeContract)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_EmployeeContract"), objEmployeeContract.id, objEmployeeContract.employeeid, objEmployeeContract.contractnum, objEmployeeContract.represent, objEmployeeContract.representunit, objEmployeeContract.representphone, objEmployeeContract.representaddress, objEmployeeContract.datestart, objEmployeeContract.dateend, objEmployeeContract.contracttype, 1);
        }

    }
}
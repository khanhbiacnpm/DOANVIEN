using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.StateManagement
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

        public override void AddStateManagement(StateManagementInfo objStateManagement)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_StateManagement"), objStateManagement.id, objStateManagement.name, objStateManagement.sequence, objStateManagement.editor, objStateManagement.modifieddate, objStateManagement.ip, 0);
        }

        public override void DeleteStateManagement(StateManagementInfo objStateManagement)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_StateManagement"), objStateManagement.id, objStateManagement.name, objStateManagement.sequence, objStateManagement.editor, objStateManagement.modifieddate, objStateManagement.ip, 2);
        }

        public override IDataReader GetStateManagement(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetStateManagement"), itemId);
        }

        public override IDataReader GetStateManagements()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetStateManagement"),0);
        }

        public override void UpdateStateManagement(StateManagementInfo objStateManagement)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_StateManagement"), objStateManagement.id, objStateManagement.name, objStateManagement.sequence, objStateManagement.editor, objStateManagement.modifieddate, objStateManagement.ip, 1);
        }

    }
}
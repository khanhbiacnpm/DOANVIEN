
using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Religion
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

        public override void AddReligions(ReligionInfo objReligions)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Religions"), objReligions.id, objReligions.name, objReligions.description, objReligions.editor, objReligions.modifieddate, objReligions.ip, 0);
        }

        public override void DeleteReligions(ReligionInfo objReligions)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Religions"), objReligions.id, objReligions.name, objReligions.description, objReligions.editor, objReligions.modifieddate, objReligions.ip, 2);
        }

        public override IDataReader GetReligion(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetReligions"),itemId);
        }

        public override IDataReader GetReligions()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetReligions"),0);
        }

        public override void UpdateReligions(ReligionInfo objReligions)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Religions"), objReligions.id, objReligions.name, objReligions.description, objReligions.editor, objReligions.modifieddate, objReligions.ip, 1);
        }

    }

}

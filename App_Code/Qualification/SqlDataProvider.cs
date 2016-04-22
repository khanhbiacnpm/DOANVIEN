

using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Qualification
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

        public override void AddQualifications(QualificationsInfo objQualifications)
        {
            
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Qualifications"), objQualifications.id, objQualifications.name, objQualifications.level, objQualifications.code, 0);

        }

        public override void DeleteQualifications(QualificationsInfo objQualifications)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Qualifications"), objQualifications.id, objQualifications.name, objQualifications.level, objQualifications.code, 2);
        }

        public override IDataReader GetQualification(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetQualifications"),itemId);
        }
        public override IDataReader GetQualificationByCode(string itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetQualificationsByCode]"), itemId);
        }

        public override IDataReader GetQualifications()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetQualifications"),0);
        }

        public override void UpdateQualifications(QualificationsInfo objQualifications)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Qualifications"), objQualifications.id, objQualifications.name, objQualifications.level, objQualifications.code, 1);
        }

    }

}

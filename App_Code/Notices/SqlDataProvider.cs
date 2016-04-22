using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Notices
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

        public override void AddNotices(NoticesInfo objNotices)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Notices"), objNotices.id, objNotices.title, objNotices.content, objNotices.editor, objNotices.notedate, objNotices.ip, 0);
        }

        public override void DeleteNotices(NoticesInfo objNotices)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Notices"), objNotices.id, objNotices.title, objNotices.content, objNotices.editor, objNotices.notedate, objNotices.ip, 2);
        }

        public override IDataReader GetNotices(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetNotices"),itemId);
        }
        public override IDataReader GetDisplayedNotices(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetDisplayedNotices"), itemId);
        }

        public override IDataReader GetNoticess()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetNotices"),0);
        }
        public override IDataReader GetTopNotices()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTopNotices"));
        }

        public override void UpdateNotices(NoticesInfo objNotices)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Notices"), objNotices.id, objNotices.title, objNotices.content, objNotices.editor, objNotices.notedate, objNotices.ip, 1);
        }

    }
}
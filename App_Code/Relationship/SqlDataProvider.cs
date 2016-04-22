/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Relationship
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

        public override void AddRelationship(RelationshipInfo objRelationship)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Relationship"), objRelationship.id, objRelationship.name, objRelationship.rank,objRelationship.level, 0);
        }

        public override void DeleteRelationship(RelationshipInfo objRelationship)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Relationship"), objRelationship.id, objRelationship.name, objRelationship.rank, objRelationship.level, 2);
        }

        public override IDataReader GetRelationship(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRelationship"), itemId);
        }

        public override IDataReader GetRelationships()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRelationship"),0);
        }

        public override void UpdateRelationship(RelationshipInfo objRelationship)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Relationship"), objRelationship.id, objRelationship.name, objRelationship.rank, objRelationship.level, 1);
        }

    }

}

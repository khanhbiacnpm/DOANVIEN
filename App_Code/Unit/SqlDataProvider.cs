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
using System.Configuration;

namespace VNPT.Modules.Unit
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

        public override void AddUnit(UnitInfo objUnit)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Unit"), objUnit.id, objUnit.name, objUnit.effectivedate, objUnit.establishdesicion, objUnit.establishdate, objUnit.functiondesicion, objUnit.functiondate, objUnit.expirydate, objUnit.canceldesicion, objUnit.function, objUnit.parentid, objUnit.address, objUnit.phone, objUnit.taxcode, objUnit.level,  objUnit.status, objUnit.coefficient, objUnit.code, objUnit.dinhbienlaodong, objUnit.loaidonvi, 0);
        }

        public override void DeleteUnit(UnitInfo objUnit)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Unit"), objUnit.id, objUnit.name, objUnit.effectivedate, objUnit.establishdesicion, objUnit.establishdate, objUnit.functiondesicion, objUnit.functiondate, objUnit.expirydate, objUnit.canceldesicion, objUnit.function, objUnit.parentid, objUnit.address, objUnit.phone, objUnit.taxcode, objUnit.level, objUnit.status, objUnit.coefficient, objUnit.code, objUnit.dinhbienlaodong, objUnit.loaidonvi, 2);
        }

        public override IDataReader GetUnit(decimal itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetUnit"),itemId);
        }

        public override IDataReader GetUnits()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetUnit"),0);
        }
        public override IDataReader GetParentUnits()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetParentUnit"));
        }
        public override IDataReader GetChildUnits(decimal parentId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetChildUnit1"), parentId);
        }
        public override IDataReader CheckUnitId(string unitid)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_CheckUnitId"), unitid);
        }

        public override void UpdateUnit(UnitInfo objUnit)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Unit"), objUnit.id, objUnit.name, objUnit.effectivedate, objUnit.establishdesicion, objUnit.establishdate, objUnit.functiondesicion, objUnit.functiondate, objUnit.expirydate, objUnit.canceldesicion, objUnit.function, objUnit.parentid, objUnit.address, objUnit.phone, objUnit.taxcode, objUnit.level, objUnit.status, objUnit.coefficient, objUnit.code, objUnit.dinhbienlaodong, objUnit.loaidonvi, 1);
        }
        public override IDataReader GetRootUnit(decimal empid, int type)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRootUnit"), empid, type);
        }
    }

}

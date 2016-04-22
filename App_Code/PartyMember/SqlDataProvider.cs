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

namespace VNPT.Modules.PartyMember
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
        public override void AddPartyMember(PartyMemberInfo objPartyMember)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_PartyMember"), objPartyMember.id, objPartyMember.IdNhanVien, objPartyMember.NoiDung, objPartyMember.ChucVuDang, objPartyMember.SoQD, objPartyMember.CapQD, objPartyMember.ThoiGianQD, objPartyMember.FileQD,objPartyMember.idToChucDang, objPartyMember.tenchucvudang, objPartyMember.tentochucdang, objPartyMember.loaikiemnhiem, 0);
        }
        public override void DeletePartyMember(PartyMemberInfo objPartyMember)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_PartyMember"), objPartyMember.id, objPartyMember.IdNhanVien, objPartyMember.NoiDung, objPartyMember.ChucVuDang, objPartyMember.SoQD, objPartyMember.CapQD, objPartyMember.ThoiGianQD, objPartyMember.FileQD, objPartyMember.idToChucDang, objPartyMember.tenchucvudang, objPartyMember.tentochucdang, objPartyMember.loaikiemnhiem, 2);
        }
        public override IDataReader GetPartyMember(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPartyMember"),itemId);
        }
        public override IDataReader GetPartyMembers()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPartyMember"), 0);
        }
        public override IDataReader GetPartyMemberByEmployee(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPartyMemberByEmployee"), employeeId);
        }
        public override void UpdatePartyMember(PartyMemberInfo objPartyMember)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_PartyMember"), objPartyMember.id, objPartyMember.IdNhanVien, objPartyMember.NoiDung, objPartyMember.ChucVuDang, objPartyMember.SoQD, objPartyMember.CapQD, objPartyMember.ThoiGianQD, objPartyMember.FileQD, objPartyMember.idToChucDang, objPartyMember.tenchucvudang, objPartyMember.tentochucdang, objPartyMember.loaikiemnhiem, 1);
        }
        public override IDataReader GetPartyMemberByEmployee_ChucVuDang(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetTatCaChucVuDang1]"), employeeId);
        }
    }
}

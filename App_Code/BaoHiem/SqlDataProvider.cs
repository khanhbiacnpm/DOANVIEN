using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace Philip.Modules.BaoHiem
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The SqlDataProvider class is a SQL Server implementation of the abstract DataProvider
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
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
        public override void AddBaoHiem(BaoHiemInfo objBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BaoHiem"), objBaoHiem.id, objBaoHiem.idloaibh, objBaoHiem.tlnsudunglaodong, objBaoHiem.tllaodong, objBaoHiem.thoidiem , 0);
        }
        public override void DeleteBaoHiem(BaoHiemInfo objBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BaoHiem"), objBaoHiem.id, objBaoHiem.idloaibh, objBaoHiem.tlnsudunglaodong, objBaoHiem.tllaodong, objBaoHiem.thoidiem, 2);
        }
        public override void UpdateBaoHiem(BaoHiemInfo objBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BaoHiem"), objBaoHiem.id, objBaoHiem.idloaibh, objBaoHiem.tlnsudunglaodong, objBaoHiem.tllaodong, objBaoHiem.thoidiem, 1);
        }
        public override IDataReader GetBaoHiemByIdLoaiBH(int idLoaiBH)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBaoHiemByIdLoaiBH"), idLoaiBH);
        }
        public override IDataReader GetBaoHiemId(int id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBaoHiemById"), id);
        }
        public override IDataReader GetTTBaoHiem(int idLoaiBH, DateTime datetime)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTTBaoHiem"), idLoaiBH, datetime);
        }
        public override IDataReader GetBaoHiems()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBaoHiemById"), 0);
        }

        // loai bao hiem
        public override void AddLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LoaiBH"), objLoaiBaoHiem.id, objLoaiBaoHiem.loaibh, 0);
        }
        public override void DeleteLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LoaiBH"), objLoaiBaoHiem.id, objLoaiBaoHiem.loaibh, 2);
        }
        public override void UpdateLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LoaiBH"), objLoaiBaoHiem.id, objLoaiBaoHiem.loaibh, 1);
        }

        public override IDataReader GetLoaiBaoHiemId(int id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLoaiBaoHiem"), id);
        }
        public override IDataReader GetLoaiBaoHiems()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLoaiBaoHiem"), 0);
        }  

        // luong cb
        public override void AddLuongCB(LuongCBInfo objLuongCB)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LuongCB"), objLuongCB.id, objLuongCB.luongcb, objLuongCB.thoidiem, objLuongCB.soqd, objLuongCB.fileKem, 0);
        }
        public override void DeleteLuongCB(LuongCBInfo objLuongCB)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LuongCB"), objLuongCB.id, objLuongCB.luongcb, objLuongCB.thoidiem, objLuongCB.soqd, objLuongCB.fileKem, 2);
        }
        public override void UpdateLuongCB(LuongCBInfo objLuongCB)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_LuongCB"), objLuongCB.id, objLuongCB.luongcb, objLuongCB.thoidiem, objLuongCB.soqd, objLuongCB.fileKem, 1);
        }
        public override IDataReader GetLuongCBId(int id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLuongCB"), id);
        }
        public override IDataReader GetLuongCBs()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLuongCB"), 0);
        }
        public override IDataReader GetTTLuongCB(DateTime datetime)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTTLuongCB"), datetime);
        }
        // danh sach tham gia bao hiem
        public override IDataReader GetEmployeesTGBaoHiemByUnitid(int unitid)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetEmployeesTGBaoHiemByUnitid"), unitid);
        }
        public override IDataReader GetThoiDiemLuongAQTCTTheoIdNV(int idNV)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_NhomLuongAQTCongTacTheoIdNV"), idNV);
        }
    }
}

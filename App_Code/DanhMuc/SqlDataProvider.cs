using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;
using System.Configuration;

namespace VNPT.Modules.DanhMuc
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

        public override void ThemNhomChucDanh(NhomChucDanhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanh]"), obj.Id, obj.NhomChucDanh,obj.MaNhom,obj.LoaiLaoDong, 0);
        }

        public override void XoaNhomChucDanh(NhomChucDanhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanh]"), obj.Id, obj.NhomChucDanh, obj.MaNhom, obj.LoaiLaoDong, 2);
        }

        public override IDataReader GetNhomChucDanh(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChucDanh]"), itemId);
        }

        public override IDataReader GetNhomChucDanhs()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChucDanh]"), 0);
        }

        public override void CapNhatNhomChucDanh(NhomChucDanhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanh]"), obj.Id, obj.NhomChucDanh, obj.MaNhom, obj.LoaiLaoDong, 1);
        }
        //nhom chuc danh B
        public override void ThemNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanhB]"), obj.Id, obj.NhomChucDanh, obj.MaNhom,obj.ThuTu,  0);
        }

        public override void XoaNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanhB]"), obj.Id, obj.NhomChucDanh, obj.MaNhom, obj.ThuTu, 2);
        }

        public override IDataReader GetNhomChucDanhB(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChucDanhB]"), itemId);
        }

        public override IDataReader GetNhomChucDanhBs()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChucDanhB]"), 0);
        }

        public override void CapNhatNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChucDanhB]"), obj.Id, obj.NhomChucDanh, obj.MaNhom, obj.ThuTu, 1);
        }
        // kha nanng cong viec
        public override void ThemKhaNang(KhaNangCongViecInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_KhaNangCongViec]"), obj.Id, obj.KhaNang, 0);
        }

        public override void XoaKhaNang(KhaNangCongViecInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_KhaNangCongViec]"), obj.Id, obj.KhaNang, 2);
        }

        public override IDataReader GetKhaNang(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetKhaNangCongViec]"), itemId);
        }

        public override IDataReader GetKhaNangs()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetKhaNangCongViec]"), 0);
        }

        public override void CapNhatKhaNang(KhaNangCongViecInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_KhaNangCongViec]"), obj.Id, obj.KhaNang, 1);
        }
        // nhom chuyen nganh
        public override void ThemNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChuyenNganh]"), obj.Id, obj.NhomChuyenNganh,obj.MaNhom, 0);
        }

        public override void XoaNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChuyenNganh]"), obj.Id, obj.NhomChuyenNganh, obj.MaNhom, 2);
        }

        public override IDataReader GetNhomChuyenNganh(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChuyenNganh]"), itemId);
        }

        public override IDataReader GetNhomChuyenNganhs()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetNhomChuyenNganh]"), 0);
        }

        public override void CapNhatNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_NhomChuyenNganh]"), obj.Id, obj.NhomChuyenNganh, obj.MaNhom, 1);
        }
        // Khoa dao tao 
        public override void ThemKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[qldv_HRM_KhoaDaoTao]"), obj.Id, obj.KhoaDaoTao, 0);
        }

        public override void XoaKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[qldv_HRM_KhoaDaoTao]"), obj.Id, obj.KhoaDaoTao, 2);
        }

        public override IDataReader GetKhoaDaoTao(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetKhoaDaoTao]"), itemId);
        }

        public override IDataReader GetKhoaDaoTaos()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("[HRM_GetKhoaDaoTao]"), 0);
        }

        public override void CapNhatKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[qldv_HRM_KhoaDaoTao]"), obj.Id, obj.KhoaDaoTao, 1);
        }
    }
}
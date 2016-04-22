using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;
using System.Configuration;
namespace Philip.Modules.doanThe
{    
    public class SqlDataProvider : DataProvider
    {

        private const string ProviderType = "data";
        private ProviderConfiguration _providerConfiguration = ProviderConfiguration.GetProviderConfiguration(ProviderType);
        private string _connectionString;
        private string _databaseOwner;
        private string str_conn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
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
            get { return str_conn; }
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

        // doan the
        public override void themDoanThe(doanTheInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_doanThe"), objdoanThe.id, objdoanThe.idNhanVien, objdoanThe.idChucVuDoanThe, objdoanThe.noiDung, objdoanThe.capQuyetDinh, objdoanThe.soQuyetDinh, objdoanThe.fileQuyetDinh, objdoanThe.ngay, 0);
        }
        public override void suaDoanThe(doanTheInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_doanThe"), objdoanThe.id, objdoanThe.idNhanVien, objdoanThe.idChucVuDoanThe, objdoanThe.noiDung, objdoanThe.capQuyetDinh, objdoanThe.soQuyetDinh, objdoanThe.fileQuyetDinh, objdoanThe.ngay, 1);
        } 
        public override void xoaDoanThe(doanTheInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_doanThe"), objdoanThe.id, objdoanThe.idNhanVien, objdoanThe.idChucVuDoanThe, objdoanThe.noiDung, objdoanThe.capQuyetDinh, objdoanThe.soQuyetDinh, objdoanThe.fileQuyetDinh, objdoanThe.ngay, 2);
        }
        public override IDataReader GetdoanThe(int idNV)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("Get_doanThe"), idNV);
        }
        public override IDataReader GetdoanTheById(int id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("Get_doanTheById"), id);
        }
        // to chuc dang chuan
        public override void themToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDangChuan"), objdoanThe.id, objdoanThe.ghichu, objdoanThe.loaitochuc, 0);
        }
        public override void suaToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDangChuan"), objdoanThe.id, objdoanThe.ghichu, objdoanThe.loaitochuc, 1);
        }
        public override void xoaToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDangChuan"), objdoanThe.id, objdoanThe.ghichu, objdoanThe.loaitochuc, 2);
        }
        public override IDataReader GetToChucDangChuan(int id,int loaiToChucDang)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetToChucDangChuan"), id, loaiToChucDang);
        }
        // to chuc dang
        public override void themToChucDang(toChucDangInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDang"), objdoanThe.id, objdoanThe.tentochucdang, objdoanThe.soqd, objdoanThe.ghichu, objdoanThe.ngay, objdoanThe.loaitochuc, objdoanThe.idtochucdangchuan,objdoanThe.file, 0);
        }
        public override void suaToChucDang(toChucDangInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDang"), objdoanThe.id, objdoanThe.tentochucdang, objdoanThe.soqd, objdoanThe.ghichu, objdoanThe.ngay, objdoanThe.loaitochuc, objdoanThe.idtochucdangchuan, objdoanThe.file, 1);
        }
        public override void xoaToChucDang(toChucDangInfo objdoanThe)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_ToChucDang"), objdoanThe.id, objdoanThe.tentochucdang, objdoanThe.soqd, objdoanThe.ghichu, objdoanThe.ngay, objdoanThe.loaitochuc, objdoanThe.idtochucdangchuan, objdoanThe.file, 2);
        }
        public override IDataReader GetToChucDang_idToChucDangChuan(int idToChucDangChuan,int loaitochuc)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetToChucDang_idToChucDangChuan"), idToChucDangChuan, loaitochuc);
        }
        public override IDataReader GetToChucDang_id(int id)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetToChucDang"), id);
        }
        public override IDataReader GetToChucDang_idToChucDangChuan_ngay(int idToChucDangChuan, DateTime ngay,int loaitochuc)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetToChucDang_Ngay"), idToChucDangChuan, ngay, loaitochuc);
        }
    }
}

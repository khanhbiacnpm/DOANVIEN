using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.RewardDiscipline
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
            get { return System.Configuration.ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString; }
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

        public override void AddRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_RewardDiscipline"), objRewardDiscipline.id, objRewardDiscipline.objectid, objRewardDiscipline.objecttype, objRewardDiscipline.type, objRewardDiscipline.detail, objRewardDiscipline.title, objRewardDiscipline.desicion, objRewardDiscipline.desiciondate, objRewardDiscipline.unitdesicion, objRewardDiscipline.level, objRewardDiscipline.HinhThucKiLuat, objRewardDiscipline.ThoiHanKyLuat, objRewardDiscipline.NgayHopKyLuat, objRewardDiscipline.fileKem, objRewardDiscipline.fileVanban, objRewardDiscipline.NguoiKyQuyetDinh, objRewardDiscipline.SoKyHieu, objRewardDiscipline.GhiChu, objRewardDiscipline.HinhThucThiDua, objRewardDiscipline.HinhthucKhenthuong, objRewardDiscipline.idThanhTichKhenThuong, objRewardDiscipline.TienThuong,objRewardDiscipline.Loai, 0);
        }

        public override void DeleteRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_RewardDiscipline"), objRewardDiscipline.id, objRewardDiscipline.objectid, objRewardDiscipline.objecttype, objRewardDiscipline.type, objRewardDiscipline.detail, objRewardDiscipline.title, objRewardDiscipline.desicion, objRewardDiscipline.desiciondate, objRewardDiscipline.unitdesicion, objRewardDiscipline.level, objRewardDiscipline.HinhThucKiLuat, objRewardDiscipline.ThoiHanKyLuat, objRewardDiscipline.NgayHopKyLuat, objRewardDiscipline.fileKem, objRewardDiscipline.fileVanban, objRewardDiscipline.NguoiKyQuyetDinh, objRewardDiscipline.SoKyHieu, objRewardDiscipline.GhiChu, objRewardDiscipline.HinhThucThiDua, objRewardDiscipline.HinhthucKhenthuong, objRewardDiscipline.idThanhTichKhenThuong, objRewardDiscipline.TienThuong, objRewardDiscipline.Loai, 2);
        }
        public override void DeleteRewardDisciplines(int id, int loai)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("[HRM_DeleteRewardDiscipline]"), id, loai);
        }
        public override IDataReader GetRewardDiscipline(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRewardDiscipline"), itemId);
        }
        public override IDataReader GetLatestDiscipline(int idnhanvien)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetLatestDiscipline"), idnhanvien);
        }
        public override IDataReader GetRewardDisciplines()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRewardDiscipline"), 0);
        }
        public override IDataReader GetRewardDisciplinesByObject(int objectId, int objectType, int type)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRewardDisciplineByObject"), objectId, objectType, type);
        }
        public override IDataReader GetRewardDisciplineByEmp(int objectId, int objectType)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRewardDisciplineByEmp"), objectId, objectType);
        }
        public override IDataReader GetRewardDisciplineByLevel(int EmpId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetRewardDisciplineByLevel"), EmpId);
        }
        public override void UpdateRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_RewardDiscipline"), objRewardDiscipline.id, objRewardDiscipline.objectid, objRewardDiscipline.objecttype, objRewardDiscipline.type, objRewardDiscipline.detail, objRewardDiscipline.title, objRewardDiscipline.desicion, objRewardDiscipline.desiciondate, objRewardDiscipline.unitdesicion, objRewardDiscipline.level, objRewardDiscipline.HinhThucKiLuat, objRewardDiscipline.ThoiHanKyLuat, objRewardDiscipline.NgayHopKyLuat, objRewardDiscipline.fileKem, objRewardDiscipline.fileVanban, objRewardDiscipline.NguoiKyQuyetDinh, objRewardDiscipline.SoKyHieu, objRewardDiscipline.GhiChu, objRewardDiscipline.HinhThucThiDua, objRewardDiscipline.HinhthucKhenthuong, objRewardDiscipline.idThanhTichKhenThuong, objRewardDiscipline.TienThuong, objRewardDiscipline.Loai, 1);
        }
        
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.SalaryType
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
        public override void AddSalaryType(SalaryTypeInfo objACoefficient)
		{            
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SalaryType"), objACoefficient.id, objACoefficient.title, objACoefficient.coefficient, objACoefficient.level, objACoefficient.dateeffectted, objACoefficient.status, objACoefficient.code,objACoefficient.groupid, objACoefficient.parentid, 0);
		}
        public override void DeleteSalaryType(SalaryTypeInfo objACoefficient)
		{
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SalaryType"), objACoefficient.id, objACoefficient.title, objACoefficient.coefficient, objACoefficient.level, objACoefficient.dateeffectted, objACoefficient.status, objACoefficient.code, objACoefficient.groupid, objACoefficient.parentid, 2);
		}
		public override IDataReader GetSalaryType(int itemId)
		{
			return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSalaryType"),itemId);
		}
        public override IDataReader GetACoefficientByGroup(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetACoefficientByGroup"), itemId);
        }
        public override IDataReader GetACoefficientByParentId(int itemIdParentid, DateTime dateeffectted,int option)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetACoefficientByParentId"), itemIdParentid, dateeffectted, option);
        }
		public override IDataReader GetSalaryTypes()
		{
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSalaryType"), 0);
		}
        public override void UpdateSalaryType(SalaryTypeInfo objACoefficient)
		{
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_SalaryType"), objACoefficient.id, objACoefficient.title, objACoefficient.coefficient, objACoefficient.level, objACoefficient.dateeffectted, objACoefficient.status, objACoefficient.code, objACoefficient.groupid, objACoefficient.parentid, 1);
		}
        public override IDataReader GetSalaryGroupIdMax(bool type)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetSalaryGroupIdMax"), type);
        }
        // phần bac luong cao nhat thuoc nhom luong
        public override void AddBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BacLuongCaoNhat_ThuocNhom"), objbacluong.id, objbacluong.idNhomLuong, objbacluong.kieuLuong, objbacluong.bacLuongTheoNhom, objbacluong.thoiDiem, 0);            
        }
        public override void UpdateBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BacLuongCaoNhat_ThuocNhom"), objbacluong.id, objbacluong.idNhomLuong, objbacluong.kieuLuong, objbacluong.bacLuongTheoNhom, objbacluong.thoiDiem, 1);
        }
        public override void DeleteBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_BacLuongCaoNhat_ThuocNhom"), objbacluong.id, objbacluong.idNhomLuong, objbacluong.kieuLuong, objbacluong.bacLuongTheoNhom, objbacluong.thoiDiem, 2);
        }
        public override IDataReader GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idNhomLuong, bool kieuLuong, DateTime thoiDiem)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem"), idNhomLuong, kieuLuong, thoiDiem);
        }
        public override IDataReader GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idItem)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBacLuongCaoNhat_Id"), idItem);
        }
        public override IDataReader GetBacLuongCaoNhat_IdNhomLuong(int idNhomLuong)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetBacLuongCaoNhat_IdNhomLuong"), idNhomLuong);
        }
	}
}

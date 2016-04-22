using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.SalaryType
{
    public abstract class DataProvider
    {
        static DataProvider objProvider = null;

        static DataProvider()
        {
            CreateProvider();
        }
        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.SalaryType", "");
        }
        public static DataProvider Instance()
        {
            return objProvider;
        }
        public abstract void AddSalaryType(SalaryTypeInfo objSalaryType);
        public abstract IDataReader GetSalaryType(int itemId);
        public abstract IDataReader GetACoefficientByGroup(int itemId);
        public abstract IDataReader GetACoefficientByParentId(int itemIdParentid, DateTime dateeffectted, int option);
        public abstract IDataReader GetSalaryTypes();
        public abstract void UpdateSalaryType(SalaryTypeInfo objSalaryType);
        public abstract void DeleteSalaryType(SalaryTypeInfo objSalaryType);

        // phan bac luong thuoc nhom luong
        public abstract void AddBacLuongCaoNhat(BacLuongTheoNhomInfo objBacLuong);
        public abstract void UpdateBacLuongCaoNhat(BacLuongTheoNhomInfo objBacLuong);
        public abstract void DeleteBacLuongCaoNhat(BacLuongTheoNhomInfo objBacLuong);
        public abstract IDataReader GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idNhomLuong, bool kieuLuong, DateTime thoiDiem);
        public abstract IDataReader GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idItem);
        public abstract IDataReader GetBacLuongCaoNhat_IdNhomLuong(int idNhomLuong);
        public abstract IDataReader GetSalaryGroupIdMax(bool type);
    }
}
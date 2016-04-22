using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.DanhMuc
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.DanhMuc", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        //nhom chuc danh
        public abstract void ThemNhomChucDanh(NhomChucDanhInfo obj);
        public abstract IDataReader GetNhomChucDanh(int itemId);
        public abstract IDataReader GetNhomChucDanhs();
        public abstract void CapNhatNhomChucDanh(NhomChucDanhInfo obj);
        public abstract void XoaNhomChucDanh(NhomChucDanhInfo obj);
        //nhom chuc danh B
        public abstract void ThemNhomChucDanhB(NhomChucDanhBInfo obj);
        public abstract IDataReader GetNhomChucDanhB(int itemId);
        public abstract IDataReader GetNhomChucDanhBs();
        public abstract void CapNhatNhomChucDanhB(NhomChucDanhBInfo obj);
        public abstract void XoaNhomChucDanhB(NhomChucDanhBInfo obj);
        //nhom chuyen nganh
        public abstract void ThemNhomChuyenNganh(NhomChuyenNganhInfo obj);
        public abstract IDataReader GetNhomChuyenNganh(int itemId);
        public abstract IDataReader GetNhomChuyenNganhs();
        public abstract void CapNhatNhomChuyenNganh(NhomChuyenNganhInfo obj);
        public abstract void XoaNhomChuyenNganh(NhomChuyenNganhInfo obj);
        //KhaNang cong viec
        public abstract void ThemKhaNang(KhaNangCongViecInfo obj);
        public abstract IDataReader GetKhaNang(int itemId);
        public abstract IDataReader GetKhaNangs();
        public abstract void CapNhatKhaNang(KhaNangCongViecInfo obj);
        public abstract void XoaKhaNang(KhaNangCongViecInfo obj);
        //Khoa dao tao
        public abstract void ThemKhoaDaoTao(KhoaDaoTaoInfo obj);
        public abstract IDataReader GetKhoaDaoTao(int itemId);
        public abstract IDataReader GetKhoaDaoTaos();
        public abstract void CapNhatKhoaDaoTao(KhoaDaoTaoInfo obj);
        public abstract void XoaKhoaDaoTao(KhoaDaoTaoInfo obj);

    }
}
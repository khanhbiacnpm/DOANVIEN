
using System;
using DotNetNuke;
using System.Data;

using DotNetNuke.Framework;

namespace Philip.Modules.doanThe
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// An abstract class that provides the DAL contract
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public abstract class DataProvider
    {

        #region Shared/Static Methods

        // singleton reference to the instantiated object 
        static DataProvider objProvider = null;

        // constructor
        static DataProvider()
        {
            CreateProvider();
        }

        // dynamically create provider
        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "Philip.Modules.doanThe", "");
        }

        // return the provider
        public static DataProvider Instance()
        {
            return objProvider;
        }

        #endregion

        #region Abstract methods
            // doan the
            public abstract void themDoanThe(doanTheInfo objdoanThe);
            public abstract void suaDoanThe(doanTheInfo objdoanThe);
            public abstract void xoaDoanThe(doanTheInfo objdoanThe);
            public abstract IDataReader GetdoanThe(int idNV);
            public abstract IDataReader GetdoanTheById(int id);    
        // to chuc dang chuan
            public abstract void themToChucDangChuan(toChucDangChuanInfo toChucDang);
            public abstract void suaToChucDangChuan(toChucDangChuanInfo toChucDang);
            public abstract void xoaToChucDangChuan(toChucDangChuanInfo toChucDang);
            public abstract IDataReader GetToChucDangChuan(int id,int loaiToChucDang);
            // to chuc dang
            public abstract void themToChucDang(toChucDangInfo toChucDang);
            public abstract void suaToChucDang(toChucDangInfo toChucDang);
            public abstract void xoaToChucDang(toChucDangInfo toChucDang);
            public abstract IDataReader GetToChucDang_idToChucDangChuan(int idToChucDangChuan, int loaiToChuc);        
            public abstract IDataReader GetToChucDang_id(int id);
            public abstract IDataReader GetToChucDang_idToChucDangChuan_ngay(int idToChucDangChuan, DateTime ngay, int loaiToChuc);

        #endregion

    }
}

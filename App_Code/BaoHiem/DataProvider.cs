
using System;
using DotNetNuke;
using System.Data;

using DotNetNuke.Framework;

namespace Philip.Modules.BaoHiem
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "Philip.Modules.BaoHiem", "");
        }

        // return the provider
        public static DataProvider Instance()
        {
            return objProvider;
        }

        #endregion

        #region Abstract methods

        public abstract void AddBaoHiem(BaoHiemInfo objBaoHiem);
        public abstract void UpdateBaoHiem(BaoHiemInfo objBaoHiem);
        public abstract void DeleteBaoHiem(BaoHiemInfo objBaoHiem);
        public abstract IDataReader GetBaoHiemByIdLoaiBH(int idLoaiBH);
        public abstract IDataReader GetTTBaoHiem(int idLoaiBH, DateTime datetime);
        public abstract IDataReader GetBaoHiemId(int id);      
        public abstract IDataReader GetBaoHiems();

        public abstract void AddLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem);
        public abstract void UpdateLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem);
        public abstract void DeleteLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem);
        public abstract IDataReader GetLoaiBaoHiemId(int id);
        public abstract IDataReader GetLoaiBaoHiems();

        public abstract void AddLuongCB(LuongCBInfo objLuongCB);
        public abstract void UpdateLuongCB(LuongCBInfo objLuongCB);
        public abstract void DeleteLuongCB(LuongCBInfo objLuongCB);
        public abstract IDataReader GetLuongCBId(int id);
        public abstract IDataReader GetLuongCBs();
        public abstract IDataReader GetTTLuongCB(DateTime thoidiem);
        
        // danh sach nv tham gia bao hiem xhoi va yte
        public abstract IDataReader GetEmployeesTGBaoHiemByUnitid(int unitid);
        public abstract IDataReader GetThoiDiemLuongAQTCTTheoIdNV(int idNV);
        #endregion

    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Xml;
using System.Web;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search;

namespace Philip.Modules.BaoHiem
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the BaoHiem
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class BaoHiemController 
    {
        // bao hiem

        public void AddBaoHiem(BaoHiemInfo objBaoHiem)
        {
            DataProvider.Instance().AddBaoHiem(objBaoHiem);
        }
        public void DeleteBaoHiem(BaoHiemInfo objBaoHiem)
        {
            DataProvider.Instance().DeleteBaoHiem(objBaoHiem);
        }
        public void UpdateBaoHiem(BaoHiemInfo objBaoHiem)
        {
            DataProvider.Instance().UpdateBaoHiem(objBaoHiem);
        }
        public List<BaoHiemInfo> GetBaoHiemByIdLoaiBH(int idLoaiBH)
        {
            return CBO.FillCollection<BaoHiemInfo>(DataProvider.Instance().GetBaoHiemByIdLoaiBH(idLoaiBH));
        }
        public BaoHiemInfo GetBaoHiemId(int id)
        {
            return CBO.FillObject<BaoHiemInfo>(DataProvider.Instance().GetBaoHiemId(id));
        }
        public BaoHiemInfo GetTTBaoHiem(int idLoaiBH, DateTime datetime)
        {
            return CBO.FillObject<BaoHiemInfo>(DataProvider.Instance().GetTTBaoHiem(idLoaiBH, datetime));
        }
        public List<BaoHiemInfo> GetBaoHiems()
        {
            return CBO.FillCollection<BaoHiemInfo>(DataProvider.Instance().GetBaoHiems());
        }

        // Loai bao hiem

        public void AddLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            DataProvider.Instance().AddLoaiBaoHiem(objLoaiBaoHiem);
        }
        public void DeleteLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            DataProvider.Instance().DeleteLoaiBaoHiem(objLoaiBaoHiem);
        }
        public void UpdateLoaiBaoHiem(LoaiBaoHiemInfo objLoaiBaoHiem)
        {
            DataProvider.Instance().UpdateLoaiBaoHiem(objLoaiBaoHiem);
        }
        public LoaiBaoHiemInfo GetLoaiBaoHiemId(int id)
        {
            return CBO.FillObject<LoaiBaoHiemInfo>(DataProvider.Instance().GetLoaiBaoHiemId(id));
        }
        public List<LoaiBaoHiemInfo> GetLoaiBaoHiems()
        {
            return CBO.FillCollection<LoaiBaoHiemInfo>(DataProvider.Instance().GetLoaiBaoHiems());
        } 

        // Luong CB
        public void AddLuongCB(LuongCBInfo objLuongCB)
        {
            DataProvider.Instance().AddLuongCB(objLuongCB);
        }
        public void DeleteLuongCB(LuongCBInfo objLuongCB)
        {
            DataProvider.Instance().DeleteLuongCB(objLuongCB);
        }
        public void UpdateLuongCB(LuongCBInfo objLuongCB)
        {
            DataProvider.Instance().UpdateLuongCB(objLuongCB);
        }
        public LuongCBInfo GetLuongCBId(int id)
        {
            return CBO.FillObject<LuongCBInfo>(DataProvider.Instance().GetLuongCBId(id));
        }
        public List<LuongCBInfo> GetLuongCBs()
        {
            return CBO.FillCollection<LuongCBInfo>(DataProvider.Instance().GetLuongCBs());
        }
        public LuongCBInfo GetTTLuongCB(DateTime datetime)
        {
            return CBO.FillObject<LuongCBInfo>(DataProvider.Instance().GetTTLuongCB(datetime));
        }
        // ds nhan vien tham gia bao hiem
        public List<DSBaoHiemInfo> GetEmployeesTGBaoHiemByUnitid(int unitid)
        {
            return CBO.FillCollection<DSBaoHiemInfo>(DataProvider.Instance().GetEmployeesTGBaoHiemByUnitid(unitid));
        }
        public List<ThoiDiemLuongAVaQCTInfo> GetThoiDiemLuongAQTCTTheoIdNV(int idNV)
        {
            return CBO.FillCollection<ThoiDiemLuongAVaQCTInfo>(DataProvider.Instance().GetThoiDiemLuongAQTCTTheoIdNV(idNV));
        }   
    }
}


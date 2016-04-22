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

namespace VNPT.Modules.Position
{
    public class PositionController
    {
        #region Constructors

        public PositionController()
        {
        }

        #endregion

        public void AddPosition(PositionInfo objPosition)
        {
            DataProvider.Instance().AddPosition(objPosition);
        }

        public void DeletePosition(PositionInfo objPosition)
        {
            DataProvider.Instance().DeletePosition(objPosition);
        }
        public List<PositionInfo> GetPositionByType(int itemId)
        {

            return CBO.FillCollection<PositionInfo>(DataProvider.Instance().GetPositionByType(itemId));

        }
        public PositionInfo GetPosition(int itemId)
        {

            return CBO.FillObject<PositionInfo>(DataProvider.Instance().GetPosition(itemId));

        }

        public List<PositionInfo> GetPositions()
        {
            return CBO.FillCollection<PositionInfo>(DataProvider.Instance().GetPositions());

        }

        public void UpdatePosition(PositionInfo objPosition)
        {
            DataProvider.Instance().UpdatePosition(objPosition);
        }
        // he so chuc vu

        public void themHSChucVu(hschucvuInfo objPosition)
        {
            DataProvider.Instance().themHSChucVu(objPosition);
        }
        public void suaHSChucVu(hschucvuInfo objPosition)
        {
            DataProvider.Instance().suaHSChucVu(objPosition);
        }
        public void xoaHSChucVu(hschucvuInfo objPosition)
        {
            DataProvider.Instance().xoaHSChucVu(objPosition);
        }
        public List<hschucvuInfo> GetPositionByChucVu(int chucvu)
        {
            return CBO.FillCollection<hschucvuInfo>(DataProvider.Instance().GetPositionByChucVu(chucvu));
        }
        public hschucvuInfo GetPositionByThoiDiem(int chucvu)
        {
            return CBO.FillObject<hschucvuInfo>(DataProvider.Instance().GetPositionByThoiDiem(chucvu));
        }        
    }
}


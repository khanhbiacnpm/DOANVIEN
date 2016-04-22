using System;
using DotNetNuke;
using System.Data;
using System.Data.SqlClient;
using DotNetNuke.Framework;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


using DotNetNuke.Framework;

namespace VNPT.Modules.Position
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Position", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        // chuc vu
        public abstract void AddPosition(PositionInfo objPosition);
        public abstract IDataReader GetPosition(int itemId);
        public abstract IDataReader GetPositionByType(int itemId);
        public abstract IDataReader GetPositions();        
        public abstract void UpdatePosition(PositionInfo objPosition);
        public abstract void DeletePosition(PositionInfo objPosition);
        // chuc vu
        public abstract void themHSChucVu(hschucvuInfo objPosition);
        public abstract void suaHSChucVu(hschucvuInfo objPosition);
        public abstract void xoaHSChucVu(hschucvuInfo objPosition);
        public abstract IDataReader GetPositionByChucVu(int chucvu);
        public abstract IDataReader GetPositionByThoiDiem(int chucvu);
    }
}

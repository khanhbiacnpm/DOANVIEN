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

namespace VNPT.Modules.Notices
{
    public abstract class DataProvider
    {

        static DataProvider objProvider = null;

        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        static DataProvider()
        {
            CreateProvider();
        }
        public static DataTable Select(string strSQL)
        {
            string strConn = getConnectionString();
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Notices", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddNotices(NoticesInfo objNotices);
        public abstract IDataReader GetNotices(int itemId);
        public abstract IDataReader GetDisplayedNotices(int itemId);
        public abstract IDataReader GetTopNotices();
        public abstract IDataReader GetNoticess();
        public abstract void UpdateNotices(NoticesInfo objNotices);
        public abstract void DeleteNotices(NoticesInfo objNotices);

    }
}
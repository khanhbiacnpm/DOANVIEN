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

namespace VNPT.Modules.SocietyHistory
{
    public class SocietyHistoryInfo
    {

        private int _id;
        private DateTime _fromdate;
        private DateTime _todate;
        private string _content;
        private int _employeeid;
        private int _chucVuDoanThe;


        public SocietyHistoryInfo()
        {
            this._id = 0;
            this._fromdate = Convert.ToDateTime("01/01/1900");
            this._todate = Convert.ToDateTime("01/01/1900");
            this._content = "";
            this._employeeid = 0;
            this._chucVuDoanThe = 0;
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public DateTime fromdate
        {
            get { return this._fromdate; }
            set { this._fromdate = value; }
        }
        public DateTime todate
        {
            get { return this._todate; }
            set { this._todate = value; }
        }
        public string content
        {
            get { return this._content; }
            set { this._content = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public int ChucVuDoanThe
        {
            get { return this._chucVuDoanThe; }
            set { this._chucVuDoanThe = value; }
        }

        private object KhongToNull(object obj)
        {
            object objtmp1 = 0;
            object objtmp2 = "";
            object objtmp3 = Convert.ToDateTime("01/01/1900");
            if (obj == null || (obj.ToString() == objtmp1.ToString()) || obj.Equals(objtmp2) || obj.Equals(objtmp3))
                return DBNull.Value;
            else
                return obj;
        }

        
    }
}

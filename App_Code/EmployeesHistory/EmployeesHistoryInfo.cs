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

namespace VNPT.Modules.EmployeesHistory
{
    public class EmployeesHistoryInfo
    {

        private int _id;
        private string _fromdate;
        private string _todate;
        private string _content;
        private int _employeeid;

        public string stt { get; set; }
        public string thoigian { get; set; }
        public EmployeesHistoryInfo()
        {
            this._id = 0;
            this._fromdate = "";
            this._todate = "";
            this._content = "";
            this._employeeid = 0;

        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string fromdate
        {
            get { return this._fromdate; }
            set { this._fromdate = value; }
        }
        public string todate
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

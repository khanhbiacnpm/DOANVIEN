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

namespace VNPT.Modules.Leave
{
    public class LeaveInfo
    {

        private int _id;
        private int _employeeid;
        private decimal _unitid;
        private int _year;
        private DateTime _fromdate;
        private DateTime _todate;
        private int _provinceid;
        private string _place;
        private string _reason;
        private bool _leavetype;
        private int _editor;
        private DateTime _modifieddate;
        private string _ip;
        private string _SoQD;

        public LeaveInfo()
        {
            this._id = 0;
            this._employeeid = 0;
            this._unitid = 0;
            this._year = 0;
            this._fromdate = Convert.ToDateTime("01/01/1900");
            this._todate = Convert.ToDateTime("01/01/1900");
            this._place = "";
            this._reason = "";
            this._leavetype = false;
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
            this._SoQD = "";
        }
        public string SoQD
        {
            get { return this._SoQD; }
            set { this._SoQD = value; }
        }
        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public int provinceid
        {
            get { return this._provinceid; }
            set { this._provinceid = value; }
        }
        public decimal unitid
        {
            get { return this._unitid; }
            set { this._unitid = value; }
        }
        public int year
        {
            get { return this._year; }
            set { this._year = value; }
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
        public string place
        {
            get { return this._place; }
            set { this._place = value; }
        }
        public string reason
        {
            get { return this._reason; }
            set { this._reason = value; }
        }
        public bool leavetype
        {
            get { return this._leavetype; }
            set { this._leavetype = value; }
        }
        public int editor
        {
            get { return this._editor; }
            set { this._editor = value; }
        }
        public DateTime modifieddate
        {
            get { return this._modifieddate; }
            set { this._modifieddate = value; }
        }
        public string ip
        {
            get { return this._ip; }
            set { this._ip = value; }
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

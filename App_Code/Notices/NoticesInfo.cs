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

namespace VNPT.Modules.Notices
{
    public class NoticesInfo
    {

        private int _id;
        private string _title;
        private string _content;
        private int _editor;
        private DateTime _notedate;
        private string _ip;

        public NoticesInfo()
        {
            this._id = 0;
            this._title = "";
            this._content = "";
            this._editor = 0;
            this._notedate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string title
        {
            get { return this._title; }
            set { this._title = value; }
        }
        public string content
        {
            get { return this._content; }
            set { this._content = value; }
        }
        public int editor
        {
            get { return this._editor; }
            set { this._editor = value; }
        }
        public DateTime notedate
        {
            get { return this._notedate; }
            set { this._notedate = value; }
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

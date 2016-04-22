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
    public class SortSociety
    {

        private int _id;
        private int  _year;
        private int _sort;
        private string _content;
        private int _employeeid;
        private int _positionid;


        public SortSociety()
        {
            this._id = 0;
            this._year = 0;
            this._sort = 0;
            this._content = "";
            this._employeeid = 0;
            this._positionid = 0;
        }

        public int Id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int Year
        {
            get { return this._year; }
            set { this._year = value; }
        }
        public int Sort
        {
            get { return this._sort; }
            set { this._sort = value; }
        }
        public string content
        {
            get { return this._content; }
            set { this._content = value; }
        }
        public int EmpId
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public int PositionId
        {
            get { return this._positionid; }
            set { this._positionid = value; }
        }

       
        
    }
}

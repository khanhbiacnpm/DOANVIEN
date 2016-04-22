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

namespace VNPT.Modules.SalaryType
{
    public class SalaryTypeInfo
    {

        private int _id;
        private string _title;
        private string _code;
        private string _coefficient;
        private string _level;
        private DateTime _dateeffectted;
        private int _status;
        private DateTime _modifieddate;
        private int _editor;
        private string _ip;
        private string _oldid;
        private int _groupid;
        private int _parentid;

        public SalaryTypeInfo()
        {
            this._id = 0;
            this._title = "";
            this._coefficient = "";
            this._level = "";
            this._dateeffectted = Convert.ToDateTime("01/01/1900");
            this._status = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._editor = 0;
            this._ip = "";
            this._oldid = "";
            this._parentid = 0;
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
        public string code
        {
            get { return this._code; }
            set { this._code = value; }
        }
        public string coefficient
        {
            get { return this._coefficient; }
            set { this._coefficient = value; }
        }
        public string level
        {
            get { return this._level; }
            set { this._level = value; }
        }
        public DateTime dateeffectted
        {
            get { return this._dateeffectted; }
            set { this._dateeffectted = value; }
        }
        public int status
        {
            get { return this._status; }
            set { this._status = value; }
        }
        public int groupid
        {
            get { return this._groupid; }
            set { this._groupid = value; }
        }
        public int parentid
        {
            get { return this._parentid; }
            set { this._parentid = value; }
        }

    }
}

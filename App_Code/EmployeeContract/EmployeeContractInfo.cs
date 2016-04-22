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

namespace VNPT.Modules.EmployeeContract
{
    public class EmployeeContractInfo
    {

        private int _id;
        private int _employeeid;
        private string _contractnum;
        private string _represent;
      
        private string _representunit;
        private string _representphone;
        private string _representaddress;
      
        private DateTime _datestart;
        private DateTime _dateend;
        private int _contracttype;
      
        public string loaihopdong { get; set; }
        public string stt { get; set; }
        public string thoigian { get; set; }

        public EmployeeContractInfo()
        {
            this._id = 0;
            this._employeeid = 0;
            this._contractnum = "";
            this._represent = "";
        
            this._representunit = "";
            this._representphone = "";
            this._representaddress = "";
         
            this._datestart = Convert.ToDateTime("01/01/1900");
            this._dateend = Convert.ToDateTime("01/01/1900");
            this._contracttype = 0;
         
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
        public string contractnum
        {
            get { return this._contractnum; }
            set { this._contractnum = value; }
        }
        public string represent
        {
            get { return this._represent; }
            set { this._represent = value; }
        }
      
        public string representunit
        {
            get { return this._representunit; }
            set { this._representunit = value; }
        }
        public string representphone
        {
            get { return this._representphone; }
            set { this._representphone = value; }
        }
        public string representaddress
        {
            get { return this._representaddress; }
            set { this._representaddress = value; }
        }
      
        public DateTime datestart
        {
            get { return this._datestart; }
            set { this._datestart = value; }
        }
        public DateTime dateend
        {
            get { return this._dateend; }
            set { this._dateend = value; }
        }
        public int contracttype
        {
            get { return this._contracttype; }
            set { this._contracttype = value; }
        }
        

        

    }
}

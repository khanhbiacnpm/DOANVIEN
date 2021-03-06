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

namespace VNPT.Modules.WorkHistory
{
    public class WorkHistoryInfo
    {
        private int _id;
        private int _employeeid;
        private int _unitid;
        private string _empcode;
        private string _department;
        private DateTime _startdate;
        private DateTime _enddate;
        private int _positionid;
        private string _desicion;
        private DateTime _desiciondate;
        private string _attachfile;
        private int _editor;
        private DateTime _modifieddate;
        private string _ip;
        private string _reason;
        private int _idCVDThe;
        private int _idCVDang;
        private int _idCDanh;
        private int _idCDanh_B;
        private int _idQLNhaNuoc;
        private string _DVKhac;
        public string tendonvi { get; set; }
        public string chucvu { get; set; }
        public string chucdanh { get; set; }
        public string chucdanhB { get; set; }
        public string qlnn { get; set; }
        public string stt { get; set; }
       
        public WorkHistoryInfo()
        {
            this._id = 0;
            this._employeeid = 0;
            this._unitid = 0;
            this._empcode = "";
            this._department = "";
            this._startdate = Convert.ToDateTime("01/01/1900");
            this._enddate = Convert.ToDateTime("01/01/1900");
            this._positionid = 0;
            this._desicion = "";
            this._desiciondate = Convert.ToDateTime("01/01/1900");
            this._attachfile = "";
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
            this._reason = "";
            this._idCVDThe = 0;
            this._idCVDang = 0;
            this._idCDanh = 0;
            this._idCDanh_B = 0;
            this._idQLNhaNuoc = 0;
            this._DVKhac = "";
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
        public int unitid
        {
            get { return this._unitid; }
            set { this._unitid = value; }
        }
        public string empcode
        {
            get { return this._empcode; }
            set { this._empcode = value; }
        }
        public string reason
        {
            get { return this._reason; }
            set { this._reason = value; }
        }
        public string department
        {
            get { return this._department; }
            set { this._department = value; }
        }
        public DateTime startdate
        {
            get { return this._startdate; }
            set { this._startdate = value; }
        }
        public DateTime enddate
        {
            get { return this._enddate; }
            set { this._enddate = value; }
        }
        public int positionid
        {
            get { return this._positionid; }
            set { this._positionid = value; }
        }
        public string desicion
        {
            get { return this._desicion; }
            set { this._desicion = value; }
        }
        public DateTime desiciondate
        {
            get { return this._desiciondate; }
            set { this._desiciondate = value; }
        }
        public string attachfile
        {
            get { return this._attachfile; }
            set { this._attachfile = value; }
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
        public int idCVDThe
        {
            get { return this._idCVDThe; }
            set { this._idCVDThe = value; }
        }
        public int idCVDang
        {
            get { return this._idCVDang; }
            set { this._idCVDang = value; }
        }
        public int idCDanh
        {
            get { return this._idCDanh; }
            set { this._idCDanh = value; }
        }
        public int idCDanh_B
        {
            get { return this._idCDanh_B; }
            set { this._idCDanh_B = value; }
        }
        public int idQLNhaNuoc
        {
            get { return this._idQLNhaNuoc; }
            set { this._idQLNhaNuoc = value; }
        }
        public string DVKhac
        {
            get { return this._DVKhac; }
            set { this._DVKhac = value; }
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

/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.ChangeSalary
{
    public class ChangeSalaryInfo
    {
        private int _id;
        private int _employeeid;
        private DateTime _ngayki;
        private DateTime _changedate;        
        private string _salarylevel;
        private string _salarycoefficient;
        private int _classid;
        private string _reason;
        private int _editor;
        private int _type;
        private DateTime _modifieddate;
        private string _ip;
        private string _soQD;
        private string _luongCB;
        private string _BHXH;
        private string _BHYT;
        private string _BHTN;
        private string _PhuCap;
        private DateTime _DenNgay;
        private string _fileKem;
        private bool _kieuLuong;
        private int _officeid;

        private string _ngach;
        private string _bac;
        public string thoigian { get; set; }
        public string chucdanh { get; set; }
        public string stt { get; set; }
        public string ngach { get; set; }
        public string bac { get; set; }
        public ChangeSalaryInfo()
        {
            this._id = 0;
            this._employeeid = 0;
            this._ngayki = Convert.ToDateTime("01/01/1900");
            this._changedate = Convert.ToDateTime("01/01/1900");
            this._classid = 0;
            this._officeid = 0;
            this._salarylevel = "";
            this._salarycoefficient = "";
            this._reason = "";
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
            this._soQD = "";
            this._luongCB = "";
            this._BHXH = "";
            this._BHYT = "";
            this._BHTN = "";
            this._PhuCap = "";
            this._DenNgay = Convert.ToDateTime("01/01/1900");
            this._fileKem = "";
            this._kieuLuong = false;
        }

        public string soQD
        {
            get { return this._soQD; }
            set { this._soQD = value; }
        }
        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int officeid
        {
            get { return this._officeid; }
            set { this._officeid = value; }
        }
        public int type
        {
            get { return this._type; }
            set { this._type = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public DateTime ngayki
        {
            get { return this._ngayki; }
            set { this._ngayki = value; }
        }
        public DateTime changedate
        {
            get { return this._changedate; }
            set { this._changedate = value; }
        }
        public DateTime DenNgay
        {
            get { return this._DenNgay; }
            set { this._DenNgay = value; }
        }
        public int classid
        {
            get { return this._classid; }
            set { this._classid = value; }
        }
        public string salarylevel
        {
            get { return this._salarylevel; }
            set { this._salarylevel = value; }
        }
        public string salarycoefficient
        {
            get { return this._salarycoefficient; }
            set { this._salarycoefficient = value; }
        }
        public string reason
        {
            get { return this._reason; }
            set { this._reason = value; }
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
        public string LuongCB
        {
            get { return this._luongCB; }
            set { this._luongCB = value; }
        }
        public string BHXH
        {
            get { return this._BHXH; }
            set { this._BHXH = value; }
        }
        public string BHYT
        {
            get { return this._BHYT; }
            set { this._BHYT = value; }
        }
        public string BHTN
        {
            get { return this._BHTN; }
            set { this._BHTN = value; }
        }
        public string PhuCap
        {
            get { return this._PhuCap; }
            set { this._PhuCap = value; }
        }
        public string FileKem
        {
            get { return this._fileKem; }
            set { this._fileKem = value; }
        }
        public bool KieuLuong
        {
            get { return this._kieuLuong; }
            set { this._kieuLuong = value; }
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

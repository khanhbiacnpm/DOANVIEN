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

namespace VNPT.Modules.Training
{
    public class TrainingInfo
    {
        private int _id;
        private string _schoolname;
        private string _skill;
        private DateTime _fromdate;
        private DateTime _todate;
        private int _trainingformid;
        private int _qualificationid;
        private string _decision;
        private string _fee;
        private string _result;
        private int _employeeid;
        private int _editor;
        private DateTime _modifieddate;
        private string _ip;
        private int _diadiemtochucId;
        private int _donvitochucId;
        private string _fileKem;
        private bool _camket;
        public string trinhdo { get; set; }
        public string stt { get; set; }
        public string thoigian { get; set; }

        public TrainingInfo()
        {
            this._id = 0;
            this._schoolname = "";
            this._skill = "";
            this._result = "";
            this._fromdate = Convert.ToDateTime("01/01/1900");
            this._todate = Convert.ToDateTime("01/01/1900");
            this._trainingformid = 0;
            this._qualificationid = 0;
            this._decision = "";
            this._fee = "";
            this._employeeid = 0;
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
            this._diadiemtochucId = 0;
            this._donvitochucId = 0;
            this._fileKem = "";
            this._camket = false;
        }
        public bool camket {
            get { return this._camket; }
            set { this._camket = value; }
        }
        public int diadiemtochucId
        {
            get { return this._diadiemtochucId; }
            set { this._diadiemtochucId = value; }
        }
        public int donvitochucId
        {
            get { return this._donvitochucId; }
            set { this._donvitochucId = value; }
        }
        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string schoolname
        {
            get { return this._schoolname; }
            set { this._schoolname = value; }
        }
        public string result
        {
            get { return this._result; }
            set { this._result = value; }
        }
        public string skill
        {
            get { return this._skill; }
            set { this._skill = value; }
        }
        public string fee
        {
            get { return this._fee; }
            set { this._fee = value; }
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
        public int trainingformid
        {
            get { return this._trainingformid; }
            set { this._trainingformid = value; }
        }
        public int qualificationid
        {
            get { return this._qualificationid; }
            set { this._qualificationid = value; }
        }
        public string decision
        {
            get { return this._decision; }
            set { this._decision = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
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
        public string fileKem
        {
            get { return this._fileKem; }
            set { this._fileKem = value; }
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

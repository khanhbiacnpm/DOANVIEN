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

namespace Philip.Modules.EmpQualification
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the EmpQualification
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class EmpQualificationInfo
    {
        private int _id;
        private int _qualificationid; // bang cap
        private int _professionid; // chuyen nganh
        private int _empid; // id nv
        private int _trainingid; // hinh thuc dao tao
        private string _result; 
        private bool _highest;
        private string _schools;
        private string _danhhieu;
        private string _NamTotNghiep;
        private string _ghichu;
        public string trinhdo { get; set; }
        public string chuyennganh { get; set; }
        public string hedaotao { get; set; }

        public EmpQualificationInfo()
        {
            this._id = 0;
            this._qualificationid = 0;
            this._professionid = 0;
            this._empid = 0;
            this._trainingid = 0;
            this._result = "";
            this._highest = false;
            this._schools = "";
            this._danhhieu = "";
            this._NamTotNghiep = "";
            this._ghichu = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int qualificationid
        {
            get { return this._qualificationid; }
            set { this._qualificationid = value; }
        }
        public int professionid
        {
            get { return this._professionid; }
            set { this._professionid = value; }
        }
        public int empid
        {
            get { return this._empid; }
            set { this._empid = value; }
        }
        public int trainingid
        {
            get { return this._trainingid; }
            set { this._trainingid = value; }
        }
        public string result
        {
            get { return this._result; }
            set { this._result = value; }
        }
        public bool highest
        {
            get { return this._highest; }
            set { this._highest = value; }
        }
        public string schools
        {
            get { return this._schools; }
            set { this._schools = value; }
        }
        public string danhhieu
        {
            get { return this._danhhieu; }
            set { this._danhhieu = value; }
        }
        public string NamTotNghiep
        {
            get { return this._NamTotNghiep; }
            set { this._NamTotNghiep = value; }
        }
        public string ghichu
        {
            get { return this._ghichu; }
            set { this._ghichu = value; }
        }
    }
}

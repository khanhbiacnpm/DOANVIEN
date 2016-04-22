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

namespace VNPT.Modules.HealthCare
{
    public class HealthCareInfo
    {

        private int _id;
        private int _employeeid;
        private int _healthtype;
        private string _high;
        private string _weight;
        private string _ha;
        private string _otherresult;
        private string _conclusion;
        private string _testdate;
        private int _editor;
        private DateTime _modifieddate;
        private string _ip;
        private string _place;
        
        public string loaisuckhoe { get; set; }
        public HealthCareInfo()
        {
            this._id = 0;
            this._employeeid = 0;
            this._healthtype = 0;
            this._high = "";
            this._weight = "";
            this._ha = "";
            this._otherresult = "";
            this._conclusion = "";
            this._testdate = "";
            this._place = "";
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int healthtype
        {
            get { return this._healthtype; }
            set { this._healthtype = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public string high
        {
            get { return this._high; }
            set { this._high = value; }
        }
        public string weight
        {
            get { return this._weight; }
            set { this._weight = value; }
        }
        public string ha
        {
            get { return this._ha; }
            set { this._ha = value; }
        }
        public string otherresult
        {
            get { return this._otherresult; }
            set { this._otherresult = value; }
        }
        public string conclusion
        {
            get { return this._conclusion; }
            set { this._conclusion = value; }
        }
        public string testdate
        {
            get { return this._testdate; }
            set { this._testdate = value; }
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
        public string place
        {
            get { return this._place; }
            set { this._place = value; }
        }
        
     

        

    }

}

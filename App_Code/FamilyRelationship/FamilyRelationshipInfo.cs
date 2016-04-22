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

namespace VNPT.Modules.FamilyRelationship
{
    public class FamilyRelationshipInfo
    {

        private int _id;
        private string _fullname;
        private string _birthday;
        private string _placeofbirth;
        private string _address;
        private string _occupation;
        private string _description;
        private int _relationshipid;
        private int _employeeid;
        private DateTime _deaddate;
        private string _reason;
        private int _editor;
        private DateTime _modifieddate;
        private string _ip;
        public string stt { get; set; }
        public string quanhe { get; set; }

        public FamilyRelationshipInfo()
        {
            this._id = 0;
            this._fullname = "";
            this._birthday = "";
            this._placeofbirth = "";
            this._address = "";
            this._occupation = "";
            this._description = "";
            this._relationshipid = 0;
            this._employeeid = 0;
            this._deaddate = Convert.ToDateTime("01/01/1900");
            this._reason = "";
            this._editor = 0;
            this._modifieddate = Convert.ToDateTime("01/01/1900");
            this._ip = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string fullname
        {
            get { return this._fullname; }
            set { this._fullname = value; }
        }
        public string birthday
        {
            get { return this._birthday; }
            set { this._birthday = value; }
        }
        public string placeofbirth
        {
            get { return this._placeofbirth; }
            set { this._placeofbirth = value; }
        }
        public string address
        {
            get { return this._address; }
            set { this._address = value; }
        }
        public string occupation
        {
            get { return this._occupation; }
            set { this._occupation = value; }
        }
        public string description
        {
            get { return this._description; }
            set { this._description = value; }
        }
        public int relationshipid
        {
            get { return this._relationshipid; }
            set { this._relationshipid = value; }
        }
        public int employeeid
        {
            get { return this._employeeid; }
            set { this._employeeid = value; }
        }
        public DateTime deaddate
        {
            get { return this._deaddate; }
            set { this._deaddate = value; }
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

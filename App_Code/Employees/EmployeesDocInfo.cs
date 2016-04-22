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

namespace VNPT.Modules.Employees
{
   public class EmployeesDocInfo
	{
		private int _id;
		private string _fullname;
		private string _empcode;
		private string _unitname;
		private int _unitid;
		private DateTime _birthday;
		private bool _sex;
		private string _cellphone;
        private string _positionname;
        private string _acoefficient;
        private string _level;
       
        public EmployeesDocInfo()
		{
			this._id = 0;
			this._fullname = "";
			this._unitname = "";
			this._empcode = "";
			this._unitid = 0;
            this._birthday = Convert.ToDateTime("01/01/1900");
			this._sex = false;
			this._cellphone = "";
            this._positionname = "";
            this._acoefficient = "";
            this._level = "";
		}

		public int id
		{
			get {	return this._id;	}
			set {	this._id = value;	}
		}
		public string fullname
		{
			get {	return this._fullname;	}
			set {	this._fullname = value;	}
		}
        public string acoefficient
        {
            get { return this._acoefficient; }
            set { this._acoefficient = value; }
        }
		public string unitname
		{
			get { return this._unitname; }
            set { this._unitname = value; }
		}
		public string empcode
		{
			get {	return this._empcode;	}
			set {	this._empcode = value;	}
		}
		public int unitid
		{
			get {	return this._unitid;	}
			set {	this._unitid = value;	}
		}
		public DateTime birthday
		{
			get {	return this._birthday;	}
			set {	this._birthday = value;	}
		}
		public bool sex
		{
			get {	return this._sex;	}
			set {	this._sex = value;	}
		}
		public string cellphone
		{
			get {	return this._cellphone;	}
			set {	this._cellphone = value;	}
		}
        public string positionname
        {
            get { return this._positionname; }
            set { this._positionname = value; }
        }
        public string level
        {
            get { return this._level; }
            set { this._level = value; }
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

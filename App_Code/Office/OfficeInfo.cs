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

namespace Philip.Modules.Office
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the Office
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class OfficeInfo
    {

        private int _id;
        private string _code;
        private string _name;
        private string _note;
        private bool _isactive;
        private int _docHai;
        private int _type;

        public OfficeInfo()
        {
            this._id = 0;
            this._code = "";
            this._name = "";
            this._note = "";
            this._isactive = true;
            this._docHai = 0;
            this._type = 0;
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int IdNhomNguonNhanLuc{get;set;}
        public int IdNhomChucDanhB { get; set; }
       
        public int type
        {
            get { return this._type; }
            set { this._type = value; }
        }
        public string code
        {
            get { return this._code; }
            set { this._code = value; }
        }
        public string note
        {
            get { return this._note; }
            set { this._note = value; }
        }
        public string name
        {
            get { return this._name; }
            set { this._name = value; }
        }
        public bool isactive
        {
            get { return this._isactive; }
            set { this._isactive = value; }
        }

        public int DocHai
        {
            get { return this._docHai; }
            set { this._docHai = value; }
        }
    }
}

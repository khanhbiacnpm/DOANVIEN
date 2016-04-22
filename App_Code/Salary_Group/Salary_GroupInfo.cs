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

namespace Philip.Modules.Salary_Group
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the Salary_Group
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class Salary_GroupInfo
    {
        private int _id;
        private int _parentId;
        private string _groupname;
        private bool _type;
        private string _ghichu;

        public Salary_GroupInfo()
        {
            this._id = 0;
            this._groupname = "";
            this._type = true;
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int parentId
        {
            get { return this._parentId; }
            set { this._parentId = value; }
        }
        public string groupname
        {
            get { return this._groupname; }
            set { this._groupname = value; }
        }
        public bool type
        {
            get { return this._type; }
            set { this._type = value; }
        }
        public string ghichu
        {
            get { return this._ghichu; }
            set { this._ghichu = value; }
        }

    }
}

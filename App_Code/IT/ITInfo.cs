/*
' DotNetNuke� - http://www.dotnetnuke.com
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

namespace Philip.Modules.IT
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the IT
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class ITInfo
    {

        private int _id;
        private string _name;
        private bool _isactive;

        public ITInfo()
        {
            this._id = 0;
            this._name = "";
            this._isactive = true;
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
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

    }
}

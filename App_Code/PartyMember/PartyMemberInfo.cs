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

namespace VNPT.Modules.PartyMember
{
    public class PartyMemberInfo
    {

        private int _id;
        private int _IdNhanVien;
        private int _ChucVuDang;
        private string _NoiDung;
        private string _SoQD;
        private string _CapQD;
        private string _ThoiGianQD;
        private string _FileQD;
        public int idToChucDang { get; set; }
        public string tenchucvudang { get; set; }
        public string tentochucdang { get; set; }
        public string loaikiemnhiem { get; set; }
        public PartyMemberInfo()
        {
            this._id = 0;
            this._IdNhanVien = 0;
            this._ChucVuDang = 0;
            this._NoiDung = "";
            this._SoQD = "";
            this._CapQD = "";
            this._FileQD = "";
            this._ThoiGianQD = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int IdNhanVien
        {
            get { return this._IdNhanVien; }
            set { this._IdNhanVien = value; }
        }
        public int ChucVuDang
        {
            get { return this._ChucVuDang; }
            set { this._ChucVuDang = value; }
        }
        public string NoiDung
        {
            get { return this._NoiDung; }
            set { this._NoiDung = value; }
        }
        public string SoQD
        {
            get { return this._SoQD; }
            set { this._SoQD = value; }
        }
        public string ThoiGianQD
        {
            get { return this._ThoiGianQD; }
            set { this._ThoiGianQD = value; }
        }
        public string FileQD
        {
            get { return this._FileQD; }
            set { this._FileQD = value; }
        }
        public string CapQD
        {
            get { return this._CapQD; }
            set { this._CapQD = value; }
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

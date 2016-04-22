using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Xml;
using System.Web;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search;

namespace VNPT.Modules.SalaryType
{
    public class BacLuongTheoNhomInfo
    {
        private int _id;
        private int _idNhomLuong;
        private bool _kieuLuong;
        private string _bacLuongTheoNhom;
        private DateTime _thoiDiem;        

        public BacLuongTheoNhomInfo()
        {
            this._id = 0;
            this._idNhomLuong = 0;
            this._kieuLuong = false;
            this._bacLuongTheoNhom = "";
            this._thoiDiem = Convert.ToDateTime("01/01/1900");            
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int idNhomLuong
        {
            get { return this._idNhomLuong; }
            set { this._idNhomLuong = value; }
        }
        public bool kieuLuong
        {
            get { return this._kieuLuong; }
            set { this._kieuLuong = value; }
        }
        public string bacLuongTheoNhom
        {
            get { return this._bacLuongTheoNhom; }
            set { this._bacLuongTheoNhom = value; }
        }        
        public DateTime thoiDiem
        {
            get { return this._thoiDiem; }
            set { this._thoiDiem = value; }
        }       
    }
}

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

namespace VNPT.Modules.RewardDiscipline
{
    public class RewardDisciplineInfo
    {

        private int _id;
        private int _objectid;
        private int _level;
        private bool _objecttype;
        private int _type;
        private string _detail;
        private string _title;
        private string _desicion;
        private string _unitdesicion;     
        private string __desiciondate;
        private string _kiluat;
        private DateTime _ngayhop;
        private int _thoihan;
        private string _fileKem;
        private string _fileVanban;
        private string _nguoikyquyetdinh;
        private string _sokyhieu;
        private string _ghichu;
        private int idHinhThucThiDua;
        private int idhinhthuckhenthuong;
        private string tienthuong;

        public int idThanhTichKhenThuong { get; set; }
        public string Loai { get; set; }
       
        public RewardDisciplineInfo()
        {
            this._id = 0;
            this._objectid = 0;
            this._objecttype = false;
            this._type = 0;
            this._detail = "";
            this._title = "";
            this._desicion = "";
            this.__desiciondate ="";
            this._kiluat = "";
            this._thoihan = 0;
            this._fileKem = "";
            this._ngayhop = Convert.ToDateTime("01/01/1900");
            this._fileVanban = "";
            this._sokyhieu = "";
            this._ghichu = "";
            idHinhThucThiDua = 0;
            idhinhthuckhenthuong = 0;
            tienthuong = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int level
        {
            get { return this._level; }
            set { this._level = value; }
        }
        public int objectid
        {
            get { return this._objectid; }
            set { this._objectid = value; }
        }
        public bool objecttype
        {
            get { return this._objecttype; }
            set { this._objecttype = value; }
        }
        public int type
        {
            get { return this._type; }
            set { this._type = value; }
        }
        public string detail
        {
            get { return this._detail; }
            set { this._detail = value; }
        }
        public string unitdesicion
        {
            get { return this._unitdesicion; }
            set { this._unitdesicion = value; }
        }
        public string title
        {
            get { return this._title; }
            set { this._title = value; }
        }
        public string desicion
        {
            get { return this._desicion; }
            set { this._desicion = value; }
        }
        
        public string desiciondate
        {
            get { return this.__desiciondate; }
            set { this.__desiciondate = value; }
        }
        public string HinhThucKiLuat
        {
            get { return this._kiluat; }
            set { this._kiluat = value; }
        }
        public DateTime NgayHopKyLuat
        {
            get { return this._ngayhop; }
            set { this._ngayhop = value; }
        }
        public int ThoiHanKyLuat
        {
            get { return _thoihan; }
            set { _thoihan = value; }
        }

        public string fileKem
        {
            get { return _fileKem; }
            set { this._fileKem = value; }
        }

        public string fileVanban
        {
            get
            {
                return _fileVanban;
            }
            set
            {
                _fileVanban = value;
            }
        }

        public string NguoiKyQuyetDinh
        {
            get { return _nguoikyquyetdinh; }
            set { _nguoikyquyetdinh = value; }
        }

        public string SoKyHieu
        {
            get { return _sokyhieu; }
            set { _sokyhieu = value; }
        }

        public string GhiChu
        {
            get { return _ghichu; }
            set { _ghichu = value; }
        }

        public int HinhThucThiDua
        {
            get { return this.idHinhThucThiDua; }
            set { this.idHinhThucThiDua = value; }
        }

        public int HinhthucKhenthuong
        {
            get { return this.idhinhthuckhenthuong; }
            set { this.idhinhthuckhenthuong = value; }
        }

        public string TienThuong
        {
            get { return this.tienthuong; }
            set { tienthuong = value; }
        }
    }
}

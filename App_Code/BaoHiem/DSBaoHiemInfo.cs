using System;
using System.Configuration;
using System.Data;

namespace Philip.Modules.BaoHiem
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the BaoHiem
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class DSBaoHiemInfo
    {
        private int _id;
        private string _hoTen;
        private string _soBHXH;
        private string _soBHYT;        
        private DateTime _ngaySinh;
        private string _soCMND;
        private int _gioiTinh;
        private string _tenTT;
        private string _noiKhamBenh;
        private DateTime _ngayDongBHXH;
        private string _heSoChucVu;
        private string _phuCapChucVu;
        private string _phuCapDocHai;
        
        public DSBaoHiemInfo()
        {
            this._id = 0;
            this._hoTen = "";
            this._soBHXH = "";
            this._soBHYT = "";
            this._ngaySinh = Convert.ToDateTime("01/01/1900");
            this._gioiTinh = 0;
            this._tenTT = "";
            this._noiKhamBenh = "";
            this._ngayDongBHXH = Convert.ToDateTime("01/01/1900");
            this._heSoChucVu = "";
            this._phuCapChucVu = "";
            this._phuCapDocHai = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string hoTen
        {
            get { return this._hoTen; }
            set { this._hoTen = value; }
        }
        public string soBHXH
        {
            get { return this._soBHXH; }
            set { this._soBHXH = value; }
        }
        public string soBHYT
        {
            get { return this._soBHYT; }
            set { this._soBHYT = value; }
        }
        public DateTime ngaySinh
        {
            get { return this._ngaySinh; }
            set { this._ngaySinh = value; }
        }
        public string soCMND
        {
            get { return this._soCMND; }
            set { this._soCMND = value; }
        }

        public int gioiTinh
        {
            get { return this._gioiTinh; }
            set { this._gioiTinh = value; }
        }
        public string tenTT
        {
            get { return this._tenTT; }
            set { this._tenTT = value; }
        }
        public string noiKhamBenh
        {
            get { return this._noiKhamBenh; }
            set { this._noiKhamBenh = value; }
        }
        public DateTime ngayDongBHXH
        {
            get { return this._ngayDongBHXH; }
            set { this._ngayDongBHXH = value; }
        }
        public string phuCapChucVu
        {
            get { return this._phuCapChucVu; }
            set { this._phuCapChucVu = value; }
        }
        public string phuCapDocHai
        {
            get { return this._phuCapDocHai; }
            set { this._phuCapDocHai = value; }
        }
        public string heSoChucVu
        {
            get { return this._heSoChucVu; }
            set { this._heSoChucVu = value; }
        }
    }
}

using System;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.Unit
{
    public class UnitInfo
    {
        private decimal _id;
        private string _name;
      
        private DateTime _effectivedate;
        private string _establishdesicion;
        private DateTime _establishdate;
        private string _functiondesicion;
        private DateTime _functiondate;
        private DateTime _expirydate;
        private string _canceldesicion;
        private string _function;
        private int _parentid;
  
        private string _address;
        private string _phone;
        private string _taxcode;
        private int _level;
      
        private int _status;
      
        private string _coefficient;
        private string _code;
        public bool ischild { get; set; }
        private int _dinhbien;
        private int _db;
      
        
        private int _loaidonvi;
        public UnitInfo()
        {
            this._id = 0;
            this._name = "";            
            this._effectivedate = Convert.ToDateTime("01/01/1900");
            this._establishdesicion = "";
            this._establishdate = Convert.ToDateTime("01/01/1900");// ngay hieu luc
            this._functiondesicion = "";
            this._functiondate = Convert.ToDateTime("01/01/1900");// ngay het hieu lua
            this._expirydate = Convert.ToDateTime("01/01/1900");
            this._canceldesicion = "";
            this._function = "";
            this._parentid = 0;
            
            this._address = "";
            this._phone = "";
            this._taxcode = "";
            this._level = 0;
            
            this._status = 0;
            
            this._loaidonvi = 0;
            
            this._coefficient = "";
            this._code = "";
        }

        public decimal id
        {
            get { return this._id; }
            set { this._id = value; }
        }
       
       public int loaidonvi
        {
            get { return this._loaidonvi; }
            set { this._loaidonvi = value; }
        }
        public int dinhbienlaodong
        {
            get { return this._dinhbien; }
            set { this._dinhbien     = value; }
        }
        public int dinhbien
        {
            get { return this._db; }
            set { this._db = value; }
        }
        public string code
        {
            get { return this._code; }
            set { this._code = value; }
        }
        public string coefficient
        {
            get { return this._coefficient; }
            set { this._coefficient = value; }
        }
        public string name
        {
            get { return this._name; }
            set { this._name = value; }
        }
       
        public DateTime effectivedate
        {
            get { return this._effectivedate; }
            set { this._effectivedate = value; }
        }
        public string establishdesicion
        {
            get { return this._establishdesicion; }
            set { this._establishdesicion = value; }
        }
        public DateTime establishdate
        {
            get { return this._establishdate; }
            set { this._establishdate = value; }
        }
        public string functiondesicion
        {
            get { return this._functiondesicion; }
            set { this._functiondesicion = value; }
        }
        public DateTime functiondate
        {
            get { return this._functiondate; }
            set { this._functiondate = value; }
        }
        public DateTime expirydate
        {
            get { return this._expirydate; }
            set { this._expirydate = value; }
        }
        public string canceldesicion
        {
            get { return this._canceldesicion; }
            set { this._canceldesicion = value; }
        }
        public string function
        {
            get { return this._function; }
            set { this._function = value; }
        }
        public int parentid
        {
            get { return this._parentid; }
            set { this._parentid = value; }
        }
       
        public string address
        {
            get { return this._address; }
            set { this._address = value; }
        }
        public string phone
        {
            get { return this._phone; }
            set { this._phone = value; }
        }
        public string taxcode
        {
            get { return this._taxcode; }
            set { this._taxcode = value; }
        }
        public int level
        {
            get { return this._level; }
            set { this._level = value; }
        }
       
        public int status
        {
            get { return this._status; }
            set { this._status = value; }
        }
        
    }

}

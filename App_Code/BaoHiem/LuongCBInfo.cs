using System;
using System.Configuration;
using System.Data;

namespace Philip.Modules.BaoHiem
{
    public class LuongCBInfo
    {
        private int _id;
		private decimal _luongcb;
		private DateTime _thoidiem;
        private string _fileKem;
        private string _soqd;

        public LuongCBInfo()
		{
			this._id = id;
			this._luongcb = luongcb;
			this._thoidiem = thoidiem;
            this._fileKem = "";
            this._soqd = "";
		}
		public int id
		{
			get {	return this._id;	}
			set {	this._id = value;	}
		}
		public decimal luongcb
		{
			get {	return this._luongcb;	}
			set {	this._luongcb = value;	}
		}
		public DateTime thoidiem
		{
			get {	return this._thoidiem;	}
			set {	this._thoidiem = value;	}
		}
        public string fileKem
        {
            get { return this._fileKem; }
            set { this._fileKem = value; }
        }
        public string soqd
        {
            get { return this._soqd; }
            set { this._soqd = value; }
        }
    }
}

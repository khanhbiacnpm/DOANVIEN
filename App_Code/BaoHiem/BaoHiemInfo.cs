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
    public class BaoHiemInfo
    {

        private int _id;
        private int _idloaibh;
        private string _tlnsudunglaodong;
        private string _tllaodong;
        private DateTime _thoidiem;

        public BaoHiemInfo()
        {
            this._id = 0;
            this._idloaibh = 0;
            this._tlnsudunglaodong = "";
            this._tllaodong = "";
            this._thoidiem = Convert.ToDateTime("01/01/1900");
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public int idloaibh
        {
            get { return this._idloaibh; }
            set { this._idloaibh = value; }
        }
        public string tlnsudunglaodong
        {
            get { return this._tlnsudunglaodong; }
            set { this._tlnsudunglaodong = value; }
        }
        public string tllaodong
        {
            get { return this._tllaodong; }
            set { this._tllaodong = value; }
        }
        public DateTime thoidiem
        {
            get { return this._thoidiem; }
            set { this._thoidiem = value; }
        }
    }
}

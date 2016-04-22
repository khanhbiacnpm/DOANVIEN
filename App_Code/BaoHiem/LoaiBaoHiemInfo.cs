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
    public class LoaiBaoHiemInfo
    {
        private int _id;
        private string _loaibh;
        public LoaiBaoHiemInfo()
        {
            this._id = 0;
            this._loaibh = "";            
        }
        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string loaibh
        {
            get { return this._loaibh; }
            set { this._loaibh = value; }
        }       
    }
}

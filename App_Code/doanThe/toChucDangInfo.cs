using System;
using System.Configuration;
using System.Data;

namespace Philip.Modules.doanThe
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Info class for the doanThe
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class toChucDangInfo
    {
        public int id { get; set; }
        public string tentochucdang { get; set; }
        public string soqd { get; set; }
        public string ghichu { get; set; }
        public int loaitochuc { get; set; }
        public int idtochucdangchuan { get; set; }
        public DateTime ngay { get; set; }
        public string file { get; set; }
    }
}

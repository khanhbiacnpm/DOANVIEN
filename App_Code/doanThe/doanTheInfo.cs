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
    public class doanTheInfo
    {
        public int id { get; set; }
        public int idNhanVien { get; set; }
        public int idChucVuDoanThe { get; set; }
        public string noiDung { get; set; }
        public string soQuyetDinh { get; set; }
        public string capQuyetDinh { get; set; }
        public string fileQuyetDinh { get; set; }
        public DateTime ngay { get; set; }
    }
}

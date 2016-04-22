using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public class UnitShortInfo
{
    public int Id { get; set; }
    public string Name { get; set; }
}

public class ShortEmpInfo
{
    public int Id { get; set; }
    public string Empcode { get; set; }
    public string FullName { get; set; }
    public string UnitName { get; set; }
    public string ChucVu { get; set; }
    public string HinhThucThiDua { get; set; }
    public string TienThuong { get; set; }
    public string NgayQuyetDinh { get; set; }
    public string STT { get; set; }
    public int ItemType { get; set; }
}
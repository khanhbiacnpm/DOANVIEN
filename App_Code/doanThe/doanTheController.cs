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

namespace Philip.Modules.doanThe
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the doanThe
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class doanTheController 
    {
        // doan The
        public void themDoanThe(doanTheInfo objdoanThe)
        {
            DataProvider.Instance().themDoanThe(objdoanThe);
        }
        public void xoaDoanThe(doanTheInfo objdoanThe)
        {
            DataProvider.Instance().xoaDoanThe(objdoanThe);
        }
        public void suaDoanThe(doanTheInfo objdoanThe)
        {
            DataProvider.Instance().suaDoanThe(objdoanThe);
        }        
        public List<doanTheInfo> GetdoanThe(int idNV)
        {
            return CBO.FillCollection<doanTheInfo>(DataProvider.Instance().GetdoanThe(idNV));
        }
        public doanTheInfo GetdoanTheById(int id)
        {
            return CBO.FillObject<doanTheInfo>(DataProvider.Instance().GetdoanTheById(id));
        }
        // to chuc dang chuan
        public void themToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            DataProvider.Instance().themToChucDangChuan(objdoanThe);
        }
        public void xoaToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            DataProvider.Instance().xoaToChucDangChuan(objdoanThe);
        }
        public void suaToChucDangChuan(toChucDangChuanInfo objdoanThe)
        {
            DataProvider.Instance().suaToChucDangChuan(objdoanThe);
        }
        public List<toChucDangChuanInfo> GetToChucDangChuan(int id, int loaiToChucDang)
        {
            return CBO.FillCollection<toChucDangChuanInfo>(DataProvider.Instance().GetToChucDangChuan(id,loaiToChucDang));
        } 
        // to chuc dang
        public void themToChucDang(toChucDangInfo objdoanThe)
        {
            DataProvider.Instance().themToChucDang(objdoanThe);
        }
        public void xoaToChucDang(toChucDangInfo objdoanThe)
        {
            DataProvider.Instance().xoaToChucDang(objdoanThe);
        }
        public void suaToChucDang(toChucDangInfo objdoanThe)
        {
            DataProvider.Instance().suaToChucDang(objdoanThe);
        }
        public List<toChucDangInfo> GetToChucDang_idToChucDangChuan(int idToChucChuan, int loaiToChuc)
        {
            return CBO.FillCollection<toChucDangInfo>(DataProvider.Instance().GetToChucDang_idToChucDangChuan(idToChucChuan, loaiToChuc));
        }
        public List<toChucDangInfo> GetToChucDang_id(int id)
        {
            return CBO.FillCollection<toChucDangInfo>(DataProvider.Instance().GetToChucDang_id(id));
        }
        public toChucDangInfo GetToChucDang_idToChucDangChuan_ngay(int idtochucdangchuan, DateTime ngay, int loaiToChuc)
        {
            return CBO.FillObject<toChucDangInfo>(DataProvider.Instance().GetToChucDang_idToChucDangChuan_ngay(idtochucdangchuan, ngay, loaiToChuc));
        } 
    }
}


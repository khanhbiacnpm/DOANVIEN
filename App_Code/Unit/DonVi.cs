using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Common.Utilities;
using Microsoft.ApplicationBlocks.Data;
using System.Data;

namespace Unit
{
    public class DonVi
    {
        public DonVi()
        {
        }
        public DonVi(int _id, string _name, int _parentId)
        {
            id = _id;
            name = _name;
            parentid = _parentId;
        }

        public int id { get; set; }
        public string name { get; set; }
        public int parentid { get; set; }
        public bool ischild
        {
            get
            {
                if (parentid == 14 && id != 115 && id != 116)
                    return false;
                else
                    return true;
            }
        }

        public List<DonVi> GetDonViList()
        {
            List<DonVi> retList = null;
            string sql = "select id, name, parentid from hrm.dbo.Unit where status=1 and year(functiondate)=1900 and id!=350 and parentid=14 order by Level";
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
            retList = CBO.FillCollection<DonVi>(SqlHelper.ExecuteReader(constr, CommandType.Text, sql));
            
            return retList;
        }

        public List<DonVi> GetDonViConList(int donviCha)
        {
            string sql = "select id, name, parentid from hrm.dbo.Unit where status=1 and year(functiondate)=1900 and parentid=" + donviCha + "  order by Level";
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
            return CBO.FillCollection<DonVi>(SqlHelper.ExecuteReader(constr, CommandType.Text, sql));
        }
    }
}
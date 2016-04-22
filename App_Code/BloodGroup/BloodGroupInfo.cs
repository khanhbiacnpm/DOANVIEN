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

namespace VNPT.Modules.BloodGroup
{
    public class BloodGroupInfo
    {

        private int _id;
        private string _name;

        public BloodGroupInfo()
        {
            this._id = 0;
            this._name = "";
        }

        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string name
        {
            get { return this._name; }
            set { this._name = value; }
        }

        private object KhongToNull(object obj)
        {
            object objtmp1 = 0;
            object objtmp2 = "";
            object objtmp3 = Convert.ToDateTime("01/01/1900");
            if (obj == null || (obj.ToString() == objtmp1.ToString()) || obj.Equals(objtmp2) || obj.Equals(objtmp3))
                return DBNull.Value;
            else
                return obj;
        }

        

    }
}


using System;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.Nationality
{
    public class NationalityInfo
    {

        private int _id;
        private string _name;
        private string _description;

        public NationalityInfo()
        {
            this._id = 0;
            this._name = "";
            this._description = "";
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
        public string description
        {
            get { return this._description; }
            set { this._description = value; }
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

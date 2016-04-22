

using System;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.Qualification
{
    public class QualificationsInfo
    {

        private int _id;
        private string _name;
        private int _level;
        private string _code;
        private bool _isactive;

        public QualificationsInfo()
        {
            this._id = 0;
            this._name = "";
            this._level = 0;
            this._code = "";
            this._isactive = true;
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
        public int level
        {
            get { return this._level; }
            set { this._level = value; }
        }
        public string code
        {
            get { return this._code; }
            set { this._code = value; }
        }
        public bool isactive
        {
            get { return this._isactive; }
            set { this._isactive = value; }
        }


        

    }

}

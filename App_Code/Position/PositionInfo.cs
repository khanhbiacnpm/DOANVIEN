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


namespace VNPT.Modules.Position
{
    public class PositionInfo
    {
        private int _id;
        private string _name;
        private bool _isactive;
        private int _type;
        private string _coefficient;
        private string _ecoefficient;
        private string _rcoefficient;

        public PositionInfo()
        {
            this._id = 0;
            this._name = "";
            this._isactive = true;
            this._type = 0;
            this._coefficient = "";
            this._ecoefficient = "";
            this._rcoefficient = "";
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
        public bool isactive
        {
            get { return this._isactive; }
            set { this._isactive = value; }
        }
        public int type
        {
            get { return this._type; }
            set { this._type = value; }
        }
        public string coefficient
        {
            get { return this._coefficient; }
            set { this._coefficient = value; }
        }
        public string ecoefficient
        {
            get { return this._ecoefficient; }
            set { this._ecoefficient = value; }
        }
        public string rcoefficient
        {
            get { return this._rcoefficient; }
            set { this._rcoefficient = value; }
        }




    }
}

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
    public class hschucvuInfo
    {
        public int id { get; set; }
        public int positionid { get; set; }
        public float hschucvu { get; set; }
        public float hstrachnhiem { get; set; }
        public float hsdochai { get; set; }
        public DateTime thoidiem { get; set; }
    }
}

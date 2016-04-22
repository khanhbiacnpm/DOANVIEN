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

namespace VNPT.Modules.DanhMuc
{
    public class KhaNangCongViecInfo
    {

        public int Id { get; set; }
        public bool TrangThai{get;set;}        
        public string KhaNang{get;set;}

       
        

    }
}

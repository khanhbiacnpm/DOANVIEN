

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

namespace VNPT.Modules.Nationality
{
  
    public class NationalityController 
    {

        #region Constructors

        public NationalityController()
        {
        }

        #endregion

        public void AddNationality(NationalityInfo objNationality)
        {
            DataProvider.Instance().AddNationality(objNationality);
        }

        public void DeleteNationality(NationalityInfo objNationality)
        {
            DataProvider.Instance().DeleteNationality(objNationality);
        }

        public NationalityInfo GetNationality(int itemId)
        {
            return CBO.FillObject<NationalityInfo>(DataProvider.Instance().GetNationality(itemId));
        }

        public List<NationalityInfo> GetNationalities()
        {
            return CBO.FillCollection<NationalityInfo>(DataProvider.Instance().GetNationalities());
        }

        public void UpdateNationality(NationalityInfo objNationality)
        {
            DataProvider.Instance().UpdateNationality(objNationality);
        }
    }
}

